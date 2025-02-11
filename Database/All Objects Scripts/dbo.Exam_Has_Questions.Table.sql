USE [db_ab2209_examinationsystem]
GO
/****** Object:  Table [dbo].[Exam_Has_Questions]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam_Has_Questions](
	[exam_id_FK] [int] NOT NULL,
	[ques_id_FK] [int] NOT NULL,
 CONSTRAINT [PK__Exam_Has__6661ABB8B28933CE] PRIMARY KEY CLUSTERED 
(
	[exam_id_FK] ASC,
	[ques_id_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND]
) ON [SECOND]
GO
ALTER TABLE [dbo].[Exam_Has_Questions]  WITH CHECK ADD  CONSTRAINT [FK__Exam_Has___exam___6477ECF3] FOREIGN KEY([exam_id_FK])
REFERENCES [dbo].[Exam] ([exam_id])
GO
ALTER TABLE [dbo].[Exam_Has_Questions] CHECK CONSTRAINT [FK__Exam_Has___exam___6477ECF3]
GO
ALTER TABLE [dbo].[Exam_Has_Questions]  WITH CHECK ADD  CONSTRAINT [FK__Exam_Has___ques___656C112C] FOREIGN KEY([ques_id_FK])
REFERENCES [dbo].[Questions] ([ques_id])
GO
ALTER TABLE [dbo].[Exam_Has_Questions] CHECK CONSTRAINT [FK__Exam_Has___ques___656C112C]
GO
