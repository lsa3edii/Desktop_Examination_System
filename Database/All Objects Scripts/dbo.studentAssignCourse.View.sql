USE [db_ab2209_examinationsystem]
GO
/****** Object:  View [dbo].[studentAssignCourse]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   view [dbo].[studentAssignCourse]
as
select s.stud_fname + ' '+ s.stud_lname as Full_Name, c.crs_name
from Student s
inner join Student_Register_Course src
on s.SSN = src.SSN_FK
inner join Course c
on src.crs_id_FK = c.crs_id;
GO
