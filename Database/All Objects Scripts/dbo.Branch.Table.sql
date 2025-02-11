USE [db_ab2209_examinationsystem]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[branch_id] [int] IDENTITY(1,1) NOT NULL,
	[branch_name] [varchar](max) NULL,
	[admin_id_FK] [int] NULL,
 CONSTRAINT [PK__Branch__E55E37DE154B2CBA] PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND]
) ON [SECOND] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD FOREIGN KEY([admin_id_FK])
REFERENCES [dbo].[Admin] ([id])
GO
