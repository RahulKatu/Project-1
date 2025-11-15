CREATE DATABASE LEARNING
USE LEARNING
---------------------------------******************************************  ALL THE TABLES  STARTS**********************************
--CREATE TABLE UserProfile(
-- UserId int Identity Primary key,
--DisplayName nvarchar(100) ,
--FirstName nvarchar(50),
--LastName nvarchar(50),
--Email nvarchar(100)
--)
CREATE TABLE UserProfile(
 UserId int Identity,
DisplayName nvarchar(100) NOT NULL CONSTRAINT DF_UserProfile_DisplayName DEFAULT 'Guest' ,
FirstName nvarchar(50),
LastName nvarchar(50),
Email nvarchar(100),
AddObjId nvarchar(130),
Constraint PK_UserProfile_UserId Primary Key (UserId)
) 

Create Table Roles(
RoleId int Identity,
RoleName Nvarchar(50) Not Null,
Constraint PK_Roles_RoleId Primary Key(RoleId)
)

Create Table SmartApp(
SmartAppId Int Identity,
AppName nvarchar(50) Not Null,
Constraint PK_SmartApp_SmartAppId Primary Key (SmartAppId)
)

Create Table UserRole(
UserRoleId Int Identity,
RoleId Int NOT NULL,
UserId int NOT NULL,
SmartAppId Int NOT NULL,
Constraint PK_UserRoles_UserRoleId Primary Key(UserRoleId),
Constraint FK_UserRole_UserProfile Foreign Key (UserId) References UserProfile(UserId),
Constraint FK_UserRole_Roles Foreign key (RoleId) References Roles(RoleId),
Constraint FK_UserRole_SmartApp Foreign Key (SmartAppId) References SmartApp(SmartAppId)
)

Create Table Courses(
CourseId int Identity,
Title nvarchar(100) Not Null,
Description Nvarchar(max)Null,
CreatedBy Int NOT NULL,
CreatedOn Datetime2 NOT NULL Constraint Df_Course_CreatedOn Default Getdate(),
Constraint PK_Courses_CourseId Primary Key (CourseId),
Constraint Fk_Courses_CreatedBy Foreign Key (CreatedBy) References UserProfile (UserId)
)


Create Table Questions(
QuestionId Int Identity,
CourseId int NOT NULL,
QuestionText nvarchar(max)  NULL,
DifficultyLevel nvarchar(20) NOT NULL,
IsCode Bit NOT NULL Default 0,
Constraint PK_Questions_QuestionId Primary Key (QuestionId),
Constraint Fk_Questions_CourseId Foreign Key (CourseId) References Courses(CourseId)
)


Create Table Choices(
ChoiceId int Identity,
QuestionId int Not Null,
ChoiceText nvarchar(max) Not Null,
IsCode Bit NOt NUll Default 0,
IsCorrect Bit Not Null,
Constraint PK_Choices_ChoiceId Primary Key(ChoiceId),
Constraint FK_Choices_QuestionId Foreign Key (QuestionId) References Questions(QuestionId)
)

Create Table Exams
(
ExamId int Identity,
CourseId Int NOT NULL,
UserId int NOT NULL,
Status nvarchar(20) NOT NULL Default 'In Progress',
StartedOn Datetime2  NOT NULL Constraint DF_Exams_StartedOn Default Getdate(),
FinishedOn Datetime2 Null,
FeedBack Datetime Null,
Constraint PK_Exams_ExamId Primary Key (ExamId),
Constraint Fk_Exams_CourseId Foreign Key (CourseId) References Courses(CourseId),
Constraint FK_Exams_UserId Foreign key (UserId)References UserProfile(UserId)
)

Create Table ExamQuestions(
ExamQuestionId Int Identity,
ExamId int NOT NULL,
QuestionId int NOT NULL,
SelectedChoiceId Int Null,
IsCorrect Bit Null,
ReviewLater Bit Null Default 0,
Constraint PK_ExamQuestions_ExamQuestionId Primary Key (ExamQuestionId),
Constraint FK_ExamQuestions_ExamId Foreign Key(ExamId) References Exams(ExamId),
Constraint FK_ExamQuestions_QuestionId Foreign Key (QuestionId) References Questions(QuestionId),
Constraint FK_ExamQuestions_SelectedChoiceId Foreign Key (SelectedChoiceId) References Choices(ChoiceId),
)

Create Table Notification(
NotificationId Int Identity,
Subject Nvarchar(200) NOT NULL,
Content Nvarchar(max) NOT NULL,
CreatedoN Datetime2 NOT NULL Constraint Df_Notification_CreatedOn Default GetDate(),
ScheduledSendTime Datetime2 NOT NULL,
IsActive Bit NOT NULL Default 1,
Constraint PK_Notification_NotificationId Primary Key (NotificationId)
)

Create Table UserNotifications(
UserNotificationId Int Identity,
NotificationId Int NOT NULL,
UserId Int NOT NULL,
EmailSubject Nvarchar(200) Not Null,
EmailContent Nvarchar(max) NOT NULL,
NotificationSent Bit NOT NULL Default 0,
SentOn Datetime2 Null,
CreatedOn Datetime2 NOT NULL Constraint Df_UserNotification_CreatedOn Default GetDate(),
Constraint PK_UserNotifications_UserNotificationId Primary Key (UserNotificationId),
Constraint FK_UserNotifications_NotificationId Foreign Key(NotificationId) References Notification(NotificationId),
Constraint FK_UserNotification_UserId Foreign Key(UserId) References UserProfile(UserId)
)

Create Table BannerInfo(
BannerId int Identity,
Title nvarchar(100)NOT NULL,
Content nvarchar(max) NOT NULL,
ImageUrl nvarchar(500)NULL,
IsActive Bit NOT NULL Default 1,
DisplayFrom Datetime2 NOT NULL,
DisplayTo Datetime2 NOT NULL,
CreatedOn Datetime2 NOT NULL Constraint Df_BannerInfo_CreatedOn Default GetDate(),
Constraint PK_BannerInfo_BannerId Primary Key(BannerId)
)
 

Create Table UserActivityLog(
LogId INT IDENTITY,
UserId int,
ActivityType nvarchar(50) Not Null,
ActivityDescription nvarchar(max),
LogDate Datetime Not null,
Constraint PK_UserActivityLog_LogId PRIMARY KEY (LogId),
Constraint FK_UserActivityLog_UserProfile Foreign Key (UserId) references UserProfile(UserId)
)

Create Table ContactUs(
ContactUsId Int Identity,
UserName Nvarchar(100) NOT NULL,
UserEmail NVarchar(100) NOT NULL,
MessageDetails Nvarchar(2000) NOT NULL,
Constraint PK_ContactUs_ContactUsId Primary Key (ContactUsId)
)

---------------------------------******************************************  ALL THE TABLES  END**********************************





