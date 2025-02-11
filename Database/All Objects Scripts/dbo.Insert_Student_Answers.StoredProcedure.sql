USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[Insert_Student_Answers]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[Insert_Student_Answers]
    @st_id int, 
    @exam_id int, 
    @ques_id int, 
    @answer nvarchar(150)
as
begin
    begin try
        merge student_take_exam_has_questions as target
        using (select @st_id as ssn_fk, @exam_id as exam_id_fk, @ques_id as ques_id_fk) as source
        on (target.ssn_fk = source.ssn_fk and target.exam_id_fk = source.exam_id_fk and target.ques_id_fk = source.ques_id_fk)
        when matched then
            update set target.answer = @answer
        when not matched then
            insert (ssn_fk, exam_id_fk, ques_id_fk, answer)
            values (@st_id, @exam_id, @ques_id, @answer);
    end try
    begin catch
        throw 50001, 'error: failed to insert or update student answer.', 1;
    end catch
end;
GO
