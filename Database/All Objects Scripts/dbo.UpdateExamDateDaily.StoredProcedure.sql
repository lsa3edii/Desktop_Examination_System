USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[UpdateExamDateDaily]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[UpdateExamDateDaily]
as
begin
    update exam
    set exam_date = getdate();
end;
GO
