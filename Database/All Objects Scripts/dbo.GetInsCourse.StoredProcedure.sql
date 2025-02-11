USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[GetInsCourse]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[GetInsCourse]
(
    @insId int
)
as
begin
    select i.ins_name as InstructorName,c.crs_name as CourseName,count(src.SSN_FK) as NumOfStudents
    from Instructor i
	inner join Instructor_Teach_Course itc
    on i.ins_id = itc.ins_id_FK
    inner join Course c
    on c.crs_id = itc.crs_id_FK
    inner join Student_Register_Course src
    on src.crs_id_FK = c.crs_id
    where i.ins_id = @insId
    group by i.ins_name, c.crs_name;
end;
GO
