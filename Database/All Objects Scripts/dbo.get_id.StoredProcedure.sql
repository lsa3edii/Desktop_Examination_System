USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[get_id]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[get_id]
    @table VARCHAR(MAX), 
    @param VARCHAR(MAX),
    @nestlevel INT = 0 -- Default nesting level
AS 
BEGIN 
    IF @nestlevel > 10 -- Limit nesting to 10
    BEGIN
        RAISERROR('Nesting level exceeded.', 16, 1);
        RETURN;
    END

    BEGIN TRY 
        DECLARE @query NVARCHAR(MAX)
        DECLARE @result INT
        
        IF (@table = 'Admin')
            SET @query = 'SELECT @result = id FROM ' + @table + 
                         N' WHERE admin_email = @param'
        IF (@table = 'Student')
            SET @query = 'SELECT @result = SSN FROM ' + @table + 
                         N' WHERE stud_email = @param'
        IF (@table = 'Instructor')
            SET @query = 'SELECT @result = ins_id FROM ' + @table + 
                         N' WHERE ins_email = @param'
        IF (@table = 'Exam')
            SET @query = 'SELECT @result = exam_id FROM ' + @table + 
                         N' WHERE exam_name = @param'
        IF (@table = 'Course')
            SET @query = 'SELECT @result = crs_id FROM ' + @table + 
                         N' WHERE crs_name = @param'
		IF (@table = 'Questions')
            SET @query = 'SELECT @result = ques_id FROM ' + @table + 
                         N' WHERE ques_name = @param'
        
        -- Prevent SQL injection as the input is not part of the query itself 
        EXEC sp_executesql @query, 
            N'@param VARCHAR(255), @result INT OUTPUT', 
            @param, @result OUTPUT

        IF @result IS NULL 
            SELECT 'Enter a valid input'
        ELSE
            SELECT @result
    END TRY 
    BEGIN CATCH 
        SELECT 'Please enter valid data';
    END CATCH
END;
GO
