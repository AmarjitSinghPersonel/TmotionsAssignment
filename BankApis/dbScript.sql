use master
CREATE DATABASE [VanillaBank]



USE [VanillaBank]
GO
/****** Object:  Table [dbo].[BankTransactions]    Script Date: 16-Sep-2018 08:57:46 ******/
Create Table BankTransactionsMain(Id int primary key identity(1,1),accNo int not null,openingBal float not null,closingBal float not null,tStamp datetime)
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

Begin
select distinct ((select sum(Amount) from BankTransactions where accountNo=@accNo and Transtype='Cr' group by AccountNo,TransType )-
(select sum(Amount) from BankTransactions where accountNo=@accNo and Transtype='Db' group by AccountNo,TransType) ) as balance from BankTransactions
where AccountNo=@accNo
	
end;


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

Begin
	Insert into BankTransactions values(@accNo,@amt,'Cr',@curr,getdate())
end;

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
	
end try
begin catch
 
 throw;
end catch
GO

