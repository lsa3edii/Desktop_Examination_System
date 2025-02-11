USE [db_ab2209_examinationsystem]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2/1/2025 11:28:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[SSN] [int] NOT NULL,
	[stud_fname] [varchar](max) NOT NULL,
	[stud_lname] [varchar](max) NOT NULL,
	[stud_email] [nvarchar](255) NULL,
	[stud_password] [varchar](max) NOT NULL,
	[stud_phone] [varchar](max) NOT NULL,
	[stud_address] [varchar](max) NOT NULL,
	[stud_gender] [varchar](max) NOT NULL,
	[stud_birthdate] [date] NOT NULL,
	[track_id_FK] [int] NULL,
	[admin_id_FK] [int] NULL,
 CONSTRAINT [PK__Student__CA1E8E3D88A109A5] PRIMARY KEY CLUSTERED 
(
	[SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND],
 CONSTRAINT [constraint_email] UNIQUE NONCLUSTERED 
(
	[stud_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND]
) ON [SECOND] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF_Student_stud_password]  DEFAULT ((12345)) FOR [stud_password]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK__Student__admin_i__44FF419A] FOREIGN KEY([admin_id_FK])
REFERENCES [dbo].[Admin] ([id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK__Student__admin_i__44FF419A]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK__Student__track_i__440B1D61] FOREIGN KEY([track_id_FK])
REFERENCES [dbo].[Track] ([track_id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK__Student__track_i__440B1D61]
GO
