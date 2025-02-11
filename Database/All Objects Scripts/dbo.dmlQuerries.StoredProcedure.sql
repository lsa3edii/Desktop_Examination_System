USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[dmlQuerries]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[dmlQuerries]
(
    @tablename nvarchar(50),
    @operation nvarchar(10),
    @columns nvarchar(max) = null,
    @values nvarchar(max) = null,
    @condition nvarchar(max) = null,
	@nestlevel INT = 0 -- Default nesting level
)
as
begin
	 IF @nestlevel > 10 -- Limit nesting to 10
    BEGIN
        RAISERROR('Nesting level exceeded.', 16, 1);
        RETURN;
    END
    declare @querrySql nvarchar(max);

    begin try
        if @operation = 'insert'
			begin
				set @querrySql = 'insert into ' + @tablename + ' (' + @columns + ') values (' + @values + ')';
			end
        else if @operation = 'update'
			begin
				set @querrySql = 'update ' + @tablename + ' set ' + @columns + ' where ' + @condition;
			end
        else if @operation = 'delete'
			begin
				set @querrySql = 'delete from ' + @tablename + ' where ' + @condition;
			end
        else
			begin
				set @querrySql = 'select ''Invalid operation. Use insert, update, or delete.'' as ErrorMessage';
			end

        exec sp_executesql @querrySql;
    end try
    begin catch
        declare @customMessage nvarchar(max);

        if @operation = 'insert'
			begin
				set @customMessage = 'Custom Error: Failed to execute INSERT operation.';
			end
        else if @operation = 'update'
			begin
				set @customMessage = 'Custom Error: Failed to execute UPDATE operation.';
			end
        else if @operation = 'delete'
			begin
				set @customMessage = 'Custom Error: Failed to execute DELETE operation.';
			end
        else
			begin
				set @customMessage = 'Custom Error: Unknown operation.';
			end
        select @customMessage as ErrorMessage;
    end catch
end;
GO
