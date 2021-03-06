USE [TalentSearch]
GO
/****** Object:  Table [dbo].[User]    Script Date: 04/08/2017 13:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[User] ON
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Name]) VALUES (2, N'Admin', N'AdminPwd', N'Admin User')
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  Table [dbo].[ErrorTracer]    Script Date: 04/08/2017 13:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ErrorTracer](
	[iErrorID] [int] IDENTITY(1,1) NOT NULL,
	[vErrorNumber] [int] NULL,
	[vErrorState] [int] NULL,
	[vErrorSeverity] [int] NULL,
	[vErrorLine] [int] NULL,
	[vErrorProc] [varchar](max) NULL,
	[vErrorMsg] [varchar](max) NULL,
	[vUserName] [varchar](max) NULL,
	[vHostName] [varchar](max) NULL,
	[dErrorDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[iErrorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ErrorTracer] ON
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (1, 8134, 1, 16, 16, N'Proc_ExceptionHandlingExample', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500A7F5D6 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (2, 8134, 1, 16, 16, N'Proc_ExceptionHandlingExample', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500A81561 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (3, 8134, 1, 16, 16, N'Proc_ExceptionHandlingExample', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500A817BB AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (4, 8134, 1, 16, 16, N'Proc_ExceptionHandlingExample', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500A81971 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (5, 8134, 1, 16, 9, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500A89401 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (6, 8134, 1, 16, 32, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500AE17A6 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (7, 8134, 1, 16, 32, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500AEBA96 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (8, 8134, 1, 16, 32, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500AF0125 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (9, 8134, 1, 16, 19, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500AF4049 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (10, 8134, 1, 16, 19, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500AFD1C2 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (11, 8134, 1, 16, 13, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B04B5D AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (12, 8134, 1, 16, 13, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B0981C AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (13, 8134, 1, 16, 13, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B09962 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (14, 8134, 1, 16, 16, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B0B982 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (15, 8134, 1, 16, 16, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B0BAF2 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (16, 8134, 1, 16, 16, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B0BC1E AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (17, 8134, 1, 16, 31, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B18993 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (18, 8134, 1, 16, 31, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B25948 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (19, 8134, 1, 16, 31, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B26059 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (20, 8134, 1, 16, 31, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B261B4 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (21, 8134, 1, 16, 31, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B262CB AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (22, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B2944E AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (23, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B29806 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (24, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B29953 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (25, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B2D233 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (26, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B2D40B AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (27, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B2D529 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (28, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B2D649 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (29, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B2D768 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (30, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B2D86F AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (31, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B2D97F AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (32, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B2DA80 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (33, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B2DB7E AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (34, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B2DC7A AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (35, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B2DD73 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (36, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B34884 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (37, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B3752F AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (38, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B3D47D AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (39, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B3D58C AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (40, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B3D63C AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (41, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B3D6D9 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (42, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B3D77A AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (43, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B3D805 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (44, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B3D9A4 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (45, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B3DA53 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (46, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B3DE28 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (47, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B3DEF0 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (48, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B3FB4A AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (49, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B3FCB1 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (50, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B3FD8A AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (51, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B3FE78 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (52, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B3FF63 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (53, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B4002C AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (54, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B400DC AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (55, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B420A5 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (56, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B4219C AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (57, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B4223B AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (58, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B422AC AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (59, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B4421F AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (60, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B44383 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (61, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B4444B AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (62, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B44519 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (63, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B445CE AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (64, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B44679 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (65, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B4B091 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (66, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B4B1C0 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (67, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B4B282 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (68, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B4B327 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (69, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B4B3D0 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (70, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B4B473 AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (71, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B4B51D AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (72, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B4B5BD AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (73, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B4B65E AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (74, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B4B6FB AS DateTime))
INSERT [dbo].[ErrorTracer] ([iErrorID], [vErrorNumber], [vErrorState], [vErrorSeverity], [vErrorLine], [vErrorProc], [vErrorMsg], [vUserName], [vHostName], [dErrorDate]) VALUES (75, 8134, 1, 16, 33, N'usp_DeleteProductionCompany', N'Divide by zero error encountered.', N'Singla-PC\Singla', N'SINGLA-PC', CAST(0x0000A74500B4B79C AS DateTime))
SET IDENTITY_INSERT [dbo].[ErrorTracer] OFF
/****** Object:  Table [dbo].[MasterCategory]    Script Date: 04/08/2017 13:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MasterCategory](
	[MasterCategoryName] [varchar](200) NOT NULL,
	[MasterCategoryDescription] [varchar](1000) NULL,
 CONSTRAINT [PK_MasterCategory] PRIMARY KEY CLUSTERED 
(
	[MasterCategoryName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MasterCategory] ([MasterCategoryName], [MasterCategoryDescription]) VALUES (N'ADMIN', N'Admin')
INSERT [dbo].[MasterCategory] ([MasterCategoryName], [MasterCategoryDescription]) VALUES (N'CATEGORY', N'Categoris')
INSERT [dbo].[MasterCategory] ([MasterCategoryName], [MasterCategoryDescription]) VALUES (N'ETHNICITY', N'the fact or state of belonging to a social group that has a common national or cultural tradition.')
INSERT [dbo].[MasterCategory] ([MasterCategoryName], [MasterCategoryDescription]) VALUES (N'LANGUAGE', N'languages')
INSERT [dbo].[MasterCategory] ([MasterCategoryName], [MasterCategoryDescription]) VALUES (N'STATUS', N'Master category "STATUS" for jobs and talents status')
/****** Object:  Table [dbo].[Region]    Script Date: 04/08/2017 13:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Region](
	[RegionId] [bigint] IDENTITY(1,1) NOT NULL,
	[RegionName] [varchar](200) NOT NULL,
	[RegionCode] [varchar](50) NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[RegionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Region] ON
INSERT [dbo].[Region] ([RegionId], [RegionName], [RegionCode]) VALUES (1, N'Northland', N'NZ-NTL')
INSERT [dbo].[Region] ([RegionId], [RegionName], [RegionCode]) VALUES (2, N'Auckland', N'NZ-AUK')
INSERT [dbo].[Region] ([RegionId], [RegionName], [RegionCode]) VALUES (3, N'Waikato', N'NZ-WKO')
INSERT [dbo].[Region] ([RegionId], [RegionName], [RegionCode]) VALUES (4, N'Bay of Plenty', N'NZ-BOP')
INSERT [dbo].[Region] ([RegionId], [RegionName], [RegionCode]) VALUES (5, N'Gisborne', N'NZ-GIS')
INSERT [dbo].[Region] ([RegionId], [RegionName], [RegionCode]) VALUES (6, N'Hawke''s Bay', N'NZ-HKB')
INSERT [dbo].[Region] ([RegionId], [RegionName], [RegionCode]) VALUES (7, N'Taranaki', N'NZ-TKI')
INSERT [dbo].[Region] ([RegionId], [RegionName], [RegionCode]) VALUES (8, N'Manawatu-Wanganui', N'NZ-MWT')
INSERT [dbo].[Region] ([RegionId], [RegionName], [RegionCode]) VALUES (9, N'Wellington', N'NZ-WGN')
INSERT [dbo].[Region] ([RegionId], [RegionName], [RegionCode]) VALUES (10, N'Tasman', N'NZ-TAS')
INSERT [dbo].[Region] ([RegionId], [RegionName], [RegionCode]) VALUES (11, N'Nelson', N'NZ-NSN')
INSERT [dbo].[Region] ([RegionId], [RegionName], [RegionCode]) VALUES (12, N'Marlborough', N'NZ-MBH')
INSERT [dbo].[Region] ([RegionId], [RegionName], [RegionCode]) VALUES (13, N'West Coast', N'NZ-WTC')
INSERT [dbo].[Region] ([RegionId], [RegionName], [RegionCode]) VALUES (14, N'Canterbury', N'NZ-CAN')
INSERT [dbo].[Region] ([RegionId], [RegionName], [RegionCode]) VALUES (15, N'Otago', N'NZ-OTA')
INSERT [dbo].[Region] ([RegionId], [RegionName], [RegionCode]) VALUES (16, N'Southland', N'NZ-STL')
SET IDENTITY_INSERT [dbo].[Region] OFF
/****** Object:  Table [dbo].[ProductionCompany]    Script Date: 04/08/2017 13:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductionCompany](
	[ProductionCompanyId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductionCompanyName] [varchar](1000) NULL,
	[RegionId] [bigint] NULL,
	[ContactPerson] [varchar](500) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[EmailId] [varchar](200) NULL,
	[DescriptionNotes] [varchar](max) NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedDate] [datetime2](0) NOT NULL,
	[modifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime2](0) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_ProductionCompany] PRIMARY KEY CLUSTERED 
(
	[ProductionCompanyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ProductionCompany] ON
INSERT [dbo].[ProductionCompany] ([ProductionCompanyId], [ProductionCompanyName], [RegionId], [ContactPerson], [PhoneNumber], [EmailId], [DescriptionNotes], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1, N'abc', 1, N'ub', N'gyg', N'jhgfhgfh', N'hb yugyg uih', 1, CAST(0x00EDCE00873C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[ProductionCompany] ([ProductionCompanyId], [ProductionCompanyName], [RegionId], [ContactPerson], [PhoneNumber], [EmailId], [DescriptionNotes], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (2, N'dhsd', 1, N'jhb', N'hgjhgj', N'jhgjhg', N'oji1', 0, CAST(0x005A3E009A3C0B0000 AS DateTime2), 2, CAST(0x00AB6900A83C0B0000 AS DateTime2), 0)
INSERT [dbo].[ProductionCompany] ([ProductionCompanyId], [ProductionCompanyName], [RegionId], [ContactPerson], [PhoneNumber], [EmailId], [DescriptionNotes], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (3, N'dhsd', NULL, N'jhb', N'hgjhgj', N'jhgjhg', N'oji', 0, CAST(0x006A3E009A3C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[ProductionCompany] ([ProductionCompanyId], [ProductionCompanyName], [RegionId], [ContactPerson], [PhoneNumber], [EmailId], [DescriptionNotes], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (4, N'sgj', NULL, N'ghjg', N'jhgjhg', N'jjhhgjh', N'oji', 0, CAST(0x00BC3E009A3C0B0000 AS DateTime2), 2, CAST(0x00A2EE00A43C0B0000 AS DateTime2), 1)
INSERT [dbo].[ProductionCompany] ([ProductionCompanyId], [ProductionCompanyName], [RegionId], [ContactPerson], [PhoneNumber], [EmailId], [DescriptionNotes], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (5, N'gjhg', NULL, N'hjjjh', N'jhjh', N'jhjh', N'ljl', 0, CAST(0x00FB3E009A3C0B0000 AS DateTime2), 2, CAST(0x0033E800A43C0B0000 AS DateTime2), 1)
INSERT [dbo].[ProductionCompany] ([ProductionCompanyId], [ProductionCompanyName], [RegionId], [ContactPerson], [PhoneNumber], [EmailId], [DescriptionNotes], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (6, N'sdk', NULL, N'jhkjh', N'jhkj', N'kjhk', N'kjkl', 0, CAST(0x00273F009A3C0B0000 AS DateTime2), 2, CAST(0x0087E700A43C0B0000 AS DateTime2), 1)
INSERT [dbo].[ProductionCompany] ([ProductionCompanyId], [ProductionCompanyName], [RegionId], [ContactPerson], [PhoneNumber], [EmailId], [DescriptionNotes], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (7, N'dhsd', 7, N'fhgf', N'hfhg', N'jhjhf', N'uuh12', 2, CAST(0x00B141009A3C0B0000 AS DateTime2), 2, CAST(0x00EC9700A83C0B0000 AS DateTime2), 0)
INSERT [dbo].[ProductionCompany] ([ProductionCompanyId], [ProductionCompanyName], [RegionId], [ContactPerson], [PhoneNumber], [EmailId], [DescriptionNotes], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (8, N'jsscasda', 1, N'asd', N'dsasd', N'asdasd', N'asd', 2, CAST(0x005EA100A43C0B0000 AS DateTime2), 2, CAST(0x00C4EE00A43C0B0000 AS DateTime2), 1)
INSERT [dbo].[ProductionCompany] ([ProductionCompanyId], [ProductionCompanyName], [RegionId], [ContactPerson], [PhoneNumber], [EmailId], [DescriptionNotes], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (9, N'dhsd', 1, N'asd', N'dsasd', N'asdasd', N'asd', 2, CAST(0x0064A100A43C0B0000 AS DateTime2), 2, CAST(0x00029800A83C0B0000 AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[ProductionCompany] OFF
/****** Object:  StoredProcedure [dbo].[Proc_InsertErrorDetails]    Script Date: 04/08/2017 13:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_InsertErrorDetails]
AS
/*
Purpose    : Insert the error details occurred in the SQL query
Input      : Insert the details which receives from the TRY...CATCH block
Output     : Insert the details of received errors into the ErrorTracer table
Created By : Senthilkumar
Created On : July 17, 2009
*/
BEGIN
  SET NOCOUNT ON 
  SET XACT_ABORT ON
  
  DECLARE @ErrorNumber VARCHAR(MAX)  
  DECLARE @ErrorState VARCHAR(MAX)  
  DECLARE @ErrorSeverity VARCHAR(MAX)  
  DECLARE @ErrorLine VARCHAR(MAX)  
  DECLARE @ErrorProc VARCHAR(MAX)  
  DECLARE @ErrorMesg VARCHAR(MAX)  
  DECLARE @vUserName VARCHAR(MAX)  
  DECLARE @vHostName VARCHAR(MAX) 

  SELECT  @ErrorNumber = ERROR_NUMBER()  
       ,@ErrorState = ERROR_STATE()  
       ,@ErrorSeverity = ERROR_SEVERITY()  
       ,@ErrorLine = ERROR_LINE()  
       ,@ErrorProc = ERROR_PROCEDURE()  
       ,@ErrorMesg = ERROR_MESSAGE()  
       ,@vUserName = SUSER_SNAME()  
       ,@vHostName = Host_NAME()  
  
INSERT INTO ErrorTracer(vErrorNumber,vErrorState,vErrorSeverity,vErrorLine,
	vErrorProc,vErrorMsg,vUserName,vHostName,dErrorDate)  
VALUES(@ErrorNumber,@ErrorState,@ErrorSeverity,@ErrorLine,@ErrorProc,
	@ErrorMesg,@vUserName,@vHostName,GETDATE())  
END
GO
/****** Object:  Table [dbo].[Category]    Script Date: 04/08/2017 13:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[MasterCategoryName] [varchar](200) NOT NULL,
	[CategoryName] [varchar](200) NOT NULL,
	[CategoryValue] [varchar](200) NULL,
	[CategoryDescription] [varchar](1000) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Category] UNIQUE NONCLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([CategoryId], [MasterCategoryName], [CategoryName], [CategoryValue], [CategoryDescription]) VALUES (1, N'STATUS', N'Job Status', N'Job Status', N'Status of the job posted by production company')
INSERT [dbo].[Category] ([CategoryId], [MasterCategoryName], [CategoryName], [CategoryValue], [CategoryDescription]) VALUES (2, N'STATUS', N'Talent Status', N'Talent Status', N'Status of the talent')
INSERT [dbo].[Category] ([CategoryId], [MasterCategoryName], [CategoryName], [CategoryValue], [CategoryDescription]) VALUES (4, N'STATUS', N'Contact Status', N'Contact Status', N'Status of the contact')
INSERT [dbo].[Category] ([CategoryId], [MasterCategoryName], [CategoryName], [CategoryValue], [CategoryDescription]) VALUES (5, N'ETHNICITY', N'New Zealand Ethincity', N'Ethincity', N'the fact or state of belonging to a social group that has a common national or cultural tradition.')
INSERT [dbo].[Category] ([CategoryId], [MasterCategoryName], [CategoryName], [CategoryValue], [CategoryDescription]) VALUES (6, N'LANGUAGE', N'New Zealand Language', N'Language', N'Language')
INSERT [dbo].[Category] ([CategoryId], [MasterCategoryName], [CategoryName], [CategoryValue], [CategoryDescription]) VALUES (7, N'CATEGORY', N'Category', N'Category', N'Categories')
INSERT [dbo].[Category] ([CategoryId], [MasterCategoryName], [CategoryName], [CategoryValue], [CategoryDescription]) VALUES (10, N'ADMIN', N'Admin', N'Admin', N'Admin Menu')
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[Tokens]    Script Date: 04/08/2017 13:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tokens](
	[TokenId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[AuthToken] [nvarchar](250) NOT NULL,
	[IssuedOn] [datetime] NOT NULL,
	[ExpiresOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Tokens] PRIMARY KEY CLUSTERED 
(
	[TokenId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 04/08/2017 13:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryId] [bigint] NOT NULL,
	[SubCategoryName] [nvarchar](200) NOT NULL,
	[SubCategoryValue] [nvarchar](200) NOT NULL,
	[SubCategoryDescription] [nvarchar](max) NULL,
	[ParentId] [bigint] NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedDate] [datetime2](0) NOT NULL,
	[modifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime2](0) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1, 1, N'Active', N'Active', N'Active', NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (2, 1, N'Inactive', N'Inactive', N'Inactive', NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (3, 1, N'On Hold', N'On Hold', N'On Hold', NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (4, 2, N'Put Forward', N'Put Forward', N'Put Forward', NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (5, 2, N'On Hold', N'On Hold', N'On Hold', NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (6, 2, N'Audition', N'Audition', N'Audition', NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (7, 2, N'Selected', N'Selected', N'Selected', NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (8, 2, N'Rejected', N'Rejected', N'Rejected', NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (11, 4, N'Contact Pending', N'Contact Pending', N'Contact Pending', NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (12, 4, N'Under Discussion', N'Under Discussion', N'Under Discussion', NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (13, 4, N'Resolved', N'Resolved', N'Resolved', NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (14, 5, N'New Zealand European', N'New Zealand European', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (15, 5, N'Maori', N'Maori', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (16, 5, N'Chinese', N'Chinese', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (17, 5, N'Samoan', N'Samoan', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (18, 5, N'New Zealander', N'New Zealander', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (19, 5, N'Cook Islands Maori', N'Cook Islands Maori', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (20, 5, N'Tongan', N'Tongan', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (21, 5, N'Filipino', N'Filipino', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (22, 5, N'English', N'English', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (23, 5, N'British', N'British', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (24, 5, N'Korean', N'Korean', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (25, 5, N'South African', N'South African', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (26, 5, N'Dutch', N'Dutch', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (27, 5, N'European', N'European', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (28, 5, N'Niuean', N'Niuean', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (29, 5, N'Australian', N'Australian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (30, 5, N'Fijian', N'Fijian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (31, 5, N'Scottish', N'Scottish', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (32, 5, N'Irish', N'Irish', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (33, 5, N'Japanese', N'Japanese', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (34, 5, N'German', N'German', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (35, 5, N'American', N'American', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (36, 5, N'Fijian Indian', N'Fijian Indian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (37, 5, N'Sri Lankan', N'Sri Lankan', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (38, 5, N'Cambodian', N'Cambodian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (39, 5, N'Thai', N'Thai', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (40, 5, N'Tokelauan', N'Tokelauan', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (41, 5, N'African', N'African', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (42, 5, N'Vietnamese', N'Vietnamese', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (43, 5, N'Russian', N'Russian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (44, 5, N'Canadian', N'Canadian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (45, 5, N'Taiwanese', N'Taiwanese', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (46, 5, N'Latin American', N'Latin American', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (47, 5, N'Malay', N'Malay', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (48, 5, N'Asian', N'Asian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (49, 5, N'French', N'French', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (50, 5, N'Middle Eastern', N'Middle Eastern', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (51, 5, N'Indonesian', N'Indonesian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (52, 5, N'Italian', N'Italian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (53, 5, N'Welsh', N'Welsh', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (54, 5, N'Tuvaluan', N'Tuvaluan', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (55, 5, N'Afghani', N'Afghani', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (56, 5, N'Pakistani', N'Pakistani', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (57, 5, N'Iranian/Persian', N'Iranian/Persian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (58, 5, N'Arab', N'Arab', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (59, 5, N'Brazilian', N'Brazilian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (60, 5, N'Croatian', N'Croatian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (61, 5, N'Iraqi', N'Iraqi', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (62, 5, N'Greek', N'Greek', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (63, 5, N'Swiss', N'Swiss', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (64, 5, N'Burmese', N'Burmese', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (65, 5, N'Polish', N'Polish', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (66, 5, N'Kiribati', N'Kiribati', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (67, 5, N'Spanish', N'Spanish', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (68, 5, N'Danish', N'Danish', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (69, 5, N'Malaysian Chinese', N'Malaysian Chinese', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (70, 5, N'Chilean', N'Chilean', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (71, 5, N'Bangladeshi', N'Bangladeshi', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (72, 5, N'Somali', N'Somali', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (73, 5, N'Zimbabwean', N'Zimbabwean', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (74, 5, N'Nepalese', N'Nepalese', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (75, 5, N'Assyrian', N'Assyrian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (76, 5, N'Romanian', N'Romanian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (77, 5, N'Tahitian', N'Tahitian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (78, 5, N'Swedish', N'Swedish', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (79, 5, N'Laotian', N'Laotian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (80, 5, N'Eurasian', N'Eurasian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (81, 5, N'Hungarian', N'Hungarian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (82, 5, N'Israeli/Jewish', N'Israeli/Jewish', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (83, 5, N'Southeast Asian', N'Southeast Asian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (84, 5, N'Ethiopian', N'Ethiopian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (85, 5, N'Afrikaner', N'Afrikaner', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (86, 5, N'Egyptian', N'Egyptian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (87, 5, N'Czech', N'Czech', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (88, 5, N'Serbian', N'Serbian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (89, 5, N'Lebanese', N'Lebanese', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (90, 5, N'Austrian', N'Austrian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (91, 5, N'Pacific Peoples', N'Pacific Peoples', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (92, 5, N'Sinhalese', N'Sinhalese', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (93, 5, N'Other European', N'Other European', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (94, 5, N'Other MELAA', N'Other MELAA', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (95, 5, N'Other Asian', N'Other Asian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (96, 5, N'Other Pacific Peoples', N'Other Pacific Peoples', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (97, 5, N'Other Ethnicity', N'Other Ethnicity', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (98, 6, N'English', N'English', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (99, 6, N'Maori', N'Maori', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (100, 6, N'Samoan', N'Samoan', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (101, 6, N'Hindi', N'Hindi', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (102, 6, N'Mandarin Chinese', N'Mandarin Chinese', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (103, 6, N'French', N'French', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (104, 6, N'Yue Chinese (Cantonese)', N'Yue Chinese (Cantonese)', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (105, 6, N'Chinese', N'Chinese', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (106, 6, N'German', N'German', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (107, 6, N'Tongan', N'Tongan', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (108, 6, N'Tagalog', N'Tagalog', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (109, 6, N'Afrikaans', N'Afrikaans', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (110, 6, N'Spanish', N'Spanish', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (111, 6, N'Korean', N'Korean', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (112, 6, N'Dutch', N'Dutch', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (113, 6, N'New Zealand Sign Language', N'New Zealand Sign Language', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (114, 6, N'Japanese', N'Japanese', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (115, 6, N'Punjabi', N'Punjabi', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (116, 6, N'Gujarati', N'Gujarati', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (117, 6, N'Arabic', N'Arabic', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (118, 6, N'Russian', N'Russian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (119, 6, N'Italian', N'Italian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (120, 6, N'Cook Islands Maori', N'Cook Islands Maori', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (121, 6, N'Thai', N'Thai', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (122, 6, N'Tamil', N'Tamil', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (123, 6, N'Malaysian', N'Malaysian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (124, 6, N'Khmer', N'Khmer', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (125, 6, N'Fijian', N'Fijian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (126, 6, N'Vietnamese', N'Vietnamese', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (127, 6, N'Serbo-Croatian', N'Serbo-Croatian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (128, 6, N'Sinhala', N'Sinhala', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (129, 6, N'Min Chinese', N'Min Chinese', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (130, 6, N'Persian', N'Persian', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (131, 6, N'Urdu', N'Urdu', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (132, 6, N'Bahasa Indonesia', N'Bahasa Indonesia', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (133, 6, N'Niuean', N'Niuean', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (134, 6, N'Malayalam', N'Malayalam', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (135, 7, N'Models', N'Models', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (136, 7, N'Talent', N'Talent', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (137, 7, N'Kids', N'Kids', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (138, 7, N'Alternate', N'Alternate', NULL, 135, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (139, 7, N'Fashion', N'Fashion', NULL, 135, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (140, 7, N'Promo', N'Promo', NULL, 135, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (141, 7, N'Fitness', N'Fitness', NULL, 135, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (142, 7, N'Actor', N'Actor', NULL, 136, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (143, 7, N'Stunt', N'Stunt', NULL, 136, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (144, 7, N'Dancers', N'Dancers', NULL, 136, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (145, 10, N'Admin', N'Admin', NULL, NULL, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (146, 10, N'Add Talent', N'AddTalent', NULL, 145, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (147, 10, N'Search Talent', N'SearchTalent', NULL, 145, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (148, 10, N'Production Company', N'ProductionCompany', NULL, 145, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (150, 10, N'Jobs', N'Jobs', NULL, 145, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [SubCategoryValue], [SubCategoryDescription], [ParentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (151, 10, N'Change Password', N'ChangePassword', NULL, 145, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
/****** Object:  Table [dbo].[Talent]    Script Date: 04/08/2017 13:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Talent](
	[TalentId] [bigint] IDENTITY(1000,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[StatusId] [bigint] NULL,
	[EmailId] [varchar](200) NOT NULL,
	[AlternateEmailId] [varchar](200) NULL,
	[Gender] [varchar](50) NOT NULL,
	[Age] [bigint] NOT NULL,
	[Hobbies] [varchar](1000) NULL,
	[Acsent] [bigint] NULL,
	[Mobile] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NULL,
	[PostalAddress] [varchar](1000) NOT NULL,
	[RegionId] [bigint] NOT NULL,
	[EmergencyName] [varchar](200) NULL,
	[EmergencyNumber] [varchar](50) NULL,
	[Height] [bigint] NULL,
	[Nationality] [varchar](100) NULL,
	[EyeColor] [varchar](50) NULL,
	[Ethnicity] [varchar](100) NULL,
	[Waist] [bigint] NULL,
	[HairColor] [varchar](50) NULL,
	[ChestSize] [bigint] NULL,
	[HipSize] [bigint] NULL,
	[IsPublic] [bit] NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedDate] [datetime2](0) NOT NULL,
	[modifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime2](0) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Talent] PRIMARY KEY CLUSTERED 
(
	[TalentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Talent] ON
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1000, N'Honey', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honeybansal98@yahoo.com', N'Male', 27, N'Cricket', NULL, N'8287085730', NULL, N'hgj', 1, NULL, NULL, 142, N'Indian', N'Black', N'Indian', 32, N'Black', 54, 38, 1, 1, CAST(0x00000000543C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1001, N'sada', N'dasd', NULL, N'hgghg', N'hgh', N'ghhg', 12, N'ghg', NULL, N'123jh', NULL, N'hgj', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(0x00000000543C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1002, N'Honey', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honeybansal98@yahoo.com', N'Male', 27, N'Cricket                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil', N'12231', 142, N'Indian', N'Black', NULL, 32, N'Black', 54, 38, 1, 1, CAST(0x00FBAA00913C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1003, N'Sunil', N'Kumar', NULL, N'sunil@gmail.com', N'sunil@yahoo.com', N'Male', 27, N'Cricket                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Honey', N'4555', 142, N'Indian', N'Black', NULL, 32, N'Black', 54, 38, 1, 1, CAST(0x008DB200913C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1004, N'Honey2', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honeybansal98@yahoo.com', N'Male', 27, N'Cricket                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil', N'8287085730', 142, N'Indian', N'Black', NULL, 34, N'Black', 32, 38, 1, 1, CAST(0x00E04301923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1005, N'Honey3', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honeybansal98@yahoo.com', N'Male', 27, N'Cricket                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil', N'8287085730', 142, N'Indian', N'Black', NULL, 32, N'Black', 34, 38, 1, 1, CAST(0x002E4501923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1006, N'Honey4', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honeybansal98@yahoo.com', N'Male', 27, N'Cricket                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil', N'8287085730', 142, N'Indian', N'Black', NULL, 32, N'Black', 32, 38, 1, 1, CAST(0x002E4801923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1007, N'Honey5', N'Bansal', NULL, N'Honeybansal98@gmail.com', N'honeybansal@yahoo.com', N'Male', 27, N'Cricket                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil', N'8281', 142, N'Indian', N'Black', N'Indian', 33, N'Black', 32, 38, 1, 1, CAST(0x00044A01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1008, N'Honey7', N'Bansal', NULL, N'honeybansal98@yahoo.com', N'honeybansal98@gmail.com', N'Male', 27, N'Cricket                                    ', NULL, N'8287085730', N'1223', N'147001', 2, N'Sunil', N'1223', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 34, 38, 1, 1, CAST(0x00DD4D01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1009, N'Honey8', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honeybansal98@yahoo.com', N'Male', 27, N'Cricket                                    ', NULL, N'8287085730', N'455', N'47520', 2, N'Sunil', N'1455', 142, N'India', N'Black', N'Indian', 32, N'Black', 54, 38, 1, 1, CAST(0x00AF4F01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1010, N'Honey8', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honeybansal98@yahoo.com', N'Male', 27, N'Cricket                                    ', NULL, N'8287085730', N'455', N'47520', 2, N'Sunil', N'1455', 142, N'India', N'Black', N'Indian', 32, N'Black', 54, 38, 1, 1, CAST(0x00F24F01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1011, N'Honey8', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honeybansal98@yahoo.com', N'Male', 27, N'Cricket                                    ', NULL, N'8287085730', N'455', N'47520', 2, N'Sunil', N'1455', 142, N'India', N'Black', N'Indian', 32, N'Black', 54, 38, 1, 1, CAST(0x003E5001923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1012, N'Honey8', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honeybansal98@yahoo.com', N'Male', 27, N'Cricket                                    ', NULL, N'8287085730', N'455', N'47520', 2, N'Sunil', N'1455', 142, N'India', N'Black', N'Indian', 32, N'Black', 54, 38, 1, 1, CAST(0x00DE5001923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1013, N'Honey', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honeybansal98@yahoo.com', N'Male', 27, N'Cricket                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Test', N'Test@1234', 120, N'Indian', N'Black', N'Indian', 120, N'Black', 120, 120, 1, 1, CAST(0x001AE500963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1014, N'Aman', N'Singla', NULL, N'Am@test.com', N'Am@test.com', N'Male', 27, N'Crr                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Honey', N'4545', 124, N'Indian', N'Black', N'Indian', 124, N'Black', 124, 124, 0, 1, CAST(0x008F0B01963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1015, N'Aman', N'Singla', NULL, N'Am@test.com', N'Am@test.com', N'Male', 27, N'Crr                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Honey', N'4545', 124, N'Indian', N'Black', N'Indian', 124, N'Black', 124, 124, 1, 1, CAST(0x00910B01963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1016, N'Aman', N'Singla2', NULL, N'Test@Test.com', N'Test@yahoo.com', N'Male', 27, N'Cricket                                    ', NULL, N'4555', N'1555', N'147001', 2, N'Test', N'4455', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 0, 1, CAST(0x005C0F01963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1017, N'Honey', N'Bansal', NULL, N'honey@test.com', N'honey@gmail.com', N'Male', 27, N'Cricket                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil Bansal', N'5455', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 0, 1, CAST(0x00AF1001963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1018, N'Aman', N'4', NULL, N'Test@Test.com', N'Test@gmail.com', N'Male', 27, N'Cricket                                    ', NULL, N'8287', N'877', N'147001', 2, N'Sunil', N'125445', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 1, 1, CAST(0x00851201963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1019, N'Last', N'Test', NULL, N'Test', N'Test', N'Male', 27, N'Cric                                    ', NULL, N'45', N'45', N'14255', 2, N'Sun', N'12', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 1, 1, CAST(0x008F1301963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1020, N'Honey', N'Last', NULL, N'honey@gmail.com', N'honey@yahoo.com', N'Male', 27, N'Cricket                                    ', NULL, N'8287085730', N'8287085730', N'145552', 2, N'Sunil', N'455', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 1, 1, CAST(0x00D4B400973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1021, N'Honey', N'Last', NULL, N'honey@gmail.com', N'honey@yahoo.com', N'Male', 27, N'Cricket                                    ', NULL, N'8287085730', N'8287085730', N'145552', 2, N'Sunil', N'455', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 1, 1, CAST(0x00F5B400973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1022, N'Honey', N'Last', NULL, N'honey@gmail.com', N'honey@yahoo.com', N'Male', 27, N'Cricket                                    ', NULL, N'8287085730', N'8287085730', N'145552', 2, N'Sunil', N'455', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 1, 1, CAST(0x0053B500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1023, N'Honey', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honey@yahoo.com', N'Male', 27, N'Crick                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil', N'4555', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 1, 1, CAST(0x00FBB500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1024, N'Honey', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honey@yahoo.com', N'Male', 27, N'Crick', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil', N'4555', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 1, 1, CAST(0x0000B900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1025, N'Honey', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honey@yahoo.com', N'Male', 27, N'                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil', N'4555', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 1, 1, CAST(0x000BDE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1026, N'Honey', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honey@yahoo.com', N'Male', 27, N'                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil', N'4555', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 1, 1, CAST(0x0042DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1027, N'Honey', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honey@yahoo.com', N'Male', 27, N'                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil', N'4555', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 1, 1, CAST(0x0093DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1028, N'Honey', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honey@yahoo.com', N'Male', 27, N'                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil', N'4555', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 1, 1, CAST(0x00D7DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1029, N'Honey', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honey@yahoo.com', N'Male', 27, N'                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil', N'4555', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 1, 1, CAST(0x0083DF00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1031, N'Honey', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honey@yahoo.com', N'Male', 27, N'                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil', N'4555', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 1, 1, CAST(0x00F0E000973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1032, N'Honey', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honey@yahoo.com', N'Male', 27, N'                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil', N'4555', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 1, 1, CAST(0x0063E100973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1033, N'Honey', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honey@yahoo.com', N'Male', 27, N'                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil', N'4555', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 1, 1, CAST(0x00DBE500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1034, N'Honey', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honey@yahoo.com', N'Male', 27, N'                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil', N'4555', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 1, 1, CAST(0x00F8E500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1035, N'Honey', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honey@yahoo.com', N'Male', 27, N'                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil', N'4555', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 1, 1, CAST(0x0025E600973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1036, N'Honey', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honey@yahoo.com', N'Male', 27, N'                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil', N'4555', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 1, 1, CAST(0x004DE900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1037, N'Honey', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honey@yahoo.com', N'Male', 27, N'                                    ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil', N'4555', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 1, 1, CAST(0x0091E900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1038, N'Honey', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honey@yahoo.com', N'Male', 27, N'Test ', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil', N'4555', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 1, 1, CAST(0x00372601973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1039, N'Honey', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honey@yahoo.com', N'Male', 27, N'Test123', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil', N'4555', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 1, 1, CAST(0x005B2701973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Talent] ([TalentId], [FirstName], [LastName], [StatusId], [EmailId], [AlternateEmailId], [Gender], [Age], [Hobbies], [Acsent], [Mobile], [Phone], [PostalAddress], [RegionId], [EmergencyName], [EmergencyNumber], [Height], [Nationality], [EyeColor], [Ethnicity], [Waist], [HairColor], [ChestSize], [HipSize], [IsPublic], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1040, N'Honey', N'Bansal', NULL, N'honeybansal98@gmail.com', N'honey@yahoo.com', N'Male', 27, N'My Hobbies', NULL, N'8287085730', N'8287085730', N'147001', 2, N'Sunil', N'4555', 142, N'Indian', N'Black', N'Indian', 32, N'Black', 32, 32, 1, 1, CAST(0x00148C00993C0B0000 AS DateTime2), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Talent] OFF
/****** Object:  Table [dbo].[ContactUs]    Script Date: 04/08/2017 13:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactUs](
	[ContactId] [bigint] IDENTITY(1,1) NOT NULL,
	[ContactPersonName] [varchar](500) NOT NULL,
	[ContactPersonEmail] [varchar](500) NOT NULL,
	[Subject] [varchar](1000) NOT NULL,
	[Message] [varchar](max) NOT NULL,
	[AdminComments] [varchar](max) NULL,
	[CreatedDate] [datetime2](0) NOT NULL,
	[ModifiedDate] [datetime2](0) NULL,
	[ContactStatus] [bigint] NULL,
 CONSTRAINT [PK_ContactUs] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 04/08/2017 13:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Jobs](
	[JobId] [bigint] IDENTITY(1000,1) NOT NULL,
	[JobName] [varchar](1000) NOT NULL,
	[ProductionCompanyId] [bigint] NOT NULL,
	[StatusId] [bigint] NULL,
	[RegionId] [bigint] NULL,
	[JobDescription] [nvarchar](max) NULL,
	[Gender] [varchar](50) NULL,
	[MinAge] [bigint] NOT NULL,
	[MaxAge] [bigint] NOT NULL,
	[EyeColor] [varchar](50) NULL,
	[Height] [bigint] NULL,
	[Waist] [bigint] NULL,
	[HairColor] [varchar](50) NULL,
	[ChestSize] [bigint] NULL,
	[HipSize] [bigint] NULL,
	[Ethicity] [varchar](100) NULL,
	[Pay] [varchar](100) NULL,
	[NumberOfDays] [bigint] NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedDate] [datetime2](0) NOT NULL,
	[modifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime2](0) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Jobs] ON
INSERT [dbo].[Jobs] ([JobId], [JobName], [ProductionCompanyId], [StatusId], [RegionId], [JobDescription], [Gender], [MinAge], [MaxAge], [EyeColor], [Height], [Waist], [HairColor], [ChestSize], [HipSize], [Ethicity], [Pay], [NumberOfDays], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1000, N'test', 1, NULL, NULL, NULL, N'gj', 12, 13, N'hghj', 12, 21, N'hjg', 12, 12, N'hjgjh', N'12828', 28, 2017, CAST(0x00000000693C0B0000 AS DateTime2), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Jobs] OFF
/****** Object:  Table [dbo].[JobTalentLanguage]    Script Date: 04/08/2017 13:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTalentLanguage](
	[JobTalentLanguageId] [bigint] IDENTITY(1,1) NOT NULL,
	[LanguageId] [bigint] NOT NULL,
	[JobId] [bigint] NULL,
	[TalentId] [bigint] NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedDate] [datetime2](0) NOT NULL,
	[modifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime2](0) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_JobTalentLanguage] PRIMARY KEY CLUSTERED 
(
	[JobTalentLanguageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[JobTalentLanguage] ON
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1, 128, NULL, 1000, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (2, 129, NULL, 1000, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (3, 130, NULL, 1000, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (4, 131, NULL, 1000, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (5, 132, NULL, 1000, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (6, 101, NULL, 1002, 1, CAST(0x00FBAA00913C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (7, 109, NULL, 1003, 1, CAST(0x008DB200913C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (8, 132, NULL, 1003, 1, CAST(0x008DB200913C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (9, 105, NULL, 1003, 1, CAST(0x008DB200913C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (10, 98, NULL, 1004, 1, CAST(0x00E04301923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (11, 106, NULL, 1005, 1, CAST(0x002E4501923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (12, 116, NULL, 1005, 1, CAST(0x002E4501923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (13, 101, NULL, 1005, 1, CAST(0x002E4501923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (14, 106, NULL, 1006, 1, CAST(0x002E4801923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (15, 116, NULL, 1006, 1, CAST(0x002E4801923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (16, 101, NULL, 1006, 1, CAST(0x002E4801923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (17, 106, NULL, 1007, 1, CAST(0x00044A01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (18, 116, NULL, 1007, 1, CAST(0x00044A01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (19, 101, NULL, 1007, 1, CAST(0x00044A01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (20, 101, NULL, 1008, 1, CAST(0x00DD4D01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (21, 125, NULL, 1009, 1, CAST(0x00AF4F01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (22, 103, NULL, 1009, 1, CAST(0x00AF4F01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (23, 106, NULL, 1009, 1, CAST(0x00AF4F01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (24, 116, NULL, 1009, 1, CAST(0x00AF4F01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (25, 101, NULL, 1009, 1, CAST(0x00AF4F01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (26, 125, NULL, 1010, 1, CAST(0x00F24F01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (27, 103, NULL, 1010, 1, CAST(0x00F24F01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (28, 106, NULL, 1010, 1, CAST(0x00F24F01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (29, 116, NULL, 1010, 1, CAST(0x00F24F01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (30, 101, NULL, 1010, 1, CAST(0x00F24F01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (31, 125, NULL, 1011, 1, CAST(0x003E5001923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (32, 103, NULL, 1011, 1, CAST(0x003E5001923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (33, 106, NULL, 1011, 1, CAST(0x003E5001923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (34, 116, NULL, 1011, 1, CAST(0x003E5001923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (35, 101, NULL, 1011, 1, CAST(0x003E5001923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (36, 125, NULL, 1012, 1, CAST(0x00DE5001923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (37, 103, NULL, 1012, 1, CAST(0x00DE5001923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (38, 106, NULL, 1012, 1, CAST(0x00DE5001923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (39, 116, NULL, 1012, 1, CAST(0x00DE5001923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (40, 101, NULL, 1012, 1, CAST(0x00DE5001923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (41, 105, NULL, 1013, 1, CAST(0x001AE500963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (42, 120, NULL, 1013, 1, CAST(0x001AE500963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (43, 117, NULL, 1014, 1, CAST(0x008F0B01963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (44, 117, NULL, 1015, 1, CAST(0x00910B01963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (45, 117, NULL, 1016, 1, CAST(0x005C0F01963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (46, 132, NULL, 1016, 1, CAST(0x005C0F01963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (47, 117, NULL, 1017, 1, CAST(0x00AF1001963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (48, 132, NULL, 1017, 1, CAST(0x00AF1001963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (49, 117, NULL, 1018, 1, CAST(0x00851201963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (50, 132, NULL, 1018, 1, CAST(0x00851201963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (51, 132, NULL, 1019, 1, CAST(0x008F1301963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (52, 105, NULL, 1019, 1, CAST(0x008F1301963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (53, 120, NULL, 1019, 1, CAST(0x008F1301963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (54, 112, NULL, 1019, 1, CAST(0x008F1301963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (55, 117, NULL, 1020, 1, CAST(0x00D4B400973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (56, 132, NULL, 1020, 1, CAST(0x00D4B400973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (57, 105, NULL, 1020, 1, CAST(0x00D4B400973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (58, 120, NULL, 1020, 1, CAST(0x00D4B400973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (59, 112, NULL, 1020, 1, CAST(0x00D4B400973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (60, 117, NULL, 1021, 1, CAST(0x00F5B400973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (61, 132, NULL, 1021, 1, CAST(0x00F5B400973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (62, 105, NULL, 1021, 1, CAST(0x00F5B400973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (63, 120, NULL, 1021, 1, CAST(0x00F5B400973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (64, 112, NULL, 1021, 1, CAST(0x00F5B400973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (65, 117, NULL, 1022, 1, CAST(0x0053B500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (66, 132, NULL, 1022, 1, CAST(0x0053B500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (67, 105, NULL, 1022, 1, CAST(0x0053B500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (68, 120, NULL, 1022, 1, CAST(0x0053B500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (69, 112, NULL, 1022, 1, CAST(0x0053B500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (70, 117, NULL, 1023, 1, CAST(0x00FBB500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (71, 132, NULL, 1023, 1, CAST(0x00FBB500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (72, 105, NULL, 1023, 1, CAST(0x00FBB500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (73, 120, NULL, 1023, 1, CAST(0x00FBB500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (74, 117, NULL, 1024, 1, CAST(0x0000B900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (75, 132, NULL, 1024, 1, CAST(0x0000B900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (76, 105, NULL, 1024, 1, CAST(0x0000B900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (77, 120, NULL, 1024, 1, CAST(0x0000B900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (78, 117, NULL, 1025, 1, CAST(0x000BDE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (79, 132, NULL, 1025, 1, CAST(0x000BDE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (80, 105, NULL, 1025, 1, CAST(0x000BDE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (81, 120, NULL, 1025, 1, CAST(0x000BDE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (82, 117, NULL, 1026, 1, CAST(0x0042DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (83, 132, NULL, 1026, 1, CAST(0x0042DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (84, 105, NULL, 1026, 1, CAST(0x0042DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (85, 120, NULL, 1026, 1, CAST(0x0042DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (86, 117, NULL, 1027, 1, CAST(0x0093DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (87, 132, NULL, 1027, 1, CAST(0x0093DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (88, 105, NULL, 1027, 1, CAST(0x0093DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (89, 120, NULL, 1027, 1, CAST(0x0093DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (90, 117, NULL, 1028, 1, CAST(0x00D7DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (91, 132, NULL, 1028, 1, CAST(0x00D7DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (92, 105, NULL, 1028, 1, CAST(0x00D7DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (93, 120, NULL, 1028, 1, CAST(0x00D7DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (94, 117, NULL, 1029, 1, CAST(0x0083DF00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (95, 132, NULL, 1029, 1, CAST(0x0083DF00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (96, 105, NULL, 1029, 1, CAST(0x0083DF00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (97, 120, NULL, 1029, 1, CAST(0x0083DF00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (102, 117, NULL, 1031, 1, CAST(0x00F0E000973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (103, 132, NULL, 1031, 1, CAST(0x00F0E000973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (104, 105, NULL, 1031, 1, CAST(0x00F0E000973C0B0000 AS DateTime2), NULL, NULL, 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (105, 120, NULL, 1031, 1, CAST(0x00F0E000973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (106, 117, NULL, 1032, 1, CAST(0x0063E100973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (107, 132, NULL, 1032, 1, CAST(0x0063E100973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (108, 105, NULL, 1032, 1, CAST(0x0063E100973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (109, 120, NULL, 1032, 1, CAST(0x0063E100973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (110, 117, NULL, 1033, 1, CAST(0x00DBE500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (111, 132, NULL, 1033, 1, CAST(0x00DBE500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (112, 105, NULL, 1033, 1, CAST(0x00DBE500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (113, 120, NULL, 1033, 1, CAST(0x00DBE500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (114, 117, NULL, 1034, 1, CAST(0x00F8E500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (115, 132, NULL, 1034, 1, CAST(0x00F8E500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (116, 105, NULL, 1034, 1, CAST(0x00F8E500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (117, 120, NULL, 1034, 1, CAST(0x00F8E500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (118, 117, NULL, 1035, 1, CAST(0x0025E600973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (119, 132, NULL, 1035, 1, CAST(0x0025E600973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (120, 105, NULL, 1035, 1, CAST(0x0025E600973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (121, 120, NULL, 1035, 1, CAST(0x0025E600973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (122, 117, NULL, 1036, 1, CAST(0x004DE900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (123, 132, NULL, 1036, 1, CAST(0x004DE900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (124, 105, NULL, 1036, 1, CAST(0x004DE900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (125, 120, NULL, 1036, 1, CAST(0x004DE900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (126, 117, NULL, 1037, 1, CAST(0x0091E900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (127, 132, NULL, 1037, 1, CAST(0x0091E900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (128, 105, NULL, 1037, 1, CAST(0x0091E900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (129, 120, NULL, 1037, 1, CAST(0x0091E900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (130, 117, NULL, 1038, 1, CAST(0x00372601973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (131, 132, NULL, 1038, 1, CAST(0x00372601973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (132, 105, NULL, 1038, 1, CAST(0x00372601973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (133, 120, NULL, 1038, 1, CAST(0x00372601973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (134, 117, NULL, 1039, 1, CAST(0x005B2701973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (135, 132, NULL, 1039, 1, CAST(0x005B2701973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (136, 105, NULL, 1039, 1, CAST(0x005B2701973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (137, 120, NULL, 1039, 1, CAST(0x005B2701973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (138, 117, NULL, 1040, 1, CAST(0x00148C00993C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (139, 132, NULL, 1040, 1, CAST(0x00148C00993C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (140, 105, NULL, 1040, 1, CAST(0x00148C00993C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentLanguage] ([JobTalentLanguageId], [LanguageId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (141, 120, NULL, 1040, 1, CAST(0x00148C00993C0B0000 AS DateTime2), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[JobTalentLanguage] OFF
/****** Object:  Table [dbo].[JobTalentCategory]    Script Date: 04/08/2017 13:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTalentCategory](
	[JobTalentCategoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryId] [bigint] NOT NULL,
	[JobId] [bigint] NULL,
	[TalentId] [bigint] NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedDate] [datetime2](0) NOT NULL,
	[modifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime2](0) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_JobTalentCategory] PRIMARY KEY CLUSTERED 
(
	[JobTalentCategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[JobTalentCategory] ON
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1, 135, NULL, 1000, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (2, 136, NULL, 1000, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (3, 137, NULL, 1000, 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (4, 136, NULL, 1002, 1, CAST(0x00FBAA00913C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (5, 136, NULL, 1003, 1, CAST(0x008DB200913C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (6, 136, NULL, 1004, 1, CAST(0x00E04301923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (7, 135, NULL, 1005, 1, CAST(0x002E4501923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (8, 135, NULL, 1006, 1, CAST(0x002E4801923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (9, 136, NULL, 1007, 1, CAST(0x00044A01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (10, 136, NULL, 1008, 1, CAST(0x00DD4D01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (11, 136, NULL, 1009, 1, CAST(0x00AF4F01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (12, 136, NULL, 1010, 1, CAST(0x00F24F01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (13, 136, NULL, 1011, 1, CAST(0x003E5001923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (14, 136, NULL, 1012, 1, CAST(0x00DE5001923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (15, 135, NULL, 1013, 1, CAST(0x001AE500963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (16, 136, NULL, 1013, 1, CAST(0x001AE500963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (17, 136, NULL, 1014, 1, CAST(0x008F0B01963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (18, 136, NULL, 1015, 1, CAST(0x00910B01963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (19, 136, NULL, 1016, 1, CAST(0x005C0F01963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (20, 135, NULL, 1017, 1, CAST(0x00AF1001963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (21, 136, NULL, 1017, 1, CAST(0x00AF1001963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (22, 136, NULL, 1018, 1, CAST(0x00851201963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (23, 135, NULL, 1019, 1, CAST(0x008F1301963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (24, 136, NULL, 1019, 1, CAST(0x008F1301963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (25, 135, NULL, 1020, 1, CAST(0x00D4B400973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (26, 135, NULL, 1021, 1, CAST(0x00F5B400973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (27, 135, NULL, 1022, 1, CAST(0x0053B500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (28, 135, NULL, 1023, 1, CAST(0x00FBB500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (29, 135, NULL, 1024, 1, CAST(0x0000B900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (30, 135, NULL, 1025, 1, CAST(0x000BDE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (31, 135, NULL, 1026, 1, CAST(0x0042DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (32, 135, NULL, 1027, 1, CAST(0x0093DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (33, 135, NULL, 1028, 1, CAST(0x00D7DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (34, 135, NULL, 1029, 1, CAST(0x0083DF00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (36, 135, NULL, 1031, 1, CAST(0x00F0E000973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (37, 135, NULL, 1032, 1, CAST(0x0063E100973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (38, 135, NULL, 1033, 1, CAST(0x00DBE500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (39, 135, NULL, 1034, 1, CAST(0x00F8E500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (40, 135, NULL, 1035, 1, CAST(0x0025E600973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (41, 135, NULL, 1036, 1, CAST(0x004DE900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (42, 135, NULL, 1037, 1, CAST(0x0091E900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (43, 135, NULL, 1038, 1, CAST(0x00372601973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (44, 135, NULL, 1039, 1, CAST(0x005B2701973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentCategory] ([JobTalentCategoryId], [CategoryId], [JobId], [TalentId], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (45, 135, NULL, 1040, 1, CAST(0x00148C00993C0B0000 AS DateTime2), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[JobTalentCategory] OFF
/****** Object:  Table [dbo].[JobTalentAssociation]    Script Date: 04/08/2017 13:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTalentAssociation](
	[JobTalentAssociationId] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[TalentId] [bigint] NOT NULL,
	[Status] [bigint] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedDate] [datetime2](0) NOT NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime2](0) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_JobTalentAssociation] PRIMARY KEY CLUSTERED 
(
	[JobTalentAssociationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetJobs]    Script Date: 04/08/2017 13:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetJobs]
AS

 select count(1) as JobCount from jobs

SELECT
  *
FROM Jobs
GO
/****** Object:  Table [dbo].[Media]    Script Date: 04/08/2017 13:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Media](
	[MediaId] [bigint] IDENTITY(1,1) NOT NULL,
	[MediaType] [varchar](20) NOT NULL,
	[TalentId] [bigint] NULL,
	[JobId] [bigint] NULL,
	[MimeType] [varchar](20) NOT NULL,
	[FileName] [varchar](500) NOT NULL,
	[IsProfilePic] [bit] NULL,
	[FilePath] [varchar](1000) NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedDate] [datetime2](0) NOT NULL,
	[modifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime2](0) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Media] PRIMARY KEY CLUSTERED 
(
	[MediaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Media] ON
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (3, N'Image', 1000, NULL, N'hgj', N'profile1', 0, N'../Content/images/banner.jpg', 1, CAST(0x00000000733C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (4, N'Image', 1000, NULL, N'hgj', N'profile2', 0, N'../Content/images/pic01.jpg', 1, CAST(0x00000000733C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (8, N'Image', 1000, NULL, N'image/png', N'Capture.PNG', 0, N'../Content/Files/Image/Capture.PNG', 1, CAST(0x003D4A00913C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (12, N'Image', 1000, NULL, N'image/png', N'Capture.PNG', 0, N'../Content/Files/Image/Capture.PNG', 1, CAST(0x001B4C00913C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (14, N'Video', 1000, NULL, N'video/mp4', N'Sarvann-2017-DesiPdvd--hd-sample-OkPunjab.Com.mp4', 0, N'../Content/Files/Video/Sarvann-2017-DesiPdvd--hd-sample-OkPunjab.Com.mp4', 1, CAST(0x00A74F00913C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (15, N'Image', 1000, NULL, N'image/png', N'JadeLook2.png', 0, N'../Content/Files/Image/JadeLook2.png', 1, CAST(0x00465B00913C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (16, N'Image', 1000, NULL, N'image/jpeg', N'FileService.jpg', NULL, N'../Content/Files/Image/FileService.jpg', 1, CAST(0x00465B00913C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (17, N'Image', 1000, NULL, N'image/png', N'JadeLook.png', 0, N'../Content/Files/Image/JadeLook.png', 1, CAST(0x00465B00913C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (18, N'Image', 1000, NULL, N'image/png', N'JadeLook.png', NULL, N'../Content/Files/Image/JadeLook.png', 1, CAST(0x00B15D00913C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (19, N'Image', 1000, NULL, N'image/png', N'JadeLook2.png', 0, N'../Content/Files/Image/JadeLook2.png', 1, CAST(0x00B15D00913C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (20, N'Image', 1000, NULL, N'image/png', N'Capture.PNG', NULL, N'../Content/Files/Image/Capture.PNG', 1, CAST(0x00396500913C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (21, N'Image', 1000, NULL, N'image/jpeg', N'IMG_20170111_094523.jpg', 0, N'../Content/Files/Image/IMG_20170111_094523.jpg', 1, CAST(0x00396500913C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (22, N'Image', 1000, NULL, N'image/png', N'Contact.png', 0, N'../Content/Files/Image/Contact.png', 1, CAST(0x00396500913C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (23, N'Image', 1000, NULL, N'image/png', N'Capture.PNG', 0, N'../Content/Files/Image/Capture.PNG', 1, CAST(0x009CF600923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (24, N'Image', 1005, NULL, N'image/png', N'Contact.png', 0, N'../Content/Files/Image/Contact.png', 1, CAST(0x00D7F700923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (25, N'Image', 1005, NULL, N'image/png', N'Capture.PNG', 0, N'../Content/Files/Image/Capture.PNG', 1, CAST(0x00D7F700923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (26, N'Image', 1006, NULL, N'image/png', N'Capture.PNG', 0, N'../Content/Files/Image/Capture.PNG', 1, CAST(0x00E5FA00923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (27, N'Video', 1006, NULL, N'video/mp4', N'Sarvann-2017-DesiPdvd--hd-sample-OkPunjab.Com.mp4', 0, N'../Content/Files/Video/Sarvann-2017-DesiPdvd--hd-sample-OkPunjab.Com.mp4', 1, CAST(0x00EAFA00923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (28, N'Image', 1006, NULL, N'image/png', N'Contact.png', 0, N'../Content/Files/Image/Contact.png', 1, CAST(0x00ECFA00923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (29, N'Image', 1007, NULL, N'image/jpeg', N'IMG_20170111_094523.jpg', 0, N'../Content/Files/Image/IMG_20170111_094523.jpg', 1, CAST(0x00AEFC00923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (30, N'Image', 1007, NULL, N'image/png', N'JadeLook.png', 0, N'../Content/Files/Image/JadeLook.png', 1, CAST(0x00AFFC00923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (31, N'Video', 1007, NULL, N'video/mp4', N'Sarvann-2017-DesiPdvd--hd-sample-OkPunjab.Com.mp4', 0, N'../Content/Files/Video/Sarvann-2017-DesiPdvd--hd-sample-OkPunjab.Com.mp4', 1, CAST(0x00B0FC00923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (32, N'Image', 1008, NULL, N'image/png', N'JadeLook2.png', 0, N'../Content/Files/Image/JadeLook2.png', 1, CAST(0x00860001923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (33, N'Image', 1008, NULL, N'image/png', N'JadeLook.png', 0, N'../Content/Files/Image/JadeLook.png', 1, CAST(0x00860001923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (34, N'Image', 1009, NULL, N'image/png', N'Profile.png', 0, N'../Content/Files/Image/Profile.png', 1, CAST(0x00580201923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (35, N'Image', 1009, NULL, N'image/png', N'Register.png', 0, N'../Content/Files/Image/Register.png', 1, CAST(0x00580201923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (36, N'Image', 1009, NULL, N'image/png', N'screencapture-localhost-4339-Home-RegisterTalent-1488786336255.png', 0, N'../Content/Files/Image/screencapture-localhost-4339-Home-RegisterTalent-1488786336255.png', 1, CAST(0x00580201923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (37, N'Image', 1010, NULL, N'image/jpeg', N'IMG_20170111_094523.jpg', 0, N'../Content/Files/Image/IMG_20170111_094523.jpg', 1, CAST(0x009C0201923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (38, N'Video', 1010, NULL, N'video/mp4', N'Sarvann-2017-DesiPdvd--hd-sample-OkPunjab.Com.mp4', 0, N'../Content/Files/Video/Sarvann-2017-DesiPdvd--hd-sample-OkPunjab.Com.mp4', 1, CAST(0x009D0201923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (39, N'Image', 1010, NULL, N'image/png', N'Profile.png', 0, N'../Content/Files/Image/Profile.png', 1, CAST(0x00A10201923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (40, N'Image', 1011, NULL, N'image/jpeg', N'IMG_20170111_094523.jpg', 0, N'../Content/Files/Image/IMG_20170111_094523.jpg', 1, CAST(0x00E60201923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (41, N'Image', 1011, NULL, N'image/jpeg', N'Talent.jpg', 0, N'../Content/Files/Image/Talent.jpg', 1, CAST(0x00E60201923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (42, N'Video', 1012, NULL, N'video/mp4', N'Sarvann-2017-DesiPdvd--hd-sample-OkPunjab.Com.mp4', 0, N'../Content/Files/Video/Sarvann-2017-DesiPdvd--hd-sample-OkPunjab.Com.mp4', 1, CAST(0x00920401923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (43, N'Image', 1013, NULL, N'image/png', N'Capture.PNG', NULL, N'../Content/Files/Image/Capture.PNG', 1, CAST(0x00C49700963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (44, N'Image', 1013, NULL, N'image/png', N'JadeLook.png', 0, N'../Content/Files/Image/JadeLook.png', 1, CAST(0x00C49700963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (45, N'Image', 1013, NULL, N'image/jpeg', N'IMG_20170111_094523.jpg', 0, N'../Content/Files/Image/IMG_20170111_094523.jpg', 1, CAST(0x00C49700963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (46, N'Image', 1013, NULL, N'image/png', N'JadeLook2.png', 0, N'../Content/Files/Image/JadeLook2.png', 1, CAST(0x00C49700963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (47, N'Image', 1013, NULL, N'image/png', N'screencapture-localhost-4339-Home-RegisterTalent-1488786336255.png', 0, N'../Content/Files/Image/screencapture-localhost-4339-Home-RegisterTalent-1488786336255.png', 1, CAST(0x00C49700963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (48, N'Video', 1013, NULL, N'video/mp4', N'Sarvann-2017-DesiPdvd--hd-sample-OkPunjab.Com.mp4', 0, N'../Content/Files/Video/Sarvann-2017-DesiPdvd--hd-sample-OkPunjab.Com.mp4', 1, CAST(0x00C49700963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (49, N'Image', 1013, NULL, N'image/png', N'Upload.png', 0, N'../Content/Files/Image/Upload.png', 1, CAST(0x00C49700963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (50, N'Image', 1014, NULL, N'image/jpeg', N'IMG_20170111_094523.jpg', 0, N'../Content/Files/Image/IMG_20170111_094523.jpg', 1, CAST(0x003ABE00963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (51, N'Image', 1014, NULL, N'image/png', N'JadeLook.png', 0, N'../Content/Files/Image/JadeLook.png', 1, CAST(0x003ABE00963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (52, N'Image', 1015, NULL, N'image/png', N'Capture.PNG', 1, N'../Content/Files/Image/Capture.PNG', 1, CAST(0x003BBE00963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (53, N'Image', 1015, NULL, N'image/png', N'JadeLook2.png', 0, N'../Content/Files/Image/JadeLook2.png', 1, CAST(0x003BBE00963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (54, N'Image', 1015, NULL, N'image/jpeg', N'IMG_20170111_094523.jpg', 0, N'../Content/Files/Image/IMG_20170111_094523.jpg', 1, CAST(0x003CBE00963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (55, N'Image', 1015, NULL, N'image/png', N'Capture.PNG', NULL, N'../Content/Files/Image/Capture.PNG', 1, CAST(0x003DBE00963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (56, N'Image', 1015, NULL, N'image/png', N'JadeLook.png', 0, N'../Content/Files/Image/JadeLook.png', 1, CAST(0x003DBE00963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (57, N'Image', 1016, NULL, N'image/png', N'JadeLook2.png', 0, N'../Content/Files/Image/JadeLook2.png', 1, CAST(0x001BC200963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (58, N'Image', 1016, NULL, N'image/png', N'JadeLook.png', NULL, N'../Content/Files/Image/JadeLook.png', 1, CAST(0x001BC200963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (59, N'Image', 1017, NULL, N'image/jpeg', N'IMG_20170111_094523.jpg', NULL, N'../Content/Files/Image/IMG_20170111_094523.jpg', 1, CAST(0x0099C300963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (60, N'Image', 1017, NULL, N'image/png', N'Profile.png', 0, N'../Content/Files/Image/Profile.png', 1, CAST(0x009BC300963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (61, N'Image', 1017, NULL, N'image/png', N'JadeLook2.png', 0, N'../Content/Files/Image/JadeLook2.png', 1, CAST(0x009CC300963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (62, N'Image', 1017, NULL, N'image/png', N'JadeLook.png', 0, N'../Content/Files/Image/JadeLook.png', 1, CAST(0x009CC300963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (63, N'Video', 1017, NULL, N'video/mp4', N'Sarvann-2017-DesiPdvd--hd-sample-OkPunjab.Com.mp4', 0, N'../Content/Files/Video/Sarvann-2017-DesiPdvd--hd-sample-OkPunjab.Com.mp4', 1, CAST(0x009CC300963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (64, N'Image', 1018, NULL, N'image/png', N'Contact.png', 0, N'../Content/Files/Image/Contact.png', 1, CAST(0x002FC500963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (65, N'Image', 1018, NULL, N'image/jpeg', N'FileService.jpg', 0, N'../Content/Files/Image/FileService.jpg', 1, CAST(0x002FC500963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (66, N'Image', 1018, NULL, N'image/png', N'JadeLook.png', NULL, N'../Content/Files/Image/JadeLook.png', 1, CAST(0x002FC500963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (67, N'Image', 1018, NULL, N'image/png', N'Capture.PNG', 0, N'../Content/Files/Image/Capture.PNG', 1, CAST(0x0030C500963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (68, N'Image', 1018, NULL, N'image/jpeg', N'IMG_20170111_094523.jpg', 0, N'../Content/Files/Image/IMG_20170111_094523.jpg', 1, CAST(0x0030C500963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (69, N'Image', 1019, NULL, N'image/png', N'JadeLook2.png', 0, N'../Content/Files/Image/JadeLook2.png', 1, CAST(0x0038C600963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (70, N'Image', 1019, NULL, N'image/jpeg', N'IMG_20170111_094523.jpg', 1, N'../Content/Files/Image/IMG_20170111_094523.jpg', 1, CAST(0x0038C600963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (71, N'Image', 1019, NULL, N'image/png', N'JadeLook.png', 0, N'../Content/Files/Image/JadeLook.png', 1, CAST(0x0038C600963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (72, N'Image', 1019, NULL, N'image/png', N'Capture.PNG', 0, N'../Content/Files/Image/Capture.PNG', 1, CAST(0x0038C600963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (73, N'Image', 1019, NULL, N'image/png', N'Contact.png', 0, N'../Content/Files/Image/Contact.png', 1, CAST(0x0038C600963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (74, N'Image', 1022, NULL, N'image/png', N'Upload.png', 0, N'../Content/Files/Image/Upload.png', 1, CAST(0x00FB6700973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (75, N'Image', 1022, NULL, N'image/png', N'week1.png', 0, N'../Content/Files/Image/week1.png', 1, CAST(0x00FB6700973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (76, N'Image', 1022, NULL, N'image/jpeg', N'Talent.jpg', 0, N'../Content/Files/Image/Talent.jpg', 1, CAST(0x00FB6700973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (77, N'Image', 1022, NULL, N'image/jpeg', N'FileService - Copy.jpg', 1, N'../Content/Files/Image/FileService - Copy.jpg', 1, CAST(0x00FB6700973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (78, N'Image', 1022, NULL, N'image/jpeg', N'IMG_20170111_094523 - Copy.jpg', 0, N'../Content/Files/Image/IMG_20170111_094523 - Copy.jpg', 1, CAST(0x00FB6700973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (79, N'Image', 1022, NULL, N'image/png', N'Contact - Copy.png', 0, N'../Content/Files/Image/Contact - Copy.png', 1, CAST(0x00FB6700973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (80, N'Image', 1022, NULL, N'image/png', N'Capture - Copy.PNG', 0, N'../Content/Files/Image/Capture - Copy.PNG', 1, CAST(0x00FB6700973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (81, N'Image', 1022, NULL, N'image/png', N'JadeLook - Copy.png', 0, N'../Content/Files/Image/JadeLook - Copy.png', 1, CAST(0x00FC6700973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (82, N'Image', 1023, NULL, N'image/png', N'Capture - Copy.PNG', 1, N'../Content/Files/Image/Capture - Copy.PNG', 1, CAST(0x00A46800973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (83, N'Image', 1023, NULL, N'image/png', N'Contact - Copy.png', 0, N'../Content/Files/Image/Contact - Copy.png', 1, CAST(0x00A46800973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (84, N'Image', 1023, NULL, N'image/png', N'Contact.png', 0, N'../Content/Files/Image/Contact.png', 1, CAST(0x00A46800973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (85, N'Image', 1024, NULL, N'image/jpeg', N'FileService.jpg', 1, N'../Content/Files/Image/FileService.jpg', 1, CAST(0x00A86B00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (87, N'Image', 1032, NULL, N'image/png', N'Capture.PNG', 1, N'../Content/Files/Image/131344794990758443.PNG', 1, CAST(0x00179400973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (88, N'Image', 1033, NULL, N'image/jpeg', N'FileService - Copy - Copy.jpg', 0, N'../Content/Files/Image/131344806437292822.jpg', 1, CAST(0x009E9800973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (89, N'Image', 1033, NULL, N'image/png', N'Contact.png', 0, N'../Content/Files/Image/131344806438769157.png', 1, CAST(0x009E9800973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (90, N'Image', 1034, NULL, N'image/jpeg', N'FileService - Copy - Copy.jpg', 0, N'../Content/Files/Image/131344806725968412.jpg', 1, CAST(0x00A19800973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (91, N'Image', 1034, NULL, N'image/png', N'Contact - Copy.png', 1, N'../Content/Files/Image/131344806727957275.png', 1, CAST(0x00A19800973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (92, N'Image', 1034, NULL, N'image/png', N'Contact.png', 0, N'../Content/Files/Image/131344806728869843.png', 1, CAST(0x00A19800973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (93, N'Image', 1035, NULL, N'image/png', N'Capture.PNG', 1, N'../Content/Files/Image/131344807176920567.PNG', 1, CAST(0x00CE9800973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (94, N'Image', 1036, NULL, N'image/png', N'Capture.PNG', 1, N'../Content/Files/Image/131344815254534066.PNG', 1, CAST(0x00F69B00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (95, N'Image', 1037, NULL, N'image/png', N'JadeLook.png', 0, N'../Content/Files/Image/131344815938094704.png', 1, CAST(0x003A9C00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (96, N'Image', 1038, NULL, N'image/png', N'Capture - Copy.PNG', 0, N'../Content/Files/Image/131344971205605139.PNG', 1, CAST(0x00E1D800973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (97, N'Image', 1039, NULL, N'image/jpeg', N'FileService - Copy - Copy.jpg', 0, N'../Content/Files/Image/131344974114377384.jpg', 1, CAST(0x0003DA00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (98, N'Image', 1039, NULL, N'image/png', N'Contact.png', 1, N'../Content/Files/Image/131344974114767636.png', 1, CAST(0x0003DA00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (99, N'Image', 1040, NULL, N'image/jpeg', N'FileService - Copy - Copy.jpg', 0, N'../Content/Files/Image/131346304613649829.jpg', 1, CAST(0x00D73E00993C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Media] ([MediaId], [MediaType], [TalentId], [JobId], [MimeType], [FileName], [IsProfilePic], [FilePath], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (100, N'Image', 1040, NULL, N'image/png', N'Capture - Copy.PNG', 1, N'../Content/Files/Image/131346304817960983.PNG', 1, CAST(0x00DA3E00993C0B0000 AS DateTime2), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Media] OFF
/****** Object:  Table [dbo].[JobTalentSkills]    Script Date: 04/08/2017 13:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobTalentSkills](
	[JobTalentSkillsId] [bigint] IDENTITY(1,1) NOT NULL,
	[ParentCategoryId] [bigint] NOT NULL,
	[SkillId] [bigint] NOT NULL,
	[JobId] [bigint] NULL,
	[TalentId] [bigint] NULL,
	[Description] [varchar](max) NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedDate] [datetime2](0) NOT NULL,
	[modifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime2](0) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_JobTalentSkills] PRIMARY KEY CLUSTERED 
(
	[JobTalentSkillsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[JobTalentSkills] ON
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (4, 2, 142, NULL, 1000, N'Good Actor', 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (5, 2, 143, NULL, 1000, N'Good Stuntman', 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (6, 2, 144, NULL, 1000, N'Good Dancer', 1, CAST(0x00000000683C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (7, 4, 142, NULL, 1002, N'Good Actor                                            ', 1, CAST(0x00FBAA00913C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (8, 5, 142, NULL, 1003, N'                               Good Actor             ', 1, CAST(0x008DB200913C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (9, 6, 142, NULL, 1004, N'Good Actor', 1, CAST(0x00E04301923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (10, 7, 138, NULL, 1005, N'Test               ', 1, CAST(0x002E4501923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (11, 8, 138, NULL, 1006, N'Alternate                 ', 1, CAST(0x002E4801923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (12, 9, 142, NULL, 1007, N'Good Actor                                            ', 1, CAST(0x00044A01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (13, 10, 142, NULL, 1008, N'Good Actor                                            ', 1, CAST(0x00DD4D01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (14, 11, 142, NULL, 1009, N'Good Actor                                       ', 1, CAST(0x00AF4F01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (15, 12, 142, NULL, 1010, N'Good Actor                                       ', 1, CAST(0x00F24F01923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (16, 13, 142, NULL, 1011, N'Good Actor                                       ', 1, CAST(0x003E5001923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (17, 14, 142, NULL, 1012, N'Good Actor                                       ', 1, CAST(0x00DE5001923C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (18, 15, 138, NULL, 1013, N'Test                                            ', 1, CAST(0x001AE500963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (19, 15, 139, NULL, 1013, N'Test                                            ', 1, CAST(0x001AE500963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (20, 16, 142, NULL, 1013, N'Good Actor                                            ', 1, CAST(0x001AE500963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (21, 17, 142, NULL, 1014, N'Good Actor                                            ', 1, CAST(0x008F0B01963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (22, 18, 142, NULL, 1015, N'Good Actor                                            ', 1, CAST(0x00910B01963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (23, 19, 142, NULL, 1016, N']Good', 1, CAST(0x005C0F01963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (24, 20, 138, NULL, 1017, N'                                  Good          ', 1, CAST(0x00AF1001963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (25, 21, 142, NULL, 1017, N'Good                                            ', 1, CAST(0x00AF1001963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (26, 22, 142, NULL, 1018, N' Good                                           ', 1, CAST(0x00851201963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (27, 22, 142, NULL, 1018, N'Good                                            ', 1, CAST(0x00851201963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (28, 23, 138, NULL, 1019, N'Good                                            ', 1, CAST(0x008F1301963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (29, 24, 142, NULL, 1019, N'Good                                            ', 1, CAST(0x008F1301963C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (30, 25, 141, NULL, 1020, N'Good                                           ', 1, CAST(0x00D4B400973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (31, 26, 141, NULL, 1021, N'Good                                           ', 1, CAST(0x00F5B400973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (32, 27, 141, NULL, 1022, N'Good                                           ', 1, CAST(0x0053B500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (33, 28, 141, NULL, 1023, N'My Expertise                       ', 1, CAST(0x00FBB500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (34, 29, 141, NULL, 1024, N'                 My Plan                           ', 1, CAST(0x0000B900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (35, 29, 138, NULL, 1024, N'My Plan                                            ', 1, CAST(0x0000B900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (36, 29, 139, NULL, 1024, N'My Plan                                            ', 1, CAST(0x0000B900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (37, 30, 141, NULL, 1025, N'Fit                ', 1, CAST(0x000BDE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (38, 30, 138, NULL, 1025, N'Alternate                               ', 1, CAST(0x000BDE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (39, 31, 141, NULL, 1026, N'Fit                ', 1, CAST(0x0042DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (40, 31, 138, NULL, 1026, N'Alternate                               ', 1, CAST(0x0042DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (41, 32, 141, NULL, 1027, N'Fit                ', 1, CAST(0x0093DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (42, 32, 138, NULL, 1027, N'Alternate                               ', 1, CAST(0x0093DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (43, 33, 141, NULL, 1028, N'Fit                ', 1, CAST(0x00D7DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (44, 33, 138, NULL, 1028, N'Alternate                               ', 1, CAST(0x00D7DE00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (45, 34, 141, NULL, 1029, N'Fit                ', 1, CAST(0x0083DF00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (46, 34, 138, NULL, 1029, N'Alternate                               ', 1, CAST(0x0083DF00973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (49, 36, 141, NULL, 1031, N'Fit                ', 1, CAST(0x00F0E000973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (50, 36, 138, NULL, 1031, N'Alternate                               ', 1, CAST(0x00F0E000973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (51, 37, 141, NULL, 1032, N'Fit                ', 1, CAST(0x0063E100973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (52, 37, 138, NULL, 1032, N'Alternate                               ', 1, CAST(0x0063E100973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (53, 38, 141, NULL, 1033, N'Fit                                          ', 1, CAST(0x00DBE500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (54, 39, 141, NULL, 1034, N'Fit                                          ', 1, CAST(0x00F8E500973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (55, 40, 141, NULL, 1035, N'Fit                                          ', 1, CAST(0x0025E600973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (56, 41, 141, NULL, 1036, N'                                            ', 1, CAST(0x004DE900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (57, 41, 141, NULL, 1036, N'                                            ', 1, CAST(0x004DE900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (58, 41, 141, NULL, 1036, N'                                            ', 1, CAST(0x004DE900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (59, 42, 141, NULL, 1037, N'                                            ', 1, CAST(0x0091E900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (60, 42, 141, NULL, 1037, N'                                            ', 1, CAST(0x0091E900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (61, 42, 141, NULL, 1037, N'                                            ', 1, CAST(0x0091E900973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (62, 43, 141, NULL, 1038, N'Fit                   ', 1, CAST(0x00372601973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (63, 44, 141, NULL, 1039, N'Fit                  ', 1, CAST(0x005B2701973C0B0000 AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[JobTalentSkills] ([JobTalentSkillsId], [ParentCategoryId], [SkillId], [JobId], [TalentId], [Description], [CreatedBy], [CreatedDate], [modifiedBy], [ModifiedDate], [IsDeleted]) VALUES (64, 45, 141, NULL, 1040, N'Fit', 1, CAST(0x00148C00993C0B0000 AS DateTime2), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[JobTalentSkills] OFF
/****** Object:  StoredProcedure [dbo].[usp_GetPublicTalent]    Script Date: 04/08/2017 13:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetPublicTalent]
@Category varchar(200) = '',
@SubCategory varchar(200) = '',
@isAdmin bit=0
AS
BEGIN
select ISNULL(T.FirstName,'') + ' ' + ISNULL(T.LastName, '') AS Name, T.TalentId, ISNULL(M.FilePath,'Images/blank-profile-picture.png') AS FilePath from Talent T WITH(NOLOCK) 
INNER JOIN 
JobTalentCategory JTC WITH(NOLOCK) ON JTC.TalentId = T.TalentId AND JTC.JobId IS NULL
INNER JOIN 
SubCategory SC WITH(NOLOCK) ON SC.SubCategoryId = JTC.CategoryId AND SC.ParentId IS NULL
INNER JOIN
JobTalentSkills JTS WITH(NOLOCK) ON JTS.ParentCategoryId = JTC.JobTalentCategoryId AND JTS.JobId IS NULL
INNER JOIN
SubCategory SC1 WITH(NOLOCK) ON SC1.SubCategoryId = JTS.SkillId AND SC1.ParentId IS NOT NULL
INNER JOIN Category C WITH(NOLOCK) ON C.CategoryId = SC.CategoryId AND C.CategoryId = SC1.CategoryId
LEFT JOIN
Media M WITH(NOLOCK) ON M.TalentId = T.TalentId AND M.JobId IS NULL AND M.MediaType = 'Image' AND IsProfilePic = 1
WHERE C.MasterCategoryName = 'CATEGORY' AND C.CategoryValue = 'Category' AND (T.IsPublic = 1 or @isAdmin=1)
AND
  (SC.SubCategoryValue = @Category) AND 
(@SubCategory = '' OR SC1.SubCategoryValue = @SubCategory)
AND T.IsDeleted = 0 AND JTC.IsDeleted = 0 AND SC.IsDeleted = 0 AND JTS.IsDeleted = 0 AND SC1.IsDeleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteProductionCompany]    Script Date: 04/08/2017 13:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_DeleteProductionCompany]
@ProductionCompanyId BIGINT,
@UserId BIGINT
AS
BEGIN
DECLARE @IsSuccess VARCHAR(10) = 'Fail'
DECLARE @TodayDate DATETIME2(0) = GETDATE()

  BEGIN TRY
    BEGIN TRANSACTION;
        UPDATE ProductionCompany SET IsDeleted = 1, ModifiedBy = @UserId, ModifiedDate = @TodayDate WHERE ProductionCompanyId = @ProductionCompanyId
		UPDATE Jobs SET IsDeleted = 1, ModifiedBy = @UserId, ModifiedDate = @TodayDate WHERE ProductionCompanyId = @ProductionCompanyId
    
		SELECT JobId INTO #DeleteJobs from Jobs WHERE ProductionCompanyId = @ProductionCompanyId
		
		IF EXISTS(SELECT TOP 1 1 FROM #DeleteJobs)
		BEGIN
			UPDATE JTC SET JTC.IsDeleted = 1, JTC.ModifiedBy = @UserId, JTC.ModifiedDate = @TodayDate FROM JobTalentCategory JTC
			INNER JOIN #DeleteJobs J ON J.JobId = JTC.JobId
     
			UPDATE JTL SET JTL.IsDeleted = 1, JTL.ModifiedBy = @UserId, JTL.ModifiedDate = @TodayDate FROM JobTalentLanguage JTL
			INNER JOIN #DeleteJobs J ON J.JobId = JTL.JobId
    
			UPDATE JTS SET JTS.IsDeleted = 1, JTS.ModifiedBy = @UserId, JTS.ModifiedDate = @TodayDate FROM JobTalentSkills JTS
			INNER JOIN #DeleteJobs J ON J.JobId = JTS.JobId
    
			UPDATE JTS SET JTS.IsDeleted = 1, JTS.ModifiedBy = @UserId, JTS.ModifiedDate = @TodayDate FROM JobTalentStatus JTS
			INNER JOIN #DeleteJobs J ON J.JobId = JTS.JobId
    
			UPDATE M SET M.IsDeleted = 1, M.ModifiedBy = @UserId, M.ModifiedDate = @TodayDate FROM Media M
			INNER JOIN #DeleteJobs J ON J.JobId = M.JobId 
		END
		
    COMMIT TRANSACTION;
  SET @IsSuccess = 'Success'
  END TRY
  BEGIN CATCH
  select @@TRANCOUNT
    IF @@TRANCOUNT > 0
    ROLLBACK TRANSACTION;
	SET @IsSuccess = 'Fail'
    EXEC Proc_InsertErrorDetails
  END CATCH
  
  SELECT @IsSuccess
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteJob]    Script Date: 04/08/2017 13:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_DeleteJob]
@JobId BIGINT,
@UserId BIGINT
AS
BEGIN
DECLARE @IsSuccess VARCHAR(10) = 'Fail'
DECLARE @TodayDate DATETIME2(0) = GETDATE()

  BEGIN TRY
    BEGIN TRANSACTION;
		UPDATE Jobs SET IsDeleted = 1, ModifiedBy = @UserId, ModifiedDate = @TodayDate WHERE JobId = @JobId
		
		UPDATE JobTalentAssociation SET IsDeleted = 1, ModifiedBy = @UserId, ModifiedDate = @TodayDate WHERE JobId = @JobId
		
			UPDATE JobTalentCategory SET IsDeleted = 1, ModifiedBy = @UserId, ModifiedDate = @TodayDate WHERE JobId = @JobId
     
			UPDATE JobTalentLanguage SET IsDeleted = 1, ModifiedBy = @UserId, ModifiedDate = @TodayDate WHERE JobId = @JobId
    
			UPDATE JobTalentSkills SET IsDeleted = 1, ModifiedBy = @UserId, ModifiedDate = @TodayDate WHERE JobId = @JobId
    
			UPDATE JobTalentStatus SET IsDeleted = 1, ModifiedBy = @UserId, ModifiedDate = @TodayDate WHERE JobId = @JobId
    
			UPDATE Media SET IsDeleted = 1, ModifiedBy = @UserId, ModifiedDate = @TodayDate WHERE JobId = @JobId
		
    COMMIT TRANSACTION;
  SET @IsSuccess = 'Success'
  END TRY
  BEGIN CATCH
  select @@TRANCOUNT
    IF @@TRANCOUNT > 0
    ROLLBACK TRANSACTION;
	SET @IsSuccess = 'Fail'
    EXEC Proc_InsertErrorDetails
  END CATCH
  
  SELECT @IsSuccess
END;
GO
/****** Object:  Default [DF__ErrorTrac__dErro__6E01572D]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[ErrorTracer] ADD  DEFAULT (getdate()) FOR [dErrorDate]
GO
/****** Object:  Default [DF_Jobs_IsDeleted]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[Jobs] ADD  CONSTRAINT [DF_Jobs_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_JobTalentAssociation_IsDeleted]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[JobTalentAssociation] ADD  CONSTRAINT [DF_JobTalentAssociation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_JobTalentCategory_IsDeleted]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[JobTalentCategory] ADD  CONSTRAINT [DF_JobTalentCategory_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_JobTalentLanguage_IsDeleted]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[JobTalentLanguage] ADD  CONSTRAINT [DF_JobTalentLanguage_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_JobTalentSkills_IsDeleted]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[JobTalentSkills] ADD  CONSTRAINT [DF_JobTalentSkills_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_Media_IsProfilePic]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[Media] ADD  CONSTRAINT [DF_Media_IsProfilePic]  DEFAULT ((0)) FOR [IsProfilePic]
GO
/****** Object:  Default [DF_Media_IsDeleted]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[Media] ADD  CONSTRAINT [DF_Media_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_ProductionCompany_IsDeleted]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[ProductionCompany] ADD  CONSTRAINT [DF_ProductionCompany_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_SubCategory_IsDeleted]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[SubCategory] ADD  CONSTRAINT [DF_SubCategory_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_Talent_ShowTalentOnWeb]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[Talent] ADD  CONSTRAINT [DF_Talent_ShowTalentOnWeb]  DEFAULT ((0)) FOR [IsPublic]
GO
/****** Object:  Default [DF_Talent_IsDeleted]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[Talent] ADD  CONSTRAINT [DF_Talent_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  ForeignKey [FK_Category_MasterCategory]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_MasterCategory] FOREIGN KEY([MasterCategoryName])
REFERENCES [dbo].[MasterCategory] ([MasterCategoryName])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_MasterCategory]
GO
/****** Object:  ForeignKey [FK_ContactUs_SubCategory]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[ContactUs]  WITH CHECK ADD  CONSTRAINT [FK_ContactUs_SubCategory] FOREIGN KEY([ContactStatus])
REFERENCES [dbo].[SubCategory] ([SubCategoryId])
GO
ALTER TABLE [dbo].[ContactUs] CHECK CONSTRAINT [FK_ContactUs_SubCategory]
GO
/****** Object:  ForeignKey [FK_Jobs_ProductionCompany]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_ProductionCompany] FOREIGN KEY([ProductionCompanyId])
REFERENCES [dbo].[ProductionCompany] ([ProductionCompanyId])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_ProductionCompany]
GO
/****** Object:  ForeignKey [FK_Jobs_Region]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Region] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Region] ([RegionId])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Region]
GO
/****** Object:  ForeignKey [FK_Jobs_SubCategory]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_SubCategory] FOREIGN KEY([StatusId])
REFERENCES [dbo].[SubCategory] ([SubCategoryId])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_SubCategory]
GO
/****** Object:  ForeignKey [FK_JobTalentAssociation_Jobs]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[JobTalentAssociation]  WITH CHECK ADD  CONSTRAINT [FK_JobTalentAssociation_Jobs] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([JobId])
GO
ALTER TABLE [dbo].[JobTalentAssociation] CHECK CONSTRAINT [FK_JobTalentAssociation_Jobs]
GO
/****** Object:  ForeignKey [FK_JobTalentAssociation_SubCategory]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[JobTalentAssociation]  WITH CHECK ADD  CONSTRAINT [FK_JobTalentAssociation_SubCategory] FOREIGN KEY([Status])
REFERENCES [dbo].[SubCategory] ([SubCategoryId])
GO
ALTER TABLE [dbo].[JobTalentAssociation] CHECK CONSTRAINT [FK_JobTalentAssociation_SubCategory]
GO
/****** Object:  ForeignKey [FK_JobTalentAssociation_Talent]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[JobTalentAssociation]  WITH CHECK ADD  CONSTRAINT [FK_JobTalentAssociation_Talent] FOREIGN KEY([TalentId])
REFERENCES [dbo].[Talent] ([TalentId])
GO
ALTER TABLE [dbo].[JobTalentAssociation] CHECK CONSTRAINT [FK_JobTalentAssociation_Talent]
GO
/****** Object:  ForeignKey [FK_JobTalentCategory_Jobs]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[JobTalentCategory]  WITH CHECK ADD  CONSTRAINT [FK_JobTalentCategory_Jobs] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([JobId])
GO
ALTER TABLE [dbo].[JobTalentCategory] CHECK CONSTRAINT [FK_JobTalentCategory_Jobs]
GO
/****** Object:  ForeignKey [FK_JobTalentCategory_SubCategory]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[JobTalentCategory]  WITH CHECK ADD  CONSTRAINT [FK_JobTalentCategory_SubCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[SubCategory] ([SubCategoryId])
GO
ALTER TABLE [dbo].[JobTalentCategory] CHECK CONSTRAINT [FK_JobTalentCategory_SubCategory]
GO
/****** Object:  ForeignKey [FK_JobTalentCategory_Talent]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[JobTalentCategory]  WITH CHECK ADD  CONSTRAINT [FK_JobTalentCategory_Talent] FOREIGN KEY([TalentId])
REFERENCES [dbo].[Talent] ([TalentId])
GO
ALTER TABLE [dbo].[JobTalentCategory] CHECK CONSTRAINT [FK_JobTalentCategory_Talent]
GO
/****** Object:  ForeignKey [FK_JobTalentLanguage_Jobs]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[JobTalentLanguage]  WITH CHECK ADD  CONSTRAINT [FK_JobTalentLanguage_Jobs] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([JobId])
GO
ALTER TABLE [dbo].[JobTalentLanguage] CHECK CONSTRAINT [FK_JobTalentLanguage_Jobs]
GO
/****** Object:  ForeignKey [FK_JobTalentLanguage_SubCategory]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[JobTalentLanguage]  WITH CHECK ADD  CONSTRAINT [FK_JobTalentLanguage_SubCategory] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[SubCategory] ([SubCategoryId])
GO
ALTER TABLE [dbo].[JobTalentLanguage] CHECK CONSTRAINT [FK_JobTalentLanguage_SubCategory]
GO
/****** Object:  ForeignKey [FK_JobTalentLanguage_Talent]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[JobTalentLanguage]  WITH CHECK ADD  CONSTRAINT [FK_JobTalentLanguage_Talent] FOREIGN KEY([TalentId])
REFERENCES [dbo].[Talent] ([TalentId])
GO
ALTER TABLE [dbo].[JobTalentLanguage] CHECK CONSTRAINT [FK_JobTalentLanguage_Talent]
GO
/****** Object:  ForeignKey [FK_JobTalentSkills_Jobs]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[JobTalentSkills]  WITH CHECK ADD  CONSTRAINT [FK_JobTalentSkills_Jobs] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([JobId])
GO
ALTER TABLE [dbo].[JobTalentSkills] CHECK CONSTRAINT [FK_JobTalentSkills_Jobs]
GO
/****** Object:  ForeignKey [FK_JobTalentSkills_JobTalentCategory]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[JobTalentSkills]  WITH CHECK ADD  CONSTRAINT [FK_JobTalentSkills_JobTalentCategory] FOREIGN KEY([ParentCategoryId])
REFERENCES [dbo].[JobTalentCategory] ([JobTalentCategoryId])
GO
ALTER TABLE [dbo].[JobTalentSkills] CHECK CONSTRAINT [FK_JobTalentSkills_JobTalentCategory]
GO
/****** Object:  ForeignKey [FK_JobTalentSkills_SubCategory]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[JobTalentSkills]  WITH CHECK ADD  CONSTRAINT [FK_JobTalentSkills_SubCategory] FOREIGN KEY([SkillId])
REFERENCES [dbo].[SubCategory] ([SubCategoryId])
GO
ALTER TABLE [dbo].[JobTalentSkills] CHECK CONSTRAINT [FK_JobTalentSkills_SubCategory]
GO
/****** Object:  ForeignKey [FK_JobTalentSkills_Talent]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[JobTalentSkills]  WITH CHECK ADD  CONSTRAINT [FK_JobTalentSkills_Talent] FOREIGN KEY([TalentId])
REFERENCES [dbo].[Talent] ([TalentId])
GO
ALTER TABLE [dbo].[JobTalentSkills] CHECK CONSTRAINT [FK_JobTalentSkills_Talent]
GO
/****** Object:  ForeignKey [FK_Media_Jobs]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[Media]  WITH CHECK ADD  CONSTRAINT [FK_Media_Jobs] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([JobId])
GO
ALTER TABLE [dbo].[Media] CHECK CONSTRAINT [FK_Media_Jobs]
GO
/****** Object:  ForeignKey [FK_Media_Talent]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[Media]  WITH CHECK ADD  CONSTRAINT [FK_Media_Talent] FOREIGN KEY([TalentId])
REFERENCES [dbo].[Talent] ([TalentId])
GO
ALTER TABLE [dbo].[Media] CHECK CONSTRAINT [FK_Media_Talent]
GO
/****** Object:  ForeignKey [FK_ProductionCompany_Region]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[ProductionCompany]  WITH CHECK ADD  CONSTRAINT [FK_ProductionCompany_Region] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Region] ([RegionId])
GO
ALTER TABLE [dbo].[ProductionCompany] CHECK CONSTRAINT [FK_ProductionCompany_Region]
GO
/****** Object:  ForeignKey [FK_SubCategory_Category]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
/****** Object:  ForeignKey [FK_Talent_Region]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[Talent]  WITH CHECK ADD  CONSTRAINT [FK_Talent_Region] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Region] ([RegionId])
GO
ALTER TABLE [dbo].[Talent] CHECK CONSTRAINT [FK_Talent_Region]
GO
/****** Object:  ForeignKey [FK_Talent_SubCategory]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[Talent]  WITH CHECK ADD  CONSTRAINT [FK_Talent_SubCategory] FOREIGN KEY([Acsent])
REFERENCES [dbo].[SubCategory] ([SubCategoryId])
GO
ALTER TABLE [dbo].[Talent] CHECK CONSTRAINT [FK_Talent_SubCategory]
GO
/****** Object:  ForeignKey [FK_Talent_SubCategory1]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[Talent]  WITH CHECK ADD  CONSTRAINT [FK_Talent_SubCategory1] FOREIGN KEY([StatusId])
REFERENCES [dbo].[SubCategory] ([SubCategoryId])
GO
ALTER TABLE [dbo].[Talent] CHECK CONSTRAINT [FK_Talent_SubCategory1]
GO
/****** Object:  ForeignKey [FK_Tokens_User]    Script Date: 04/08/2017 13:16:16 ******/
ALTER TABLE [dbo].[Tokens]  WITH CHECK ADD  CONSTRAINT [FK_Tokens_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Tokens] CHECK CONSTRAINT [FK_Tokens_User]
GO
