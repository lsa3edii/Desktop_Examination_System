USE [db_ab2209_examinationsystem]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[ins_id] [int] IDENTITY(1,1) NOT NULL,
	[ins_name] [varchar](max) NOT NULL,
	[ins_email] [nvarchar](255) NULL,
	[ins_password] [varchar](max) NOT NULL,
	[ins_phone] [varchar](max) NOT NULL,
	[ins_salary] [int] NOT NULL,
	[admin_id_FK] [int] NULL,
 CONSTRAINT [PK__Instruct__9CB72D20F3D54D58] PRIMARY KEY CLUSTERED 
(
	[ins_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND],
 CONSTRAINT [constraint_name] UNIQUE NONCLUSTERED 
(
	[ins_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND]
) ON [SECOND] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Instructor] ADD  CONSTRAINT [DF_Instructor_ins_password]  DEFAULT ((12345)) FOR [ins_password]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK__Instructo__admin__3D5E1FD2] FOREIGN KEY([admin_id_FK])
REFERENCES [dbo].[Admin] ([id])
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK__Instructo__admin__3D5E1FD2]
GO
