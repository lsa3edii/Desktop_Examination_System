USE [db_ab2209_examinationsystem]
GO
/****** Object:  View [dbo].[branchAssignTrackView]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[branchAssignTrackView] AS
SELECT 
    b.branch_name AS Branch_Name,
    t.track_name AS Track_Name
FROM 
    Branch_Has_Track bht
INNER JOIN 
    Branch b ON bht.branch_id_FK = b.branch_id
INNER JOIN 
    Track t ON bht.track_id_FK = t.track_id;

GO
