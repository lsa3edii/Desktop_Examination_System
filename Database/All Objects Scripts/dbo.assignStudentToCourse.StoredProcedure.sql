USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[assignStudentToCourse]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[assignStudentToCourse]
    @ssn int,
    @crs_id int,
    @operation nvarchar(10),
    @result int output
as
begin
    if @operation = 'insert'
    begin
        if exists (
            select 1 
            from Student_Register_Course
            where SSN_FK = @ssn and crs_id_fk = @crs_id
        )
        begin
            set @result = 0;
            select 'the student is already assigned to this course.';
        end
        else
        begin
            insert into Student_Register_Course (SSN_FK, crs_id_fk)
            values (@ssn, @crs_id);

            set @result = 1;
            select 'the student has been successfully assigned to the course.';
        end
    end
    else if @operation = 'delete'
    begin
        if exists (
            select 1 
            from Student_Register_Course
            where SSN_FK = @ssn and crs_id_fk = @crs_id
        )
        begin
            delete from Student_Register_Course
            where SSN_FK = @ssn and crs_id_fk = @crs_id;

            set @result = 1;
            select 'the student has been successfully removed from the course.';
        end
        else
        begin
            set @result = 0;
            select 'the student is not assigned to this course.';
        end
    end
    else
    begin
        set @result = -1;
        select 'invalid operation. please specify insert or delete.';
    end
end;
GO
