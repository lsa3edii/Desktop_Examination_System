USE [db_ab2209_examinationsystem]
GO
/****** Object:  View [dbo].[studentView]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[studentView] 
as
select 
    SSN,
    stud_fname,
    stud_lname,
    stud_email,
    stud_phone,
    stud_address,
    stud_gender,
    stud_birthdate,
	track_id_FK
from Student;
GO
