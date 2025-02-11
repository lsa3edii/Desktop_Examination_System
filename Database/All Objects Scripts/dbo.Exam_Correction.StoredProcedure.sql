USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[Exam_Correction]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Exam_Correction] 
    @st_id INT, 
    @exam_id INT  
AS
BEGIN
    BEGIN TRY
        DECLARE @grade INT = 0;

        SELECT @grade = COUNT(*)
        FROM Student_Take_Exam_Has_Questions s 
        JOIN Questions q ON s.ques_id_FK = q.ques_id
        WHERE s.SSN_FK = @st_id 
            AND s.exam_id_FK = @exam_id 
            AND s.answer = q.ques_model_answer;

        IF EXISTS (
            SELECT 1 FROM Student_Attend_Exam 
            WHERE SSN_FK = @st_id AND exam_id_FK = @exam_id
        )
        BEGIN
            UPDATE Student_Attend_Exam
            SET exam_grade = @grade
            WHERE SSN_FK = @st_id AND exam_id_FK = @exam_id;
        END
        ELSE
        BEGIN
            INSERT INTO Student_Attend_Exam (SSN_FK, exam_id_FK, exam_grade)
            VALUES (@st_id, @exam_id, @grade);
        END
    END TRY
    BEGIN CATCH
        PRINT 'Error: ' + ERROR_MESSAGE();
    END CATCH
END;
GO
