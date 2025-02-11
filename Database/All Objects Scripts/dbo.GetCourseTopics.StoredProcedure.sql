USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[GetCourseTopics]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[GetCourseTopics]
(
    @topicId int
)
as
begin
select  c.crs_name as CourseName, t.topic_name as TopicName
from Course c
inner join Topic t
on t.topic_id = c.topic_id_FK
where t.topic_id =  @topicId
end;
GO
