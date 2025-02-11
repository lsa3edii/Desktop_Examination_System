USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[get_password]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[get_password] 
	@table varchar(max), 
    @email varchar(max),
	@nestlevel INT = 0 -- Default nesting level
as 
begin 
	IF @nestlevel > 10 -- Limit nesting to 10
    BEGIN
        RAISERROR('Nesting level exceeded.', 16, 1);
        RETURN;
    END
    begin try 
        declare @query nvarchar(max)
		declare @result nvarchar(max)
        
		
		if (@table = 'Admin')
			set @query = 'select @result = admin_password from ' + @table + 
                     N' where admin_email = @email'
		if (@table = 'Student')
			set @query = 'select @result = stud_password from ' + @table + 
                     N' where stud_email = @email'
		if (@table = 'Instructor')
			set @query = 'select @result = ins_password from ' + @table + 
                     N' where ins_email = @email'
        
		-- prevent sql injection as the input not part of the query itself 
        exec sp_executesql @query, 
            N'@email varchar(255) , @result nvarchar(max) OUTPUT', 
            @email , @result OUTPUT

		if @result is NULL 
			select 'Enter a valid email'
		else
			select @result
    end try 
    begin catch 
        select 'Please enter valid data';
    end catch
end;
GO
