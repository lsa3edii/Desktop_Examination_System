USE [db_ab2209_examinationsystem]
GO
/****** Object:  Table [dbo].[Track_Has_Course]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Track_Has_Course](
	[track_id_FK] [int] NOT NULL,
	[crs_id_FK] [int] NOT NULL,
 CONSTRAINT [PK__Track_Ha__A11FF1CAE5DED143] PRIMARY KEY CLUSTERED 
(
	[track_id_FK] ASC,
	[crs_id_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND]
) ON [SECOND]
GO
ALTER TABLE [dbo].[Track_Has_Course]  WITH CHECK ADD  CONSTRAINT [FK__Track_Has__crs_i__619B8048] FOREIGN KEY([crs_id_FK])
REFERENCES [dbo].[Course] ([crs_id])
GO
ALTER TABLE [dbo].[Track_Has_Course] CHECK CONSTRAINT [FK__Track_Has__crs_i__619B8048]
GO
ALTER TABLE [dbo].[Track_Has_Course]  WITH CHECK ADD  CONSTRAINT [FK__Track_Has__track__60A75C0F] FOREIGN KEY([track_id_FK])
REFERENCES [dbo].[Track] ([track_id])
GO
ALTER TABLE [dbo].[Track_Has_Course] CHECK CONSTRAINT [FK__Track_Has__track__60A75C0F]
GO
