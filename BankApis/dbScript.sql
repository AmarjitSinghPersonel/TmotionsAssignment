USE [master]
GO
/****** Object:  Database [VanillaBank]    Script Date: 16-Sep-2018 08:57:46 ******/
CREATE DATABASE [VanillaBank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VanillaBank', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\VanillaBank.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VanillaBank_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\VanillaBank_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [VanillaBank] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VanillaBank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VanillaBank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VanillaBank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VanillaBank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VanillaBank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VanillaBank] SET ARITHABORT OFF 
GO
ALTER DATABASE [VanillaBank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VanillaBank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VanillaBank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VanillaBank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VanillaBank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VanillaBank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VanillaBank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VanillaBank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VanillaBank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VanillaBank] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VanillaBank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VanillaBank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VanillaBank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VanillaBank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VanillaBank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VanillaBank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VanillaBank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VanillaBank] SET RECOVERY FULL 
GO
ALTER DATABASE [VanillaBank] SET  MULTI_USER 
GO
ALTER DATABASE [VanillaBank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VanillaBank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VanillaBank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VanillaBank] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VanillaBank] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'VanillaBank', N'ON'
GO
ALTER DATABASE [VanillaBank] SET QUERY_STORE = OFF
GO
USE [VanillaBank]
GO
/****** Object:  Table [dbo].[BankTransactions]    Script Date: 16-Sep-2018 08:57:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankTransactions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AccountNo] [int] NULL,
	[Amount] [float] NULL,
	[TransType] [varchar](2) NULL,
	[Currency] [varchar](3) NULL,
	[tstamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BankTransactions] ON 

INSERT [dbo].[BankTransactions] ([id], [AccountNo], [Amount], [TransType], [Currency], [tstamp]) VALUES (1, 12122, 112, N'Cr', N'inr', CAST(N'2018-09-16T16:49:32.913' AS DateTime))
INSERT [dbo].[BankTransactions] ([id], [AccountNo], [Amount], [TransType], [Currency], [tstamp]) VALUES (2, 12122, 112, N'Db', N'inr', CAST(N'2018-09-16T16:50:49.117' AS DateTime))
INSERT [dbo].[BankTransactions] ([id], [AccountNo], [Amount], [TransType], [Currency], [tstamp]) VALUES (3, 12122, 100, N'Cr', N'inr', CAST(N'2018-09-16T17:00:23.360' AS DateTime))
INSERT [dbo].[BankTransactions] ([id], [AccountNo], [Amount], [TransType], [Currency], [tstamp]) VALUES (4, 12122, 100, N'Cr', N'inr', CAST(N'2018-09-16T17:00:26.793' AS DateTime))
INSERT [dbo].[BankTransactions] ([id], [AccountNo], [Amount], [TransType], [Currency], [tstamp]) VALUES (5, 12122, 100, N'Db', N'inr', CAST(N'2018-09-16T17:00:39.647' AS DateTime))
INSERT [dbo].[BankTransactions] ([id], [AccountNo], [Amount], [TransType], [Currency], [tstamp]) VALUES (6, 123, 100, N'Cr', N'inr', CAST(N'2018-09-16T17:02:25.267' AS DateTime))
INSERT [dbo].[BankTransactions] ([id], [AccountNo], [Amount], [TransType], [Currency], [tstamp]) VALUES (7, 123, 50, N'Db', N'inr', CAST(N'2018-09-16T17:02:25.267' AS DateTime))
INSERT [dbo].[BankTransactions] ([id], [AccountNo], [Amount], [TransType], [Currency], [tstamp]) VALUES (8, 123, 50, N'Cr', N'inr', CAST(N'2018-09-16T17:02:35.813' AS DateTime))
INSERT [dbo].[BankTransactions] ([id], [AccountNo], [Amount], [TransType], [Currency], [tstamp]) VALUES (9, 123, 50, N'Db', N'inr', CAST(N'2018-09-16T17:02:35.813' AS DateTime))
INSERT [dbo].[BankTransactions] ([id], [AccountNo], [Amount], [TransType], [Currency], [tstamp]) VALUES (10, 123, 50, N'Db', N'inr', CAST(N'2018-09-16T17:26:28.637' AS DateTime))
INSERT [dbo].[BankTransactions] ([id], [AccountNo], [Amount], [TransType], [Currency], [tstamp]) VALUES (11, 123, 50, N'Cr', N'inr', CAST(N'2018-09-16T17:28:05.087' AS DateTime))
INSERT [dbo].[BankTransactions] ([id], [AccountNo], [Amount], [TransType], [Currency], [tstamp]) VALUES (12, 123, 50, N'Db', N'inr', CAST(N'2018-09-16T17:28:33.147' AS DateTime))
INSERT [dbo].[BankTransactions] ([id], [AccountNo], [Amount], [TransType], [Currency], [tstamp]) VALUES (13, 123, 100, N'Cr', N'Inr', CAST(N'2018-09-16T19:21:04.120' AS DateTime))
INSERT [dbo].[BankTransactions] ([id], [AccountNo], [Amount], [TransType], [Currency], [tstamp]) VALUES (14, 123, 50, N'Db', N'Inr', CAST(N'2018-09-16T19:21:47.323' AS DateTime))
INSERT [dbo].[BankTransactions] ([id], [AccountNo], [Amount], [TransType], [Currency], [tstamp]) VALUES (15, 123, 11, N'Cr', N'Inr', CAST(N'2018-09-16T19:28:35.417' AS DateTime))
INSERT [dbo].[BankTransactions] ([id], [AccountNo], [Amount], [TransType], [Currency], [tstamp]) VALUES (16, 11, 11, N'Cr', N'Inr', CAST(N'2018-09-16T19:28:50.753' AS DateTime))
SET IDENTITY_INSERT [dbo].[BankTransactions] OFF
/****** Object:  StoredProcedure [dbo].[SPBalance]    Script Date: 16-Sep-2018 08:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SPBalance]
@accNo integer

AS
Begin Transaction;
Begin
select distinct ((select sum(Amount) from BankTransactions where accountNo=@accNo and Transtype='Cr' group by AccountNo,TransType )-
(select sum(Amount) from BankTransactions where accountNo=@accNo and Transtype='Db' group by AccountNo,TransType) ) as balance from BankTransactions
where AccountNo=@accNo
	
end;
Commit;

GO
/****** Object:  StoredProcedure [dbo].[SpDeposit]    Script Date: 16-Sep-2018 08:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SpDeposit]
@accNo integer,
@amt float,
@curr varchar(3)
AS
Begin Transaction;
Begin
	Insert into BankTransactions values(@accNo,@amt,'Cr',@curr,getdate())
end;
Commit;
GO
/****** Object:  StoredProcedure [dbo].[SpWithdraw]    Script Date: 16-Sep-2018 08:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SpWithdraw]
@accNo integer,
@amt float,
@curr varchar(3)
AS
Declare @balance float;
Begin Transaction;
begin Try	
		Begin
			Set @balance = (select distinct ((select sum(Amount) from BankTransactions where accountNo=@accNo and Transtype='Cr' group by AccountNo,TransType )-
			(select sum(Amount) from BankTransactions where accountNo=@accNo and Transtype='Db' group by AccountNo,TransType) ) as balance from BankTransactions
			where AccountNo=@accNo);
			if(@balance< 0)
			begin
				THROW 51000, 'Insufficent Balance.', 1;  
			end
			else if((@balance -@amt)<0)
			begin
				THROW 51000, 'Insufficent Balance.', 1;  
			end
			else
			begin
				Insert into BankTransactions values(@accNo,@amt,'Db',@curr,getdate())
			end			
		end;
	Commit;
end try
begin catch
 Rollback;
 throw;
end catch
GO
USE [master]
GO
ALTER DATABASE [VanillaBank] SET  READ_WRITE 
GO
