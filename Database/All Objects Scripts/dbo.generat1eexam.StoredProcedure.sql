USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[generat1eexam]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[generat1eexam]
(
    @examname nvarchar(100),
    @examduration int,
    @examdate date,
    @courseid int,
    @totalquestions int
)
as
begin
    begin try
        declare @examid int;

        insert into exam (exam_name, exam_duration, exam_date, crs_id_fk)
        values (@examname, @examduration, @examdate, @courseid);

        set @examid = scope_identity();

        if not exists (
            select 1
            from questions
            where crs_id_fk = @courseid
        )
        begin
            throw 50001, 'no questions found for the selected course.', 1;
        end

        declare @selectedquestions table (ques_id int);

        insert into @selectedquestions (ques_id)
        select top (@totalquestions) ques_id
        from questions
        where crs_id_fk = @courseid
        order by newid();

        insert into exam_has_questions (exam_id_fk, ques_id_fk)
        select @examid, ques_id
        from @selectedquestions;

        select @examid as generatedexamid;
    end try
    begin catch
        declare @errormessage nvarchar(4000) = error_message();
        throw 50001, @errormessage, 1;
    end catch
end;
GO
