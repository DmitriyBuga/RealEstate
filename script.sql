USE [master]
GO
/****** Object:  Database [RealEstate]    Script Date: 03.02.2016 13:56:29 ******/
CREATE DATABASE [RealEstate]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RealEstate', FILENAME = N'C:\PROGRAM FILES\MICROSOFT SQL SERVER\MSSQL11.SQLEXPRESS\MSSQL\DATA\RealEstate.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RealEstate_log', FILENAME = N'C:\PROGRAM FILES\MICROSOFT SQL SERVER\MSSQL11.SQLEXPRESS\MSSQL\DATA\RealEstate_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RealEstate] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RealEstate].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RealEstate] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RealEstate] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RealEstate] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RealEstate] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RealEstate] SET ARITHABORT OFF 
GO
ALTER DATABASE [RealEstate] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RealEstate] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [RealEstate] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RealEstate] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RealEstate] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RealEstate] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RealEstate] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RealEstate] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RealEstate] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RealEstate] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RealEstate] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RealEstate] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RealEstate] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RealEstate] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RealEstate] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RealEstate] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RealEstate] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RealEstate] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RealEstate] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RealEstate] SET  MULTI_USER 
GO
ALTER DATABASE [RealEstate] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RealEstate] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RealEstate] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RealEstate] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [RealEstate]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 03.02.2016 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 03.02.2016 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[manager_id] [int] NOT NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
	[middlename] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_CUST] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Districts]    Script Date: 03.02.2016 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Districts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[city_id] [int] NOT NULL,
	[region_id] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Districts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Estates]    Script Date: 03.02.2016 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cust_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[manager_id] [int] NOT NULL,
	[type_op] [int] NULL,
	[type_estate] [int] NULL,
	[descr] [nvarchar](max) NULL,
	[floors] [int] NULL,
	[floor] [int] NULL,
	[rooms] [int] NULL,
	[square] [real] NULL,
	[price] [real] NULL,
	[region] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[district] [nvarchar](50) NULL,
	[street] [nvarchar](100) NULL,
	[building] [nchar](10) NULL,
	[apt] [nchar](10) NULL,
	[city_id] [int] NULL,
	[region_id] [int] NULL,
	[datainput] [smalldatetime] NULL,
	[dstart] [smalldatetime] NULL,
	[dend] [smalldatetime] NULL,
	[isempty] [bit] NULL,
 CONSTRAINT [PK_ESTATE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Regions]    Script Date: 03.02.2016 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 03.02.2016 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Streets]    Script Date: 03.02.2016 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Streets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Streets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 03.02.2016 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[position] [nvarchar](50) NOT NULL,
	[department_id] [int] NULL,
	[role_id] [int] NOT NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Estates] ON 

INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (1, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (2, 2, 1, 1, 1, 1, N'продам очень хороший хаузззз :)', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Кирова', N'55        ', N'11        ', 1, 1, CAST(N'2016-01-02 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Estates] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [name], [login], [password], [position], [department_id], [role_id], [firstname], [lastname]) VALUES (0, N'sa', N'sa', N'123qwe', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[Users] ([id], [name], [login], [password], [position], [department_id], [role_id], [firstname], [lastname]) VALUES (1, N'user1', N'saUser', N'123qwe', N'0', NULL, 2, NULL, NULL)
INSERT [dbo].[Users] ([id], [name], [login], [password], [position], [department_id], [role_id], [firstname], [lastname]) VALUES (2, N'sa11', N'sa11', N'123qwe', N'', NULL, 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Estates]  WITH CHECK ADD  CONSTRAINT [FK_Estates_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Estates] CHECK CONSTRAINT [FK_Estates_Users]
GO
USE [master]
GO
ALTER DATABASE [RealEstate] SET  READ_WRITE 
GO
