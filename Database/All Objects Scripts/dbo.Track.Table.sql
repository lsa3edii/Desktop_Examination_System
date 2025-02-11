USE [db_ab2209_examinationsystem]
GO
/****** Object:  Table [dbo].[Track]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Track](
	[track_id] [int] IDENTITY(1,1) NOT NULL,
	[track_name] [varchar](max) NOT NULL,
	[track_manager] [int] NULL,
	[admin_id_FK] [int] NULL,
 CONSTRAINT [PK__Track__24ECC82EC0DB8112] PRIMARY KEY CLUSTERED 
(
	[track_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND]
) ON [SECOND] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Track]  WITH CHECK ADD FOREIGN KEY([admin_id_FK])
REFERENCES [dbo].[Admin] ([id])
GO
ALTER TABLE [dbo].[Track]  WITH CHECK ADD  CONSTRAINT [FK__Track__ins_id_FK__403A8C7D] FOREIGN KEY([track_manager])
REFERENCES [dbo].[Instructor] ([ins_id])
GO
ALTER TABLE [dbo].[Track] CHECK CONSTRAINT [FK__Track__ins_id_FK__403A8C7D]
GO
