USE [db_ab2209_examinationsystem]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[crs_id] [int] IDENTITY(1,1) NOT NULL,
	[crs_name] [varchar](max) NOT NULL,
	[admin_id_FK] [int] NULL,
	[topic_id_FK] [int] NULL,
 CONSTRAINT [PK__Course__ECAF537571814E94] PRIMARY KEY CLUSTERED 
(
	[crs_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND]
) ON [SECOND] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK__Course__admin_id__7FEAFD3E] FOREIGN KEY([admin_id_FK])
REFERENCES [dbo].[Admin] ([id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK__Course__admin_id__7FEAFD3E]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [fk_topic] FOREIGN KEY([topic_id_FK])
REFERENCES [dbo].[Topic] ([topic_id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [fk_topic]
GO
