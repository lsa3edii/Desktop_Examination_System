USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[search]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[search]
	@table varchar(max), 
    @col varchar(max),
	@search_text varchar(max),
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
		set @search_text = '%' + @search_text + '%'
        set @query = 'select * from ' + @table + 
                     N' where ' + @col + ' like @search_text'
        
		-- prevent sql injection as the input not part of the query itself 
        exec sp_executesql @query, 
            N'@search_text varchar(max)', 
            @search_text 
    end try 
    begin catch 
        select 'Please enter valid data';
    end catch
end;
GO
