USE [master]
GO
/****** Object:  Database [CompanyDB]    Script Date: 25-04-2022 23:01:20 ******/
CREATE DATABASE [CompanyDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CompanyDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CompanyDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CompanyDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CompanyDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CompanyDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CompanyDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CompanyDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CompanyDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CompanyDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CompanyDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CompanyDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CompanyDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CompanyDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CompanyDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CompanyDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CompanyDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CompanyDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CompanyDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CompanyDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CompanyDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CompanyDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CompanyDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CompanyDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CompanyDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CompanyDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CompanyDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CompanyDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CompanyDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CompanyDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CompanyDB] SET  MULTI_USER 
GO
ALTER DATABASE [CompanyDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CompanyDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CompanyDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CompanyDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CompanyDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CompanyDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CompanyDB] SET QUERY_STORE = OFF
GO
USE [CompanyDB]
GO
/****** Object:  Table [dbo].[Template]    Script Date: 25-04-2022 23:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Template](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Template] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserApplication]    Script Date: 25-04-2022 23:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserApplication](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[SubmitterName] [nvarchar](50) NULL,
	[FeedbackSubmitted] [bit] NULL,
	[FeedbackId] [int] NULL,
	[FeedbackSubmittedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserApplication] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 25-04-2022 23:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Template] ON 

INSERT [dbo].[Template] ([ID], [Title], [Description], [CreatedBy]) VALUES (1, N'Accepted', N'Your UserApplication has been accepted successfully.', N'Admin')
INSERT [dbo].[Template] ([ID], [Title], [Description], [CreatedBy]) VALUES (2, N'Decline - document not complete', N'Your Application has been declined due to not complete documents.', N'Admin')
SET IDENTITY_INSERT [dbo].[Template] OFF
GO
SET IDENTITY_INSERT [dbo].[UserApplication] ON 

INSERT [dbo].[UserApplication] ([ID], [Name], [Description], [SubmitterName], [FeedbackSubmitted], [FeedbackId], [FeedbackSubmittedBy]) VALUES (1, N'Junior Post', N'Junior Developer', N'User1', 1, 2, N'Admin')
INSERT [dbo].[UserApplication] ([ID], [Name], [Description], [SubmitterName], [FeedbackSubmitted], [FeedbackId], [FeedbackSubmittedBy]) VALUES (3, N'Junior Post', N'Junior Developer', N'User2', NULL, NULL, NULL)
INSERT [dbo].[UserApplication] ([ID], [Name], [Description], [SubmitterName], [FeedbackSubmitted], [FeedbackId], [FeedbackSubmittedBy]) VALUES (4, N'Java developer', N'Java developer with minumum experience for 1-5 years', N'User3', NULL, NULL, NULL)
INSERT [dbo].[UserApplication] ([ID], [Name], [Description], [SubmitterName], [FeedbackSubmitted], [FeedbackId], [FeedbackSubmittedBy]) VALUES (5, N'Java senior developer', N'Java developer with minumum experience for 5 years', N'User4', NULL, NULL, NULL)
INSERT [dbo].[UserApplication] ([ID], [Name], [Description], [SubmitterName], [FeedbackSubmitted], [FeedbackId], [FeedbackSubmittedBy]) VALUES (6, N'Project Manager', N'Management skills with 10 years of experiece', N'User5', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserApplication] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Username], [Password]) VALUES (1, N'Admin', N'123456')
INSERT [dbo].[Users] ([UserId], [Username], [Password]) VALUES (2, N'User1', N'123456')
INSERT [dbo].[Users] ([UserId], [Username], [Password]) VALUES (3, N'User2', N'123456')
INSERT [dbo].[Users] ([UserId], [Username], [Password]) VALUES (4, N'User3', N'123456')
INSERT [dbo].[Users] ([UserId], [Username], [Password]) VALUES (5, N'User4', N'123456')
INSERT [dbo].[Users] ([UserId], [Username], [Password]) VALUES (6, N'User5', N'123456')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
USE [master]
GO
ALTER DATABASE [CompanyDB] SET  READ_WRITE 
GO
