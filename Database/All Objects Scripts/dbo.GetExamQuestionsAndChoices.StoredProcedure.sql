USE [db_ab2209_examinationsystem]
GO
/****** Object:  StoredProcedure [dbo].[GetExamQuestionsAndChoices]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[GetExamQuestionsAndChoices]
(
    @examId int
)
as
begin
    select  e.exam_name as ExamName,q.ques_id as QuestionID,q.ques_name as QuestionText,
	q.choice_1 as Choice_1,q.choice_2 as Choice_2,q.choice_3 as Choice_3,q.choice_4 as Choice_4
    from Exam e
	inner join Exam_Has_Questions ehq 
	on e.exam_id = ehq.exam_id_FK
    inner join Questions q 
	on ehq.ques_id_FK = q.ques_id
    where e.exam_id = @examId
    order by q.ques_id;
end;
GO
