USE [db_ab2209_examinationsystem]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[exam_id] [int] IDENTITY(1,1) NOT NULL,
	[exam_name] [varchar](max) NOT NULL,
	[exam_duration] [int] NOT NULL,
	[exam_date] [date] NOT NULL,
	[crs_id_FK] [int] NULL,
 CONSTRAINT [PK__Exam__9C8C7BE9026EC491] PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND]
) ON [SECOND] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exam] ADD  CONSTRAINT [DF_Exam_exam_duration]  DEFAULT ((10)) FOR [exam_duration]
GO
ALTER TABLE [dbo].[Exam] ADD  CONSTRAINT [DF_Exam_exam_date]  DEFAULT (getdate()) FOR [exam_date]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK__Exam__crs_id_FK__4CA06362] FOREIGN KEY([crs_id_FK])
REFERENCES [dbo].[Course] ([crs_id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK__Exam__crs_id_FK__4CA06362]
GO
