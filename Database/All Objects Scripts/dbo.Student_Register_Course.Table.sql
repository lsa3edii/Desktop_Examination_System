USE [db_ab2209_examinationsystem]
GO
/****** Object:  Table [dbo].[Student_Register_Course]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Register_Course](
	[SSN_FK] [int] NOT NULL,
	[crs_id_FK] [int] NOT NULL,
 CONSTRAINT [PK__Student___9A7A8704A90E4293] PRIMARY KEY CLUSTERED 
(
	[SSN_FK] ASC,
	[crs_id_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND]
) ON [SECOND]
GO
ALTER TABLE [dbo].[Student_Register_Course]  WITH CHECK ADD  CONSTRAINT [FK__Student_R__crs_i__693CA210] FOREIGN KEY([crs_id_FK])
REFERENCES [dbo].[Course] ([crs_id])
GO
ALTER TABLE [dbo].[Student_Register_Course] CHECK CONSTRAINT [FK__Student_R__crs_i__693CA210]
GO
ALTER TABLE [dbo].[Student_Register_Course]  WITH CHECK ADD  CONSTRAINT [FK__Student_R__SSN_F__68487DD7] FOREIGN KEY([SSN_FK])
REFERENCES [dbo].[Student] ([SSN])
GO
ALTER TABLE [dbo].[Student_Register_Course] CHECK CONSTRAINT [FK__Student_R__SSN_F__68487DD7]
GO
