USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[GetStudentGrades]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[GetStudentGrades]
(
    @stId int
)
as
begin
    select s.SSN,s.stud_fname + ' ' + s.stud_lname as fullName,
	e.exam_name,concat(cast((se.exam_grade * 100.0 / 10) as decimal(5, 2)), '%') as GradePercentage
    from Student s
    inner join Student_Attend_Exam se
    on s.SSN = se.SSN_FK
	inner join Exam e
	on e.exam_id = se.exam_id_FK
    where s.SSN = @stId;
end;
GO
