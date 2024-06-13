-- Create Database

USE [master]
GO

/****** Object:  Database [ACS]    Script Date: 6/12/2024 8:15:19 PM ******/
CREATE DATABASE [ACS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ACS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DEVDB\MSSQL\DATA\ACS.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ACS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DEVDB\MSSQL\DATA\ACS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ACS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [ACS] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [ACS] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [ACS] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [ACS] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [ACS] SET ARITHABORT OFF 
GO

ALTER DATABASE [ACS] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [ACS] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [ACS] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [ACS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [ACS] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [ACS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [ACS] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [ACS] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [ACS] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [ACS] SET  DISABLE_BROKER 
GO

ALTER DATABASE [ACS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [ACS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [ACS] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [ACS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [ACS] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [ACS] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [ACS] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [ACS] SET RECOVERY FULL 
GO

ALTER DATABASE [ACS] SET  MULTI_USER 
GO

ALTER DATABASE [ACS] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [ACS] SET DB_CHAINING OFF 
GO

ALTER DATABASE [ACS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [ACS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [ACS] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [ACS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [ACS] SET QUERY_STORE = ON
GO

ALTER DATABASE [ACS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO

ALTER DATABASE [ACS] SET  READ_WRITE 
GO

-- Create Table Data Definitions
USE [ACS]
GO

/****** Object:  Table [dbo].[Errors]    Script Date: 6/12/2024 8:16:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Errors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Message] [varchar](max) NOT NULL,
	[DateTime] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE [ACS]
GO

/****** Object:  Table [dbo].[Settings]    Script Date: 6/12/2024 8:16:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Settings](
	[Name] [varchar](50) NOT NULL,
	[Value] [varchar](50) NOT NULL
) ON [PRIMARY]
GO


USE [ACS]
GO

/****** Object:  Table [dbo].[WebRequests]    Script Date: 6/12/2024 8:16:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WebRequests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[URL] [varchar](max) NOT NULL,
	[ResponseCode] [varchar](50) NOT NULL,
	[Status] [varchar](20) NOT NULL,
	[ResponsePayload] [varchar](max) NOT NULL,
	[DateAndTime] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


-- Populate Settings Table

INSERT INTO [dbo].[Settings] VALUES('WeatherGovAPIURL', 'https://api.weather.gov/points/lat,lng')
INSERT INTO [dbo].[Settings] VALUES('GoogleAPIKey', 'AIzaSyA_ZQHW-QhF1LUtoyRH5yDKDkwVSn7YpVI')
INSERT INTO [dbo].[Settings] VALUES('DefaultMapCoordinates', '39.8283,-98.5795')
INSERT INTO [dbo].[Settings] VALUES('DefaultMapZoomLevel', '5')
INSERT INTO [dbo].[Settings] VALUES('DisableDefaultUI', 'true')

