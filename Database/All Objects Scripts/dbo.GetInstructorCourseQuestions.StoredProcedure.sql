USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[GetInstructorCourseQuestions]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetInstructorCourseQuestions]
    @ins_id INT,  
    @course_name VARCHAR(100),
    @result INT OUTPUT
AS
BEGIN
    DECLARE @question_count INT;
    
    
    SELECT @question_count = COUNT(*)
    FROM Questions q
    INNER JOIN Course c ON q.crs_id_FK = c.crs_id
    INNER JOIN Instructor_Teach_Course itc ON c.crs_id = itc.crs_id_FK
    INNER JOIN Instructor i ON itc.ins_id_FK = i.ins_id
    WHERE i.ins_id = @ins_id 
      AND c.crs_name = @course_name;

    
    IF @question_count < 10
        SET @result = 1;
    ELSE IF @question_count >= 10
        SET @result = 0;
    
    
    SELECT 
        q.ques_id,
        q.ques_name,
        q.ques_type,
        q.choice_1,
        q.choice_2,
        q.choice_3,
        q.choice_4,
        q.ques_model_answer
    FROM Questions q
    INNER JOIN Course c ON q.crs_id_FK = c.crs_id
    INNER JOIN Instructor_Teach_Course itc ON c.crs_id = itc.crs_id_FK
    INNER JOIN Instructor i ON itc.ins_id_FK = i.ins_id
    WHERE i.ins_id = @ins_id 
      AND c.crs_name = @course_name;
END;
GO
