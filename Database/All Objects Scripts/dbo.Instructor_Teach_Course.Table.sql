USE [db_ab2209_examinationsystem]
GO
/****** Object:  Table [dbo].[Instructor_Teach_Course]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor_Teach_Course](
	[ins_id_FK] [int] NOT NULL,
	[crs_id_FK] [int] NOT NULL,
 CONSTRAINT [PK__Instruct__5C0D3DF9C6051A6D] PRIMARY KEY CLUSTERED 
(
	[ins_id_FK] ASC,
	[crs_id_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND]
) ON [SECOND]
GO
ALTER TABLE [dbo].[Instructor_Teach_Course]  WITH CHECK ADD  CONSTRAINT [FK__Instructo__crs_i__5DCAEF64] FOREIGN KEY([crs_id_FK])
REFERENCES [dbo].[Course] ([crs_id])
GO
ALTER TABLE [dbo].[Instructor_Teach_Course] CHECK CONSTRAINT [FK__Instructo__crs_i__5DCAEF64]
GO
ALTER TABLE [dbo].[Instructor_Teach_Course]  WITH CHECK ADD  CONSTRAINT [FK__Instructo__ins_i__5CD6CB2B] FOREIGN KEY([ins_id_FK])
REFERENCES [dbo].[Instructor] ([ins_id])
GO
ALTER TABLE [dbo].[Instructor_Teach_Course] CHECK CONSTRAINT [FK__Instructo__ins_i__5CD6CB2B]
GO
