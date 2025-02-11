USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[Ins_Course]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[Ins_Course]
(
    @insId int
)
as
begin
    select c.crs_id, c.crs_name as CourseName
    from Instructor i
	inner join Instructor_Teach_Course itc
    on i.ins_id = itc.ins_id_FK
    inner join Course c
    on c.crs_id = itc.crs_id_FK
    where i.ins_id = @insId
	group by c.crs_id, c.crs_name;
end;
GO
