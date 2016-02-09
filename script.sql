USE [master]
GO
/****** Object:  Database [RealEstate]    Script Date: 09.02.2016 16:47:40 ******/
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
/****** Object:  Table [dbo].[Cities]    Script Date: 09.02.2016 16:47:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[region_id] [int] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 09.02.2016 16:47:40 ******/
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
/****** Object:  Table [dbo].[Districts]    Script Date: 09.02.2016 16:47:40 ******/
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
/****** Object:  Table [dbo].[Estates]    Script Date: 09.02.2016 16:47:40 ******/
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
/****** Object:  Table [dbo].[Regions]    Script Date: 09.02.2016 16:47:40 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 09.02.2016 16:47:40 ******/
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
/****** Object:  Table [dbo].[Streets]    Script Date: 09.02.2016 16:47:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Streets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[city_id] [int] NOT NULL,
 CONSTRAINT [PK_Streets] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 09.02.2016 16:47:40 ******/
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
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (2, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (3, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (4, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (5, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (6, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (7, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (8, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (9, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (10, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (11, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (12, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (13, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (14, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (15, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (16, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (17, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (18, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (19, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (20, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (21, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (22, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (23, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (24, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (25, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (26, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (27, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (28, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (29, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (30, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (31, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (32, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (33, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (34, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (35, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (36, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (37, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (38, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (39, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (40, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (41, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (42, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (43, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (44, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (45, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (46, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (47, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (48, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (49, 1, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (51, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (52, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (53, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (54, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (55, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (56, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (57, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (58, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (59, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (60, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (61, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (62, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (63, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (64, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (65, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (66, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (67, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (68, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (69, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (70, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (71, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (72, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (73, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (74, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (75, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (76, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (77, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (78, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (79, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (80, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (81, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (82, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (83, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (84, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (85, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (86, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (87, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (88, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (89, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (90, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (91, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (92, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (93, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (94, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (95, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (96, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (97, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (98, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Estates] ([id], [cust_id], [user_id], [manager_id], [type_op], [type_estate], [descr], [floors], [floor], [rooms], [square], [price], [region], [city], [district], [street], [building], [apt], [city_id], [region_id], [datainput], [dstart], [dend], [isempty]) VALUES (99, 2, 1, 1, 1, 1, N'продам хауз', 5, 3, 3, 55, 100, N'Днепропетровская', N'Днепропетровск', N'Бабушкинский', N'ул. Ленина', N'55        ', N'2         ', 1, 1, CAST(N'2016-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Estates] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [name], [login], [password], [position], [department_id], [role_id], [firstname], [lastname]) VALUES (0, N'sa', N'sa', N'123qwe', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[Users] ([id], [name], [login], [password], [position], [department_id], [role_id], [firstname], [lastname]) VALUES (1, N'user1', N'saUser', N'123qwe', N'0', NULL, 2, NULL, NULL)
INSERT [dbo].[Users] ([id], [name], [login], [password], [position], [department_id], [role_id], [firstname], [lastname]) VALUES (2, N'sa11', N'sa11', N'123qwe', N'', NULL, 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Cities] FOREIGN KEY([region_id])
REFERENCES [dbo].[Regions] ([id])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Cities]
GO
ALTER TABLE [dbo].[Districts]  WITH CHECK ADD  CONSTRAINT [FK_Districts_Cities] FOREIGN KEY([city_id])
REFERENCES [dbo].[Cities] ([id])
GO
ALTER TABLE [dbo].[Districts] CHECK CONSTRAINT [FK_Districts_Cities]
GO
ALTER TABLE [dbo].[Estates]  WITH CHECK ADD  CONSTRAINT [FK_Estates_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Estates] CHECK CONSTRAINT [FK_Estates_Users]
GO
ALTER TABLE [dbo].[Streets]  WITH CHECK ADD  CONSTRAINT [FK_Streets_Cities] FOREIGN KEY([city_id])
REFERENCES [dbo].[Cities] ([id])
GO
ALTER TABLE [dbo].[Streets] CHECK CONSTRAINT [FK_Streets_Cities]
GO
USE [master]
GO
ALTER DATABASE [RealEstate] SET  READ_WRITE 
GO
