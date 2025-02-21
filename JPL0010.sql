USE [master]
GO
/****** Object:  Database [JLP0010]    Script Date: 30/09/2020 6:56:41 CH ******/
CREATE DATABASE [JLP0010]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JLP0010', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\JLP0010.mdf' , SIZE = 3328KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JLP0010_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\JLP0010_log.LDF' , SIZE = 3136KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [JLP0010] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JLP0010].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JLP0010] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JLP0010] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JLP0010] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JLP0010] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JLP0010] SET ARITHABORT OFF 
GO
ALTER DATABASE [JLP0010] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [JLP0010] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [JLP0010] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JLP0010] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JLP0010] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JLP0010] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JLP0010] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JLP0010] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JLP0010] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JLP0010] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JLP0010] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JLP0010] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JLP0010] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JLP0010] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JLP0010] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JLP0010] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JLP0010] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JLP0010] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JLP0010] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JLP0010] SET  MULTI_USER 
GO
ALTER DATABASE [JLP0010] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JLP0010] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JLP0010] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JLP0010] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [JLP0010]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 30/09/2020 6:56:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Article](
	[postID] [int] IDENTITY(1,1) NOT NULL,
	[image] [varchar](100) NULL,
	[title] [varchar](100) NULL,
	[description] [varchar](100) NULL,
	[content] [varchar](2000) NULL,
	[dayPost] [date] NULL,
	[email] [varchar](30) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[postID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 30/09/2020 6:56:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[commentID] [int] IDENTITY(1,1) NOT NULL,
	[postID] [int] NULL,
	[email] [varchar](30) NULL,
	[dayPost] [date] NULL,
	[content] [varchar](2000) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Emotion]    Script Date: 30/09/2020 6:56:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Emotion](
	[emotionID] [int] IDENTITY(1,1) NOT NULL,
	[postID] [int] NULL,
	[email] [varchar](30) NULL,
	[reaction] [int] NULL,
	[dayPost] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[emotionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Notify]    Script Date: 30/09/2020 6:56:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notify](
	[notifyID] [int] IDENTITY(1,1) NOT NULL,
	[postID] [int] NULL,
	[emailLogin] [varchar](30) NULL,
	[emailInteract] [varchar](30) NULL,
	[dayAction] [date] NULL,
	[typeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[notifyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reaction]    Script Date: 30/09/2020 6:56:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reaction](
	[reactionID] [int] NOT NULL,
	[name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[reactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Status]    Script Date: 30/09/2020 6:56:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Status](
	[statusID] [int] NOT NULL,
	[name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Type]    Script Date: 30/09/2020 6:56:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Type](
	[typeID] [int] NOT NULL,
	[typeName] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 30/09/2020 6:56:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[email] [varchar](30) NOT NULL,
	[name] [varchar](50) NULL,
	[password] [varchar](64) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (1, N'', N'first post', N'hahaha', N'aaa hello world
', CAST(0x97410B00 AS Date), N'aaa@gmail.com', 2)
INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (2, N'', N'haha', N'qqqq', N'aaaaaaaa', CAST(0x98410B00 AS Date), N'aaa@gmail.com', 2)
INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (3, N'', N'1123', N'hihihih', N'aasdasd', CAST(0x98410B00 AS Date), N'aaa@gmail.com', 2)
INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (4, N'C:\Users\DELL\Pictures\Saved Pictures\slidersinweb6.jpg', N'aaaa', N'aaaa', N'aeqweaaaa', CAST(0x98410B00 AS Date), N'aaa@gmail.com', 2)
INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (5, N'', N'text', N'delete', N'test delete aaaaa', CAST(0x98410B00 AS Date), N'aaa@gmail.com', 2)
INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (6, N'', N'test delete again', N'ahahaha', N'aa only test', CAST(0x98410B00 AS Date), N'aaa@gmail.com', 2)
INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (7, N'', N'Second Post', N'hahahahaha', N'qwueiyqweiuyqwiuejakxhdakjsdhzbxcmnzbxcnbaushdklaekjhawkjehjkashd aaaaaaa', CAST(0x99410B00 AS Date), N'aaa@gmail.com', 2)
INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (8, N'', N'test delete', N'hey hey', N'delete', CAST(0x9A410B00 AS Date), N'aaa@gmail.com', 3)
INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (9, N'', N'test delete function', N'test', N'haya', CAST(0x9B410B00 AS Date), N'aaa@gmail.com', 2)
INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (10, N'', N'nice caption', N'yu', N'zxca', CAST(0x9B410B00 AS Date), N'aaa@gmail.com', 2)
INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (11, N'', N'C''s Post', N'c post', N'my name is c haha', CAST(0x9B410B00 AS Date), N'ccc@gmail.com', 2)
INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (12, N'C:\Users\DELL\Pictures\cmd1.png', N'welcome test 1', N'test 1 post first post', N'this is test1''s post number 1 ', CAST(0x9D410B00 AS Date), N'test1@gmail.com', 2)
INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (13, N'', N'Like post', N'Like', N'I have liked my post', CAST(0x9F410B00 AS Date), N'aaa@gmail.com', 2)
INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (14, N'', N'Like post', N'Like', N'I have liked my post ', CAST(0x9F410B00 AS Date), N'aaa@gmail.com', 2)
INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (15, N'', N'b test delete', N'hiiii', N'a come here
', CAST(0xA0410B00 AS Date), N'bbb@gmail.com', 2)
INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (16, N'', N'Hello', N'Xin chao', N'Aloooooo', CAST(0xA1410B00 AS Date), N'tthinh..2128@gmail.com', 2)
INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (17, N'', N'a', N'a', N'a', CAST(0xA1410B00 AS Date), N'tthinh..2128@gmail.com', 2)
INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (18, N'C:\Users\DELL\Pictures\Saved Pictures\yellowMoon.png', N'Welcome c', N'c is come back', N'hi everyone my name is c and c is come back
', CAST(0xA1410B00 AS Date), N'ccc@gmail.com', 2)
INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (19, N'C:\Users\DELL\Pictures\Saved Pictures\2470369.png', N'again it is me', N'test some function', N'explain the cmd is fun and good', CAST(0xA1410B00 AS Date), N'ccc@gmail.com', 2)
INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (20, N'C:\Users\DELL\Pictures\Saved Pictures\ie.jpg', N'final post in day', N'IE nice but not good ', N'a IE is not good no hope', CAST(0xA1410B00 AS Date), N'bbb@gmail.com', 2)
INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (21, N'', N'social network', N'NWC', N'nice subject nice time A grade', CAST(0xA1410B00 AS Date), N'bbb@gmail.com', 2)
INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (22, N'C:\Users\DELL\Pictures\Saved Pictures\636963912790626520_dell-3481-den-1.png', N'new Laptop', N'Dell', N'Dell mine lap', CAST(0xA1410B00 AS Date), N'bbb@gmail.com', 2)
INSERT [dbo].[Article] ([postID], [image], [title], [description], [content], [dayPost], [email], [status]) VALUES (23, N'', N'carefull drama school', N'k16', N'not good generate', CAST(0xA1410B00 AS Date), N'bbb@gmail.com', 2)
SET IDENTITY_INSERT [dbo].[Article] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (1, 1, N'aaa@gmail.com', CAST(0x99410B00 AS Date), N'haha', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (2, 1, N'aaa@gmail.com', CAST(0x99410B00 AS Date), N'haha', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (3, 2, N'aaa@gmail.com', CAST(0x99410B00 AS Date), N'a
', 2)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (4, 7, N'aaa@gmail.com', CAST(0x99410B00 AS Date), N'hay
', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (5, 7, N'aaa@gmail.com', CAST(0x99410B00 AS Date), N'hay
', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (6, 7, N'aaa@gmail.com', CAST(0x99410B00 AS Date), N'hay
', 2)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (7, 7, N'aaa@gmail.com', CAST(0x99410B00 AS Date), N'qwe
', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (8, 7, N'aaa@gmail.com', CAST(0x99410B00 AS Date), N'qwe
', 2)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (9, 7, N'aaa@gmail.com', CAST(0x99410B00 AS Date), N'tets', 2)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (10, 1, N'bbb@gmail.com', CAST(0x9A410B00 AS Date), N'from b', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (11, 7, N'aaa@gmail.com', CAST(0x9A410B00 AS Date), N'23/9', 2)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (12, 1, N'aaa@gmail.com', CAST(0x9B410B00 AS Date), N'aaa', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (13, 10, N'bbb@gmail.com', CAST(0x9B410B00 AS Date), N'from b with love', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (14, 10, N'bbb@gmail.com', CAST(0x9B410B00 AS Date), N'nice', 2)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (15, 11, N'ccc@gmail.com', CAST(0x9B410B00 AS Date), N'hello every one', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (16, 1, N'aaa@gmail.com', CAST(0x9C410B00 AS Date), N'test Notify', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (17, 1, N'bbb@gmail.com', CAST(0x9C410B00 AS Date), N'haha from b', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (18, 1, N'bbb@gmail.com', CAST(0x9C410B00 AS Date), N'b', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (19, 7, N'ccc@gmail.com', CAST(0x9C410B00 AS Date), N'from c', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (20, 7, N'ccc@gmail.com', CAST(0x9C410B00 AS Date), N'from c', 2)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (21, 1, N'ccc@gmail.com', CAST(0x9C410B00 AS Date), N'c', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (22, 1, N'ccc@gmail.com', CAST(0x9C410B00 AS Date), N'jtest', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (23, 1, N'ccc@gmail.com', CAST(0x9C410B00 AS Date), N'test', 2)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (24, 7, N'bbb@gmail.com', CAST(0x9C410B00 AS Date), N'bbbb', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (25, 7, N'bbb@gmail.com', CAST(0x9C410B00 AS Date), N'badc', 2)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (26, 1, N'ccc@gmail.com', CAST(0x9C410B00 AS Date), N'hi my name is c', 2)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (27, 9, N'bbb@gmail.com', CAST(0x9C410B00 AS Date), N'from b', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (28, 1, N'e@gmail.com', CAST(0x9C410B00 AS Date), N'helo my name is e', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (29, 1, N'e@gmail.com', CAST(0x9C410B00 AS Date), N'haha from e', 2)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (30, 1, N'bbb@gmail.com', CAST(0x9C410B00 AS Date), N'Ãª a', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (31, 1, N'bbb@gmail.com', CAST(0x9C410B00 AS Date), N'hey from b', 2)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (32, 1, N'aaa@gmail.com', CAST(0x9D410B00 AS Date), N'aa', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (33, 1, N'aaa@gmail.com', CAST(0x9D410B00 AS Date), N'aa', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (34, 3, N'bbb@gmail.com', CAST(0x9D410B00 AS Date), N'hello a', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (35, 3, N'bbb@gmail.com', CAST(0x9D410B00 AS Date), N'my name is b', 2)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (36, 3, N'bbb@gmail.com', CAST(0x9D410B00 AS Date), N'ha ha', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (37, 12, N'test1@gmail.com', CAST(0x9D410B00 AS Date), N'hello', 2)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (38, 1, N'test1@gmail.com', CAST(0x9D410B00 AS Date), N'hello a', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (39, 10, N'aaa@gmail.com', CAST(0x9F410B00 AS Date), N'haha', 3)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (40, 4, N'aaa@gmail.com', CAST(0x9F410B00 AS Date), N'first picture', 2)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (41, 1, N'aaa@gmail.com', CAST(0x9F410B00 AS Date), N'op', 2)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (42, 10, N'aaa@gmail.com', CAST(0x9F410B00 AS Date), N'from a', 2)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (43, 13, N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), N'a', 2)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (44, 13, N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 2)
INSERT [dbo].[Comment] ([commentID], [postID], [email], [dayPost], [content], [status]) VALUES (47, 16, N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), N'a', 2)
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Emotion] ON 

INSERT [dbo].[Emotion] ([emotionID], [postID], [email], [reaction], [dayPost]) VALUES (3, 1, N'aaa@gmail.com', 3, CAST(0x9E410B00 AS Date))
INSERT [dbo].[Emotion] ([emotionID], [postID], [email], [reaction], [dayPost]) VALUES (4, 7, N'aaa@gmail.com', 2, CAST(0xA0410B00 AS Date))
INSERT [dbo].[Emotion] ([emotionID], [postID], [email], [reaction], [dayPost]) VALUES (6, 10, N'aaa@gmail.com', 1, CAST(0x9F410B00 AS Date))
INSERT [dbo].[Emotion] ([emotionID], [postID], [email], [reaction], [dayPost]) VALUES (8, 7, N'bbb@gmail.com', 2, CAST(0x9D410B00 AS Date))
INSERT [dbo].[Emotion] ([emotionID], [postID], [email], [reaction], [dayPost]) VALUES (9, 10, N'bbb@gmail.com', 1, CAST(0x9B410B00 AS Date))
INSERT [dbo].[Emotion] ([emotionID], [postID], [email], [reaction], [dayPost]) VALUES (10, 10, N'ccc@gmail.com', 1, CAST(0x9B410B00 AS Date))
INSERT [dbo].[Emotion] ([emotionID], [postID], [email], [reaction], [dayPost]) VALUES (11, 11, N'ccc@gmail.com', 1, CAST(0x9B410B00 AS Date))
INSERT [dbo].[Emotion] ([emotionID], [postID], [email], [reaction], [dayPost]) VALUES (12, 4, N'aaa@gmail.com', 1, CAST(0x9F410B00 AS Date))
INSERT [dbo].[Emotion] ([emotionID], [postID], [email], [reaction], [dayPost]) VALUES (13, 1, N'ccc@gmail.com', 1, CAST(0x9C410B00 AS Date))
INSERT [dbo].[Emotion] ([emotionID], [postID], [email], [reaction], [dayPost]) VALUES (14, 7, N'ccc@gmail.com', 1, CAST(0x9D410B00 AS Date))
INSERT [dbo].[Emotion] ([emotionID], [postID], [email], [reaction], [dayPost]) VALUES (15, 3, N'ccc@gmail.com', 2, CAST(0x9D410B00 AS Date))
INSERT [dbo].[Emotion] ([emotionID], [postID], [email], [reaction], [dayPost]) VALUES (16, 12, N'test1@gmail.com', 1, CAST(0x9D410B00 AS Date))
INSERT [dbo].[Emotion] ([emotionID], [postID], [email], [reaction], [dayPost]) VALUES (18, 13, N'tthinh..2128@gmail.com', 1, CAST(0xA1410B00 AS Date))
INSERT [dbo].[Emotion] ([emotionID], [postID], [email], [reaction], [dayPost]) VALUES (19, 10, N'tthinh..2128@gmail.com', 2, CAST(0xA1410B00 AS Date))
INSERT [dbo].[Emotion] ([emotionID], [postID], [email], [reaction], [dayPost]) VALUES (20, 16, N'tthinh..2128@gmail.com', 3, CAST(0xA1410B00 AS Date))
SET IDENTITY_INSERT [dbo].[Emotion] OFF
SET IDENTITY_INSERT [dbo].[Notify] ON 

INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (1, 1, N'aaa@gmail.com', N'e@gmail.com', CAST(0x9C410B00 AS Date), 6)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (2, 1, N'aaa@gmail.com', N'bbb@gmail.com', CAST(0x9C410B00 AS Date), 1)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (3, 1, N'aaa@gmail.com', N'bbb@gmail.com', CAST(0x9C410B00 AS Date), 6)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (4, 1, N'aaa@gmail.com', N'bbb@gmail.com', CAST(0x9C410B00 AS Date), 1)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (5, 1, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0x9C410B00 AS Date), 6)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (6, 1, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0x9D410B00 AS Date), 1)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (7, 1, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0x9D410B00 AS Date), 1)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (8, 1, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0x9D410B00 AS Date), 6)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (9, 1, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0x9D410B00 AS Date), 6)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (10, 3, N'aaa@gmail.com', N'bbb@gmail.com', CAST(0x9D410B00 AS Date), 1)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (11, 3, N'aaa@gmail.com', N'bbb@gmail.com', CAST(0x9D410B00 AS Date), 1)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (12, 3, N'aaa@gmail.com', N'bbb@gmail.com', CAST(0x9D410B00 AS Date), 1)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (13, 3, N'aaa@gmail.com', N'bbb@gmail.com', CAST(0x9D410B00 AS Date), 6)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (14, 3, N'aaa@gmail.com', N'bbb@gmail.com', CAST(0x9D410B00 AS Date), 6)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (15, 7, N'aaa@gmail.com', N'bbb@gmail.com', CAST(0x9D410B00 AS Date), 3)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (16, 7, N'aaa@gmail.com', N'bbb@gmail.com', CAST(0x9D410B00 AS Date), 5)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (17, 7, N'aaa@gmail.com', N'bbb@gmail.com', CAST(0x9D410B00 AS Date), 3)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (18, 12, N'test1@gmail.com', N'test1@gmail.com', CAST(0x9D410B00 AS Date), 2)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (19, 12, N'test1@gmail.com', N'test1@gmail.com', CAST(0x9D410B00 AS Date), 1)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (20, 1, N'aaa@gmail.com', N'test1@gmail.com', CAST(0x9D410B00 AS Date), 1)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (21, 1, N'aaa@gmail.com', N'test1@gmail.com', CAST(0x9D410B00 AS Date), 6)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (22, 1, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0x9E410B00 AS Date), 6)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (23, 1, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0x9E410B00 AS Date), 4)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (24, 7, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0x9E410B00 AS Date), 6)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (25, 10, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0x9F410B00 AS Date), 1)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (26, 10, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0x9F410B00 AS Date), 6)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (27, 10, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0x9F410B00 AS Date), 2)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (28, 4, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0x9F410B00 AS Date), 1)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (29, 4, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0x9F410B00 AS Date), 2)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (30, 1, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0x9F410B00 AS Date), 1)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (31, 1, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0x9F410B00 AS Date), 6)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (32, 10, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0x9F410B00 AS Date), 1)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (33, 10, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0x9F410B00 AS Date), 4)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (34, 10, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0x9F410B00 AS Date), 3)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (35, 10, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0x9F410B00 AS Date), 2)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (36, 7, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0xA0410B00 AS Date), 4)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (37, 7, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0xA0410B00 AS Date), 2)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (38, 7, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0xA0410B00 AS Date), 3)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (39, 7, N'aaa@gmail.com', N'aaa@gmail.com', CAST(0xA0410B00 AS Date), 6)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (40, 13, N'aaa@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 2)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (41, 13, N'aaa@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 4)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (42, 13, N'aaa@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 2)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (43, 13, N'aaa@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 4)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (44, 13, N'aaa@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 2)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (45, 13, N'aaa@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 4)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (46, 13, N'aaa@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 2)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (47, 13, N'aaa@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 4)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (48, 13, N'aaa@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 2)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (49, 13, N'aaa@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 4)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (50, 13, N'aaa@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 3)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (51, 13, N'aaa@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 2)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (52, 13, N'aaa@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 3)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (53, 13, N'aaa@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 2)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (54, 13, N'aaa@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 1)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (55, 13, N'aaa@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 1)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (56, 16, N'tthinh..2128@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 1)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (57, 10, N'aaa@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 3)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (58, 10, N'aaa@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 2)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (59, 10, N'aaa@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 3)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (60, 16, N'tthinh..2128@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 3)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (61, 16, N'tthinh..2128@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 5)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (62, 16, N'tthinh..2128@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 2)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (63, 16, N'tthinh..2128@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 3)
INSERT [dbo].[Notify] ([notifyID], [postID], [emailLogin], [emailInteract], [dayAction], [typeID]) VALUES (64, 16, N'tthinh..2128@gmail.com', N'tthinh..2128@gmail.com', CAST(0xA1410B00 AS Date), 5)
SET IDENTITY_INSERT [dbo].[Notify] OFF
INSERT [dbo].[Reaction] ([reactionID], [name]) VALUES (1, N'Like')
INSERT [dbo].[Reaction] ([reactionID], [name]) VALUES (2, N'Dislike')
INSERT [dbo].[Reaction] ([reactionID], [name]) VALUES (3, N'No react')
INSERT [dbo].[Status] ([statusID], [name]) VALUES (1, N'New')
INSERT [dbo].[Status] ([statusID], [name]) VALUES (2, N'Active')
INSERT [dbo].[Status] ([statusID], [name]) VALUES (3, N'Delete')
INSERT [dbo].[Type] ([typeID], [typeName]) VALUES (1, N'Comment')
INSERT [dbo].[Type] ([typeID], [typeName]) VALUES (2, N'Like')
INSERT [dbo].[Type] ([typeID], [typeName]) VALUES (3, N'Dislike')
INSERT [dbo].[Type] ([typeID], [typeName]) VALUES (4, N'Un Like')
INSERT [dbo].[Type] ([typeID], [typeName]) VALUES (5, N'Un Dislike')
INSERT [dbo].[Type] ([typeID], [typeName]) VALUES (6, N'Delete Comment')
INSERT [dbo].[Users] ([email], [name], [password], [status]) VALUES (N'aaa@gmail.com', N'aaaaa', N'8BB0CF6EB9B17D0F7D22B456F121257DC1254E1F01665370476383EA776DF414', 1)
INSERT [dbo].[Users] ([email], [name], [password], [status]) VALUES (N'bbb@gmail.com', N'bbbbb', N'03306388376DAFF2E73D289F7B47A7F77F7D19DB7489FC8D1D3855FB8ACFF9A5', 1)
INSERT [dbo].[Users] ([email], [name], [password], [status]) VALUES (N'ccc@gmail.com', N'my name is c', N'8BB0CF6EB9B17D0F7D22B456F121257DC1254E1F01665370476383EA776DF414', 1)
INSERT [dbo].[Users] ([email], [name], [password], [status]) VALUES (N'ddd@gmail.com', N'qwerty', N'8A9BCF1E51E812D0AF8465A8DBCC9F741064BF0AF3B3D08E6B0246437C19F7FB', 1)
INSERT [dbo].[Users] ([email], [name], [password], [status]) VALUES (N'e@gmail.com', N'ee', N'8BB0CF6EB9B17D0F7D22B456F121257DC1254E1F01665370476383EA776DF414', 1)
INSERT [dbo].[Users] ([email], [name], [password], [status]) VALUES (N'test1@gmail.com', N'test 1', N'8BB0CF6EB9B17D0F7D22B456F121257DC1254E1F01665370476383EA776DF414', 1)
INSERT [dbo].[Users] ([email], [name], [password], [status]) VALUES (N'tthinh...2128@gmail.com', N'1111111', N'2558A34D4D20964CA1D272AB26CCCE9511D880579593CD4C9E01AB91ED00F325', 1)
INSERT [dbo].[Users] ([email], [name], [password], [status]) VALUES (N'tthinh..2128@gmail.com', N'ABC', N'8BB0CF6EB9B17D0F7D22B456F121257DC1254E1F01665370476383EA776DF414', 1)
ALTER TABLE [dbo].[Article]  WITH CHECK ADD FOREIGN KEY([email])
REFERENCES [dbo].[Users] ([email])
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD FOREIGN KEY([status])
REFERENCES [dbo].[Status] ([statusID])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([email])
REFERENCES [dbo].[Users] ([email])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([postID])
REFERENCES [dbo].[Article] ([postID])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([status])
REFERENCES [dbo].[Status] ([statusID])
GO
ALTER TABLE [dbo].[Emotion]  WITH CHECK ADD FOREIGN KEY([email])
REFERENCES [dbo].[Users] ([email])
GO
ALTER TABLE [dbo].[Emotion]  WITH CHECK ADD FOREIGN KEY([postID])
REFERENCES [dbo].[Article] ([postID])
GO
ALTER TABLE [dbo].[Emotion]  WITH CHECK ADD FOREIGN KEY([reaction])
REFERENCES [dbo].[Reaction] ([reactionID])
GO
ALTER TABLE [dbo].[Notify]  WITH CHECK ADD FOREIGN KEY([emailInteract])
REFERENCES [dbo].[Users] ([email])
GO
ALTER TABLE [dbo].[Notify]  WITH CHECK ADD FOREIGN KEY([emailLogin])
REFERENCES [dbo].[Users] ([email])
GO
ALTER TABLE [dbo].[Notify]  WITH CHECK ADD FOREIGN KEY([postID])
REFERENCES [dbo].[Article] ([postID])
GO
ALTER TABLE [dbo].[Notify]  WITH CHECK ADD FOREIGN KEY([typeID])
REFERENCES [dbo].[Type] ([typeID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([status])
REFERENCES [dbo].[Status] ([statusID])
GO
USE [master]
GO
ALTER DATABASE [JLP0010] SET  READ_WRITE 
GO
