USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[GetStudentGradesStatus]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStudentGradesStatus]
(
    @ssn INT
)
AS
BEGIN
    SELECT 
        e.exam_name,
        CONCAT(CAST((se.exam_grade * 100 / 10) AS INT), '%') AS GradePercentage,
        CASE 
            WHEN (se.exam_grade * 100 / 10) < 50 THEN 'Fail'
            ELSE 'Pass'
        END AS Status
    FROM Student s
    INNER JOIN Student_Attend_Exam se ON s.SSN = se.SSN_FK
    INNER JOIN Exam e ON e.exam_id = se.exam_id_FK
    INNER JOIN Course c ON e.crs_id_FK = c.crs_id
    WHERE s.SSN = @ssn;
END;
GO
