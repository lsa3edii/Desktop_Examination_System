USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[GetInstructorIdByName]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetInstructorIdByName]
    @InstructorName NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Select the ID of the instructor by name
        SELECT ins_id 
        FROM Instructor 
        WHERE ins_name = @InstructorName;
    END TRY
    BEGIN CATCH
        THROW; -- Rethrow any errors
    END CATCH
END
GO
