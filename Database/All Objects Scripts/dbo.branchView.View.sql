USE [db_ab2209_examinationsystem]
GO
/****** Object:  View [dbo].[branchView]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[branchView]
as
select branch_id as [Branch ID], branch_name as [Branch Name]
from Branch;
GO
