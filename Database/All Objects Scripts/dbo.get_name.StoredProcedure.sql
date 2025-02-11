USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[get_name]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[get_name]
	@table varchar(max), 
    @email varchar(max) 
as 
begin 
    begin try 
        declare @query nvarchar(max)
		declare @result nvarchar(max)

		if (@table = 'Student')
			set @query = 'select @result = stud_fname + '' '' + stud_lname from ' + @table + 
                     N' where stud_email = @email'

		if (@table = 'Instructor')
			set @query = 'select @result = ins_name from ' + @table + 
                     N' where ins_email = @email'
        
        exec sp_executesql @query, 
            N'@email varchar(255) , @result nvarchar(max) OUTPUT', 
            @email , @result OUTPUT

		if @result is NULL 
			select 'Enter a valid email'
		else
			select @result as 'Name'
    end try 
    begin catch 
        select 'Please enter valid data';
    end catch
end;
GO
