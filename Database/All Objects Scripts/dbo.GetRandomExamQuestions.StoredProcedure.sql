USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[GetRandomExamQuestions]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetRandomExamQuestions]
(
    @course_name NVARCHAR(100),
    @ssn INT
)
AS
BEGIN
    BEGIN TRY
        DECLARE @course_id INT;
        DECLARE @exam_id INT;

        SELECT @course_id = crs_id
        FROM course
        WHERE crs_name = @course_name;

        IF @course_id IS NULL
        BEGIN
            THROW 50001, 'Course not found with the given name.', 1;
        END

        SELECT @exam_id = exam_id
        FROM exam
        WHERE exam_name = @course_name AND crs_id_fk = @course_id;

        IF @exam_id IS NULL
        BEGIN
            THROW 50001, 'No exam found for the given course.', 1;
        END

        IF NOT EXISTS (
            SELECT 1
            FROM student_register_course
            WHERE ssn_fk = @ssn AND crs_id_fk = @course_id
        )
        BEGIN
            THROW 50001, 'Student is not registered in the given course.', 1;
        END

        SELECT 
            q.ques_name AS QuestionText,
            q.choice_1 AS Choice1,
            q.choice_2 AS Choice2,
            q.choice_3 AS Choice3,
            q.choice_4 AS Choice4,
			q.ques_id,
			e.exam_id
			FROM exam e
        INNER JOIN exam_has_questions ehq ON e.exam_id = ehq.exam_id_fk
        INNER JOIN questions q ON ehq.ques_id_fk = q.ques_id
        WHERE e.exam_id = @exam_id
        ORDER BY NEWID();
    END TRY
    BEGIN CATCH
        DECLARE @error_message NVARCHAR(4000) = ERROR_MESSAGE();
        THROW 50001, @error_message, 1;
    END CATCH
END;
GO
