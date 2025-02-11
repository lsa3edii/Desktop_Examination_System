USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[assignCourseToTrack]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create    procedure [dbo].[assignCourseToTrack]
    @course_id int,
    @track_id int,
    @operation nvarchar(10),
    @result int output
as
begin
    if @operation = 'insert'
    begin
        if exists (
            select 1 
            from Track_Has_Course
            where track_id_FK = @track_id and crs_id_FK = @course_id
        )
        begin
            set @result = 0;
            select 'the track is already assigned to this Course .';
        end
        else
        begin
            insert into Track_Has_Course (track_id_FK, crs_id_FK)
            values (@track_id, @course_id);

            set @result = 1;
            select 'the track has been successfully assigned to the course.';
        end
    end
    else if @operation = 'delete'
    begin
        if exists (
            select 1 
            from Track_Has_Course
            where track_id_FK = @track_id and crs_id_FK = @course_id
        )
        begin
            delete 
            from Track_Has_Course
            where track_id_FK = @track_id and crs_id_FK = @course_id

            set @result = 1;
            select 'the track has been successfully removed from the Course.';
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
