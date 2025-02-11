USE [db_ab2209_examinationsystem]
GO
/****** Object:  Table [dbo].[Student_Attend_Exam]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Attend_Exam](
	[SSN_FK] [int] NOT NULL,
	[exam_id_FK] [int] NOT NULL,
	[exam_grade] [int] NOT NULL,
 CONSTRAINT [PK__Student___E762641000AAE545] PRIMARY KEY CLUSTERED 
(
	[SSN_FK] ASC,
	[exam_id_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND]
) ON [SECOND]
GO
ALTER TABLE [dbo].[Student_Attend_Exam]  WITH CHECK ADD  CONSTRAINT [FK__Student_A__exam___6D0D32F4] FOREIGN KEY([exam_id_FK])
REFERENCES [dbo].[Exam] ([exam_id])
GO
ALTER TABLE [dbo].[Student_Attend_Exam] CHECK CONSTRAINT [FK__Student_A__exam___6D0D32F4]
GO
ALTER TABLE [dbo].[Student_Attend_Exam]  WITH CHECK ADD  CONSTRAINT [FK__Student_A__SSN_F__6C190EBB] FOREIGN KEY([SSN_FK])
REFERENCES [dbo].[Student] ([SSN])
GO
ALTER TABLE [dbo].[Student_Attend_Exam] CHECK CONSTRAINT [FK__Student_A__SSN_F__6C190EBB]
GO
