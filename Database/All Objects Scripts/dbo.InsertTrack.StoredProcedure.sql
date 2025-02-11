USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[InsertTrack]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[InsertTrack]
    @TrackName NVARCHAR(100),
    @InstructorId INT,
    @AdminId INT,
    @TrackId INT OUTPUT 
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        INSERT INTO Track (track_name,track_manager, admin_id_FK)
        VALUES (@TrackName, @InstructorId, @AdminId);

        -- Retrieve the ID of the newly inserted record
        SET @TrackId = SCOPE_IDENTITY();
    END TRY
    BEGIN CATCH
        THROW; -- Rethrow any error for handling
    END CATCH
END
GO
