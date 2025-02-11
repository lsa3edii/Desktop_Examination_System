USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[GetInstructorStudentGrades]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[GetInstructorStudentGrades]
(
    @insId int
)
as
begin
    select 
        s.stud_fname + ' ' + s.stud_lname as fullName,
        e.exam_name,
        concat(cast((se.exam_grade * 100.0 / 10) as INT), '%') as GradePercentage,
        case 
            when (se.exam_grade * 100.0 / 10) < 50 then 'Fail'
            else 'Pass'
        end as Status
    from Instructor i
    inner join Instructor_Teach_Course itc
    on i.ins_id = itc.ins_id_FK
    inner join Course c
    on c.crs_id = itc.crs_id_FK
    inner join Exam e
    on e.crs_id_FK = c.crs_id
    inner join Student_Attend_Exam se
    on e.exam_id = se.exam_id_FK
    inner join Student s
    on s.SSN = se.SSN_FK
    where i.ins_id = @insId;
end;
GO
