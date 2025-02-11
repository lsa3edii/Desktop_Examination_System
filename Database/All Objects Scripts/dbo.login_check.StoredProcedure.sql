USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[login_check]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[login_check] 
	@table varchar(max),
    @email varchar(max), 
    @password varchar(max),
	@nestlevel INT = 0 -- Default nesting level
as 
begin 
	IF @nestlevel > 10 -- Limit nesting to 10
    BEGIN
        RAISERROR('Nesting level exceeded.', 16, 1);
        RETURN;
    END
    begin try 
        declare @query nvarchar(max);
        
		if (@table = 'Admin')
			set @query = 'select count(*) from ' + @table + 
                     ' where admin_email = @email and admin_password = @password';
		if (@table = 'Student')
			set @query = 'select count(*) from ' + @table + 
                     ' where stud_email = @email and stud_password = @password';
		if (@table = 'Instructor')
			set @query = 'select count(*) from ' + @table + 
                     ' where ins_email = @email and ins_password = @password';
        
        
		-- prevent sql injection as the input not part of the query itself 
        exec sp_executesql @query, 
            N'@email varchar(255), @password varchar(255)', 
            @email, 
            @password;
    end try 
    begin catch 
        select 'Please enter valid data';
    end catch
end;
GO
