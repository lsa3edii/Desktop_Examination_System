USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[stud_Course]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[stud_Course]
(
    @ssn int
)
as
begin
    select c.crs_id, c.crs_name as CourseName
    from Student s
	inner join Student_Register_Course src
	on s.SSN = src.SSN_FK
	inner join Course c
	on src.crs_id_FK = c.crs_id
	where s.SSN = @ssn
    group by c.crs_id, c.crs_name;
end;
GO
