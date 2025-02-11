USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[generateexam]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[generateexam]
(
    @coursename nvarchar(100)
)
as
begin
    begin try
        declare @courseid int;
        declare @examid int;
        declare @examname nvarchar(100);

        select @courseid = crs_id
        from course
        where crs_name = @coursename;

        if @courseid is null
        begin
            throw 50001, 'Course not found with the given name.', 1;
        end

        set @examname = @coursename + ' Exam';

        insert into exam (exam_name, exam_duration, exam_date, crs_id_fk)
        values (@examname, 10, getdate(), @courseid);

        set @examid = scope_identity();

        if not exists (
            select 1
            from questions
            where crs_id_fk = @courseid
        )
        begin
            throw 50001, 'No questions found for the selected course.', 1;
        end

        declare @selectedquestions table (ques_id int);

        insert into @selectedquestions (ques_id)
        select top (10) ques_id
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
