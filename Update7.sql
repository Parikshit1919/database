USE [master]
GO
/****** Object:  Database [Online_exam]    Script Date: 15-04-2021 01:16:25 PM ******/
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
/****** Object:  Table [dbo].[Admin]    Script Date: 15-04-2021 01:16:25 PM ******/
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
/****** Object:  Table [dbo].[Courses]    Script Date: 15-04-2021 01:16:25 PM ******/
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
/****** Object:  Table [dbo].[Exams]    Script Date: 15-04-2021 01:16:25 PM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 15-04-2021 01:16:25 PM ******/
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
/****** Object:  Table [dbo].[Forgot_Pass]    Script Date: 15-04-2021 01:16:25 PM ******/
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
/****** Object:  Table [dbo].[Questions]    Script Date: 15-04-2021 01:16:25 PM ******/
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
/****** Object:  Table [dbo].[Result]    Script Date: 15-04-2021 01:16:25 PM ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 15-04-2021 01:16:25 PM ******/
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
INSERT [dbo].[Courses] ([Course_id], [Course_name]) VALUES (345, N'VB.NET')
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Exams] ON 

INSERT [dbo].[Exams] ([Exam_id], [Course_id], [Level], [Time]) VALUES (CAST(1 AS Numeric(18, 0)), 302, 1, 10)
INSERT [dbo].[Exams] ([Exam_id], [Course_id], [Level], [Time]) VALUES (CAST(2 AS Numeric(18, 0)), 303, 1, 10)
INSERT [dbo].[Exams] ([Exam_id], [Course_id], [Level], [Time]) VALUES (CAST(4 AS Numeric(18, 0)), 308, 2, 20)
INSERT [dbo].[Exams] ([Exam_id], [Course_id], [Level], [Time]) VALUES (CAST(9 AS Numeric(18, 0)), 333, 2, 70)
INSERT [dbo].[Exams] ([Exam_id], [Course_id], [Level], [Time]) VALUES (CAST(11 AS Numeric(18, 0)), 302, 2, 35)
INSERT [dbo].[Exams] ([Exam_id], [Course_id], [Level], [Time]) VALUES (CAST(17 AS Numeric(18, 0)), 333, 1, 60)
INSERT [dbo].[Exams] ([Exam_id], [Course_id], [Level], [Time]) VALUES (CAST(19 AS Numeric(18, 0)), 345, 1, 30)
SET IDENTITY_INSERT [dbo].[Exams] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([Feedback_id], [s_id], [s_name], [e_id], [Feedback]) VALUES (602, 101, N'Ross', CAST(2 AS Numeric(18, 0)), N'MEDUIM HARD')
INSERT [dbo].[Feedback] ([Feedback_id], [s_id], [s_name], [e_id], [Feedback]) VALUES (605, 114, N'SKB', CAST(2 AS Numeric(18, 0)), N'Meduim Hard')
INSERT [dbo].[Feedback] ([Feedback_id], [s_id], [s_name], [e_id], [Feedback]) VALUES (609, 107, N'Sdsa', CAST(1 AS Numeric(18, 0)), N'EASY')
INSERT [dbo].[Feedback] ([Feedback_id], [s_id], [s_name], [e_id], [Feedback]) VALUES (610, 107, N'Uday', CAST(9 AS Numeric(18, 0)), N'Meduim Hard')
INSERT [dbo].[Feedback] ([Feedback_id], [s_id], [s_name], [e_id], [Feedback]) VALUES (618, 107, N'Uday', CAST(4 AS Numeric(18, 0)), N'HARD')
INSERT [dbo].[Feedback] ([Feedback_id], [s_id], [s_name], [e_id], [Feedback]) VALUES (619, 107, N'Uday', CAST(9 AS Numeric(18, 0)), N'BHU')
INSERT [dbo].[Feedback] ([Feedback_id], [s_id], [s_name], [e_id], [Feedback]) VALUES (621, 114, N'Uday', CAST(2 AS Numeric(18, 0)), N'HARD')
INSERT [dbo].[Feedback] ([Feedback_id], [s_id], [s_name], [e_id], [Feedback]) VALUES (622, 114, N'Uday', CAST(2 AS Numeric(18, 0)), N'TOO EASY')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([Q_no], [Question], [Option1], [Option2], [Option3], [Option4], [Correct_ans], [e_id]) VALUES (502, N'What is the full form of SQL?', N'Structured Query List', N'Structure Query Language', N'Sample Query Language', N'None of these.', N'b', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Questions] ([Q_no], [Question], [Option1], [Option2], [Option3], [Option4], [Correct_ans], [e_id]) VALUES (503, N'Which of the following is not a valid SQL type?', N'FLOAT', N'NUMERIC', N'DECIMAL', N'CHARACTER', N'c', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Questions] ([Q_no], [Question], [Option1], [Option2], [Option3], [Option4], [Correct_ans], [e_id]) VALUES (504, N'Which of the following is not a DDL command?', N'TRUNCATE', N'ALTER', N'CREATE', N'UPDATE', N'c', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Questions] ([Q_no], [Question], [Option1], [Option2], [Option3], [Option4], [Correct_ans], [e_id]) VALUES (506, N' Which of the following option leads to the portability and security of Java?', N'Bytecode is executed by JVM', N'The applet makes the Java code secure and portable', N'Use of exception handling', N'Dynamic binding between objects', N'a', CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[Questions] ([Q_no], [Question], [Option1], [Option2], [Option3], [Option4], [Correct_ans], [e_id]) VALUES (507, N'Which of the following is not a Java features?', N'Dynamic', N'Architecture Neutral', N'Use of pointers', N'Object-oriented', N'c', CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[Questions] ([Q_no], [Question], [Option1], [Option2], [Option3], [Option4], [Correct_ans], [e_id]) VALUES (508, N' _____ is used to find and fix bugs in the Java programs.', N'JVM', N'JRE', N'JDK', N'JDB', N'd', CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[Questions] ([Q_no], [Question], [Option1], [Option2], [Option3], [Option4], [Correct_ans], [e_id]) VALUES (509, N'The model is a _______', N'Shape of data', N'Html content', N'Collection of data', N'Type of data', N'a', CAST(17 AS Numeric(18, 0)))
INSERT [dbo].[Questions] ([Q_no], [Question], [Option1], [Option2], [Option3], [Option4], [Correct_ans], [e_id]) VALUES (510, N'What is ActionResult()?', N'It is an abstract Class', N'It is a Concrete Class', N'Both A and B', N'None', N'a', CAST(17 AS Numeric(18, 0)))
INSERT [dbo].[Questions] ([Q_no], [Question], [Option1], [Option2], [Option3], [Option4], [Correct_ans], [e_id]) VALUES (511, N'Which of the followings are Actionselectors?', N'ActionName', N'NonAction', N'ActionVerbs', N'All of the above', N'd', CAST(17 AS Numeric(18, 0)))
INSERT [dbo].[Questions] ([Q_no], [Question], [Option1], [Option2], [Option3], [Option4], [Correct_ans], [e_id]) VALUES (512, N'Which of the following is not Constraint in SQL?', N'Primary Key', N'Not Null', N'Check', N'JOIN', N'd', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Questions] ([Q_no], [Question], [Option1], [Option2], [Option3], [Option4], [Correct_ans], [e_id]) VALUES (515, N'MVC comes from which year?', N'2003', N'2002', N'2004', N'2016', N'b', CAST(17 AS Numeric(18, 0)))
INSERT [dbo].[Questions] ([Q_no], [Question], [Option1], [Option2], [Option3], [Option4], [Correct_ans], [e_id]) VALUES (516, N'Which of the following is also called an INNER JOIN?', N'SELF JOIN', N'EQUI JOIN', N'FULL OUTER JOIN', N'None of the above', N'b', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Questions] ([Q_no], [Question], [Option1], [Option2], [Option3], [Option4], [Correct_ans], [e_id]) VALUES (517, N'Which of the following is a basic data type in VB.NET?', N'Boolean', N'Byte', N'Char', N'All of the above.', N'd', CAST(19 AS Numeric(18, 0)))
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[Result] ON 

INSERT [dbo].[Result] ([Result_id], [Result], [s_id], [e_id]) VALUES (402, N'82', 101, CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Result] ([Result_id], [Result], [s_id], [e_id]) VALUES (403, N'90', 107, CAST(4 AS Numeric(18, 0)))
INSERT [dbo].[Result] ([Result_id], [Result], [s_id], [e_id]) VALUES (405, N'99', 114, CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[Result] ([Result_id], [Result], [s_id], [e_id]) VALUES (406, N'85', 117, CAST(11 AS Numeric(18, 0)))
INSERT [dbo].[Result] ([Result_id], [Result], [s_id], [e_id]) VALUES (407, N'94', 106, CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[Result] ([Result_id], [Result], [s_id], [e_id]) VALUES (408, N'94', 101, CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Result] ([Result_id], [Result], [s_id], [e_id]) VALUES (409, N'75', 103, CAST(11 AS Numeric(18, 0)))
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
INSERT [dbo].[Student] ([Student_id], [Fullname], [Student_Email], [Student_Password], [Mobile], [City], [DOB], [State], [Qualification], [Year_of_completion]) VALUES (116, N'Jedidiah', N'codeboyjedi@gmail.com', N'Abc@#123', N'3213123111', N'Mumbai', CAST(N'1998-11-19' AS Date), N'Maharashtra', N'BE', 2020)
INSERT [dbo].[Student] ([Student_id], [Fullname], [Student_Email], [Student_Password], [Mobile], [City], [DOB], [State], [Qualification], [Year_of_completion]) VALUES (117, N'SuperkingBhu', N'ABC1@GMAIL.COM', N'Abc@#123', N'3213123111', N'MUMBAI', CAST(N'2021-04-21' AS Date), N'Mizoram', N'BE', 2019)
INSERT [dbo].[Student] ([Student_id], [Fullname], [Student_Email], [Student_Password], [Mobile], [City], [DOB], [State], [Qualification], [Year_of_completion]) VALUES (118, N'SuperkingBhu', N'ABC3@GMAIL.COM', N'Abc@#123', N'3213123111', N'Mumbai', CAST(N'2021-04-07' AS Date), N'Jharkhand', N'BE', 2020)
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
/****** Object:  StoredProcedure [dbo].[GET_FEEDBACK1]    Script Date: 15-04-2021 01:16:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[View_Analytics]    Script Date: 15-04-2021 01:16:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[View_Analytics] AS BEGIN
SELECT
(SELECT COUNT (Student_id) FROM Student) AS 'No_Of_Students',
(SELECT COUNT (Exam_id) From Exams)AS 'No_Of_Exams',
(SELECT COUNT (Course_id) FROM Courses) AS 'No_Of_Courses',
(SELECT COUNT (result_id) From Result) AS 'No_Of_ExamsTaken',
(SELECT COUNT (Feedback_id) From Feedback) As 'No_Of_Feedbacks',
(SELECT COUNT (Q_no) From Questions) AS 'No_Of_Questions'
END
GO
/****** Object:  StoredProcedure [dbo].[VIEW_COURSES]    Script Date: 15-04-2021 01:16:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[VIEW_COURSES] 
AS BEGIN
SELECT course_id, course_name FROM Courses;
END
GO
/****** Object:  StoredProcedure [dbo].[VIEW_COURSES_BYID]    Script Date: 15-04-2021 01:16:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[VIEW_COURSES_BYID] @id int
AS BEGIN
SELECT course_id, course_name FROM Courses WHERE Course_id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[View_Exams]    Script Date: 15-04-2021 01:16:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[View_Exams_BYID]    Script Date: 15-04-2021 01:16:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[View_Exams_BYID] @id INT
AS BEGIN
SELECT e.Course_id, c.Course_name, e.Exam_id, e.[level], e.[time] FROM exams e
INNER JOIN Courses c ON c.Course_id= e.course_id WHERE e.Exam_id=@id;
end
GO
/****** Object:  StoredProcedure [dbo].[View_Questions_ByExam]    Script Date: 15-04-2021 01:16:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[View_Questions_ByExam] @id int AS BEGIN
SELECT * FROM Questions WHERE e_id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[View_Questions_ByID]    Script Date: 15-04-2021 01:16:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[View_Questions_ByID] @id int AS BEGIN
SELECT * FROM Questions WHERE Q_no=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[View_Results_ByExam]    Script Date: 15-04-2021 01:16:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[View_Results_ByStudent]    Script Date: 15-04-2021 01:16:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[View_Results_ByStudent] @id INT AS BEGIN
SELECT  r.e_id, c.Course_id, c.Course_name, r.s_id,s.Fullname, r.Result, e.[level]  FROM Result r INNER JOIN exams e 
ON r.e_id = e.Exam_id INNER JOIN Courses c ON c.Course_id = e.Course_id INNER JOIN Student s
ON s.Student_id = r.s_id WHERE r.s_id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[ViewAll_Results_ByExam]    Script Date: 15-04-2021 01:16:25 PM ******/
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
