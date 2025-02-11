USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[AssignInstructorToCourse]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[AssignInstructorToCourse]
    @ins_id int,
    @crs_id int,
    @operation nvarchar(10),
    @result int output
as
begin
    if @operation = 'insert'
    begin
        if exists (
            select 1 
            from instructor_teach_course
            where ins_id_fk = @ins_id and crs_id_fk = @crs_id
        )
        begin
            set @result = 0;
            select 'the instructor is already assigned to this course.';
        end
        else
        begin
            insert into instructor_teach_course (ins_id_fk, crs_id_fk)
            values (@ins_id, @crs_id);

            set @result = 1;
            print 'the instructor has been successfully assigned to the course.';
        end
    end
    else if @operation = 'delete'
    begin
        if exists (
            select 1 
            from instructor_teach_course
            where ins_id_fk = @ins_id and crs_id_fk = @crs_id
        )
        begin
            delete from instructor_teach_course
            where ins_id_fk = @ins_id and crs_id_fk = @crs_id;

            set @result = 1;
            select 'the instructor has been successfully removed from the course.';
        end
        else
        begin
            set @result = 0;
            select 'the instructor is not assigned to this course.';
        end
    end
    else
    begin
        set @result = -1;
        select 'invalid operation. please specify insert or delete.';
    end
end;
GO
