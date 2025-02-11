USE [db_ab2209_examinationsystem]
GO
/****** Object:  View [dbo].[instructorTeachCourse]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   view [dbo].[instructorTeachCourse]
as
select i.ins_name, c.crs_name
from Instructor i
inner join Instructor_Teach_Course itc
on i.ins_id = itc.ins_id_FK
inner join Course c
on itc.crs_id_FK = c.crs_id;
GO
