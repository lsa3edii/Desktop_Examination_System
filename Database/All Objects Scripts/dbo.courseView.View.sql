USE [db_ab2209_examinationsystem]
GO
/****** Object:  View [dbo].[courseView]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create    view [dbo].[courseView]
as
select crs_id [Course ID],crs_name [Course Name] , Topic.topic_name [Topic Name]
from  Course ,Topic
Where Topic.topic_id = Course.topic_id_FK
GO
