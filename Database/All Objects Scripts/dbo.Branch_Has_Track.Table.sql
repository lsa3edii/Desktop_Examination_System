USE [db_ab2209_examinationsystem]
GO
/****** Object:  Table [dbo].[Branch_Has_Track]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch_Has_Track](
	[track_id_FK] [int] NOT NULL,
	[branch_id_FK] [int] NOT NULL,
 CONSTRAINT [PK__Branch_H__9FE507688E6F7BB4] PRIMARY KEY CLUSTERED 
(
	[track_id_FK] ASC,
	[branch_id_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND]
) ON [SECOND]
GO
ALTER TABLE [dbo].[Branch_Has_Track]  WITH CHECK ADD  CONSTRAINT [FK__Branch_Ha__branc__59FA5E80] FOREIGN KEY([branch_id_FK])
REFERENCES [dbo].[Branch] ([branch_id])
GO
ALTER TABLE [dbo].[Branch_Has_Track] CHECK CONSTRAINT [FK__Branch_Ha__branc__59FA5E80]
GO
ALTER TABLE [dbo].[Branch_Has_Track]  WITH CHECK ADD  CONSTRAINT [FK__Branch_Ha__track__59063A47] FOREIGN KEY([track_id_FK])
REFERENCES [dbo].[Track] ([track_id])
GO
ALTER TABLE [dbo].[Branch_Has_Track] CHECK CONSTRAINT [FK__Branch_Ha__track__59063A47]
GO
