USE [db_ab2209_examinationsystem]
GO
/****** Object:  Table [dbo].[Student_Take_Exam_Has_Questions]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Take_Exam_Has_Questions](
	[st_eid] [int] IDENTITY(1,1) NOT NULL,
	[SSN_FK] [int] NULL,
	[exam_id_FK] [int] NULL,
	[ques_id_FK] [int] NULL,
	[answer] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Student___8215F58851E3F3BE] PRIMARY KEY CLUSTERED 
(
	[st_eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND]
) ON [SECOND]
GO
ALTER TABLE [dbo].[Student_Take_Exam_Has_Questions]  WITH CHECK ADD  CONSTRAINT [FK__Student_T__exam___70DDC3D8] FOREIGN KEY([exam_id_FK])
REFERENCES [dbo].[Exam] ([exam_id])
GO
ALTER TABLE [dbo].[Student_Take_Exam_Has_Questions] CHECK CONSTRAINT [FK__Student_T__exam___70DDC3D8]
GO
ALTER TABLE [dbo].[Student_Take_Exam_Has_Questions]  WITH CHECK ADD  CONSTRAINT [FK__Student_T__ques___71D1E811] FOREIGN KEY([ques_id_FK])
REFERENCES [dbo].[Questions] ([ques_id])
GO
ALTER TABLE [dbo].[Student_Take_Exam_Has_Questions] CHECK CONSTRAINT [FK__Student_T__ques___71D1E811]
GO
ALTER TABLE [dbo].[Student_Take_Exam_Has_Questions]  WITH CHECK ADD  CONSTRAINT [FK__Student_T__SSN_F__6FE99F9F] FOREIGN KEY([SSN_FK])
REFERENCES [dbo].[Student] ([SSN])
GO
ALTER TABLE [dbo].[Student_Take_Exam_Has_Questions] CHECK CONSTRAINT [FK__Student_T__SSN_F__6FE99F9F]
GO
