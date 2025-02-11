USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[isStudTakeExam]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[isStudTakeExam]
(
    @ssn int,
    @crs_name nvarchar(100),
    @result int output
)
as
begin
    begin try
        declare @course_id int;
        declare @exam_id int;

        select @course_id = crs_id
        from course
        where crs_name = @crs_name;

        if @course_id is null
        begin
            throw 50001, 'Course not found with the given name.', 1;
        end

        select @exam_id = exam_id
        from exam
        where crs_id_fk = @course_id and exam_name = @crs_name;

        if @exam_id is null
        begin
            throw 50001, 'No exam found for the given course and exam name.', 1;
        end

        if exists (
            select 1
            from student_attend_exam
            where ssn_fk = @ssn and exam_id_fk = @exam_id
        )
        begin
            set @result = 1;
            print 'The student has already taken the exam.';
        end
        else
        begin
            set @result = 0;
            print 'The student has not taken the exam yet.';
        end
    end try
    begin catch
        declare @error_message nvarchar(4000) = error_message();
        throw 50001, @error_message, 1;
    end catch
end;
GO
