USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[GetLastInsertedTrackId]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetLastInsertedTrackId]
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Fetch the last identity value in the current session and scope
        SELECT SCOPE_IDENTITY() AS TrackId;
    END TRY
    BEGIN CATCH
        THROW; -- Rethrow any error for handling
    END CATCH
END
GO
