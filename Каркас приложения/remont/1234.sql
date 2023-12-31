USE [master]
GO
/****** Object:  Database [remont_tel]    Script Date: 25.10.2023 23:21:16 ******/
CREATE DATABASE [remont_tel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'remont_tel', FILENAME = N'D:\SQQQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\remont_tel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'remont_tel_log', FILENAME = N'D:\SQQQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\remont_tel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [remont_tel] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [remont_tel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [remont_tel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [remont_tel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [remont_tel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [remont_tel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [remont_tel] SET ARITHABORT OFF 
GO
ALTER DATABASE [remont_tel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [remont_tel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [remont_tel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [remont_tel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [remont_tel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [remont_tel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [remont_tel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [remont_tel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [remont_tel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [remont_tel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [remont_tel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [remont_tel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [remont_tel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [remont_tel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [remont_tel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [remont_tel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [remont_tel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [remont_tel] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [remont_tel] SET  MULTI_USER 
GO
ALTER DATABASE [remont_tel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [remont_tel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [remont_tel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [remont_tel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [remont_tel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [remont_tel] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [remont_tel] SET QUERY_STORE = OFF
GO
USE [remont_tel]
GO
/****** Object:  Table [dbo].[merch]    Script Date: 25.10.2023 23:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merch](
	[id] [int] NOT NULL,
	[photo] [varchar](50) NULL,
	[name] [varchar](50) NOT NULL,
	[dexcription] [text] NOT NULL,
	[manufacturer] [varchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_merch] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 25.10.2023 23:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] NOT NULL,
	[id_user] [int] NOT NULL,
	[id_status] [int] NOT NULL,
	[id_point] [int] NOT NULL,
	[order_data] [date] NOT NULL,
	[code] [int] NOT NULL,
	[prise] [int] NOT NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[point]    Script Date: 25.10.2023 23:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[point](
	[id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[photo] [varchar](50) NULL,
 CONSTRAINT [PK_point] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sostav]    Script Date: 25.10.2023 23:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sostav](
	[id_orders] [int] NOT NULL,
	[id_merch] [int] NOT NULL,
	[count] [int] NULL,
 CONSTRAINT [PK_sostav] PRIMARY KEY CLUSTERED 
(
	[id_orders] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 25.10.2023 23:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] NOT NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_users]    Script Date: 25.10.2023 23:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_users](
	[id] [int] NOT NULL,
	[role] [varchar](50) NOT NULL,
 CONSTRAINT [PK_type_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 25.10.2023 23:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] NOT NULL,
	[id_type] [int] NOT NULL,
	[login] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount]) VALUES (1, N'/photo/t1.png', N'iphone', N'описание', N'apple', 150000, 5)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount]) VALUES (2, N'/photo/t2.png', N'samsung', N'описание', N'china', 10000, 0)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount]) VALUES (3, N'/photo/t3.png', N'xiaomi', N'описание', N'xiaomi', 15000, 15)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount]) VALUES (4, NULL, N'google pixel', N'описание ', N'google', 2000, 10)
GO
INSERT [dbo].[orders] ([id], [id_user], [id_status], [id_point], [order_data], [code], [prise], [discount]) VALUES (1, 1, 1, 1, CAST(N'2023-10-10' AS Date), 421, 150000, 5)
INSERT [dbo].[orders] ([id], [id_user], [id_status], [id_point], [order_data], [code], [prise], [discount]) VALUES (2, 2, 2, 2, CAST(N'2022-12-10' AS Date), 124, 10000, 0)
INSERT [dbo].[orders] ([id], [id_user], [id_status], [id_point], [order_data], [code], [prise], [discount]) VALUES (3, 3, 3, 3, CAST(N'2023-04-13' AS Date), 412, 15000, 15)
GO
INSERT [dbo].[point] ([id], [name], [photo]) VALUES (1, N'WILDBERIES', N'/photo/p1.png')
INSERT [dbo].[point] ([id], [name], [photo]) VALUES (2, N'OZON', N'/photo/p2.png')
INSERT [dbo].[point] ([id], [name], [photo]) VALUES (3, N'DNS', NULL)
GO
INSERT [dbo].[sostav] ([id_orders], [id_merch], [count]) VALUES (1, 1, 1)
INSERT [dbo].[sostav] ([id_orders], [id_merch], [count]) VALUES (2, 2, 1)
INSERT [dbo].[sostav] ([id_orders], [id_merch], [count]) VALUES (3, 3, 1)
GO
INSERT [dbo].[status] ([id], [status]) VALUES (1, N'новый')
INSERT [dbo].[status] ([id], [status]) VALUES (2, N'доставляется')
INSERT [dbo].[status] ([id], [status]) VALUES (3, N'завершен')
GO
INSERT [dbo].[type_users] ([id], [role]) VALUES (1, N'admin')
INSERT [dbo].[type_users] ([id], [role]) VALUES (2, N'manager')
INSERT [dbo].[type_users] ([id], [role]) VALUES (3, N'user')
GO
INSERT [dbo].[users] ([id], [id_type], [login], [password]) VALUES (1, 1, N'admin', N'12345')
INSERT [dbo].[users] ([id], [id_type], [login], [password]) VALUES (2, 2, N'manager', N'12345')
INSERT [dbo].[users] ([id], [id_type], [login], [password]) VALUES (3, 3, N'user', N'12345')
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_point] FOREIGN KEY([id_point])
REFERENCES [dbo].[point] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_point]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_sostav] FOREIGN KEY([id])
REFERENCES [dbo].[sostav] ([id_orders])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_sostav]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_status] FOREIGN KEY([id_status])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_status]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users]
GO
ALTER TABLE [dbo].[sostav]  WITH CHECK ADD  CONSTRAINT [FK_sostav_merch] FOREIGN KEY([id_merch])
REFERENCES [dbo].[merch] ([id])
GO
ALTER TABLE [dbo].[sostav] CHECK CONSTRAINT [FK_sostav_merch]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_type_users] FOREIGN KEY([id_type])
REFERENCES [dbo].[type_users] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_type_users]
GO
USE [master]
GO
ALTER DATABASE [remont_tel] SET  READ_WRITE 
GO
