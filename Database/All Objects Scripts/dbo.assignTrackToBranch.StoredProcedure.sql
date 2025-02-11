USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[assignTrackToBranch]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[assignTrackToBranch]
    @track_id int,
    @branch_id int,
    @operation nvarchar(10),
    @result int output
as
begin
    if @operation = 'insert'
    begin
        if exists (
            select 1 
            from Branch_Has_Track
            where track_id_FK = @track_id and branch_id_FK = @branch_id
        )
        begin
            set @result = 0;
            select 'the track is already assigned to this branch.';
        end
        else
        begin
            insert into Branch_Has_Track (track_id_FK, branch_id_FK)
            values (@track_id, @branch_id);

            set @result = 1;
            select 'the track has been successfully assigned to the branch.';
        end
    end
    else if @operation = 'delete'
    begin
        if exists (
            select 1 
            from Branch_Has_Track
            where track_id_FK = @track_id and branch_id_FK = @branch_id
        )
        begin
            delete 
            from Branch_Has_Track
            where track_id_FK = @track_id and branch_id_FK = @branch_id

            set @result = 1;
            select 'the track has been successfully removed from the branch.';
        end
        else
        begin
            set @result = 0;
            select 'the track is not assigned to this branch.';
        end
    end
    else
    begin
        set @result = -1;
        select 'invalid operation. please specify insert or delete.';
    end
end;
GO
