USE [db_ab2209_examinationsystem]
GO
/****** Object:  View [dbo].[branchAssignTrack]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[branchAssignTrack] AS
SELECT 
    b.branch_name AS Branch_Name,
    t.track_name AS Track_Name,
    b.branch_id AS Branch_ID,
    t.track_id AS Track_ID
FROM 
    Branch_Has_Track bht
INNER JOIN 
    Branch b ON bht.branch_id_FK = b.branch_id
INNER JOIN 
    Track t ON bht.track_id_FK = t.track_id;

GO
