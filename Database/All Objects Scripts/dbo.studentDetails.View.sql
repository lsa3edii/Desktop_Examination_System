USE [db_ab2209_examinationsystem]
GO
/****** Object:  View [dbo].[studentDetails]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[studentDetails]
as
select SSN ,stud_fname +' '+stud_lname as [Full Name],stud_gender as Gender,stud_email as Email,stud_phone as Phone
from  Student
GO
