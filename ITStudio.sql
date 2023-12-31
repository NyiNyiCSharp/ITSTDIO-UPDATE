USE [master]
GO
/****** Object:  Database [ITSTUDIO]    Script Date: 7/15/2023 2:13:26 PM ******/
CREATE DATABASE [ITSTUDIO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ITSTUDIO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER2019\MSSQL\DATA\ITSTUDIO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ITSTUDIO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER2019\MSSQL\DATA\ITSTUDIO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ITSTUDIO] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ITSTUDIO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ITSTUDIO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ITSTUDIO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ITSTUDIO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ITSTUDIO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ITSTUDIO] SET ARITHABORT OFF 
GO
ALTER DATABASE [ITSTUDIO] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ITSTUDIO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ITSTUDIO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ITSTUDIO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ITSTUDIO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ITSTUDIO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ITSTUDIO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ITSTUDIO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ITSTUDIO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ITSTUDIO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ITSTUDIO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ITSTUDIO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ITSTUDIO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ITSTUDIO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ITSTUDIO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ITSTUDIO] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ITSTUDIO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ITSTUDIO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ITSTUDIO] SET  MULTI_USER 
GO
ALTER DATABASE [ITSTUDIO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ITSTUDIO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ITSTUDIO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ITSTUDIO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ITSTUDIO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ITSTUDIO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ITSTUDIO] SET QUERY_STORE = OFF
GO
USE [ITSTUDIO]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/15/2023 2:13:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accessories]    Script Date: 7/15/2023 2:13:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessories](
	[Id] [nvarchar](450) NOT NULL,
	[Ip] [nvarchar](max) NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[isActive] [bit] NOT NULL,
	[PhotoPath] [nvarchar](max) NULL,
	[BrandId] [nvarchar](450) NULL,
	[AccessoriesTypeId] [nvarchar](450) NULL,
	[Name] [nvarchar](max) NULL,
	[Detail] [nvarchar](max) NULL,
 CONSTRAINT [PK_Accessories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccessoriesType]    Script Date: 7/15/2023 2:13:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccessoriesType](
	[Id] [nvarchar](450) NOT NULL,
	[Ip] [nvarchar](max) NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[isActive] [bit] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_AccessoriesType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 7/15/2023 2:13:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/15/2023 2:13:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/15/2023 2:13:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/15/2023 2:13:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/15/2023 2:13:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/15/2023 2:13:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 7/15/2023 2:13:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 7/15/2023 2:13:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [nvarchar](450) NOT NULL,
	[Ip] [nvarchar](max) NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[isActive] [bit] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 7/15/2023 2:13:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Id] [nvarchar](450) NOT NULL,
	[Ip] [nvarchar](max) NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[isActive] [bit] NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[ItemId] [nvarchar](max) NULL,
	[ItemName] [nvarchar](max) NULL,
	[Price] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[TotalPrice] [int] NOT NULL,
	[TotalQuantity] [int] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Computer]    Script Date: 7/15/2023 2:13:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Computer](
	[Id] [nvarchar](450) NOT NULL,
	[Ip] [nvarchar](max) NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[isActive] [bit] NOT NULL,
	[BrandId] [nvarchar](450) NULL,
	[ComputerAmyoAsarId] [nvarchar](450) NULL,
	[CpuId] [nvarchar](450) NULL,
	[RamId] [nvarchar](450) NULL,
	[PhotoPath] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[storageSize] [int] NOT NULL,
	[isSSD] [bit] NOT NULL,
	[Detail] [nvarchar](max) NULL,
 CONSTRAINT [PK_Computer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComputerAmyoAsar]    Script Date: 7/15/2023 2:13:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComputerAmyoAsar](
	[Id] [nvarchar](450) NOT NULL,
	[Ip] [nvarchar](max) NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[isActive] [bit] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_ComputerAmyoAsar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cpu]    Script Date: 7/15/2023 2:13:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cpu](
	[Id] [nvarchar](450) NOT NULL,
	[Ip] [nvarchar](max) NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[isActive] [bit] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Cpu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 7/15/2023 2:13:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [nvarchar](450) NOT NULL,
	[Ip] [nvarchar](max) NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[isActive] [bit] NOT NULL,
	[ComputerId] [nvarchar](450) NULL,
	[AccessoriesId] [nvarchar](450) NULL,
	[BrandId] [nvarchar](max) NULL,
	[AccessoriesTypeId] [nvarchar](max) NULL,
	[ComputerAmyoAsarId] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Quantity] [int] NOT NULL,
	[Detail] [nvarchar](max) NULL,
	[Price] [int] NOT NULL,
	[PhotoPath] [nvarchar](max) NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderFromCart]    Script Date: 7/15/2023 2:13:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderFromCart](
	[Id] [nvarchar](450) NOT NULL,
	[Ip] [nvarchar](max) NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[isActive] [bit] NOT NULL,
	[PhotoPath] [nvarchar](max) NULL,
	[UserId] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NULL,
	[ItemName] [nvarchar](max) NULL,
	[Quantity] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[PhoneNumber] [int] NOT NULL,
	[TotalPrice] [int] NOT NULL,
	[Price] [nvarchar](max) NULL,
 CONSTRAINT [PK_OrderFromCart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 7/15/2023 2:13:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase](
	[Id] [nvarchar](450) NOT NULL,
	[Ip] [nvarchar](max) NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[isActive] [bit] NOT NULL,
	[ItemId] [nvarchar](450) NULL,
	[Quantity] [int] NOT NULL,
	[BuyPrice] [int] NOT NULL,
	[SalePrice] [int] NOT NULL,
 CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ram]    Script Date: 7/15/2023 2:13:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ram](
	[Id] [nvarchar](450) NOT NULL,
	[Ip] [nvarchar](max) NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[isActive] [bit] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Ram] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230712025300_forNew007', N'3.1.32')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230712051814_forNew009', N'3.1.32')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230712184850_TableUpdateAddNew', N'3.1.32')
GO
INSERT [dbo].[Accessories] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [BrandId], [AccessoriesTypeId], [Name], [Detail]) VALUES (N'063aa2e2-934d-4966-8a50-e38af2c7aa11', N'10.10.10.27', CAST(N'2023-07-12T09:57:40.8724751' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'/uploads/3169cea8-2831-4695-b010-d0e71fda50b4_download (11).jpg', N'f91ee8dc-a56f-4de7-97f0-f36869e89803', N'c76f95e6-464d-4e58-9d90-0919c246ed31', N'Dell Mouse', N'IT STUDIO
Name   : Dell Mouse
Brand  : Dell
Type   : Mouse
Note   : Dell Mouse
            Dell Mouse')
INSERT [dbo].[Accessories] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [BrandId], [AccessoriesTypeId], [Name], [Detail]) VALUES (N'0871cbe3-5e51-4bbd-ba58-14ca639b99f0', N'10.10.10.27', CAST(N'2023-07-12T09:55:37.3809727' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'/uploads/3843db4c-2543-4ce9-bf78-2035f18a584b_OIP (13).jpg', N'cc514ecc-beb7-47f5-9493-fa784e0c54ec', N'4e9a62c6-0221-4495-ad39-dc76d2a1062e', N'Lenovo Keyboard', N'IT STUDIO
Name   : Lenovo Keyboard
Brand  : Lenovo
Type   : Keyboard
Note   : Lenovo Keyboard
             Lenovo Keyboard')
INSERT [dbo].[Accessories] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [BrandId], [AccessoriesTypeId], [Name], [Detail]) VALUES (N'f532ecb1-bc67-4463-b5ff-6113bac9886c', N'10.10.10.27', CAST(N'2023-07-12T09:53:21.7838580' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'/uploads/eb058589-9686-48ae-9c31-61b3dc29d609_OIP (12).jpg', N'081bc0ed-26ab-4121-8633-6956f10e8d8b', N'238dcf7b-96e3-4c96-bba1-ac2681dd09a9', N'Hp Speaker', N'IT STUDIO
Name   : Hp Speaker
Brand  : Hp
Type   : Speaker
Note   : Hp Speaker Hp Speaker')
GO
INSERT [dbo].[AccessoriesType] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [Name]) VALUES (N'238dcf7b-96e3-4c96-bba1-ac2681dd09a9', N'10.10.10.27', CAST(N'2023-07-12T09:51:55.0849323' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'Speaker')
INSERT [dbo].[AccessoriesType] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [Name]) VALUES (N'4e9a62c6-0221-4495-ad39-dc76d2a1062e', N'10.10.10.27', CAST(N'2023-07-12T09:51:28.5189290' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'Keyboard')
INSERT [dbo].[AccessoriesType] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [Name]) VALUES (N'c76f95e6-464d-4e58-9d90-0919c246ed31', N'10.10.10.27', CAST(N'2023-07-12T09:51:39.3754079' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'Mouse')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1', N'admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e43c41f7-9a4b-4968-ac3b-63feea50873e', N'1')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'55e9416b-13a4-44a5-aada-1b9c1f676856', N'sakawar@gmail.com', N'SAKAWAR@GMAIL.COM', N'sakawar@gmail.com', N'SAKAWAR@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAENUZd/SeK+2KBMd0niqnOLEu687MUnRcRVIOQMOVe3a8rQveq7UrcRklBwe6ReVG3w==', N'KTROBYRE7BZALPUJOZDYEA7PJQV7VNVI', N'744d8374-7f70-478e-9a46-ba3c13b309db', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8a2499dc-66e7-4db0-a61e-7bc7b4ce36d2', N'bobo@gmail.com', N'BOBO@GMAIL.COM', N'bobo@gmail.com', N'BOBO@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEC3nkN5eOP6meIBVNVerR9zvXZXYl0W6b5sPL7F6YVid3pnKBFRh1gqo5W/ytSbMMA==', N'S6XUXEYCXNFVCUK6WYJWE57TWV5YPQK4', N'2fe6ad4c-6ef4-4a27-942d-8561d2e3811c', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e43c41f7-9a4b-4968-ac3b-63feea50873e', N'nyinyi@gmail.com', N'NYINYI@GMAIL.COM', N'nyinyi@gmail.com', N'NYINYI@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIakADwGg0mXdILOpNgHaxoOC/QNiuRb8sfgyP0DQS4LFTB7mx7jjlWETN6lrgtcrA==', N'GQNXO3DQXIRBPE3Q6PE4AAANHF5G76E4', N'76ddc899-e667-4c8f-b2b3-882734e8c9db', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[Brand] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [Name]) VALUES (N'081bc0ed-26ab-4121-8633-6956f10e8d8b', N'10.10.10.27', CAST(N'2023-07-12T09:42:46.7204795' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'Hp')
INSERT [dbo].[Brand] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [Name]) VALUES (N'cc514ecc-beb7-47f5-9493-fa784e0c54ec', N'10.10.10.27', CAST(N'2023-07-12T09:42:56.2268302' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'Lenovo')
INSERT [dbo].[Brand] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [Name]) VALUES (N'f91ee8dc-a56f-4de7-97f0-f36869e89803', N'10.10.10.27', CAST(N'2023-07-12T09:42:38.1823492' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'Dell')
GO
INSERT [dbo].[Cart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [UserId], [ItemId], [ItemName], [Price], [Quantity], [TotalPrice], [TotalQuantity]) VALUES (N'7eddd51b-519c-4c32-83af-c4bd0828bb5f', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'8a2499dc-66e7-4db0-a61e-7bc7b4ce36d2', N'cd2b306a-aef5-418e-a20a-09fcebe00dcc', N'Hp Speaker', 60000, 2, 120000, 0)
INSERT [dbo].[Cart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [UserId], [ItemId], [ItemName], [Price], [Quantity], [TotalPrice], [TotalQuantity]) VALUES (N'd0872ae6-bc09-440a-9553-2c4115a29f0f', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'8a2499dc-66e7-4db0-a61e-7bc7b4ce36d2', N'e53a5a28-446e-489d-a147-a15004a52e2d', N'Lenovo AOC', 1500000, 1, 1500000, 0)
GO
INSERT [dbo].[Computer] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [BrandId], [ComputerAmyoAsarId], [CpuId], [RamId], [PhotoPath], [Name], [storageSize], [isSSD], [Detail]) VALUES (N'544a4d42-8fb6-4517-978d-33bc7424553c', N'10.10.10.27', CAST(N'2023-07-12T09:50:49.0911376' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'081bc0ed-26ab-4121-8633-6956f10e8d8b', N'9156a9f2-7e64-4640-8dc4-40d197ebfede', N'0a15c3bb-f53f-4f90-ba80-f13ee8faa3fa', N'9a4fbc74-f3b0-4ea8-830d-b063d10a727d', N'/uploads/0e11d227-575d-43c1-aec5-c02cd5a7b0b3_OIP (11).jpg', N'Hp Destop', 512, 1, N'IT STUDIO
Name   : Hp Destop
Brand  : Hp
Type   : Destop
Cpu   : i3 3rd Gen
Ram   : DDR4 8Gb
Note   : Hp DestopHp Destop')
INSERT [dbo].[Computer] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [BrandId], [ComputerAmyoAsarId], [CpuId], [RamId], [PhotoPath], [Name], [storageSize], [isSSD], [Detail]) VALUES (N'e2c648db-9d3d-4752-8ca1-1e1dd31628c2', N'10.10.10.27', CAST(N'2023-07-12T09:47:37.6309820' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'f91ee8dc-a56f-4de7-97f0-f36869e89803', N'6b51d8ca-250a-4236-b483-58c23729e0c8', N'0a15c3bb-f53f-4f90-ba80-f13ee8faa3fa', N'9a4fbc74-f3b0-4ea8-830d-b063d10a727d', N'/uploads/2a2b60d3-d36a-4ab2-85bf-70aadae3bf52_OIP (9).jpg', N'Dell XPS 13', 256, 1, N'IT STUDIO
Name   : Dell XPS 13
Brand  : Dell
Type   : Laptop
Cpu   : i3 3rd Gen
Ram   : DDR4 8Gb
Note   : Dell XPS 13
            Dell XPS 13
              Dell XPS 13')
INSERT [dbo].[Computer] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [BrandId], [ComputerAmyoAsarId], [CpuId], [RamId], [PhotoPath], [Name], [storageSize], [isSSD], [Detail]) VALUES (N'fe0e25e4-3e55-4957-a20a-0490326f2471', N'10.10.10.27', CAST(N'2023-07-12T09:49:35.1816854' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'cc514ecc-beb7-47f5-9493-fa784e0c54ec', N'a7be8d42-86f0-45fc-a81f-79a60aef4689', N'0a15c3bb-f53f-4f90-ba80-f13ee8faa3fa', N'9a4fbc74-f3b0-4ea8-830d-b063d10a727d', N'/uploads/b000249f-8e31-4081-97a9-8ec5a47f2abf_OIP (10).jpg', N'Lenovo AOC', 125, 1, N'IT STUDIO
Name   : Lenovo AOC
Brand  : Lenovo
Type   : All In One
Cpu   : i3 3rd Gen
Ram   : DDR4 8Gb
Note   : Lenovo AOC Lenovo AOC')
GO
INSERT [dbo].[ComputerAmyoAsar] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [Name]) VALUES (N'6b51d8ca-250a-4236-b483-58c23729e0c8', N'10.10.10.27', CAST(N'2023-07-12T09:44:31.9155815' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'Laptop')
INSERT [dbo].[ComputerAmyoAsar] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [Name]) VALUES (N'9156a9f2-7e64-4640-8dc4-40d197ebfede', N'10.10.10.27', CAST(N'2023-07-12T09:44:45.3428461' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'Destop')
INSERT [dbo].[ComputerAmyoAsar] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [Name]) VALUES (N'a7be8d42-86f0-45fc-a81f-79a60aef4689', N'10.10.10.27', CAST(N'2023-07-12T09:44:56.7574302' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'All In One')
GO
INSERT [dbo].[Cpu] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [Name]) VALUES (N'0a15c3bb-f53f-4f90-ba80-f13ee8faa3fa', N'10.10.10.27', CAST(N'2023-07-12T09:44:06.0197509' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'i3 3rd Gen')
GO
INSERT [dbo].[Item] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [ComputerId], [AccessoriesId], [BrandId], [AccessoriesTypeId], [ComputerAmyoAsarId], [Name], [Quantity], [Detail], [Price], [PhotoPath]) VALUES (N'264bcf6a-33dc-459c-9483-e0239402f538', N'10.10.10.21', CAST(N'2023-07-12T09:57:40.8984598' AS DateTime2), CAST(N'2023-07-12T15:41:17.0717134' AS DateTime2), 1, NULL, N'063aa2e2-934d-4966-8a50-e38af2c7aa11', N'f91ee8dc-a56f-4de7-97f0-f36869e89803', N'c76f95e6-464d-4e58-9d90-0919c246ed31', NULL, N'Dell Mouse', 12, N'IT STUDIO
Name   : Dell Mouse
Brand  : Dell
Type   : Mouse
Note   : Dell Mouse
            Dell Mouse', 20000, N'/uploads/3169cea8-2831-4695-b010-d0e71fda50b4_download (11).jpg')
INSERT [dbo].[Item] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [ComputerId], [AccessoriesId], [BrandId], [AccessoriesTypeId], [ComputerAmyoAsarId], [Name], [Quantity], [Detail], [Price], [PhotoPath]) VALUES (N'38bb749f-e7fc-4796-9619-f2c048075016', N'10.10.10.27', CAST(N'2023-07-12T09:47:37.6967087' AS DateTime2), CAST(N'2023-07-12T15:33:39.5008160' AS DateTime2), 1, N'e2c648db-9d3d-4752-8ca1-1e1dd31628c2', NULL, N'f91ee8dc-a56f-4de7-97f0-f36869e89803', NULL, N'6b51d8ca-250a-4236-b483-58c23729e0c8', N'Dell XPS 13', 0, N'IT STUDIO
Name   : Dell XPS 13
Brand  : Dell
Type   : Laptop
Cpu   : i3 3rd Gen
Ram   : DDR4 8Gb
Note   : Dell XPS 13
            Dell XPS 13
              Dell XPS 13', 3300000, N'/uploads/2a2b60d3-d36a-4ab2-85bf-70aadae3bf52_OIP (9).jpg')
INSERT [dbo].[Item] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [ComputerId], [AccessoriesId], [BrandId], [AccessoriesTypeId], [ComputerAmyoAsarId], [Name], [Quantity], [Detail], [Price], [PhotoPath]) VALUES (N'afb4b41e-8f49-4ba2-8549-8cbc5e2cffd9', N'10.10.10.27', CAST(N'2023-07-12T09:50:49.1043518' AS DateTime2), CAST(N'2023-07-12T15:36:17.7173973' AS DateTime2), 1, N'544a4d42-8fb6-4517-978d-33bc7424553c', NULL, N'081bc0ed-26ab-4121-8633-6956f10e8d8b', NULL, N'9156a9f2-7e64-4640-8dc4-40d197ebfede', N'Hp Destop', 4, N'IT STUDIO
Name   : Hp Destop
Brand  : Hp
Type   : Destop
Cpu   : i3 3rd Gen
Ram   : DDR4 8Gb
Note   : Hp DestopHp Destop', 1800000, N'/uploads/0e11d227-575d-43c1-aec5-c02cd5a7b0b3_OIP (11).jpg')
INSERT [dbo].[Item] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [ComputerId], [AccessoriesId], [BrandId], [AccessoriesTypeId], [ComputerAmyoAsarId], [Name], [Quantity], [Detail], [Price], [PhotoPath]) VALUES (N'cd2b306a-aef5-418e-a20a-09fcebe00dcc', N'10.10.10.27', CAST(N'2023-07-12T09:53:21.8356468' AS DateTime2), CAST(N'2023-07-12T11:50:42.6606200' AS DateTime2), 1, NULL, N'f532ecb1-bc67-4463-b5ff-6113bac9886c', N'081bc0ed-26ab-4121-8633-6956f10e8d8b', N'238dcf7b-96e3-4c96-bba1-ac2681dd09a9', NULL, N'Hp Speaker', 2, N'IT STUDIO
Name   : Hp Speaker
Brand  : Hp
Type   : Speaker
Note   : Hp Speaker Hp Speaker', 60000, N'/uploads/eb058589-9686-48ae-9c31-61b3dc29d609_OIP (12).jpg')
INSERT [dbo].[Item] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [ComputerId], [AccessoriesId], [BrandId], [AccessoriesTypeId], [ComputerAmyoAsarId], [Name], [Quantity], [Detail], [Price], [PhotoPath]) VALUES (N'e53a5a28-446e-489d-a147-a15004a52e2d', N'10.10.10.27', CAST(N'2023-07-12T09:49:35.2024411' AS DateTime2), CAST(N'2023-07-12T10:00:33.8225032' AS DateTime2), 1, N'fe0e25e4-3e55-4957-a20a-0490326f2471', NULL, N'cc514ecc-beb7-47f5-9493-fa784e0c54ec', NULL, N'a7be8d42-86f0-45fc-a81f-79a60aef4689', N'Lenovo AOC', 2, N'IT STUDIO
Name   : Lenovo AOC
Brand  : Lenovo
Type   : All In One
Cpu   : i3 3rd Gen
Ram   : DDR4 8Gb
Note   : Lenovo AOC Lenovo AOC', 1500000, N'/uploads/b000249f-8e31-4081-97a9-8ec5a47f2abf_OIP (10).jpg')
INSERT [dbo].[Item] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [ComputerId], [AccessoriesId], [BrandId], [AccessoriesTypeId], [ComputerAmyoAsarId], [Name], [Quantity], [Detail], [Price], [PhotoPath]) VALUES (N'ebd32f0d-7b00-4d4c-a5a8-c41466e10e55', N'10.10.10.27', CAST(N'2023-07-12T09:55:37.3999971' AS DateTime2), CAST(N'2023-07-12T11:50:43.0468254' AS DateTime2), 1, NULL, N'0871cbe3-5e51-4bbd-ba58-14ca639b99f0', N'cc514ecc-beb7-47f5-9493-fa784e0c54ec', N'4e9a62c6-0221-4495-ad39-dc76d2a1062e', NULL, N'Lenovo Keyboard', 0, N'IT STUDIO
Name   : Lenovo Keyboard
Brand  : Lenovo
Type   : Keyboard
Note   : Lenovo Keyboard
             Lenovo Keyboard', 10000, N'/uploads/3843db4c-2543-4ce9-bf78-2035f18a584b_OIP (13).jpg')
GO
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'01bd75b6-5a6e-4a1a-99ae-d4c53319b9fc', NULL, CAST(N'2023-07-12T11:11:45.7535744' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/fd0d409d-0c4c-4ad6-ab0e-3a04d8698a30_download (12).jpg', N'8a2499dc-66e7-4db0-a61e-7bc7b4ce36d2', N'bobo@gmail.com', N'Dell Mouse
', N'3
', N'hhdhvdvvh', 12345, 0, NULL)
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'0a3b8aea-13ee-433e-90ba-a1667929d90e', NULL, CAST(N'2023-07-14T23:56:08.1042924' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/df2eed83-bf09-4a93-9916-d23033b54073_download (12).jpg', NULL, N'Nyi Nyi', N'Dell Mouse', N'1', N'lkjhg', 987654321, 20000, N'20000')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'2667af4c-f59c-4345-84d4-6df752ec6160', NULL, CAST(N'2023-07-14T22:27:18.2301072' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, N'Default Customer', N'Dell Mouse', N'1', NULL, 0, 20000, N'20000')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'2cb3aaf0-5652-4591-a63a-2967696b460b', NULL, CAST(N'2023-07-12T12:00:14.5762329' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/38a2c9bf-1874-4f4f-b7d3-998bca284bae_download (12).jpg', N'8a2499dc-66e7-4db0-a61e-7bc7b4ce36d2', N'bobo@gmail.com', N'Hp Destop
Dell XPS 13
', N'1
2
', N'qwert', 1234, 8400000, N'1800000
6600000
')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'2da4be20-15ff-40f7-83ec-4c39b2a60cd5', NULL, CAST(N'2023-07-14T09:53:51.1747250' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/cf3c880b-1d27-474a-ae21-9fe262e74530_download (12).jpg', N'8a2499dc-66e7-4db0-a61e-7bc7b4ce36d2', N'bobo@gmail.com', N'Hp Destop
Dell Mouse
', N'2
2
', N'qwert', 12345678, 1820000, N'1800000
20000
')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'37fb5456-912e-4c7e-ab62-5499afe1084d', NULL, CAST(N'2023-07-15T09:05:26.7098736' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/3793c469-cf54-451c-94e2-a8114a247b1d_download (12).jpg', NULL, N'Nyi Nyi', N'Lenovo AOC', N'1', N'Yangon', 0, 1500000, N'1500000')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'47267c71-f200-4f7a-bef4-c4ad70e98fdc', NULL, CAST(N'2023-07-15T10:13:28.6401980' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'/uploads/a203c997-65d2-40d8-9f3f-c35fcb66acb0_download (12).jpg', NULL, N'hjkjh', N'Lenovo AOC', N'1', N'ygn', 3456, 1500000, N'1500000')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'4a7d3b85-567c-43ba-be82-b9717b539e51', NULL, CAST(N'2023-07-12T10:15:35.0401200' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/46ca02c6-5c3c-4b71-a144-19e967a0ebd0_download (12).jpg', N'8a2499dc-66e7-4db0-a61e-7bc7b4ce36d2', N'bobo@gmail.com', N'Hp Destop
Dell XPS 13
Dell Mouse
', N'3
1
2
', N'No(556/B),Yadanarbon Street(2),
(133)Quanter,
East Dagon,Yangon.', 1234567, 0, NULL)
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'56fe3358-c6b4-477c-9b25-bb5aaf6d294e', NULL, CAST(N'2023-07-14T23:42:11.4676533' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/137b48e9-3e5b-49e2-9f54-0c345eec334f_download (12).jpg', N'8a2499dc-66e7-4db0-a61e-7bc7b4ce36d2', N'bobo@gmail.com', N'Dell Mouse', N'1', N'dfgdfg', 222222222, 20000, N'20000')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'614ee2c8-66c2-4b8c-87a3-7ea728dee567', NULL, CAST(N'2023-07-12T10:59:34.6824137' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/24758e7b-4848-45fb-b736-848e39479438_download (12).jpg', N'8a2499dc-66e7-4db0-a61e-7bc7b4ce36d2', N'bobo@gmail.com', N'Dell XPS 13
Hp Destop
', N'1
2
', N'asdfghj
qwertyuiio
asdfgh', 1234567, 0, NULL)
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'665a01ff-e31e-4a36-9b11-a457b49f3f40', NULL, CAST(N'2023-07-12T10:13:36.4031321' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/bd5923cc-69ed-4091-a5cb-82a20676e376_download (12).jpg', N'8a2499dc-66e7-4db0-a61e-7bc7b4ce36d2', N'bobo@gmail.com', N'Lenovo Keyboard
Dell Mouse
Hp Speaker
', N'1
2
3
', N'No(556/B),Yadanarbon Street(2),
(133)Quanter,
East Dagon,Yangon.', 0, 0, NULL)
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'66cb19e9-1ca3-4c08-b12f-7a1976c63450', NULL, CAST(N'2023-07-12T15:33:39.4525655' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/8cdf59cb-b384-4a95-bb86-f005c4305ff6_download (12).jpg', N'8a2499dc-66e7-4db0-a61e-7bc7b4ce36d2', N'bobo@gmail.com', N'Dell XPS 13
', N'8
', N'f ghj', 1234, 26400000, N'26400000
')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'717eecca-1b29-4c64-b342-b6d8c2ab96d9', NULL, CAST(N'2023-07-12T11:50:42.6059357' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/b63e959d-9473-4d54-91bb-3c6e68ce6c68_download (12).jpg', N'8a2499dc-66e7-4db0-a61e-7bc7b4ce36d2', N'bobo@gmail.com', N'Hp Speaker
Dell Mouse
Lenovo Keyboard
', N'1
6
2
', N'wwerrgvcvdbdfbdfbdf', 12345, 188000, N'60000
108000
20000
')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'74f9353a-9f74-4c68-bba0-efee054df7e6', NULL, CAST(N'2023-07-14T22:27:05.3835196' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL, N'Default Customer', N'Dell Mouse', N'1', NULL, 0, 20000, N'20000')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'828efed2-e759-4bca-9e6c-464470116ef2', NULL, CAST(N'2023-07-14T22:54:14.9482172' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/db5c230f-750d-4d5e-aaf7-bfc39f0038bc_download (12).jpg', NULL, N'Default Customer', N'Hp Destop', N'1', N'qwertyhdffgdgsdfghsdfghdf', 561456484, 1800000, N'1800000')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'857c2b59-39ae-41fa-acf5-062e570f0675', NULL, CAST(N'2023-07-14T23:28:13.3242810' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/d67039fa-aad6-4b61-8600-23926d4793ca_download (12).jpg', NULL, N'dfgdfg', N'Dell Mouse', N'1', N'dfgdsfgdf', 0, 20000, N'20000')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'86a03d94-23d6-43b9-9925-7e333f04166d', NULL, CAST(N'2023-07-14T23:16:01.8782718' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/99ea93d8-a379-4075-8574-9e3a72e2c70a_download (12).jpg', N'8a2499dc-66e7-4db0-a61e-7bc7b4ce36d2', N'bobo@gmail.com', N'Dell Mouse', N'1', N'dfgfdfsgdfgdfssg', 0, 20000, N'20000')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'8a400c3a-2785-4ee6-b4bb-cede20025122', NULL, CAST(N'2023-07-14T23:20:25.1860454' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/694c24ee-33a5-43f9-b8c4-ca0f6f8e474b_download (12).jpg', NULL, N'hfghdfh', N'Dell Mouse', N'1', N'gfhfghdfh', 442425, 20000, N'20000')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'a0b778e0-7127-44e6-9ca7-78eb0b3c42d7', NULL, CAST(N'2023-07-14T22:56:05.7158525' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/04f74e4d-25a3-4395-ac32-810db3282454_download (12).jpg', N'55e9416b-13a4-44a5-aada-1b9c1f676856', N'sakawar@gmail.com', N'Hp Speaker', N'1', N'rssghghrfthrfgh', 0, 60000, N'60000')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'a6ac93d7-ddd1-49ee-8b89-5358e151e677', NULL, CAST(N'2023-07-15T09:08:26.1133297' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'/uploads/c98d5eb8-0562-49d9-a27f-5257f743810e_download (12).jpg', NULL, N'Nyi Nyi', N'Dell Mouse', N'1', N'yangon', 123456, 20000, N'20000')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'af07521f-300e-47ea-9fe2-b08409cd3581', NULL, CAST(N'2023-07-15T09:06:14.1960630' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/f289ef0f-b7b0-4893-ac08-7925d2a6e639_download (12).jpg', N'55e9416b-13a4-44a5-aada-1b9c1f676856', N'sakawar@gmail.com', N'Hp Speaker', N'1', N'Mandalay', 0, 60000, N'60000')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'b1cc9c42-1cd7-4a21-aef6-8d546b42a2dd', NULL, CAST(N'2023-07-12T11:10:59.3086348' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/d8f4d546-1c07-48d5-b3f0-7845568d8246_download (12).jpg', N'8a2499dc-66e7-4db0-a61e-7bc7b4ce36d2', N'bobo@gmail.com', N'Dell Mouse
', N'1
', N'azwsxedcfv', 1234, 0, NULL)
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'b772cc43-b3e4-40ef-b191-b4a14ca12772', NULL, CAST(N'2023-07-14T23:16:28.5697349' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/2a4985f3-a2e5-4c57-87be-93f7b5f38865_download (12).jpg', NULL, N'Mg Nyi', N'Dell Mouse', N'1', N'dfgsdgsdfgsdfg', 456645, 20000, N'20000')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'c1d2c2f6-2b6b-487f-8165-26e8b9793b50', NULL, CAST(N'2023-07-12T15:36:17.7066555' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/91163215-640c-4b83-86aa-754db1a09088_download (12).jpg', N'8a2499dc-66e7-4db0-a61e-7bc7b4ce36d2', N'bobo@gmail.com', N'Hp Destop
', N'2
', N'123sdfg', 34, 3600000, N'3600000
')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'c48934c4-3405-409c-b67b-42d695543670', NULL, CAST(N'2023-07-14T23:41:47.4025678' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/693f7a9b-4614-47b2-a432-87d9d88e6728_download (12).jpg', NULL, N'aung', N'Dell Mouse', N'1', N'sdfgsdfgsdfsg', 0, 20000, N'20000')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'c5633abe-547b-49f1-b8eb-a56d83bb4a3a', NULL, CAST(N'2023-07-14T23:18:23.9557595' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/a342c774-654d-4715-904d-3f2c933c4f60_download (12).jpg', N'8a2499dc-66e7-4db0-a61e-7bc7b4ce36d2', N'bobo@gmail.com', N'Dell Mouse', N'1', N'rgsgdf', 0, 20000, N'20000')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'c5dbf7a2-330c-49f9-8819-a44c67730694', NULL, CAST(N'2023-07-14T23:47:09.8307616' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/42f01321-49e0-499a-9d87-993daad03cc6_download (12).jpg', NULL, N'dfgdfg', N'Dell Mouse', N'1', N'dfgdfg', 0, 20000, N'20000')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'c99715ce-2c3e-4777-b24e-2c1d2aba74ca', NULL, CAST(N'2023-07-14T08:59:28.1913294' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/46764133-d21a-4a12-a79f-06a37791ab17_download (12).jpg', N'8a2499dc-66e7-4db0-a61e-7bc7b4ce36d2', N'bobo@gmail.com', N'Hp Destop
Dell Mouse
', N'1
2
', N'asdfgh', 123456, 1820000, N'1800000
20000
')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'cbb1feef-bf9e-4212-9843-d1d8f8ee27f3', NULL, CAST(N'2023-07-15T09:10:51.1501447' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'/uploads/1b418dfa-c6e5-4be2-b899-010dca9a6ef2_download (12).jpg', N'55e9416b-13a4-44a5-aada-1b9c1f676856', N'sakawar@gmail.com', N'Dell Mouse', N'1', N'Mandalay', 123456, 20000, N'20000')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'cd98a319-4a2d-4438-9647-019b3319e40d', NULL, CAST(N'2023-07-14T23:55:16.4013938' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/be0aec74-5934-4091-a076-5b2c6f41868e_download (12).jpg', N'8a2499dc-66e7-4db0-a61e-7bc7b4ce36d2', N'bobo@gmail.com', N'Dell Mouse', N'1', N'asdfgh', 123344, 20000, N'20000')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'ce023631-fb11-48bc-ac52-cc155de4e210', NULL, CAST(N'2023-07-14T11:24:06.1419877' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/3f375c19-be04-430f-a6a6-f009d31fec71_download (12).jpg', N'55e9416b-13a4-44a5-aada-1b9c1f676856', N'sakawar@gmail.com', N'Dell Mouse
Lenovo AOC
', N'2
3
', N'qwert', 5432, 4540000, N'20000
1500000
')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'daebc795-d090-45a4-98fb-adf9e7325002', NULL, CAST(N'2023-07-14T23:30:29.7223936' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/6c321c40-4cda-46ad-83ab-ef5bf3fd39bb_download (12).jpg', NULL, N'gsrdgdfg', N'Dell Mouse', N'1', N'fhhhhhhhhhhhhh', 1111111111, 20000, N'20000')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'e1837244-84d4-4369-863f-fa963bacadde', NULL, CAST(N'2023-07-12T10:10:28.3367047' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/c3ea6d43-9e96-46aa-9570-85acd6ba6de7_download (12).jpg', N'8a2499dc-66e7-4db0-a61e-7bc7b4ce36d2', N'bobo@gmail.com', N'Dell Mouse
', N'2
', N'dddsaaaaaaxxxxxxxxxx
sssssssssssss
ddddddddd', 12345678, 0, NULL)
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'f0837f45-9c20-4fab-a92b-fc97c8d4b595', NULL, CAST(N'2023-07-14T09:54:57.9041954' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/2c3e9c47-6ccc-4aa8-9d6a-7d8f4fbea30f_download (12).jpg', N'8a2499dc-66e7-4db0-a61e-7bc7b4ce36d2', N'bobo@gmail.com', N'Lenovo AOC
Hp Speaker
', N'2
2
', N'duytrytr', 9876654, 1560000, N'1500000
60000
')
INSERT [dbo].[OrderFromCart] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [PhotoPath], [UserId], [UserName], [ItemName], [Quantity], [Address], [PhoneNumber], [TotalPrice], [Price]) VALUES (N'fbf841d6-9472-42ec-8132-f513133ea24d', NULL, CAST(N'2023-07-14T23:47:51.9860050' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'/uploads/322caf53-6e42-4094-94f0-546f0373b326_download (12).jpg', N'55e9416b-13a4-44a5-aada-1b9c1f676856', N'sakawar@gmail.com', N'Hp Destop', N'1', N'fbnfghb', 1111111111, 1800000, N'1800000')
GO
INSERT [dbo].[Purchase] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [ItemId], [Quantity], [BuyPrice], [SalePrice]) VALUES (N'0dd35e86-366d-4f40-ac41-438c80fc1003', N'10.10.10.27', CAST(N'2023-07-12T09:59:26.3813426' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'afb4b41e-8f49-4ba2-8549-8cbc5e2cffd9', 10, 1500000, 1800000)
INSERT [dbo].[Purchase] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [ItemId], [Quantity], [BuyPrice], [SalePrice]) VALUES (N'40a1896c-493d-4cd1-9600-b2bd0c161ffc', N'10.10.10.27', CAST(N'2023-07-12T09:58:51.2169392' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'38bb749f-e7fc-4796-9619-f2c048075016', 10, 3000000, 3300000)
INSERT [dbo].[Purchase] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [ItemId], [Quantity], [BuyPrice], [SalePrice]) VALUES (N'5e56118d-0dc6-4efe-94e1-5f4e8866681e', N'10.10.10.21', CAST(N'2023-07-12T15:41:17.0199023' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'264bcf6a-33dc-459c-9483-e0239402f538', 26, 15000, 20000)
INSERT [dbo].[Purchase] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [ItemId], [Quantity], [BuyPrice], [SalePrice]) VALUES (N'80a343c8-1058-40c6-ae0b-c0322ee051bf', N'10.10.10.27', CAST(N'2023-07-12T09:59:50.3325549' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'cd2b306a-aef5-418e-a20a-09fcebe00dcc', 10, 50000, 60000)
INSERT [dbo].[Purchase] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [ItemId], [Quantity], [BuyPrice], [SalePrice]) VALUES (N'9fe3ff72-b643-4187-b5d6-8173685183fe', N'10.10.10.27', CAST(N'2023-07-12T10:00:33.8121366' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'e53a5a28-446e-489d-a147-a15004a52e2d', 10, 1300000, 1500000)
INSERT [dbo].[Purchase] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [ItemId], [Quantity], [BuyPrice], [SalePrice]) VALUES (N'adbeeb8e-6da0-4c53-866f-e25a1c9bed09', N'10.10.10.27', CAST(N'2023-07-12T10:01:00.9867621' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'ebd32f0d-7b00-4d4c-a5a8-c41466e10e55', 10, 8000, 10000)
INSERT [dbo].[Purchase] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [ItemId], [Quantity], [BuyPrice], [SalePrice]) VALUES (N'd8d612dd-1d55-4ddb-8950-9fccffd25f2b', N'10.10.10.27', CAST(N'2023-07-12T09:58:22.6037290' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'264bcf6a-33dc-459c-9483-e0239402f538', 10, 15000, 18000)
GO
INSERT [dbo].[Ram] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [Name]) VALUES (N'872b2356-d37a-4c02-b89e-47b9087b3ded', N'10.10.10.27', CAST(N'2023-07-12T09:43:19.6284593' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'i3 3rd Gen')
INSERT [dbo].[Ram] ([Id], [Ip], [CreateDate], [ModifiedDate], [isActive], [Name]) VALUES (N'9a4fbc74-f3b0-4ea8-830d-b063d10a727d', N'10.10.10.27', CAST(N'2023-07-12T09:43:44.1533980' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'DDR4 8Gb')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Accessories_AccessoriesTypeId]    Script Date: 7/15/2023 2:13:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Accessories_AccessoriesTypeId] ON [dbo].[Accessories]
(
	[AccessoriesTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Accessories_BrandId]    Script Date: 7/15/2023 2:13:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Accessories_BrandId] ON [dbo].[Accessories]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 7/15/2023 2:13:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 7/15/2023 2:13:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 7/15/2023 2:13:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 7/15/2023 2:13:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 7/15/2023 2:13:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 7/15/2023 2:13:27 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 7/15/2023 2:13:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Computer_BrandId]    Script Date: 7/15/2023 2:13:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Computer_BrandId] ON [dbo].[Computer]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Computer_ComputerAmyoAsarId]    Script Date: 7/15/2023 2:13:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Computer_ComputerAmyoAsarId] ON [dbo].[Computer]
(
	[ComputerAmyoAsarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Computer_CpuId]    Script Date: 7/15/2023 2:13:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Computer_CpuId] ON [dbo].[Computer]
(
	[CpuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Computer_RamId]    Script Date: 7/15/2023 2:13:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Computer_RamId] ON [dbo].[Computer]
(
	[RamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Item_AccessoriesId]    Script Date: 7/15/2023 2:13:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Item_AccessoriesId] ON [dbo].[Item]
(
	[AccessoriesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Item_ComputerId]    Script Date: 7/15/2023 2:13:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Item_ComputerId] ON [dbo].[Item]
(
	[ComputerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Purchase_ItemId]    Script Date: 7/15/2023 2:13:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Purchase_ItemId] ON [dbo].[Purchase]
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT ((0)) FOR [TotalPrice]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT ((0)) FOR [TotalQuantity]
GO
ALTER TABLE [dbo].[Accessories]  WITH CHECK ADD  CONSTRAINT [FK_Accessories_AccessoriesType_AccessoriesTypeId] FOREIGN KEY([AccessoriesTypeId])
REFERENCES [dbo].[AccessoriesType] ([Id])
GO
ALTER TABLE [dbo].[Accessories] CHECK CONSTRAINT [FK_Accessories_AccessoriesType_AccessoriesTypeId]
GO
ALTER TABLE [dbo].[Accessories]  WITH CHECK ADD  CONSTRAINT [FK_Accessories_Brand_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([Id])
GO
ALTER TABLE [dbo].[Accessories] CHECK CONSTRAINT [FK_Accessories_Brand_BrandId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Computer]  WITH CHECK ADD  CONSTRAINT [FK_Computer_Brand_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([Id])
GO
ALTER TABLE [dbo].[Computer] CHECK CONSTRAINT [FK_Computer_Brand_BrandId]
GO
ALTER TABLE [dbo].[Computer]  WITH CHECK ADD  CONSTRAINT [FK_Computer_ComputerAmyoAsar_ComputerAmyoAsarId] FOREIGN KEY([ComputerAmyoAsarId])
REFERENCES [dbo].[ComputerAmyoAsar] ([Id])
GO
ALTER TABLE [dbo].[Computer] CHECK CONSTRAINT [FK_Computer_ComputerAmyoAsar_ComputerAmyoAsarId]
GO
ALTER TABLE [dbo].[Computer]  WITH CHECK ADD  CONSTRAINT [FK_Computer_Cpu_CpuId] FOREIGN KEY([CpuId])
REFERENCES [dbo].[Cpu] ([Id])
GO
ALTER TABLE [dbo].[Computer] CHECK CONSTRAINT [FK_Computer_Cpu_CpuId]
GO
ALTER TABLE [dbo].[Computer]  WITH CHECK ADD  CONSTRAINT [FK_Computer_Ram_RamId] FOREIGN KEY([RamId])
REFERENCES [dbo].[Ram] ([Id])
GO
ALTER TABLE [dbo].[Computer] CHECK CONSTRAINT [FK_Computer_Ram_RamId]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Accessories_AccessoriesId] FOREIGN KEY([AccessoriesId])
REFERENCES [dbo].[Accessories] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Accessories_AccessoriesId]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Computer_ComputerId] FOREIGN KEY([ComputerId])
REFERENCES [dbo].[Computer] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Computer_ComputerId]
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Item_ItemId] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FK_Purchase_Item_ItemId]
GO
USE [master]
GO
ALTER DATABASE [ITSTUDIO] SET  READ_WRITE 
GO
