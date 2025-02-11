USE [db_ab2209_examinationsystem]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[ques_id] [int] IDENTITY(1,1) NOT NULL,
	[ques_name] [varchar](max) NOT NULL,
	[ques_type] [varchar](max) NOT NULL,
	[ques_model_answer] [varchar](max) NOT NULL,
	[crs_id_FK] [int] NULL,
	[choice_1] [nvarchar](max) NOT NULL,
	[choice_2] [nvarchar](max) NOT NULL,
	[choice_3] [nvarchar](max) NULL,
	[choice_4] [nvarchar](max) NULL,
 CONSTRAINT [PK__Question__5BF46E9B81F1634C] PRIMARY KEY CLUSTERED 
(
	[ques_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND]
) ON [SECOND] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK__Questions__crs_i__4F7CD00D] FOREIGN KEY([crs_id_FK])
REFERENCES [dbo].[Course] ([crs_id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK__Questions__crs_i__4F7CD00D]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [chk_ques_model_answer] CHECK  (([ques_model_answer]=[choice_4] OR [ques_model_answer]=[choice_3] OR [ques_model_answer]=[choice_2] OR [ques_model_answer]=[choice_1]))
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [chk_ques_model_answer]
GO
