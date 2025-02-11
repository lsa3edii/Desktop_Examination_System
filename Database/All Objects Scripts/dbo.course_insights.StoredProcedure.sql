USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[course_insights]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[course_insights] @id int 
as
begin
	begin try 
		select 
			c.crs_name,
			Count(se.SSN_FK) [students_count],
			CONCAT(CAST((COUNT(CASE WHEN se.exam_grade >= 5 THEN 1 END) * 100.0 / COUNT(se.exam_grade)) AS INT), '%') AS pass_percentage,
			CONCAT(CAST((COUNT(CASE WHEN se.exam_grade < 5 THEN 1 END) * 100.0 / COUNT(se.exam_grade)) AS INT), '%') AS fail_percentage
		from Instructor_Teach_Course ins 
		join course c on ins.crs_id_FK = c.crs_id and ins.ins_id_FK = @id 
		join exam e on c.crs_id = e.crs_id_FK 
		join Student_Attend_Exam se on e.exam_id = se.exam_id_FK
		group by c.crs_name 
	end try 
	begin catch
		select 'Enter a valid Instructor ID'
	end catch
end
GO
