USE [master]
GO
/****** Object:  Database [db_ab2209_examinationsystem]    Script Date: 2/1/2025 11:26:39 PM ******/
CREATE DATABASE [db_ab2209_examinationsystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Examination System', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db_ab2209_examinationsystem_data.mdf' , SIZE = 77440KB , MAXSIZE = 512000KB , FILEGROWTH = 65536KB ), 
 FILEGROUP [SECOND] 
( NAME = N'SECONDFILE', FILENAME = N'C:\Data\db_ab2209_examinationsystem1' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Examination System_log', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db_ab2209_examinationsystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_ab2209_examinationsystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET  MULTI_USER 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_ab2209_examinationsystem]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2/1/2025 11:26:43 PM ******/
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
/****** Object:  Table [dbo].[Student_Register_Course]    Script Date: 2/1/2025 11:26:43 PM ******/
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
/****** Object:  Table [dbo].[Course]    Script Date: 2/1/2025 11:26:43 PM ******/
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
/****** Object:  View [dbo].[studentAssignCourse]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   view [dbo].[studentAssignCourse]
as
select s.stud_fname + ' '+ s.stud_lname as Full_Name, c.crs_name
from Student s
inner join Student_Register_Course src
on s.SSN = src.SSN_FK
inner join Course c
on src.crs_id_FK = c.crs_id;
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 2/1/2025 11:26:43 PM ******/
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
/****** Object:  Table [dbo].[Instructor_Teach_Course]    Script Date: 2/1/2025 11:26:43 PM ******/
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
/****** Object:  View [dbo].[instructorTeachCourse]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   view [dbo].[instructorTeachCourse]
as
select i.ins_name, c.crs_name
from Instructor i
inner join Instructor_Teach_Course itc
on i.ins_id = itc.ins_id_FK
inner join Course c
on itc.crs_id_FK = c.crs_id;
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 2/1/2025 11:26:43 PM ******/
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
/****** Object:  View [dbo].[branchView]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[branchView]
as
select branch_id as [Branch ID], branch_name as [Branch Name]
from Branch;
GO
/****** Object:  Table [dbo].[Track]    Script Date: 2/1/2025 11:26:43 PM ******/
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
/****** Object:  View [dbo].[trackView]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[trackView]
as
select track_id as [Track ID],track_name as [Track Name],i.ins_name [Track Manager]
from Track t
inner join Instructor i
on t.track_manager = i.ins_id
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[topic_id] [int] IDENTITY(1,1) NOT NULL,
	[topic_name] [varchar](max) NOT NULL,
 CONSTRAINT [PK__Topic__D5DAA3E940F73E1B] PRIMARY KEY CLUSTERED 
(
	[topic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND]
) ON [SECOND] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[courseView]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create    view [dbo].[courseView]
as
select crs_id [Course ID],crs_name [Course Name] , Topic.topic_name [Topic Name]
from  Course ,Topic
Where Topic.topic_id = Course.topic_id_FK
GO
/****** Object:  View [dbo].[studentDetails]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[studentDetails]
as
select SSN ,stud_fname +' '+stud_lname as [Full Name],stud_gender as Gender,stud_email as Email,stud_phone as Phone
from  Student
GO
/****** Object:  View [dbo].[topicsDetails]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[topicsDetails]
as
select topic_id as [Topic ID] , topic_name as [Topic Name]
from Topic
GO
/****** Object:  Table [dbo].[Branch_Has_Track]    Script Date: 2/1/2025 11:26:43 PM ******/
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
/****** Object:  View [dbo].[branchAssignTrack]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[branchAssignTrack] AS
SELECT 
    b.branch_name AS Branch_Name,
    t.track_name AS Track_Name,
    b.branch_id AS Branch_ID,
    t.track_id AS Track_ID
FROM 
    Branch_Has_Track bht
INNER JOIN 
    Branch b ON bht.branch_id_FK = b.branch_id
INNER JOIN 
    Track t ON bht.track_id_FK = t.track_id;

GO
/****** Object:  View [dbo].[branchAssignTrackView]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[branchAssignTrackView] AS
SELECT 
    b.branch_name AS Branch_Name,
    t.track_name AS Track_Name
FROM 
    Branch_Has_Track bht
INNER JOIN 
    Branch b ON bht.branch_id_FK = b.branch_id
INNER JOIN 
    Track t ON bht.track_id_FK = t.track_id;

GO
/****** Object:  Table [dbo].[Track_Has_Course]    Script Date: 2/1/2025 11:26:43 PM ******/
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
/****** Object:  View [dbo].[Track_Has_CourseView]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[Track_Has_CourseView]
as
select t.track_name as [Track Name],C.crs_name [Course Name]
from Track t , Course  C, Track_Has_Course Tc 
Where T.track_id  = Tc.track_id_FK and C.crs_id = Tc.crs_id_FK
GO
/****** Object:  View [dbo].[studentView]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[studentView] 
as
select 
    SSN,
    stud_fname,
    stud_lname,
    stud_email,
    stud_phone,
    stud_address,
    stud_gender,
    stud_birthdate,
	track_id_FK
from Student;
GO
/****** Object:  View [dbo].[instructorView]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[instructorView]
as
select 
    ins_id,
    ins_name,
    ins_email,
    ins_phone,
    ins_salary
from Instructor;
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[admin_name] [varchar](max) NOT NULL,
	[admin_email] [nvarchar](255) NULL,
	[admin_password] [varchar](max) NOT NULL,
 CONSTRAINT [PK__Admin__3213E83FAE44744D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND],
 CONSTRAINT [constraint_aemail] UNIQUE NONCLUSTERED 
(
	[admin_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND]
) ON [SECOND] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[exam_id] [int] IDENTITY(1,1) NOT NULL,
	[exam_name] [varchar](max) NOT NULL,
	[exam_duration] [int] NOT NULL,
	[exam_date] [date] NOT NULL,
	[crs_id_FK] [int] NULL,
 CONSTRAINT [PK__Exam__9C8C7BE9026EC491] PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND]
) ON [SECOND] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam_Has_Questions]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam_Has_Questions](
	[exam_id_FK] [int] NOT NULL,
	[ques_id_FK] [int] NOT NULL,
 CONSTRAINT [PK__Exam_Has__6661ABB8B28933CE] PRIMARY KEY CLUSTERED 
(
	[exam_id_FK] ASC,
	[ques_id_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND]
) ON [SECOND]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[ques_id] [int] IDENTITY(1,1) NOT NULL,
	[ques_name] [varchar](max) NOT NULL,
	[ques_type] [varchar](max) NOT NULL,
	[ques_model_answer] [varchar](max) NOT NULL,
	[crs_id_FK] [int] NULL,
	[choice_1] [nvarchar](max) NOT NULL,
	[choice_2] [nvarchar](max) NOT NULL,
	[choice_3] [nvarchar](max) NULL,
	[choice_4] [nvarchar](max) NULL,
 CONSTRAINT [PK__Question__5BF46E9B81F1634C] PRIMARY KEY CLUSTERED 
(
	[ques_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND]
) ON [SECOND] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Attend_Exam]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Attend_Exam](
	[SSN_FK] [int] NOT NULL,
	[exam_id_FK] [int] NOT NULL,
	[exam_grade] [int] NOT NULL,
 CONSTRAINT [PK__Student___E762641000AAE545] PRIMARY KEY CLUSTERED 
(
	[SSN_FK] ASC,
	[exam_id_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND]
) ON [SECOND]
GO
/****** Object:  Table [dbo].[Student_Take_Exam_Has_Questions]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Take_Exam_Has_Questions](
	[st_eid] [int] IDENTITY(1,1) NOT NULL,
	[SSN_FK] [int] NULL,
	[exam_id_FK] [int] NULL,
	[ques_id_FK] [int] NULL,
	[answer] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Student___8215F58851E3F3BE] PRIMARY KEY CLUSTERED 
(
	[st_eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SECOND]
) ON [SECOND]
GO
/****** Object:  Table [dbo].[Track_Assign_Instructor]    Script Date: 2/1/2025 11:26:43 PM ******/
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
ALTER TABLE [dbo].[Exam] ADD  CONSTRAINT [DF_Exam_exam_duration]  DEFAULT ((10)) FOR [exam_duration]
GO
ALTER TABLE [dbo].[Exam] ADD  CONSTRAINT [DF_Exam_exam_date]  DEFAULT (getdate()) FOR [exam_date]
GO
ALTER TABLE [dbo].[Instructor] ADD  CONSTRAINT [DF_Instructor_ins_password]  DEFAULT ((12345)) FOR [ins_password]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF_Student_stud_password]  DEFAULT ((12345)) FOR [stud_password]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD FOREIGN KEY([admin_id_FK])
REFERENCES [dbo].[Admin] ([id])
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
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK__Exam__crs_id_FK__4CA06362] FOREIGN KEY([crs_id_FK])
REFERENCES [dbo].[Course] ([crs_id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK__Exam__crs_id_FK__4CA06362]
GO
ALTER TABLE [dbo].[Exam_Has_Questions]  WITH CHECK ADD  CONSTRAINT [FK__Exam_Has___exam___6477ECF3] FOREIGN KEY([exam_id_FK])
REFERENCES [dbo].[Exam] ([exam_id])
GO
ALTER TABLE [dbo].[Exam_Has_Questions] CHECK CONSTRAINT [FK__Exam_Has___exam___6477ECF3]
GO
ALTER TABLE [dbo].[Exam_Has_Questions]  WITH CHECK ADD  CONSTRAINT [FK__Exam_Has___ques___656C112C] FOREIGN KEY([ques_id_FK])
REFERENCES [dbo].[Questions] ([ques_id])
GO
ALTER TABLE [dbo].[Exam_Has_Questions] CHECK CONSTRAINT [FK__Exam_Has___ques___656C112C]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK__Instructo__admin__3D5E1FD2] FOREIGN KEY([admin_id_FK])
REFERENCES [dbo].[Admin] ([id])
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK__Instructo__admin__3D5E1FD2]
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
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK__Questions__crs_i__4F7CD00D] FOREIGN KEY([crs_id_FK])
REFERENCES [dbo].[Course] ([crs_id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK__Questions__crs_i__4F7CD00D]
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
ALTER TABLE [dbo].[Student_Attend_Exam]  WITH CHECK ADD  CONSTRAINT [FK__Student_A__exam___6D0D32F4] FOREIGN KEY([exam_id_FK])
REFERENCES [dbo].[Exam] ([exam_id])
GO
ALTER TABLE [dbo].[Student_Attend_Exam] CHECK CONSTRAINT [FK__Student_A__exam___6D0D32F4]
GO
ALTER TABLE [dbo].[Student_Attend_Exam]  WITH CHECK ADD  CONSTRAINT [FK__Student_A__SSN_F__6C190EBB] FOREIGN KEY([SSN_FK])
REFERENCES [dbo].[Student] ([SSN])
GO
ALTER TABLE [dbo].[Student_Attend_Exam] CHECK CONSTRAINT [FK__Student_A__SSN_F__6C190EBB]
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
ALTER TABLE [dbo].[Student_Take_Exam_Has_Questions]  WITH CHECK ADD  CONSTRAINT [FK__Student_T__exam___70DDC3D8] FOREIGN KEY([exam_id_FK])
REFERENCES [dbo].[Exam] ([exam_id])
GO
ALTER TABLE [dbo].[Student_Take_Exam_Has_Questions] CHECK CONSTRAINT [FK__Student_T__exam___70DDC3D8]
GO
ALTER TABLE [dbo].[Student_Take_Exam_Has_Questions]  WITH CHECK ADD  CONSTRAINT [FK__Student_T__ques___71D1E811] FOREIGN KEY([ques_id_FK])
REFERENCES [dbo].[Questions] ([ques_id])
GO
ALTER TABLE [dbo].[Student_Take_Exam_Has_Questions] CHECK CONSTRAINT [FK__Student_T__ques___71D1E811]
GO
ALTER TABLE [dbo].[Student_Take_Exam_Has_Questions]  WITH CHECK ADD  CONSTRAINT [FK__Student_T__SSN_F__6FE99F9F] FOREIGN KEY([SSN_FK])
REFERENCES [dbo].[Student] ([SSN])
GO
ALTER TABLE [dbo].[Student_Take_Exam_Has_Questions] CHECK CONSTRAINT [FK__Student_T__SSN_F__6FE99F9F]
GO
ALTER TABLE [dbo].[Track]  WITH CHECK ADD FOREIGN KEY([admin_id_FK])
REFERENCES [dbo].[Admin] ([id])
GO
ALTER TABLE [dbo].[Track]  WITH CHECK ADD  CONSTRAINT [FK__Track__ins_id_FK__403A8C7D] FOREIGN KEY([track_manager])
REFERENCES [dbo].[Instructor] ([ins_id])
GO
ALTER TABLE [dbo].[Track] CHECK CONSTRAINT [FK__Track__ins_id_FK__403A8C7D]
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
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [chk_ques_model_answer] CHECK  (([ques_model_answer]=[choice_4] OR [ques_model_answer]=[choice_3] OR [ques_model_answer]=[choice_2] OR [ques_model_answer]=[choice_1]))
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [chk_ques_model_answer]
GO
/****** Object:  StoredProcedure [dbo].[assignCourseToTrack]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create    procedure [dbo].[assignCourseToTrack]
    @course_id int,
    @track_id int,
    @operation nvarchar(10),
    @result int output
as
begin
    if @operation = 'insert'
    begin
        if exists (
            select 1 
            from Track_Has_Course
            where track_id_FK = @track_id and crs_id_FK = @course_id
        )
        begin
            set @result = 0;
            select 'the track is already assigned to this Course .';
        end
        else
        begin
            insert into Track_Has_Course (track_id_FK, crs_id_FK)
            values (@track_id, @course_id);

            set @result = 1;
            select 'the track has been successfully assigned to the course.';
        end
    end
    else if @operation = 'delete'
    begin
        if exists (
            select 1 
            from Track_Has_Course
            where track_id_FK = @track_id and crs_id_FK = @course_id
        )
        begin
            delete 
            from Track_Has_Course
            where track_id_FK = @track_id and crs_id_FK = @course_id

            set @result = 1;
            select 'the track has been successfully removed from the Course.';
        end
        else
        begin
            set @result = 0;
            select 'the track is not assigned to this branch.';
        end
    end
    else
    begin
        set @result = -1;
        select 'invalid operation. please specify insert or delete.';
    end
end;
GO
/****** Object:  StoredProcedure [dbo].[AssignInstructorToCourse]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[AssignInstructorToCourse]
    @ins_id int,
    @crs_id int,
    @operation nvarchar(10),
    @result int output
as
begin
    if @operation = 'insert'
    begin
        if exists (
            select 1 
            from instructor_teach_course
            where ins_id_fk = @ins_id and crs_id_fk = @crs_id
        )
        begin
            set @result = 0;
            select 'the instructor is already assigned to this course.';
        end
        else
        begin
            insert into instructor_teach_course (ins_id_fk, crs_id_fk)
            values (@ins_id, @crs_id);

            set @result = 1;
            print 'the instructor has been successfully assigned to the course.';
        end
    end
    else if @operation = 'delete'
    begin
        if exists (
            select 1 
            from instructor_teach_course
            where ins_id_fk = @ins_id and crs_id_fk = @crs_id
        )
        begin
            delete from instructor_teach_course
            where ins_id_fk = @ins_id and crs_id_fk = @crs_id;

            set @result = 1;
            select 'the instructor has been successfully removed from the course.';
        end
        else
        begin
            set @result = 0;
            select 'the instructor is not assigned to this course.';
        end
    end
    else
    begin
        set @result = -1;
        select 'invalid operation. please specify insert or delete.';
    end
end;
GO
/****** Object:  StoredProcedure [dbo].[assignStudentToCourse]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[assignStudentToCourse]
    @ssn int,
    @crs_id int,
    @operation nvarchar(10),
    @result int output
as
begin
    if @operation = 'insert'
    begin
        if exists (
            select 1 
            from Student_Register_Course
            where SSN_FK = @ssn and crs_id_fk = @crs_id
        )
        begin
            set @result = 0;
            select 'the student is already assigned to this course.';
        end
        else
        begin
            insert into Student_Register_Course (SSN_FK, crs_id_fk)
            values (@ssn, @crs_id);

            set @result = 1;
            select 'the student has been successfully assigned to the course.';
        end
    end
    else if @operation = 'delete'
    begin
        if exists (
            select 1 
            from Student_Register_Course
            where SSN_FK = @ssn and crs_id_fk = @crs_id
        )
        begin
            delete from Student_Register_Course
            where SSN_FK = @ssn and crs_id_fk = @crs_id;

            set @result = 1;
            select 'the student has been successfully removed from the course.';
        end
        else
        begin
            set @result = 0;
            select 'the student is not assigned to this course.';
        end
    end
    else
    begin
        set @result = -1;
        select 'invalid operation. please specify insert or delete.';
    end
end;
GO
/****** Object:  StoredProcedure [dbo].[assignTrackToBranch]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[assignTrackToBranch]
    @track_id int,
    @branch_id int,
    @operation nvarchar(10),
    @result int output
as
begin
    if @operation = 'insert'
    begin
        if exists (
            select 1 
            from Branch_Has_Track
            where track_id_FK = @track_id and branch_id_FK = @branch_id
        )
        begin
            set @result = 0;
            select 'the track is already assigned to this branch.';
        end
        else
        begin
            insert into Branch_Has_Track (track_id_FK, branch_id_FK)
            values (@track_id, @branch_id);

            set @result = 1;
            select 'the track has been successfully assigned to the branch.';
        end
    end
    else if @operation = 'delete'
    begin
        if exists (
            select 1 
            from Branch_Has_Track
            where track_id_FK = @track_id and branch_id_FK = @branch_id
        )
        begin
            delete 
            from Branch_Has_Track
            where track_id_FK = @track_id and branch_id_FK = @branch_id

            set @result = 1;
            select 'the track has been successfully removed from the branch.';
        end
        else
        begin
            set @result = 0;
            select 'the track is not assigned to this branch.';
        end
    end
    else
    begin
        set @result = -1;
        select 'invalid operation. please specify insert or delete.';
    end
end;
GO
/****** Object:  StoredProcedure [dbo].[check_branch]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[check_branch]
    @id INT
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT 1 FROM branch WHERE branch_id = @id)
            RETURN 1; -- Branch exists
        ELSE
            RETURN 0; -- Branch does not exist
    END TRY
    BEGIN CATCH
        -- Handle any errors (optional: log or return an error code)
        RETURN -1; -- Indicating an error
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[check_instructor]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[check_instructor]
    @id INT
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT 1 FROM Instructor WHERE ins_id = @id)
            RETURN 1; -- Branch exists
        ELSE
            RETURN 0; -- Branch does not exist
    END TRY
    BEGIN CATCH
        -- Handle any errors (optional: log or return an error code)
        RETURN -1; -- Indicating an error
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[check_topic]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[check_topic]
    @id INT
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT 1 FROM Topic WHERE topic_id = @id)
            RETURN 1; -- Topic exists
        ELSE
            RETURN 0; -- Topic does not exist
    END TRY
    BEGIN CATCH
        -- Handle any errors (optional: log or return an error code)
        RETURN -1; -- Indicating an error
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[course_insights]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[course_insights] @id int 
as
begin
	begin try 
		select 
			c.crs_name,
			Count(se.SSN_FK) [students_count],
			CONCAT(CAST((COUNT(CASE WHEN se.exam_grade >= 5 THEN 1 END) * 100.0 / COUNT(se.exam_grade)) AS INT), '%') AS pass_percentage,
			CONCAT(CAST((COUNT(CASE WHEN se.exam_grade < 5 THEN 1 END) * 100.0 / COUNT(se.exam_grade)) AS INT), '%') AS fail_percentage
		from Instructor_Teach_Course ins 
		join course c on ins.crs_id_FK = c.crs_id and ins.ins_id_FK = @id 
		join exam e on c.crs_id = e.crs_id_FK 
		join Student_Attend_Exam se on e.exam_id = se.exam_id_FK
		group by c.crs_name 
	end try 
	begin catch
		select 'Enter a valid Instructor ID'
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[dmlQuerries]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[dmlQuerries]
(
    @tablename nvarchar(50),
    @operation nvarchar(10),
    @columns nvarchar(max) = null,
    @values nvarchar(max) = null,
    @condition nvarchar(max) = null,
	@nestlevel INT = 0 -- Default nesting level
)
as
begin
	 IF @nestlevel > 10 -- Limit nesting to 10
    BEGIN
        RAISERROR('Nesting level exceeded.', 16, 1);
        RETURN;
    END
    declare @querrySql nvarchar(max);

    begin try
        if @operation = 'insert'
			begin
				set @querrySql = 'insert into ' + @tablename + ' (' + @columns + ') values (' + @values + ')';
			end
        else if @operation = 'update'
			begin
				set @querrySql = 'update ' + @tablename + ' set ' + @columns + ' where ' + @condition;
			end
        else if @operation = 'delete'
			begin
				set @querrySql = 'delete from ' + @tablename + ' where ' + @condition;
			end
        else
			begin
				set @querrySql = 'select ''Invalid operation. Use insert, update, or delete.'' as ErrorMessage';
			end

        exec sp_executesql @querrySql;
    end try
    begin catch
        declare @customMessage nvarchar(max);

        if @operation = 'insert'
			begin
				set @customMessage = 'Custom Error: Failed to execute INSERT operation.';
			end
        else if @operation = 'update'
			begin
				set @customMessage = 'Custom Error: Failed to execute UPDATE operation.';
			end
        else if @operation = 'delete'
			begin
				set @customMessage = 'Custom Error: Failed to execute DELETE operation.';
			end
        else
			begin
				set @customMessage = 'Custom Error: Unknown operation.';
			end
        select @customMessage as ErrorMessage;
    end catch
end;
GO
/****** Object:  StoredProcedure [dbo].[Exam_Correction]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Exam_Correction] 
    @st_id INT, 
    @exam_id INT  
AS
BEGIN
    BEGIN TRY
        DECLARE @grade INT = 0;

        SELECT @grade = COUNT(*)
        FROM Student_Take_Exam_Has_Questions s 
        JOIN Questions q ON s.ques_id_FK = q.ques_id
        WHERE s.SSN_FK = @st_id 
            AND s.exam_id_FK = @exam_id 
            AND s.answer = q.ques_model_answer;

        IF EXISTS (
            SELECT 1 FROM Student_Attend_Exam 
            WHERE SSN_FK = @st_id AND exam_id_FK = @exam_id
        )
        BEGIN
            UPDATE Student_Attend_Exam
            SET exam_grade = @grade
            WHERE SSN_FK = @st_id AND exam_id_FK = @exam_id;
        END
        ELSE
        BEGIN
            INSERT INTO Student_Attend_Exam (SSN_FK, exam_id_FK, exam_grade)
            VALUES (@st_id, @exam_id, @grade);
        END
    END TRY
    BEGIN CATCH
        PRINT 'Error: ' + ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[generat1eexam]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[generat1eexam]
(
    @examname nvarchar(100),
    @examduration int,
    @examdate date,
    @courseid int,
    @totalquestions int
)
as
begin
    begin try
        declare @examid int;

        insert into exam (exam_name, exam_duration, exam_date, crs_id_fk)
        values (@examname, @examduration, @examdate, @courseid);

        set @examid = scope_identity();

        if not exists (
            select 1
            from questions
            where crs_id_fk = @courseid
        )
        begin
            throw 50001, 'no questions found for the selected course.', 1;
        end

        declare @selectedquestions table (ques_id int);

        insert into @selectedquestions (ques_id)
        select top (@totalquestions) ques_id
        from questions
        where crs_id_fk = @courseid
        order by newid();

        insert into exam_has_questions (exam_id_fk, ques_id_fk)
        select @examid, ques_id
        from @selectedquestions;

        select @examid as generatedexamid;
    end try
    begin catch
        declare @errormessage nvarchar(4000) = error_message();
        throw 50001, @errormessage, 1;
    end catch
end;
GO
/****** Object:  StoredProcedure [dbo].[generateexam]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[generateexam]
(
    @coursename nvarchar(100)
)
as
begin
    begin try
        declare @courseid int;
        declare @examid int;
        declare @examname nvarchar(100);

        select @courseid = crs_id
        from course
        where crs_name = @coursename;

        if @courseid is null
        begin
            throw 50001, 'Course not found with the given name.', 1;
        end

        set @examname = @coursename + ' Exam';

        insert into exam (exam_name, exam_duration, exam_date, crs_id_fk)
        values (@examname, 10, getdate(), @courseid);

        set @examid = scope_identity();

        if not exists (
            select 1
            from questions
            where crs_id_fk = @courseid
        )
        begin
            throw 50001, 'No questions found for the selected course.', 1;
        end

        declare @selectedquestions table (ques_id int);

        insert into @selectedquestions (ques_id)
        select top (10) ques_id
        from questions
        where crs_id_fk = @courseid
        order by newid();

        insert into exam_has_questions (exam_id_fk, ques_id_fk)
        select @examid, ques_id
        from @selectedquestions;

        select @examid as generatedexamid;
    end try
    begin catch
        declare @errormessage nvarchar(4000) = error_message();
        throw 50001, @errormessage, 1;
    end catch
end;
GO
/****** Object:  StoredProcedure [dbo].[Get_Exam_Details]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[Get_Exam_Details]
(
    @ins_id int
)
as
begin
    select 
        e.exam_name, 
        e.exam_duration, 
        e.exam_date,
        COUNT(src.SSN_FK) as Student_Count
    from Instructor i
    inner join Instructor_Teach_Course itc
    on i.ins_id = itc.ins_id_FK
    inner join Course c
    on c.crs_id = itc.crs_id_FK
    inner join Exam e
    on e.crs_id_FK = c.crs_id
    inner join Student_Register_Course src
    on src.crs_id_FK = c.crs_id
    where i.ins_id = @ins_id
    group by e.exam_name, e.exam_duration, e.exam_date
    order by e.exam_name;
end;
GO
/****** Object:  StoredProcedure [dbo].[get_id]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[get_id]
    @table VARCHAR(MAX), 
    @param VARCHAR(MAX),
    @nestlevel INT = 0 -- Default nesting level
AS 
BEGIN 
    IF @nestlevel > 10 -- Limit nesting to 10
    BEGIN
        RAISERROR('Nesting level exceeded.', 16, 1);
        RETURN;
    END

    BEGIN TRY 
        DECLARE @query NVARCHAR(MAX)
        DECLARE @result INT
        
        IF (@table = 'Admin')
            SET @query = 'SELECT @result = id FROM ' + @table + 
                         N' WHERE admin_email = @param'
        IF (@table = 'Student')
            SET @query = 'SELECT @result = SSN FROM ' + @table + 
                         N' WHERE stud_email = @param'
        IF (@table = 'Instructor')
            SET @query = 'SELECT @result = ins_id FROM ' + @table + 
                         N' WHERE ins_email = @param'
        IF (@table = 'Exam')
            SET @query = 'SELECT @result = exam_id FROM ' + @table + 
                         N' WHERE exam_name = @param'
        IF (@table = 'Course')
            SET @query = 'SELECT @result = crs_id FROM ' + @table + 
                         N' WHERE crs_name = @param'
		IF (@table = 'Questions')
            SET @query = 'SELECT @result = ques_id FROM ' + @table + 
                         N' WHERE ques_name = @param'
        
        -- Prevent SQL injection as the input is not part of the query itself 
        EXEC sp_executesql @query, 
            N'@param VARCHAR(255), @result INT OUTPUT', 
            @param, @result OUTPUT

        IF @result IS NULL 
            SELECT 'Enter a valid input'
        ELSE
            SELECT @result
    END TRY 
    BEGIN CATCH 
        SELECT 'Please enter valid data';
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[get_name]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[get_name]
	@table varchar(max), 
    @email varchar(max) 
as 
begin 
    begin try 
        declare @query nvarchar(max)
		declare @result nvarchar(max)

		if (@table = 'Student')
			set @query = 'select @result = stud_fname + '' '' + stud_lname from ' + @table + 
                     N' where stud_email = @email'

		if (@table = 'Instructor')
			set @query = 'select @result = ins_name from ' + @table + 
                     N' where ins_email = @email'
        
        exec sp_executesql @query, 
            N'@email varchar(255) , @result nvarchar(max) OUTPUT', 
            @email , @result OUTPUT

		if @result is NULL 
			select 'Enter a valid email'
		else
			select @result as 'Name'
    end try 
    begin catch 
        select 'Please enter valid data';
    end catch
end;
GO
/****** Object:  StoredProcedure [dbo].[get_password]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[get_password] 
	@table varchar(max), 
    @email varchar(max),
	@nestlevel INT = 0 -- Default nesting level
as 
begin 
	IF @nestlevel > 10 -- Limit nesting to 10
    BEGIN
        RAISERROR('Nesting level exceeded.', 16, 1);
        RETURN;
    END
    begin try 
        declare @query nvarchar(max)
		declare @result nvarchar(max)
        
		
		if (@table = 'Admin')
			set @query = 'select @result = admin_password from ' + @table + 
                     N' where admin_email = @email'
		if (@table = 'Student')
			set @query = 'select @result = stud_password from ' + @table + 
                     N' where stud_email = @email'
		if (@table = 'Instructor')
			set @query = 'select @result = ins_password from ' + @table + 
                     N' where ins_email = @email'
        
		-- prevent sql injection as the input not part of the query itself 
        exec sp_executesql @query, 
            N'@email varchar(255) , @result nvarchar(max) OUTPUT', 
            @email , @result OUTPUT

		if @result is NULL 
			select 'Enter a valid email'
		else
			select @result
    end try 
    begin catch 
        select 'Please enter valid data';
    end catch
end;
GO
/****** Object:  StoredProcedure [dbo].[GetCourseTopics]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[GetCourseTopics]
(
    @topicId int
)
as
begin
select  c.crs_name as CourseName, t.topic_name as TopicName
from Course c
inner join Topic t
on t.topic_id = c.topic_id_FK
where t.topic_id =  @topicId
end;
GO
/****** Object:  StoredProcedure [dbo].[GetExamQuestionsAndChoices]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[GetExamQuestionsAndChoices]
(
    @examId int
)
as
begin
    select  e.exam_name as ExamName,q.ques_id as QuestionID,q.ques_name as QuestionText,
	q.choice_1 as Choice_1,q.choice_2 as Choice_2,q.choice_3 as Choice_3,q.choice_4 as Choice_4
    from Exam e
	inner join Exam_Has_Questions ehq 
	on e.exam_id = ehq.exam_id_FK
    inner join Questions q 
	on ehq.ques_id_FK = q.ques_id
    where e.exam_id = @examId
    order by q.ques_id;
end;
GO
/****** Object:  StoredProcedure [dbo].[GetInsCourse]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[GetInsCourse]
(
    @insId int
)
as
begin
    select i.ins_name as InstructorName,c.crs_name as CourseName,count(src.SSN_FK) as NumOfStudents
    from Instructor i
	inner join Instructor_Teach_Course itc
    on i.ins_id = itc.ins_id_FK
    inner join Course c
    on c.crs_id = itc.crs_id_FK
    inner join Student_Register_Course src
    on src.crs_id_FK = c.crs_id
    where i.ins_id = @insId
    group by i.ins_name, c.crs_name;
end;
GO
/****** Object:  StoredProcedure [dbo].[GetInstructorCourseQuestions]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetInstructorCourseQuestions]
    @ins_id INT,  
    @course_name VARCHAR(100),
    @result INT OUTPUT
AS
BEGIN
    DECLARE @question_count INT;
    
    
    SELECT @question_count = COUNT(*)
    FROM Questions q
    INNER JOIN Course c ON q.crs_id_FK = c.crs_id
    INNER JOIN Instructor_Teach_Course itc ON c.crs_id = itc.crs_id_FK
    INNER JOIN Instructor i ON itc.ins_id_FK = i.ins_id
    WHERE i.ins_id = @ins_id 
      AND c.crs_name = @course_name;

    
    IF @question_count < 10
        SET @result = 1;
    ELSE IF @question_count >= 10
        SET @result = 0;
    
    
    SELECT 
        q.ques_id,
        q.ques_name,
        q.ques_type,
        q.choice_1,
        q.choice_2,
        q.choice_3,
        q.choice_4,
        q.ques_model_answer
    FROM Questions q
    INNER JOIN Course c ON q.crs_id_FK = c.crs_id
    INNER JOIN Instructor_Teach_Course itc ON c.crs_id = itc.crs_id_FK
    INNER JOIN Instructor i ON itc.ins_id_FK = i.ins_id
    WHERE i.ins_id = @ins_id 
      AND c.crs_name = @course_name;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetInstructorIdByName]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetInstructorIdByName]
    @InstructorName NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Select the ID of the instructor by name
        SELECT ins_id 
        FROM Instructor 
        WHERE ins_name = @InstructorName;
    END TRY
    BEGIN CATCH
        THROW; -- Rethrow any errors
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[GetInstructorStudentGrades]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[GetInstructorStudentGrades]
(
    @insId int
)
as
begin
    select 
        s.stud_fname + ' ' + s.stud_lname as fullName,
        e.exam_name,
        concat(cast((se.exam_grade * 100.0 / 10) as INT), '%') as GradePercentage,
        case 
            when (se.exam_grade * 100.0 / 10) < 50 then 'Fail'
            else 'Pass'
        end as Status
    from Instructor i
    inner join Instructor_Teach_Course itc
    on i.ins_id = itc.ins_id_FK
    inner join Course c
    on c.crs_id = itc.crs_id_FK
    inner join Exam e
    on e.crs_id_FK = c.crs_id
    inner join Student_Attend_Exam se
    on e.exam_id = se.exam_id_FK
    inner join Student s
    on s.SSN = se.SSN_FK
    where i.ins_id = @insId;
end;
GO
/****** Object:  StoredProcedure [dbo].[GetLastInsertedTrackId]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetLastInsertedTrackId]
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Fetch the last identity value in the current session and scope
        SELECT SCOPE_IDENTITY() AS TrackId;
    END TRY
    BEGIN CATCH
        THROW; -- Rethrow any error for handling
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[GeTopicIdByName]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GeTopicIdByName]
    @TopicName NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Select the ID of the instructor by name
        SELECT topic_id 
        FROM Topic 
        WHERE topic_name = @TopicName;
    END TRY
    BEGIN CATCH
        THROW; -- Rethrow any errors
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[GetRandomExamQuestions]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetRandomExamQuestions]
(
    @course_name NVARCHAR(100),
    @ssn INT
)
AS
BEGIN
    BEGIN TRY
        DECLARE @course_id INT;
        DECLARE @exam_id INT;

        SELECT @course_id = crs_id
        FROM course
        WHERE crs_name = @course_name;

        IF @course_id IS NULL
        BEGIN
            THROW 50001, 'Course not found with the given name.', 1;
        END

        SELECT @exam_id = exam_id
        FROM exam
        WHERE exam_name = @course_name AND crs_id_fk = @course_id;

        IF @exam_id IS NULL
        BEGIN
            THROW 50001, 'No exam found for the given course.', 1;
        END

        IF NOT EXISTS (
            SELECT 1
            FROM student_register_course
            WHERE ssn_fk = @ssn AND crs_id_fk = @course_id
        )
        BEGIN
            THROW 50001, 'Student is not registered in the given course.', 1;
        END

        SELECT 
            q.ques_name AS QuestionText,
            q.choice_1 AS Choice1,
            q.choice_2 AS Choice2,
            q.choice_3 AS Choice3,
            q.choice_4 AS Choice4,
			q.ques_id,
			e.exam_id
			FROM exam e
        INNER JOIN exam_has_questions ehq ON e.exam_id = ehq.exam_id_fk
        INNER JOIN questions q ON ehq.ques_id_fk = q.ques_id
        WHERE e.exam_id = @exam_id
        ORDER BY NEWID();
    END TRY
    BEGIN CATCH
        DECLARE @error_message NVARCHAR(4000) = ERROR_MESSAGE();
        THROW 50001, @error_message, 1;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[GetStudentExamReport]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetStudentExamReport]
(
    @examId INT,
    @studentId INT
)
AS
BEGIN
    -- Declare variables for total and correct answers
    DECLARE @TotalQuestions INT, @CorrectAnswers INT;

    -- Count total questions in the exam
    SELECT @TotalQuestions = COUNT(*)
    FROM Exam_Has_Questions
    WHERE exam_id_FK = @examId;

    -- Count correct answers given by the student
    SELECT @CorrectAnswers = COUNT(*)
    FROM Exam_Has_Questions ehq
    INNER JOIN Questions q ON ehq.ques_id_FK = q.ques_id
    LEFT JOIN Student_Take_Exam_Has_Questions sc 
        ON q.ques_id = sc.ques_id_FK 
        AND sc.SSN_FK = @studentId
    WHERE ehq.exam_id_FK = @examId 
    AND sc.answer = q.ques_model_answer;  -- Checking if answer is correct

    -- Calculate percentage
    DECLARE @Percentage FLOAT;
    SET @Percentage = CASE 
                        WHEN @TotalQuestions > 0 
                        THEN (@CorrectAnswers * 100.0) / @TotalQuestions 
                        ELSE 0 
                      END;

    -- Determine pass or fail (assuming pass is 50% or above)
    DECLARE @ResultStatus VARCHAR(10);
    SET @ResultStatus = CASE WHEN @Percentage >= 50 THEN 'Pass' ELSE 'Fail' END;

    -- Return detailed report in a single query with Full Name of Student
    SELECT  
        e.exam_name AS ExamName,
        q.ques_id AS QuestionID,
        q.ques_name AS QuestionText,
        sc.answer AS StudentAnswer,
        q.ques_model_answer AS CorrectAnswer,
        CASE 
            WHEN sc.answer = q.ques_model_answer THEN 'Right'
            ELSE 'Wrong'
        END AS AnswerStatus,
        @TotalQuestions AS TotalQuestions,
        @CorrectAnswers AS CorrectAnswers,
        @Percentage AS Percentage,
        @ResultStatus AS ResultStatus,
        s.stud_fname + ' ' + s.stud_lname AS StudentFullName -- Concatenating First and Last Name
    FROM Exam e
    INNER JOIN Exam_Has_Questions ehq 
        ON e.exam_id = ehq.exam_id_FK
    INNER JOIN Questions q 
        ON ehq.ques_id_FK = q.ques_id
    LEFT JOIN Student_Take_Exam_Has_Questions sc 
        ON q.ques_id = sc.ques_id_FK 
        AND sc.SSN_FK = @studentId
    INNER JOIN Student s 
        ON s.SSN = @studentId  -- Joining with Student table to get Full Name
    WHERE e.exam_id = @examId
    ORDER BY q.ques_id;
END;

GO
/****** Object:  StoredProcedure [dbo].[GetStudentGrades]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[GetStudentGrades]
(
    @stId int
)
as
begin
    select s.SSN,s.stud_fname + ' ' + s.stud_lname as fullName,
	e.exam_name,concat(cast((se.exam_grade * 100.0 / 10) as decimal(5, 2)), '%') as GradePercentage
    from Student s
    inner join Student_Attend_Exam se
    on s.SSN = se.SSN_FK
	inner join Exam e
	on e.exam_id = se.exam_id_FK
    where s.SSN = @stId;
end;
GO
/****** Object:  StoredProcedure [dbo].[GetStudentGradesStatus]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStudentGradesStatus]
(
    @ssn INT
)
AS
BEGIN
    SELECT 
        e.exam_name,
        CONCAT(CAST((se.exam_grade * 100 / 10) AS INT), '%') AS GradePercentage,
        CASE 
            WHEN (se.exam_grade * 100 / 10) < 50 THEN 'Fail'
            ELSE 'Pass'
        END AS Status
    FROM Student s
    INNER JOIN Student_Attend_Exam se ON s.SSN = se.SSN_FK
    INNER JOIN Exam e ON e.exam_id = se.exam_id_FK
    INNER JOIN Course c ON e.crs_id_FK = c.crs_id
    WHERE s.SSN = @ssn;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetStudentInfoByDepartment]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[GetStudentInfoByDepartment]
(
    @TracktNo int
)
as
begin
    select 
        s.SSN,
        s.stud_fname + ' ' + s.stud_lname as fullName,
        s.stud_email,
        s.stud_gender,
		s.stud_address,
		s.stud_gender,
		s.stud_phone,
        t.track_name
    from 
        Student s
    join 
        Track t
    on 
        s.track_id_FK = t.track_id
    where 
        t.track_id = @TracktNo;
end;
GO
/****** Object:  StoredProcedure [dbo].[GetStudentInfoByTracks]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[GetStudentInfoByTracks]
(
    @TracktNo int
)
as
begin
    select 
        s.SSN,
        s.stud_fname + ' ' + s.stud_lname as fullName,
        s.stud_email,
        s.stud_gender,
		s.stud_address,
		s.stud_gender,
		s.stud_phone,
        t.track_name
    from 
        Student s
    join 
        Track t
    on 
        s.track_id_FK = t.track_id
    where 
        t.track_id = @TracktNo;
end;
GO
/****** Object:  StoredProcedure [dbo].[GetStudentInfoInTracks]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[GetStudentInfoInTracks]
as
begin
    select 
        s.SSN,
        s.stud_fname + ' ' + s.stud_lname as fullName,
        s.stud_email,
        s.stud_gender,
        s.stud_address,
        s.stud_phone,
        t.track_name
    from Student s 
	inner join Track t
    on s.track_id_FK = t.track_id
	order by t.track_name, s.stud_fname;
end;
GO
/****** Object:  StoredProcedure [dbo].[Ins_Course]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[Ins_Course]
(
    @insId int
)
as
begin
    select c.crs_id, c.crs_name as CourseName
    from Instructor i
	inner join Instructor_Teach_Course itc
    on i.ins_id = itc.ins_id_FK
    inner join Course c
    on c.crs_id = itc.crs_id_FK
    where i.ins_id = @insId
	group by c.crs_id, c.crs_name;
end;
GO
/****** Object:  StoredProcedure [dbo].[Insert_Student_Answers]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[Insert_Student_Answers]
    @st_id int, 
    @exam_id int, 
    @ques_id int, 
    @answer nvarchar(150)
as
begin
    begin try
        merge student_take_exam_has_questions as target
        using (select @st_id as ssn_fk, @exam_id as exam_id_fk, @ques_id as ques_id_fk) as source
        on (target.ssn_fk = source.ssn_fk and target.exam_id_fk = source.exam_id_fk and target.ques_id_fk = source.ques_id_fk)
        when matched then
            update set target.answer = @answer
        when not matched then
            insert (ssn_fk, exam_id_fk, ques_id_fk, answer)
            values (@st_id, @exam_id, @ques_id, @answer);
    end try
    begin catch
        throw 50001, 'error: failed to insert or update student answer.', 1;
    end catch
end;
GO
/****** Object:  StoredProcedure [dbo].[InsertTrack]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[InsertTrack]
    @TrackName NVARCHAR(100),
    @InstructorId INT,
    @AdminId INT,
    @TrackId INT OUTPUT 
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        INSERT INTO Track (track_name,track_manager, admin_id_FK)
        VALUES (@TrackName, @InstructorId, @AdminId);

        -- Retrieve the ID of the newly inserted record
        SET @TrackId = SCOPE_IDENTITY();
    END TRY
    BEGIN CATCH
        THROW; -- Rethrow any error for handling
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[instructorInfo]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[instructorInfo]
as
begin
    select ins_id,ins_name,ins_email,ins_phone,ins_salary
	from Instructor
end;
GO
/****** Object:  StoredProcedure [dbo].[isStudTakeExam]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[isStudTakeExam]
(
    @ssn int,
    @crs_name nvarchar(100),
    @result int output
)
as
begin
    begin try
        declare @course_id int;
        declare @exam_id int;

        select @course_id = crs_id
        from course
        where crs_name = @crs_name;

        if @course_id is null
        begin
            throw 50001, 'Course not found with the given name.', 1;
        end

        select @exam_id = exam_id
        from exam
        where crs_id_fk = @course_id and exam_name = @crs_name;

        if @exam_id is null
        begin
            throw 50001, 'No exam found for the given course and exam name.', 1;
        end

        if exists (
            select 1
            from student_attend_exam
            where ssn_fk = @ssn and exam_id_fk = @exam_id
        )
        begin
            set @result = 1;
            print 'The student has already taken the exam.';
        end
        else
        begin
            set @result = 0;
            print 'The student has not taken the exam yet.';
        end
    end try
    begin catch
        declare @error_message nvarchar(4000) = error_message();
        throw 50001, @error_message, 1;
    end catch
end;
GO
/****** Object:  StoredProcedure [dbo].[login_check]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[login_check] 
	@table varchar(max),
    @email varchar(max), 
    @password varchar(max),
	@nestlevel INT = 0 -- Default nesting level
as 
begin 
	IF @nestlevel > 10 -- Limit nesting to 10
    BEGIN
        RAISERROR('Nesting level exceeded.', 16, 1);
        RETURN;
    END
    begin try 
        declare @query nvarchar(max);
        
		if (@table = 'Admin')
			set @query = 'select count(*) from ' + @table + 
                     ' where admin_email = @email and admin_password = @password';
		if (@table = 'Student')
			set @query = 'select count(*) from ' + @table + 
                     ' where stud_email = @email and stud_password = @password';
		if (@table = 'Instructor')
			set @query = 'select count(*) from ' + @table + 
                     ' where ins_email = @email and ins_password = @password';
        
        
		-- prevent sql injection as the input not part of the query itself 
        exec sp_executesql @query, 
            N'@email varchar(255), @password varchar(255)', 
            @email, 
            @password;
    end try 
    begin catch 
        select 'Please enter valid data';
    end catch
end;
GO
/****** Object:  StoredProcedure [dbo].[search]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[search]
	@table varchar(max), 
    @col varchar(max),
	@search_text varchar(max),
	@nestlevel INT = 0 -- Default nesting level
as 
begin 
	IF @nestlevel > 10 -- Limit nesting to 10
    BEGIN
        RAISERROR('Nesting level exceeded.', 16, 1);
        RETURN;
    END
    begin try 
        declare @query nvarchar(max)
		set @search_text = '%' + @search_text + '%'
        set @query = 'select * from ' + @table + 
                     N' where ' + @col + ' like @search_text'
        
		-- prevent sql injection as the input not part of the query itself 
        exec sp_executesql @query, 
            N'@search_text varchar(max)', 
            @search_text 
    end try 
    begin catch 
        select 'Please enter valid data';
    end catch
end;
GO
/****** Object:  StoredProcedure [dbo].[stud_Course]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[stud_Course]
(
    @ssn int
)
as
begin
    select c.crs_id, c.crs_name as CourseName
    from Student s
	inner join Student_Register_Course src
	on s.SSN = src.SSN_FK
	inner join Course c
	on src.crs_id_FK = c.crs_id
	where s.SSN = @ssn
    group by c.crs_id, c.crs_name;
end;
GO
/****** Object:  StoredProcedure [dbo].[StudentInfo]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[StudentInfo]
as
begin
    select SSN,stud_fname,stud_lname,stud_email,stud_phone,stud_address,stud_gender,stud_birthdate
	from Student
end;
GO
/****** Object:  StoredProcedure [dbo].[UpdateExamDateDaily]    Script Date: 2/1/2025 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[UpdateExamDateDaily]
as
begin
    update exam
    set exam_date = getdate();
end;
GO
USE [master]
GO
ALTER DATABASE [db_ab2209_examinationsystem] SET  READ_WRITE 
GO
