USE [db_ab2209_examinationsystem]
GO
/****** Object:  Table [dbo].[Track_Assign_Instructor]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Track_Assign_Instructor](
	[ins_id_FK] [int] NOT NULL,
	[track_id_FK] [int] NOT NULL,
 CONSTRAINT [PK__Track_As__931C6FD33B883EDD] PRIMARY KEY CLUSTERED 
(
	[ins_id_FK] ASC,
	[track_id_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND]
) ON [SECOND]
GO
ALTER TABLE [dbo].[Track_Assign_Instructor]  WITH CHECK ADD  CONSTRAINT [FK__Track_Ass__ins_i__5535A963] FOREIGN KEY([ins_id_FK])
REFERENCES [dbo].[Instructor] ([ins_id])
GO
ALTER TABLE [dbo].[Track_Assign_Instructor] CHECK CONSTRAINT [FK__Track_Ass__ins_i__5535A963]
GO
ALTER TABLE [dbo].[Track_Assign_Instructor]  WITH CHECK ADD  CONSTRAINT [FK__Track_Ass__track__5629CD9C] FOREIGN KEY([track_id_FK])
REFERENCES [dbo].[Track] ([track_id])
GO
ALTER TABLE [dbo].[Track_Assign_Instructor] CHECK CONSTRAINT [FK__Track_Ass__track__5629CD9C]
GO
