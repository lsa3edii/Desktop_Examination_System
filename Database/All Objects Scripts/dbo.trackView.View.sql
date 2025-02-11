USE [db_ab2209_examinationsystem]
GO
/****** Object:  View [dbo].[trackView]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[trackView]
as
select track_id as [Track ID],track_name as [Track Name],i.ins_name [Track Manager]
from Track t
inner join Instructor i
on t.track_manager = i.ins_id
GO
