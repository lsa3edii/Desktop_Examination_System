USE [db_ab2209_examinationsystem]
GO
/****** Object:  View [dbo].[topicsDetails]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[topicsDetails]
as
select topic_id as [Topic ID] , topic_name as [Topic Name]
from Topic
GO
