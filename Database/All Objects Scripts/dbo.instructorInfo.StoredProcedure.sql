USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[instructorInfo]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[instructorInfo]
as
begin
    select ins_id,ins_name,ins_email,ins_phone,ins_salary
	from Instructor
end;
GO
