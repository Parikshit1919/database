USE [master]
GO
/****** Object:  Database [Online_exam]    Script Date: 12-04-2021 09:32:44 PM ******/
CREATE DATABASE [Online_exam]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Online_exam', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Online_exam.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Online_exam_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Online_exam_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Online_exam] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Online_exam].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Online_exam] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Online_exam] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Online_exam] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Online_exam] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Online_exam] SET ARITHABORT OFF 
GO
ALTER DATABASE [Online_exam] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Online_exam] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Online_exam] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Online_exam] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Online_exam] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Online_exam] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Online_exam] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Online_exam] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Online_exam] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Online_exam] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Online_exam] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Online_exam] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Online_exam] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Online_exam] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Online_exam] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Online_exam] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Online_exam] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Online_exam] SET RECOVERY FULL 
GO
ALTER DATABASE [Online_exam] SET  MULTI_USER 
GO
ALTER DATABASE [Online_exam] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Online_exam] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Online_exam] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Online_exam] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Online_exam] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Online_exam] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Online_exam', N'ON'
GO
ALTER DATABASE [Online_exam] SET QUERY_STORE = OFF
GO
USE [Online_exam]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 12-04-2021 09:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Admin_id] [int] IDENTITY(201,1) NOT NULL,
	[Admin_Email] [varchar](255) NOT NULL,
	[Admin_Password] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 12-04-2021 09:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Course_id] [int] IDENTITY(301,1) NOT NULL,
	[Course_name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exams]    Script Date: 12-04-2021 09:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exams](
	[Exam_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Course_id] [int] NULL,
	[Level] [int] NULL,
	[Time] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 12-04-2021 09:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Feedback_id] [int] IDENTITY(601,1) NOT NULL,
	[s_id] [int] NOT NULL,
	[s_name] [varchar](255) NOT NULL,
	[e_id] [numeric](18, 0) NOT NULL,
	[Feedback] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Forgot_Pass]    Script Date: 12-04-2021 09:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forgot_Pass](
	[ForgotPass_id] [int] IDENTITY(701,1) NOT NULL,
	[s_id] [int] NOT NULL,
	[s_email] [varchar](255) NOT NULL,
	[reset_key] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ForgotPass_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 12-04-2021 09:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[Q_no] [int] IDENTITY(501,1) NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
	[Option1] [nvarchar](max) NOT NULL,
	[Option2] [nvarchar](max) NOT NULL,
	[Option3] [nvarchar](max) NOT NULL,
	[Option4] [nvarchar](max) NOT NULL,
	[Correct_ans] [varchar](255) NOT NULL,
	[e_id] [numeric](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Q_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Result]    Script Date: 12-04-2021 09:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[Result_id] [int] IDENTITY(401,1) NOT NULL,
	[Result] [varchar](255) NOT NULL,
	[s_id] [int] NOT NULL,
	[e_id] [numeric](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Result_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 12-04-2021 09:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Student_id] [int] IDENTITY(101,1) NOT NULL,
	[Fullname] [varchar](255) NOT NULL,
	[Student_Email] [varchar](255) NOT NULL,
	[Student_Password] [varchar](255) NOT NULL,
	[Mobile] [varchar](10) NOT NULL,
	[City] [varchar](255) NOT NULL,
	[DOB] [date] NOT NULL,
	[State] [varchar](255) NOT NULL,
	[Qualification] [varchar](255) NOT NULL,
	[Year_of_completion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Admin_id], [Admin_Email], [Admin_Password]) VALUES (201, N'admin@gmail.com', N'admin')
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([Course_id], [Course_name]) VALUES (302, N'SQL')
INSERT [dbo].[Courses] ([Course_id], [Course_name]) VALUES (303, N'JAVA')
INSERT [dbo].[Courses] ([Course_id], [Course_name]) VALUES (308, N'Python')
INSERT [dbo].[Courses] ([Course_id], [Course_name]) VALUES (309, N'ADO.NET')
INSERT [dbo].[Courses] ([Course_id], [Course_name]) VALUES (333, N'ASP.NET')
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Exams] ON 

INSERT [dbo].[Exams] ([Exam_id], [Course_id], [Level], [Time]) VALUES (CAST(1 AS Numeric(18, 0)), 302, 1, 10)
INSERT [dbo].[Exams] ([Exam_id], [Course_id], [Level], [Time]) VALUES (CAST(2 AS Numeric(18, 0)), 303, 1, 10)
INSERT [dbo].[Exams] ([Exam_id], [Course_id], [Level], [Time]) VALUES (CAST(4 AS Numeric(18, 0)), 308, 2, 20)
SET IDENTITY_INSERT [dbo].[Exams] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([Feedback_id], [s_id], [s_name], [e_id], [Feedback]) VALUES (602, 101, N'Ross', CAST(2 AS Numeric(18, 0)), N'MEDUIM HARD')
INSERT [dbo].[Feedback] ([Feedback_id], [s_id], [s_name], [e_id], [Feedback]) VALUES (603, 114, N'SKB', CAST(1 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Feedback] ([Feedback_id], [s_id], [s_name], [e_id], [Feedback]) VALUES (605, 114, N'SKB', CAST(2 AS Numeric(18, 0)), N'Meduim Hard')
INSERT [dbo].[Feedback] ([Feedback_id], [s_id], [s_name], [e_id], [Feedback]) VALUES (609, 107, N'Sdsa', CAST(1 AS Numeric(18, 0)), N'EASY')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Result] ON 

INSERT [dbo].[Result] ([Result_id], [Result], [s_id], [e_id]) VALUES (402, N'82', 101, CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Result] ([Result_id], [Result], [s_id], [e_id]) VALUES (403, N'90', 107, CAST(4 AS Numeric(18, 0)))
INSERT [dbo].[Result] ([Result_id], [Result], [s_id], [e_id]) VALUES (405, N'99', 114, CAST(2 AS Numeric(18, 0)))
SET IDENTITY_INSERT [dbo].[Result] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Student_id], [Fullname], [Student_Email], [Student_Password], [Mobile], [City], [DOB], [State], [Qualification], [Year_of_completion]) VALUES (101, N'Ross', N'ross@gmail.com', N'ross111', N'9876543210', N'Mumbai', CAST(N'1994-04-30' AS Date), N'Maharashtra', N'BEIT', 2016)
INSERT [dbo].[Student] ([Student_id], [Fullname], [Student_Email], [Student_Password], [Mobile], [City], [DOB], [State], [Qualification], [Year_of_completion]) VALUES (102, N'Rachel', N'rachel@gmail.com', N'rachel111', N'8765432109', N'Pune', CAST(N'1996-08-13' AS Date), N'Maharashtra', N'BSCIT', 2018)
INSERT [dbo].[Student] ([Student_id], [Fullname], [Student_Email], [Student_Password], [Mobile], [City], [DOB], [State], [Qualification], [Year_of_completion]) VALUES (103, N'Jedidiah', N'Bhu@gamil.com', N'abc123', N'1234567890', N'mumbai', CAST(N'2005-01-01' AS Date), N'Maharashtra', N'btech', 2020)
INSERT [dbo].[Student] ([Student_id], [Fullname], [Student_Email], [Student_Password], [Mobile], [City], [DOB], [State], [Qualification], [Year_of_completion]) VALUES (106, N'Jedidiah', N'Bhu1@gamil.com', N'abc123', N'1234567890', N'mumbai', CAST(N'2005-01-01' AS Date), N'Maharashtra', N'btech', 2020)
INSERT [dbo].[Student] ([Student_id], [Fullname], [Student_Email], [Student_Password], [Mobile], [City], [DOB], [State], [Qualification], [Year_of_completion]) VALUES (107, N'Uday', N'Uday@gamil.com', N'abc123', N'1234567890', N'mumbai', CAST(N'2005-01-01' AS Date), N'Maharashtra', N'btech', 2020)
INSERT [dbo].[Student] ([Student_id], [Fullname], [Student_Email], [Student_Password], [Mobile], [City], [DOB], [State], [Qualification], [Year_of_completion]) VALUES (114, N'SuperkingBhu', N'ABC@GMAIL.COM', N'Abc@#123', N'3213123111', N'dsad', CAST(N'2021-04-21' AS Date), N'Maharashtra', N'Btech', 2017)
INSERT [dbo].[Student] ([Student_id], [Fullname], [Student_Email], [Student_Password], [Mobile], [City], [DOB], [State], [Qualification], [Year_of_completion]) VALUES (115, N'Uday', N'Uday1@gamil.com', N'abc123', N'1234567890', N'mumbai', CAST(N'2005-01-01' AS Date), N'Maharashtra', N'btech', 2020)
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD  CONSTRAINT [fk] FOREIGN KEY([Course_id])
REFERENCES [dbo].[Courses] ([Course_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exams] CHECK CONSTRAINT [fk]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackCourses] FOREIGN KEY([e_id])
REFERENCES [dbo].[Exams] ([Exam_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_FeedbackCourses]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackStudent] FOREIGN KEY([s_id])
REFERENCES [dbo].[Student] ([Student_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_FeedbackStudent]
GO
ALTER TABLE [dbo].[Forgot_Pass]  WITH CHECK ADD  CONSTRAINT [FK_ForgotPassStudent] FOREIGN KEY([s_id])
REFERENCES [dbo].[Student] ([Student_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Forgot_Pass] CHECK CONSTRAINT [FK_ForgotPassStudent]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_QuestionExam] FOREIGN KEY([e_id])
REFERENCES [dbo].[Exams] ([Exam_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_QuestionExam]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_ResultExam] FOREIGN KEY([e_id])
REFERENCES [dbo].[Exams] ([Exam_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_ResultExam]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_ResultStudent] FOREIGN KEY([s_id])
REFERENCES [dbo].[Student] ([Student_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_ResultStudent]
GO
/****** Object:  StoredProcedure [dbo].[GET_FEEDBACK1]    Script Date: 12-04-2021 09:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GET_FEEDBACK1]
AS BEGIN
SELECT f.s_id, f.s_name, f.e_id,c.Course_name, e.[level], f.feedback 
FROM Feedback f INNER JOIN Exams e on e.Exam_id = f.e_id  INNER JOIN courses c 
ON e.Course_id = c.Course_id
end;
GO
/****** Object:  StoredProcedure [dbo].[VIEW_COURSES]    Script Date: 12-04-2021 09:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[VIEW_COURSES] 
AS BEGIN
SELECT course_id, course_name FROM Courses;
END
GO
/****** Object:  StoredProcedure [dbo].[View_Exams]    Script Date: 12-04-2021 09:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[View_Exams] AS 
BEGIN 
SELECT e.Course_id, c.Course_name, e.Exam_id, e.[level], e.[time] FROM exams e
INNER JOIN Courses c ON c.Course_id= e.course_id;
END
GO
/****** Object:  StoredProcedure [dbo].[View_Results_ByExam]    Script Date: 12-04-2021 09:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[View_Results_ByExam] @e_id INT AS
BEGIN
SELECT  r.e_id, c.Course_id, c.Course_name, r.s_id,s.Fullname, r.Result, e.[level]  FROM Result r INNER JOIN exams e 
ON r.e_id = e.Exam_id INNER JOIN Courses c ON c.Course_id = e.Course_id INNER JOIN Student s
ON s.Student_id = r.s_id WHERE r.e_id =@e_id;
END
GO
/****** Object:  StoredProcedure [dbo].[ViewAll_Results_ByExam]    Script Date: 12-04-2021 09:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ViewAll_Results_ByExam] AS
BEGIN
SELECT  r.e_id, c.Course_id, c.Course_name, r.s_id,s.Fullname, r.Result, e.[level]  FROM Result r INNER JOIN exams e 
ON r.e_id = e.Exam_id INNER JOIN Courses c ON c.Course_id = e.Course_id INNER JOIN Student s
ON s.Student_id = r.s_id
END
GO
USE [master]
GO
ALTER DATABASE [Online_exam] SET  READ_WRITE 
GO
