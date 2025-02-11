USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[Get_Exam_Details]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[Get_Exam_Details]
(
    @ins_id int
)
as
begin
    select 
        e.exam_name, 
        e.exam_duration, 
        e.exam_date,
        COUNT(src.SSN_FK) as Student_Count
    from Instructor i
    inner join Instructor_Teach_Course itc
    on i.ins_id = itc.ins_id_FK
    inner join Course c
    on c.crs_id = itc.crs_id_FK
    inner join Exam e
    on e.crs_id_FK = c.crs_id
    inner join Student_Register_Course src
    on src.crs_id_FK = c.crs_id
    where i.ins_id = @ins_id
    group by e.exam_name, e.exam_duration, e.exam_date
    order by e.exam_name;
end;
GO
