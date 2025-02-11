USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[check_topic]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[check_topic]
    @id INT
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT 1 FROM Topic WHERE topic_id = @id)
            RETURN 1; -- Topic exists
        ELSE
            RETURN 0; -- Topic does not exist
    END TRY
    BEGIN CATCH
        -- Handle any errors (optional: log or return an error code)
        RETURN -1; -- Indicating an error
    END CATCH
END
GO
