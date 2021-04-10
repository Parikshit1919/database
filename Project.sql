---------------------DATABASE----------------------
Create database Online_exam
use Online_exam

---------------------TABLES----------------------
CREATE TABLE Student (
	Student_id INT IDENTITY (101, 1) PRIMARY KEY,
	Fullname VARCHAR (255) NOT NULL,	
	Student_Email VARCHAR (255) NOT NULL,
	Student_Password VARCHAR (255) NOT NULL,
	Mobile VARCHAR(10) NOT NULL,	
	City VARCHAR (255) NOT NULL,
	DOB DATE NOT NULL,
	State VARCHAR (255) NOT NULL,
	Qualification VARCHAR (255) NOT NULL,
	Year_of_completion INT NOT NULL
);

CREATE TABLE [Admin](
	Admin_id INT IDENTITY (201, 1) PRIMARY KEY,
	Admin_Email VARCHAR (255) NOT NULL,	
	Admin_Password VARCHAR (255) NOT NULL
);

CREATE TABLE Courses(
	Course_id INT IDENTITY (301, 1) PRIMARY KEY,
	Course_name VARCHAR (255) NOT NULL,
);


CREATE TABLE Result(
	Result_id INT IDENTITY (401, 1) PRIMARY KEY,
	[Level] INT NOT NULL,
	Result VARCHAR (255) NOT NULL,
	s_id int not null,
	c_id int not null,
	CONSTRAINT FK_ResultExam FOREIGN KEY (c_id) REFERENCES Courses (Course_id) ON DELETE CASCADE ON UPDATE CASCADE,	
	CONSTRAINT FK_ResultStudent FOREIGN KEY (s_id) REFERENCES Student (Student_id) ON DELETE CASCADE ON UPDATE CASCADE	
);


CREATE TABLE Questions (
	Q_no INT IDENTITY (501, 1) PRIMARY KEY,
	Question nvarchar(max) NOT NULL,
	Option1 nvarchar(max) NOT NULL,
	Option2 nvarchar(max) NOT NULL,
	Option3 nvarchar(max) NOT NULL,
	Option4 nvarchar(max) NOT NULL,
	Correct_ans VARCHAR (255) NOT NULL,
	c_id int not null,
	[Level] INT NOT NULL,
	CONSTRAINT FK_QuestionExam FOREIGN KEY (c_id) REFERENCES Courses(Course_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Feedback(
	Feedback_id INT Identity (601,1) PRIMARY KEY,
	s_id int not null,
	s_name VARCHAR (255) not null,
	c_id int not null,
	Feedback  VARCHAR (100),
	CONSTRAINT FK_FeedbackStudent FOREIGN KEY (s_id) REFERENCES Student(Student_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_FeedbackCourses FOREIGN KEY (c_id) REFERENCES Courses(Course_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Forgot_Pass(
	ForgotPass_id INT Identity (701,1) PRIMARY KEY,
	s_id int not null,
	s_email VARCHAR (255) not null,
	reset_key VARCHAR (255),
	CONSTRAINT FK_ForgotPassStudent FOREIGN KEY (s_id) REFERENCES Student (Student_id) ON DELETE CASCADE ON UPDATE CASCADE	
);


Insert into [Admin] values('admin@gmail.com','admin')

Insert into Student VALUES ('Ross','ross@gmail.com','ross111','9876543210','Mumbai','1994-04-30','Maharashtra','BEIT',2016)
Insert into Student VALUES ('Rachel','rachel@gmail.com','rachel111','8765432109','Pune','1996-08-13','Maharashtra','BSCIT',2018)

Insert into Courses VALUES 
('PHP'),
('SQL'),
('JAVA'),
('Python')



Select * from [Admin]
Select * from Student
Select * from Courses

