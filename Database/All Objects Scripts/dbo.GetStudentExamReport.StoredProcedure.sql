USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[GetStudentExamReport]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetStudentExamReport]
(
    @examId INT,
    @studentId INT
)
AS
BEGIN
    -- Declare variables for total and correct answers
    DECLARE @TotalQuestions INT, @CorrectAnswers INT;

    -- Count total questions in the exam
    SELECT @TotalQuestions = COUNT(*)
    FROM Exam_Has_Questions
    WHERE exam_id_FK = @examId;

    -- Count correct answers given by the student
    SELECT @CorrectAnswers = COUNT(*)
    FROM Exam_Has_Questions ehq
    INNER JOIN Questions q ON ehq.ques_id_FK = q.ques_id
    LEFT JOIN Student_Take_Exam_Has_Questions sc 
        ON q.ques_id = sc.ques_id_FK 
        AND sc.SSN_FK = @studentId
    WHERE ehq.exam_id_FK = @examId 
    AND sc.answer = q.ques_model_answer;  -- Checking if answer is correct

    -- Calculate percentage
    DECLARE @Percentage FLOAT;
    SET @Percentage = CASE 
                        WHEN @TotalQuestions > 0 
                        THEN (@CorrectAnswers * 100.0) / @TotalQuestions 
                        ELSE 0 
                      END;

    -- Determine pass or fail (assuming pass is 50% or above)
    DECLARE @ResultStatus VARCHAR(10);
    SET @ResultStatus = CASE WHEN @Percentage >= 50 THEN 'Pass' ELSE 'Fail' END;

    -- Return detailed report in a single query with Full Name of Student
    SELECT  
        e.exam_name AS ExamName,
        q.ques_id AS QuestionID,
        q.ques_name AS QuestionText,
        sc.answer AS StudentAnswer,
        q.ques_model_answer AS CorrectAnswer,
        CASE 
            WHEN sc.answer = q.ques_model_answer THEN 'Right'
            ELSE 'Wrong'
        END AS AnswerStatus,
        @TotalQuestions AS TotalQuestions,
        @CorrectAnswers AS CorrectAnswers,
        @Percentage AS Percentage,
        @ResultStatus AS ResultStatus,
        s.stud_fname + ' ' + s.stud_lname AS StudentFullName -- Concatenating First and Last Name
    FROM Exam e
    INNER JOIN Exam_Has_Questions ehq 
        ON e.exam_id = ehq.exam_id_FK
    INNER JOIN Questions q 
        ON ehq.ques_id_FK = q.ques_id
    LEFT JOIN Student_Take_Exam_Has_Questions sc 
        ON q.ques_id = sc.ques_id_FK 
        AND sc.SSN_FK = @studentId
    INNER JOIN Student s 
        ON s.SSN = @studentId  -- Joining with Student table to get Full Name
    WHERE e.exam_id = @examId
    ORDER BY q.ques_id;
END;

GO
