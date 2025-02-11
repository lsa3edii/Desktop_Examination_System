USE [db_ab2209_examinationsystem]
GO
/****** Object:  View [dbo].[Track_Has_CourseView]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[Track_Has_CourseView]
as
select t.track_name as [Track Name],C.crs_name [Course Name]
from Track t , Course  C, Track_Has_Course Tc 
Where T.track_id  = Tc.track_id_FK and C.crs_id = Tc.crs_id_FK
GO
