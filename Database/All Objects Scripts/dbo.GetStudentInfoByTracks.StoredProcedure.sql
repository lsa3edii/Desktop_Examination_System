USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[GetStudentInfoByTracks]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[GetStudentInfoByTracks]
(
    @TracktNo int
)
as
begin
    select 
        s.SSN,
        s.stud_fname + ' ' + s.stud_lname as fullName,
        s.stud_email,
        s.stud_gender,
		s.stud_address,
		s.stud_gender,
		s.stud_phone,
        t.track_name
    from 
        Student s
    join 
        Track t
    on 
        s.track_id_FK = t.track_id
    where 
        t.track_id = @TracktNo;
end;
GO
