USE [JobsInABA]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Abbreviation] [nvarchar](10) NULL,
	[Code] [varchar](10) NULL,
	[PhoneCode] [varchar](10) NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON
INSERT [dbo].[Countries] ([CountryID], [Name], [Abbreviation], [Code], [PhoneCode]) VALUES (1, N'United States', N'USA', N'USA', N'1')
SET IDENTITY_INSERT [dbo].[Countries] OFF
/****** Object:  Table [dbo].[ClassTypes]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClassTypes](
	[ClassTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Description] [varchar](200) NULL,
 CONSTRAINT [PK_ClassTypes] PRIMARY KEY CLUSTERED 
(
	[ClassTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_ClassTypes_Code] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_ClassTypes_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ClassTypes] ON
INSERT [dbo].[ClassTypes] ([ClassTypeID], [Name], [Code], [Description]) VALUES (1, N'AddressTypes', N'AT', N'Type of Address, e.g. Home, Office, Work, etc.')
INSERT [dbo].[ClassTypes] ([ClassTypeID], [Name], [Code], [Description]) VALUES (2, N'BusinessType', N'BT', N'Type of Business')
INSERT [dbo].[ClassTypes] ([ClassTypeID], [Name], [Code], [Description]) VALUES (3, N'JobType', N'JT', N'Types of JobApplication')
SET IDENTITY_INSERT [dbo].[ClassTypes] OFF
/****** Object:  Table [dbo].[Roles]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Precedence] [int] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_Role_Name_Precedence] UNIQUE NONCLUSTERED 
(
	[Name] ASC,
	[Precedence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON
INSERT [dbo].[Roles] ([RoleID], [Name], [Precedence]) VALUES (2, N'CompanyOwner', 2)
INSERT [dbo].[Roles] ([RoleID], [Name], [Precedence]) VALUES (1, N'User', 1)
SET IDENTITY_INSERT [dbo].[Roles] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[MiddleName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[DOB] [date] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[insuser] [int] NULL,
	[insdt] [datetime] NULL,
	[upduser] [int] NULL,
	[upddt] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_Users_FirstName_MiddleName_LastName_DOB_IsDeleted] UNIQUE NONCLUSTERED 
(
	[FirstName] ASC,
	[MiddleName] ASC,
	[LastName] ASC,
	[DOB] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (3, N'Admin', N'FirstName1', N'M1', N'LastName1', CAST(0xFF340B00 AS Date), 1, 0, 4, CAST(0x0000A55900000000 AS DateTime), 4, CAST(0x0000A55900000000 AS DateTime), NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (4, N'Admin2', N'FirstName2', N'M', N'LastName2', CAST(0x4E250B00 AS Date), 1, 0, 3, CAST(0x0000A55900000000 AS DateTime), 3, CAST(0x0000A55900000000 AS DateTime), NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (5, N'Mr.Abc', N'FirstName3', N'M2', N'LastName3', CAST(0x07350B00 AS Date), 1, 0, 3, CAST(0x0000A5590183B8C1 AS DateTime), 3, CAST(0x0000A5590183B8C2 AS DateTime), NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (6, N'Testing UserName', N'FirstName4', N'M3', N'LastName4', CAST(0x07350B00 AS Date), 1, 0, 3, CAST(0x0000A573011704A3 AS DateTime), 3, CAST(0x0000A573011704A4 AS DateTime), NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (9, N'Testing UserName', N'FirstName5', N'M4', N'LastName5', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (10, N'Testing UserName2', N'FirstName6', N'M5', N'LastName6', NULL, 1, 0, NULL, CAST(0x0000A5AB00F52039 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (11, N'test username', N'FirstName7', N'M6', N'LastName7', NULL, 1, 0, NULL, CAST(0x0000A5AB00F74CC4 AS DateTime), NULL, CAST(0x0000A5AD00A629ED AS DateTime), NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (14, N'Testing UserName4', N'FirstName11', N'M7', N'LastName8', NULL, 1, 0, NULL, CAST(0x0000A5AB00FBDAF9 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (15, N'Testing UserNam6', N'FirstName12', N'M8', N'LastName11', NULL, 1, 0, NULL, CAST(0x0000A5AB00FF3A4C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (17, N'hardikMandanka', N'Hardik', N'P', N'Mandanka', NULL, 1, 0, NULL, CAST(0x0000A5AC010F121D AS DateTime), NULL, CAST(0x0000A5B300C759B8 AS DateTime), N'The IP Code, International Protection Marking, IEC standard 60529, frequently incorrectly interpreted as Ingress Protection Marking, classifies and rates the degree of protection provided against intrusion (body parts such as hands and fingers), dust, accidental contact, and water by mechanical casings and electrical enclosures. It is published by the International Electrotechnical Commission (IEC).

The standard aims to provide users more detailed information than vague marketing terms such as waterproof. The digits (characteristic numerals) indicate conformity with the conditions summarized in the tables below. Where there is no data available to specify a protection rating with regard to one of the criteria, the digit is replaced with the letter X. The digit 0 is used where no protection is provided.')
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (18, N'TestUser1', N'FirstName21', N'M23', N'LastName232', NULL, 1, 0, NULL, CAST(0x0000A5AD00B1CA85 AS DateTime), NULL, CAST(0x0000A5AD00B236A4 AS DateTime), NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (19, NULL, N'MR.Krunal', N'H', N'Vaghasiya', NULL, 1, 0, NULL, CAST(0x0000A5AF01154011 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (24, NULL, N'Bhushan Jogi', N'S', N'Abs', NULL, 1, 0, NULL, CAST(0x0000A5AF0123E62C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (25, NULL, N'Mr.Abas', N'asdf1', N'sf11', NULL, 1, 1, NULL, CAST(0x0000A5AF01319C71 AS DateTime), NULL, CAST(0x0000A5B000FE76C1 AS DateTime), NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (27, N'asdf', N'safdas', N'123123', N'asdf', NULL, 1, 0, NULL, CAST(0x0000A5B000BB6F7F AS DateTime), NULL, CAST(0x0000A5B000BB786F AS DateTime), NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (31, NULL, N'ewasdfsa', N'dfa', N'asdf', NULL, 1, 1, NULL, CAST(0x0000A5B000FEB2A5 AS DateTime), NULL, CAST(0x0000A5B000FED9FB AS DateTime), NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (33, NULL, N'Mr.w', N'ks', N'sas', NULL, 1, 0, NULL, CAST(0x0000A5B0011B711E AS DateTime), NULL, CAST(0x0000A5B0011B87E0 AS DateTime), NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (34, N'hdk', N'Hardik', N'PP', N'Mandanka', NULL, 1, 0, NULL, CAST(0x0000A5B001359578 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (35, NULL, N'sdf', N'asdfasd', N'fasdfasf', NULL, 1, 0, NULL, CAST(0x0000A5B001388FD5 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (40, NULL, N'asdf123', N'asdf123123', N'asdf123', NULL, 1, 1, NULL, CAST(0x0000A5B200D9CD2D AS DateTime), NULL, CAST(0x0000A5B200F3EAE7 AS DateTime), NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (41, NULL, N'Test', N'M', N'Microsoft', NULL, 1, 0, NULL, CAST(0x0000A5B200F43A3A AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (42, NULL, N'Test', N'p', N'Microsoft - 2', NULL, 1, 0, NULL, CAST(0x0000A5B200F45E76 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [FirstName], [MiddleName], [LastName], [DOB], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt], [Description]) VALUES (44, N'NewTestUser', N'Test Hardik', N'p', N'Mandanka', NULL, 1, 0, NULL, CAST(0x0000A5B20125C9B9 AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[UserRoles]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserRoles] ON
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (1, 10, 1)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (2, 11, 1)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (3, 14, 1)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (4, 15, 1)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (5, 17, 1)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (6, 18, 1)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (7, 27, 1)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (8, 34, 1)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (10, 44, 1)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
/****** Object:  Table [dbo].[UserAccounts]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAccounts](
	[UserAccountID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [varbinary](250) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[insuser] [int] NULL,
	[insdt] [datetime] NULL,
	[upduser] [int] NULL,
	[upddt] [datetime] NULL,
 CONSTRAINT [PK_UserAccounts] PRIMARY KEY CLUSTERED 
(
	[UserAccountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_UserAccount_UserName_Password_IsDeleted] UNIQUE NONCLUSTERED 
(
	[UserName] ASC,
	[Password] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[UserAccounts] ON
INSERT [dbo].[UserAccounts] ([UserAccountID], [UserID], [UserName], [Password], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (1, 10, N'dasdas', 0x313233313233, 1, 0, NULL, CAST(0x0000A5AB00F5374F AS DateTime), NULL, NULL)
INSERT [dbo].[UserAccounts] ([UserAccountID], [UserID], [UserName], [Password], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (2, 11, N'test username', 0x313233313233, 1, 0, NULL, CAST(0x0000A5AB00F74CD1 AS DateTime), NULL, NULL)
INSERT [dbo].[UserAccounts] ([UserAccountID], [UserID], [UserName], [Password], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (5, 14, N'ewr', 0x313233313233, 1, 0, NULL, CAST(0x0000A5AB00FBDD86 AS DateTime), NULL, NULL)
INSERT [dbo].[UserAccounts] ([UserAccountID], [UserID], [UserName], [Password], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (6, 15, N'asdgh', 0x313233313233, 1, 0, NULL, CAST(0x0000A5AB00FF3A59 AS DateTime), NULL, NULL)
INSERT [dbo].[UserAccounts] ([UserAccountID], [UserID], [UserName], [Password], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (7, 17, N'hardikMandanka', 0x313233313233, 1, 0, NULL, CAST(0x0000A5AC010F1237 AS DateTime), NULL, NULL)
INSERT [dbo].[UserAccounts] ([UserAccountID], [UserID], [UserName], [Password], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (8, 18, N'TestUser1', 0x313233313233, 1, 0, NULL, CAST(0x0000A5AD00B1CAAB AS DateTime), NULL, NULL)
INSERT [dbo].[UserAccounts] ([UserAccountID], [UserID], [UserName], [Password], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (9, 27, N'asdf', 0x313233313233, 1, 0, NULL, CAST(0x0000A5B000BB6F92 AS DateTime), NULL, NULL)
INSERT [dbo].[UserAccounts] ([UserAccountID], [UserID], [UserName], [Password], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (10, 34, N'hdk', 0x313233313233, 1, 0, NULL, CAST(0x0000A5B00135959C AS DateTime), NULL, NULL)
INSERT [dbo].[UserAccounts] ([UserAccountID], [UserID], [UserName], [Password], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (12, 44, N'NewTestUser', 0x313233313233, 1, 0, NULL, CAST(0x0000A5B20125C9C1 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserAccounts] OFF
/****** Object:  Table [dbo].[TypeCodes]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TypeCodes](
	[TypeCodeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Description] [varchar](200) NULL,
	[ClassTypeID] [int] NOT NULL,
	[ParentTypeCodeID] [int] NULL,
 CONSTRAINT [PK_TypeCodes] PRIMARY KEY CLUSTERED 
(
	[TypeCodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_TypeCodes_ClassTypeID_Code] UNIQUE NONCLUSTERED 
(
	[ClassTypeID] ASC,
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TypeCodes] ON
INSERT [dbo].[TypeCodes] ([TypeCodeID], [Name], [Code], [Description], [ClassTypeID], [ParentTypeCodeID]) VALUES (1, N'Home', N'home', N'Home Address', 1, NULL)
INSERT [dbo].[TypeCodes] ([TypeCodeID], [Name], [Code], [Description], [ClassTypeID], [ParentTypeCodeID]) VALUES (2, N'Work', N'work', N'Work Address', 1, NULL)
INSERT [dbo].[TypeCodes] ([TypeCodeID], [Name], [Code], [Description], [ClassTypeID], [ParentTypeCodeID]) VALUES (3, N'BusinessType', N'Business', N'Business profile', 2, NULL)
INSERT [dbo].[TypeCodes] ([TypeCodeID], [Name], [Code], [Description], [ClassTypeID], [ParentTypeCodeID]) VALUES (4, N'JobType', N'JobActive', N'Job is Active', 3, NULL)
SET IDENTITY_INSERT [dbo].[TypeCodes] OFF
/****** Object:  Table [dbo].[Skills]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[SkillID] [int] IDENTITY(1,1) NOT NULL,
	[Skill] [nvarchar](max) NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Skills] PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Skills] ON
INSERT [dbo].[Skills] ([SkillID], [Skill], [UserID]) VALUES (1, N'.net', 17)
INSERT [dbo].[Skills] ([SkillID], [Skill], [UserID]) VALUES (2, N'Java', 17)
SET IDENTITY_INSERT [dbo].[Skills] OFF
/****** Object:  Table [dbo].[Languages]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[LanguageName] [nvarchar](50) NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Languages] ON
INSERT [dbo].[Languages] ([LanguageID], [LanguageName], [UserID]) VALUES (1, N'Gujarati', 17)
INSERT [dbo].[Languages] ([LanguageID], [LanguageName], [UserID]) VALUES (2, N'english', 17)
SET IDENTITY_INSERT [dbo].[Languages] OFF
/****** Object:  Table [dbo].[Educations]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Educations](
	[EducationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[InstituteName] [nvarchar](100) NOT NULL,
	[Degree] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_Educations] PRIMARY KEY CLUSTERED 
(
	[EducationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Educations] ON
INSERT [dbo].[Educations] ([EducationID], [UserID], [InstituteName], [Degree], [Description], [StartDate], [EndDate], [IsActive], [IsDelete]) VALUES (1, 17, N'SVMIT', N'IT', NULL, CAST(0x0000A5A900000000 AS DateTime), CAST(0x0000A5BB00000000 AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[Educations] OFF
/****** Object:  Table [dbo].[Address]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Line1] [nvarchar](100) NULL,
	[Line2] [nvarchar](100) NULL,
	[Line3] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[State] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[CountryID] [int] NULL,
	[AddressTypeID] [int] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (1, N'Jai Shree Ram', N'1222 Broadway St', N'Ste 220', N'', N'Los Angeles', N'CA', N'91015', 1, 1)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (2, NULL, NULL, NULL, NULL, N'safasd', N'fasdf', N'123123', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (3, NULL, NULL, NULL, NULL, N'surat', N'Gujarat', N'395006', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (4, NULL, N'afasdfsfd asnf snadjf', NULL, NULL, N'sadfkjn', N'ksfgdjksnk', N'1231', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (5, NULL, N'ashdhf', NULL, NULL, N'adasd', N'65asuidh', N'7876', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (6, NULL, N'Swminarayan', NULL, NULL, N'Surat-1', N'Gujarat-1', N'395006', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (7, NULL, N'surat', NULL, NULL, N'Surat', N'Gujarat', N'395006', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (8, NULL, N'Swaminarayan nagar-2', NULL, NULL, N'Surat', N'Gujarat', N'395006', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (9, NULL, N'asda', NULL, NULL, N'asd', N'asd', N'123132', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (10, NULL, N'asdadasd', NULL, NULL, N'qwe', N'qweqw', N'adas', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (11, NULL, N'dfgbdfg', NULL, NULL, N'sfdgasdaasda', N'sdfg', N'sdfgsd', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (12, NULL, N'dfgbdfg', NULL, NULL, N'sfdg', N'sdfg', N'sdfgsd', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (13, NULL, N'dfgbdfg', NULL, NULL, N'sfdg', N'sdfg', N'sdfgsd', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (14, NULL, N'dfgbdfg', NULL, NULL, N'sfdg', N'sdfg', N'sdfgsd', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (15, NULL, N'dfgbdfg', NULL, NULL, N'sfdg', N'sdfg', N'sdfgsd', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (16, NULL, N'dfgbdfg', NULL, NULL, N'sfdg', N'sdfg', N'dsadqdasd', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (17, NULL, N'dfgbdfg', NULL, NULL, N'sfdg', N'sdfg', N'sdfgsd', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (18, NULL, N'dfgbdfg', NULL, NULL, N'sfdg', N'sdfg', N'sdfgsd', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (19, NULL, N'ADAFAWFAAF', NULL, NULL, N'SAFSF', N'ASDFSA', N'DFSAF', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (21, NULL, NULL, NULL, NULL, NULL, N'Surat', NULL, NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (22, NULL, NULL, NULL, NULL, NULL, N'suratas', NULL, NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (23, NULL, N'add1 check', N'add2 checkl', NULL, N'srar', N'asdfasdf', N'234234', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (24, NULL, N'sdfsdfd', NULL, NULL, N'dfsdf', N'sdfsdf', N'sdf', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (25, NULL, N'xzfzs', NULL, NULL, N'asdasd', N'fasdfsdf', N'sdgdf', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (26, NULL, NULL, NULL, NULL, NULL, N'asdf', NULL, NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (28, NULL, NULL, NULL, NULL, NULL, N'surat', NULL, NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (33, NULL, N'asd', N'asdasd', NULL, N'asd', N'asd', N'adasd', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (34, NULL, N'add123', NULL, NULL, N'city-123', N'state-123', N'zip-123', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (35, NULL, N'surar', NULL, NULL, N'surata', N'gujarat', N'123123', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (36, NULL, NULL, NULL, NULL, NULL, N'asfasdf', NULL, NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (37, NULL, N'asfa sdfawf as', N'asdf a sf saf', NULL, N'safdas fasf', N'asfd asfd', N'243323', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (38, NULL, N'asdasd', N'adsad', NULL, N'asd', N'adad', N'adadasd', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (39, NULL, NULL, NULL, NULL, NULL, N'asfd', NULL, NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (41, NULL, NULL, NULL, NULL, NULL, N'Developer', NULL, NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (42, NULL, NULL, NULL, NULL, NULL, N'Surat', NULL, NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (43, NULL, N'Microsoft Redmond Campus', N'Redmond', NULL, N'Washington', N'USA', N'21022', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (46, NULL, N'asdsd', N'asdad', NULL, N'Surat', N'Gujarat', N'395006', NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [Title], [Line1], [Line2], [Line3], [City], [State], [ZipCode], [CountryID], [AddressTypeID]) VALUES (48, NULL, N'A-6,Swaminarayan-2, Sarthana Jakatnaka,', NULL, NULL, N'Surat', N'Gujarat', N'395006', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Address] OFF
/****** Object:  Table [dbo].[Businesses]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Businesses](
	[BusinessID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Abbreviation] [nvarchar](10) NULL,
	[StartDate] [date] NULL,
	[Description] [nvarchar](max) NULL,
	[BusinessTypeID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[insuser] [int] NULL,
	[insdt] [datetime] NULL,
	[upduser] [int] NULL,
	[upddt] [datetime] NULL,
 CONSTRAINT [PK_Business] PRIMARY KEY CLUSTERED 
(
	[BusinessID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Businesses] ON
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Abbreviation], [StartDate], [Description], [BusinessTypeID], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (6, N'ABAServiceProvider1', N'ABA1', CAST(0x073B0B00 AS Date), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris convallis sodales velit in interdum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam ligula quam, consequat blandit iaculis sit amet, sagittis at tortor. Donec eleifend posuere nibh ornare lobortis. Duis hendrerit mi vel eros scelerisque, quis bibendum libero sodales. Donec rutrum dui tempus odio imperdiet tincidunt. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec tincidunt, augue a mattis faucibus, eros tellus condimentum nulla, at bibendum nibh nisl sit amet mi. Nullam ultricies faucibus justo non imperdiet. Morbi consequat ac elit condimentum dictum. Pellentesque pulvinar efficitur nulla, sed pharetra eros euismod at. Morbi cursus non diam congue bibendum.', 3, 1, 0, NULL, NULL, NULL, CAST(0x0000A5AC0122C8E7 AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Abbreviation], [StartDate], [Description], [BusinessTypeID], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (7, N'Microsoft Corporation', N'ABA2', CAST(0x80360B00 AS Date), N'Microsoft was founded by Paul Allen and Bill Gates on April 4, 1975, to develop and sell BASIC interpreters for Altair 8800. It rose to dominate the personal computer operating system market with MS-DOS in the mid-1980s, followed by Microsoft Windows. The company''s 1986 initial public offering, and subsequent rise in its share price, created three billionaires and an estimated 12,000 millionaires among Microsoft employees. Since the 1990s, it has increasingly diversified from the operating system market and has made a number of corporate acquisitions. In May 2011, Microsoft acquired Skype Technologies for $8.5 billion in its largest acquisition to date.[9]', 3, 1, 0, NULL, NULL, NULL, CAST(0x0000A5B200F3DCB9 AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Abbreviation], [StartDate], [Description], [BusinessTypeID], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (8, N'ABAServiceProvider3', N'ABA3', CAST(0x00000000 AS Date), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris convallis sodales velit in interdum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam ligula quam, consequat blandit iaculis sit amet, sagittis at tortor. Donec eleifend posuere nibh ornare lobortis. Duis hendrerit mi vel eros scelerisque, quis bibendum libero sodales. Donec rutrum dui tempus odio imperdiet tincidunt. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec tincidunt, augue a mattis faucibus, eros tellus condimentum nulla, at bibendum nibh nisl sit amet mi. Nullam ultricies faucibus justo non imperdiet. Morbi consequat ac elit condimentum dictum. Pellentesque pulvinar efficitur nulla, sed pharetra eros euismod at. Morbi cursus non diam congue bibendum.', 3, 1, 0, NULL, NULL, NULL, CAST(0x0000A5AD01131AD1 AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Abbreviation], [StartDate], [Description], [BusinessTypeID], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (9, N'ABAServiceProvider4', N'ABA4', CAST(0x00000000 AS Date), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris convallis sodales velit in interdum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam ligula quam, consequat blandit iaculis sit amet, sagittis at tortor. Donec eleifend posuere nibh ornare lobortis. Duis hendrerit mi vel eros scelerisque, quis bibendum libero sodales. Donec rutrum dui tempus odio imperdiet tincidunt. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec tincidunt, augue a mattis faucibus, eros tellus condimentum nulla, at bibendum nibh nisl sit amet mi. Nullam ultricies faucibus justo non imperdiet. Morbi consequat ac elit condimentum dictum. Pellentesque pulvinar efficitur nulla, sed pharetra eros euismod at. Morbi cursus non diam congue bibendum.asd', 3, 1, 0, NULL, NULL, NULL, CAST(0x0000A5B0011EB38B AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Abbreviation], [StartDate], [Description], [BusinessTypeID], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (10, N'ABAServiceProvider5', N'ABA5', CAST(0x00000000 AS Date), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris convallis sodales velit in interdum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam ligula quam, consequat blandit iaculis sit amet, sagittis at tortor. Donec eleifend posuere nibh ornare lobortis. Duis hendrerit mi vel eros scelerisque, quis bibendum libero sodales. Donec rutrum dui tempus odio imperdiet tincidunt. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec tincidunt, augue a mattis faucibus, eros tellus condimentum nulla, at bibendum nibh nisl sit amet mi. Nullam ultricies faucibus justo non imperdiet. Morbi consequat ac elit condimentum dictum. Pellentesque pulvinar efficitur nulla, sed pharetra eros euismod at. Morbi cursus non diam congue bibendum.', 3, 1, 0, NULL, NULL, NULL, CAST(0x0000A5AD0119AD51 AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Abbreviation], [StartDate], [Description], [BusinessTypeID], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (11, N'ABAServiceProvider6', N'ABA6', CAST(0x00000000 AS Date), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris convallis sodales velit in interdum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam ligula quam, consequat blandit iaculis sit amet, sagittis at tortor. Donec eleifend posuere nibh ornare lobortis. Duis hendrerit mi vel eros scelerisque, quis bibendum libero sodales. Donec rutrum dui tempus odio imperdiet tincidunt. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec tincidunt, augue a mattis faucibus, eros tellus condimentum nulla, at bibendum nibh nisl sit amet mi. Nullam ultricies faucibus justo non imperdiet. Morbi consequat ac elit condimentum dictum. Pellentesque pulvinar efficitur nulla, sed pharetra eros euismod at. Morbi cursus non diam congue bibendum.', 3, 1, 0, NULL, NULL, NULL, CAST(0x0000A5AD0119A91B AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Abbreviation], [StartDate], [Description], [BusinessTypeID], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (12, N'ABAServiceProvider7', N'ABA7', CAST(0x00000000 AS Date), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris convallis sodales velit in interdum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam ligula quam, consequat blandit iaculis sit amet, sagittis at tortor. Donec eleifend posuere nibh ornare lobortis. Duis hendrerit mi vel eros scelerisque, quis bibendum libero sodales. Donec rutrum dui tempus odio imperdiet tincidunt. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec tincidunt, augue a mattis faucibus, eros tellus condimentum nulla, at bibendum nibh nisl sit amet mi. Nullam ultricies faucibus justo non imperdiet. Morbi consequat ac elit condimentum dictum. Pellentesque pulvinar efficitur nulla, sed pharetra eros euismod at. Morbi cursus non diam congue bibendum.', 3, 1, 0, NULL, NULL, NULL, CAST(0x0000A5AD0119A089 AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Abbreviation], [StartDate], [Description], [BusinessTypeID], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (13, N'ABAServiceProvider8', N'ABA8', CAST(0x00000000 AS Date), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris convallis sodales velit in interdum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam ligula quam, consequat blandit iaculis sit amet, sagittis at tortor. Donec eleifend posuere nibh ornare lobortis. Duis hendrerit mi vel eros scelerisque, quis bibendum libero sodales. Donec rutrum dui tempus odio imperdiet tincidunt. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec tincidunt, augue a mattis faucibus, eros tellus condimentum nulla, at bibendum nibh nisl sit amet mi. Nullam ultricies faucibus justo non imperdiet. Morbi consequat ac elit condimentum dictum. Pellentesque pulvinar efficitur nulla, sed pharetra eros euismod at. Morbi cursus non diam congue bibendum.', 3, 1, 0, NULL, NULL, NULL, CAST(0x0000A5AD0119A475 AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Abbreviation], [StartDate], [Description], [BusinessTypeID], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (14, N'ABAServiceProvider9', N'ABA9', CAST(0x00000000 AS Date), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris convallis sodales velit in interdum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam ligula quam, consequat blandit iaculis sit amet, sagittis at tortor. Donec eleifend posuere nibh ornare lobortis. Duis hendrerit mi vel eros scelerisque, quis bibendum libero sodales. Donec rutrum dui tempus odio imperdiet tincidunt. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec tincidunt, augue a mattis faucibus, eros tellus condimentum nulla, at bibendum nibh nisl sit amet mi. Nullam ultricies faucibus justo non imperdiet. Morbi consequat ac elit condimentum dictum. Pellentesque pulvinar efficitur nulla, sed pharetra eros euismod at. Morbi cursus non diam congue bibendum.', 3, 1, 0, NULL, NULL, NULL, CAST(0x0000A5AD0119CDD5 AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Abbreviation], [StartDate], [Description], [BusinessTypeID], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (15, N'ABAServiceProvider11', N'ABA11', CAST(0x00000000 AS Date), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris convallis sodales velit in interdum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam ligula quam, consequat blandit iaculis sit amet, sagittis at tortor. Donec eleifend posuere nibh ornare lobortis. Duis hendrerit mi vel eros scelerisque, quis bibendum libero sodales. Donec rutrum dui tempus odio imperdiet tincidunt. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec tincidunt, augue a mattis faucibus, eros tellus condimentum nulla, at bibendum nibh nisl sit amet mi. Nullam ultricies faucibus justo non imperdiet. Morbi consequat ac elit condimentum dictum. Pellentesque pulvinar efficitur nulla, sed pharetra eros euismod at. Morbi cursus non diam congue bibendum.', 3, 1, 0, NULL, NULL, NULL, CAST(0x0000A5AD0119F052 AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Abbreviation], [StartDate], [Description], [BusinessTypeID], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (16, N'ABAServiceProvider12', N'ABA12', CAST(0x00000000 AS Date), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris convallis sodales velit in interdum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam ligula quam, consequat blandit iaculis sit amet, sagittis at tortor. Donec eleifend posuere nibh ornare lobortis. Duis hendrerit mi vel eros scelerisque, quis bibendum libero sodales. Donec rutrum dui tempus odio imperdiet tincidunt. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec tincidunt, augue a mattis faucibus, eros tellus condimentum nulla, at bibendum nibh nisl sit amet mi. Nullam ultricies faucibus justo non imperdiet. Morbi consequat ac elit condimentum dictum. Pellentesque pulvinar efficitur nulla, sed pharetra eros euismod at. Morbi cursus non diam congue bibendum.', 3, 1, 0, NULL, NULL, NULL, CAST(0x0000A5AD0119F4D1 AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Abbreviation], [StartDate], [Description], [BusinessTypeID], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (17, N'ABAServiceProvider23', N'ABA13', CAST(0x80360B00 AS Date), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris convallis sodales velit in interdum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam ligula quam, consequat blandit iaculis sit amet, sagittis at tortor. Donec eleifend posuere nibh ornare lobortis. Duis hendrerit mi vel eros scelerisque, quis bibendum libero sodales. Donec rutrum dui tempus odio imperdiet tincidunt. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec tincidunt, augue a mattis faucibus, eros tellus condimentum nulla, at bibendum nibh nisl sit amet mi. Nullam ultricies faucibus justo non imperdiet. Morbi consequat ac elit condimentum dictum. Pellentesque pulvinar efficitur nulla, sed pharetra eros euismod at. Morbi cursus non diam congue bibendum.', 3, 1, 0, NULL, NULL, NULL, CAST(0x0000A5AD011D54E0 AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Abbreviation], [StartDate], [Description], [BusinessTypeID], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (18, N'dfsf', N'sf', CAST(0x00000000 AS Date), N'dsfsdf', 3, 1, 0, NULL, NULL, NULL, CAST(0x0000A5B000B9194A AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Abbreviation], [StartDate], [Description], [BusinessTypeID], [IsActive], [IsDeleted], [insuser], [insdt], [upduser], [upddt]) VALUES (19, N'this is new user company', N'NWUS', CAST(0x00000000 AS Date), N'Hi everybody. The new caching feature is great, but I''m facing an issue and can''t believe Ionic Team hadn''t thought about a solution for this, I''m quite sure I''m missing something. The problem is:

I have a view with a list of records.
Tapping on the record will bring me to a different page where the user can edit the record. Once finish editing, the user taps a button and comes back to the view with the list of records.

But the view with the list of records is cached! So in the records list the user still sees the record title before he edited it!

How can I tell Ionic something like: hey man, the user who is visiting events.list state is coming from the events.event.edit state --> clean the cache of the events.list!

Thanks', 3, 1, 0, NULL, NULL, NULL, CAST(0x0000A5B00135F538 AS DateTime))
SET IDENTITY_INSERT [dbo].[Businesses] OFF
/****** Object:  Table [dbo].[Emails]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emails](
	[EmailID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[EmailTypeID] [int] NULL,
 CONSTRAINT [PK_Emails] PRIMARY KEY CLUSTERED 
(
	[EmailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Emails] ON
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (0, NULL, NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (2, N'safd@asdfa.ads', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (3, N'tstts@test.com', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (4, N'dgd@sdf.sdf', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (5, N'aksdhk@asd.asd', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (6, N'hardikmansaraa@ymail.com', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (7, N'hardikmansaraa@ymail.com', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (8, N'hardikmansaraa@ymail.com', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (9, N'haaa@tesdt.com', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (10, N'sdasdad', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (11, N'sdfgsf', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (12, N'sdfgsf', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (13, N'sdfgsf', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (14, N'sdfgsf', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (15, N'sdfgsf', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (16, N'sdfgsf', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (17, N'sdfgsf', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (18, N'sdfgsf', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (19, N'WERF', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (20, N'surajogi@s.c', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (21, N'sf@sds.c', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (22, N'sdfsdf', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (23, N'asdfas@dsa.sdf', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (24, N'asdf', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (25, N'ss@sm,dcm', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (26, N'123@123.123', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (27, N'123@sd.as', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (28, N'Dev@microsoft.com', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (29, N'test@mic.com', NULL)
INSERT [dbo].[Emails] ([EmailID], [Address], [EmailTypeID]) VALUES (30, N'hardikmansaraa@ymail.com', NULL)
SET IDENTITY_INSERT [dbo].[Emails] OFF
/****** Object:  Table [dbo].[Images]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ImageTypeID] [int] NOT NULL,
	[ImageExtension] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Images] ON
INSERT [dbo].[Images] ([ImageID], [Name], [ImageTypeID], [ImageExtension]) VALUES (2, N'Beauty of Nature.jpg', 3, N'.jpg')
INSERT [dbo].[Images] ([ImageID], [Name], [ImageTypeID], [ImageExtension]) VALUES (3, N'tig4e.jpg', 3, N'.jpg')
INSERT [dbo].[Images] ([ImageID], [Name], [ImageTypeID], [ImageExtension]) VALUES (4, N'3d_1489.jpg', 3, N'.jpg')
INSERT [dbo].[Images] ([ImageID], [Name], [ImageTypeID], [ImageExtension]) VALUES (5, N'lions-14e.jpg', 3, N'.jpg')
INSERT [dbo].[Images] ([ImageID], [Name], [ImageTypeID], [ImageExtension]) VALUES (6, N'Photography_artistic_85196.jpg', 3, N'.jpg')
INSERT [dbo].[Images] ([ImageID], [Name], [ImageTypeID], [ImageExtension]) VALUES (7, N'1-532-3D_space03.jpg', 3, N'.jpg')
INSERT [dbo].[Images] ([ImageID], [Name], [ImageTypeID], [ImageExtension]) VALUES (8, N'3d_1480.jpg', 3, N'.jpg')
INSERT [dbo].[Images] ([ImageID], [Name], [ImageTypeID], [ImageExtension]) VALUES (9, N'3d_1480.jpg', 3, N'.jpg')
INSERT [dbo].[Images] ([ImageID], [Name], [ImageTypeID], [ImageExtension]) VALUES (10, N'Photography_women_326610.jpg', 3, N'.jpg')
SET IDENTITY_INSERT [dbo].[Images] OFF
/****** Object:  Table [dbo].[Experiences]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Experiences](
	[ExperienceID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[BusinessID] [int] NOT NULL,
	[JobPossition] [nvarchar](100) NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsCurrent] [bit] NULL,
 CONSTRAINT [PK_Experiences] PRIMARY KEY CLUSTERED 
(
	[ExperienceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Experiences] ON
INSERT [dbo].[Experiences] ([ExperienceID], [UserID], [BusinessID], [JobPossition], [StartDate], [EndDate], [IsCurrent]) VALUES (3, 17, 6, N'Developer-1', CAST(0x0000A5B500000000 AS DateTime), CAST(0x0000A5B600000000 AS DateTime), 0)
INSERT [dbo].[Experiences] ([ExperienceID], [UserID], [BusinessID], [JobPossition], [StartDate], [EndDate], [IsCurrent]) VALUES (4, 17, 10, N'Develper', CAST(0x0000A5B700000000 AS DateTime), CAST(0x0000A5B500000000 AS DateTime), 0)
INSERT [dbo].[Experiences] ([ExperienceID], [UserID], [BusinessID], [JobPossition], [StartDate], [EndDate], [IsCurrent]) VALUES (5, 17, 8, N'sas', CAST(0x0000A5B900000000 AS DateTime), CAST(0x0000A5BA00000000 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Experiences] OFF
/****** Object:  Table [dbo].[BusinessImages]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessImages](
	[BusinessImageID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessID] [int] NOT NULL,
	[ImageID] [int] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
 CONSTRAINT [PK_BusinessImages] PRIMARY KEY CLUSTERED 
(
	[BusinessImageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BusinessImages] ON
INSERT [dbo].[BusinessImages] ([BusinessImageID], [BusinessID], [ImageID], [IsPrimary]) VALUES (1, 10, 3, 1)
INSERT [dbo].[BusinessImages] ([BusinessImageID], [BusinessID], [ImageID], [IsPrimary]) VALUES (2, 8, 4, 1)
INSERT [dbo].[BusinessImages] ([BusinessImageID], [BusinessID], [ImageID], [IsPrimary]) VALUES (3, 19, 5, 1)
INSERT [dbo].[BusinessImages] ([BusinessImageID], [BusinessID], [ImageID], [IsPrimary]) VALUES (4, 7, 6, 1)
INSERT [dbo].[BusinessImages] ([BusinessImageID], [BusinessID], [ImageID], [IsPrimary]) VALUES (5, 11, 8, 1)
INSERT [dbo].[BusinessImages] ([BusinessImageID], [BusinessID], [ImageID], [IsPrimary]) VALUES (6, 9, 9, 1)
INSERT [dbo].[BusinessImages] ([BusinessImageID], [BusinessID], [ImageID], [IsPrimary]) VALUES (7, 12, 10, 1)
SET IDENTITY_INSERT [dbo].[BusinessImages] OFF
/****** Object:  Table [dbo].[Phones]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Phones](
	[PhoneID] [int] IDENTITY(1,1) NOT NULL,
	[AddressbookID] [int] NOT NULL,
	[CountryID] [int] NULL,
	[Number] [varchar](20) NULL,
	[Ext] [varchar](10) NULL,
	[PhoneTypeID] [int] NULL,
 CONSTRAINT [PK_Phones] PRIMARY KEY CLUSTERED 
(
	[PhoneID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Phones] ON
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (1, 2, NULL, N'1231313', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (2, 3, NULL, N'123123123', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (3, 4, NULL, N'232224', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (4, 5, NULL, N'5765765675', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (5, 6, NULL, N'9510777747', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (6, 7, NULL, N'+919510777747', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (7, 8, NULL, N'9510777747', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (8, 9, NULL, N'121212', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (9, 10, NULL, N'adada', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (10, 11, NULL, N'gsdfgsdf', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (11, 12, NULL, N'gsdfgsdf', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (12, 13, NULL, N'gsdfgsdf', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (13, 14, NULL, N'gsdfgsdf', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (14, 15, NULL, N'gsdfgsdf', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (15, 16, NULL, N'gsdfgsdf', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (16, 17, NULL, N'gsdfgsdf', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (17, 18, NULL, N'gsdfgsdf', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (18, 19, NULL, N'SADFSF', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (22, 21, NULL, N'234234234', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (23, 22, NULL, N'23423', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (24, 25, NULL, N'123123', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (25, 26, NULL, N'sadfasfd', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (26, 28, NULL, N'3123112', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (27, 34, NULL, N'123123', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (28, 35, NULL, N'123123ds', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (29, 41, NULL, N'123123123', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (30, 42, NULL, N'123123', NULL, NULL)
INSERT [dbo].[Phones] ([PhoneID], [AddressbookID], [CountryID], [Number], [Ext], [PhoneTypeID]) VALUES (31, 48, NULL, N'123123132', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Phones] OFF
/****** Object:  Table [dbo].[Jobs]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[JobID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessID] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[JobTypeID] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[insuser] [int] NULL,
	[insdt] [datetime] NULL,
	[upduser] [int] NULL,
	[upddt] [datetime] NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_Jobs_BusinessID_Title_IsDeleted] UNIQUE NONCLUSTERED 
(
	[BusinessID] ASC,
	[Title] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Jobs] ON
INSERT [dbo].[Jobs] ([JobID], [BusinessID], [Title], [Description], [JobTypeID], [IsActive], [IsDeleted], [StartDate], [EndDate], [insuser], [insdt], [upduser], [upddt]) VALUES (24, 7, N'thiois is first test jon', N'According to Torrington, a job description is usually developed by conducting a job analysis, which includes examining the tasks and sequences of tasks necessary to perform the job. The analysis considers the areas of knowledge and skills needed for the job. A job usually includes several roles. According to Hall, the job description might be broadened to form a person specification or may be known as "Terms Of Reference". The person/job specification can be presented as a stand-alone document, but in practice it is usually included within the job description.', 4, 0, 0, CAST(0x0000A5AF00000000 AS DateTime), CAST(0x0000A5BB00000000 AS DateTime), NULL, CAST(0x0000A5B300E4FDFE AS DateTime), NULL, NULL)
INSERT [dbo].[Jobs] ([JobID], [BusinessID], [Title], [Description], [JobTypeID], [IsActive], [IsDeleted], [StartDate], [EndDate], [insuser], [insdt], [upduser], [upddt]) VALUES (25, 7, N'this is secind te tjob', N'Job descriptions may not be suitable for some senior managers as they should have the freedom to take the initiative and find fruitful new directions;
Job descriptions may be too inflexible in a rapidly changing organization, for instance in an area subject to rapid technological change;
Other changes in job content may lead to the job description being out of date;
The process that an organization uses to create job descriptions may not be optimal.', 4, 1, 0, CAST(0x0000A5A700000000 AS DateTime), CAST(0x0000A5B400000000 AS DateTime), NULL, CAST(0x0000A5B2012A909F AS DateTime), NULL, NULL)
INSERT [dbo].[Jobs] ([JobID], [BusinessID], [Title], [Description], [JobTypeID], [IsActive], [IsDeleted], [StartDate], [EndDate], [insuser], [insdt], [upduser], [upddt]) VALUES (26, 7, N'this is third tst jobs', N'The process of writing a job description requires having a clear understanding of the job’s duties and responsibilities. The job posting should also include a concise picture of the skills required for the position to attract qualified job candidates. Organize the job description into five sections: Company Information, Job Description, Job Requirements, Benefits and a Call to Action. Be sure to include keywords that will help make your job posting searchable. A well-', 4, 1, 0, CAST(0x0000A5A700000000 AS DateTime), CAST(0x0000A5BA00000000 AS DateTime), NULL, CAST(0x0000A5B300E50563 AS DateTime), NULL, NULL)
INSERT [dbo].[Jobs] ([JobID], [BusinessID], [Title], [Description], [JobTypeID], [IsActive], [IsDeleted], [StartDate], [EndDate], [insuser], [insdt], [upduser], [upddt]) VALUES (27, 7, N'this is forth jobs l', N'The process of writing a job description requires having a clear understanding of the job’s duties and responsibilities. The job posting should also include a concise picture of the skills required for the position to attract qualified job candidates. Organize the job description into five sections: Company Information, Job Description, Job Requirements, Benefits and a Call to Action. Be sure to include keywords that will help make your job posting searchable. A well-', 4, 1, 1, CAST(0x0000A5A200000000 AS DateTime), CAST(0x0000A5B500000000 AS DateTime), NULL, CAST(0x0000A5B2012AC9FD AS DateTime), NULL, NULL)
INSERT [dbo].[Jobs] ([JobID], [BusinessID], [Title], [Description], [JobTypeID], [IsActive], [IsDeleted], [StartDate], [EndDate], [insuser], [insdt], [upduser], [upddt]) VALUES (28, 19, N'thsi is new company job', N'The process of writing a job description requires having a clear understanding of the job’s duties and responsibilities. The job posting should also include a concise picture of the skills required for the position to attract qualified job candidates. Organize the job description into five sections: Company Information, Job Description, Job Requirements, Benefits and a Call to Action. Be sure to include keywords that will help make your job posting searchable. A well-', 4, 1, 0, CAST(0x0000A5A900000000 AS DateTime), CAST(0x0000A5BB00000000 AS DateTime), NULL, CAST(0x0000A5B2012B4FEA AS DateTime), NULL, NULL)
INSERT [dbo].[Jobs] ([JobID], [BusinessID], [Title], [Description], [JobTypeID], [IsActive], [IsDeleted], [StartDate], [EndDate], [insuser], [insdt], [upduser], [upddt]) VALUES (29, 19, N'thso os another new company job', N'The process of writing a job description requires having a clear understanding of the job’s duties and responsibilities. The job posting should also include a concise picture of the skills required for the position to attract qualified job candidates. Organize the job description into five sections: Company Information, Job Description, Job Requirements, Benefits and a Call to Action. Be sure to include keywords that will help make your job posting searchable. A well-', 4, 1, 0, CAST(0x0000A5B800000000 AS DateTime), CAST(0x0000A5BB00000000 AS DateTime), NULL, CAST(0x0000A5B2012B7D98 AS DateTime), NULL, NULL)
INSERT [dbo].[Jobs] ([JobID], [BusinessID], [Title], [Description], [JobTypeID], [IsActive], [IsDeleted], [StartDate], [EndDate], [insuser], [insdt], [upduser], [upddt]) VALUES (30, 7, N'this is loading job', N'loadinoi dfoif wojek fn kdoowaw f', 4, 1, 0, CAST(0x0000A5AA00000000 AS DateTime), CAST(0x0000A5BA00000000 AS DateTime), NULL, CAST(0x0000A5B300E52941 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Jobs] OFF
/****** Object:  Table [dbo].[BusinessEmails]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessEmails](
	[BusinessEmailID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessID] [int] NOT NULL,
	[EmailID] [int] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
 CONSTRAINT [PK_BusinessEmails] PRIMARY KEY CLUSTERED 
(
	[BusinessEmailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BusinessEmails] ON
INSERT [dbo].[BusinessEmails] ([BusinessEmailID], [BusinessID], [EmailID], [IsPrimary]) VALUES (1, 6, 7, 1)
INSERT [dbo].[BusinessEmails] ([BusinessEmailID], [BusinessID], [EmailID], [IsPrimary]) VALUES (2, 7, 8, 1)
INSERT [dbo].[BusinessEmails] ([BusinessEmailID], [BusinessID], [EmailID], [IsPrimary]) VALUES (3, 8, 10, 1)
INSERT [dbo].[BusinessEmails] ([BusinessEmailID], [BusinessID], [EmailID], [IsPrimary]) VALUES (4, 11, 11, 1)
INSERT [dbo].[BusinessEmails] ([BusinessEmailID], [BusinessID], [EmailID], [IsPrimary]) VALUES (5, 12, 12, 1)
INSERT [dbo].[BusinessEmails] ([BusinessEmailID], [BusinessID], [EmailID], [IsPrimary]) VALUES (6, 9, 13, 1)
INSERT [dbo].[BusinessEmails] ([BusinessEmailID], [BusinessID], [EmailID], [IsPrimary]) VALUES (7, 10, 14, 1)
INSERT [dbo].[BusinessEmails] ([BusinessEmailID], [BusinessID], [EmailID], [IsPrimary]) VALUES (8, 13, 15, 1)
INSERT [dbo].[BusinessEmails] ([BusinessEmailID], [BusinessID], [EmailID], [IsPrimary]) VALUES (9, 14, 16, 1)
INSERT [dbo].[BusinessEmails] ([BusinessEmailID], [BusinessID], [EmailID], [IsPrimary]) VALUES (10, 15, 17, 1)
INSERT [dbo].[BusinessEmails] ([BusinessEmailID], [BusinessID], [EmailID], [IsPrimary]) VALUES (11, 16, 18, 1)
INSERT [dbo].[BusinessEmails] ([BusinessEmailID], [BusinessID], [EmailID], [IsPrimary]) VALUES (12, 17, 19, 1)
INSERT [dbo].[BusinessEmails] ([BusinessEmailID], [BusinessID], [EmailID], [IsPrimary]) VALUES (13, 18, 22, 1)
INSERT [dbo].[BusinessEmails] ([BusinessEmailID], [BusinessID], [EmailID], [IsPrimary]) VALUES (14, 19, 27, 1)
SET IDENTITY_INSERT [dbo].[BusinessEmails] OFF
/****** Object:  Table [dbo].[BusinessAddresses]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessAddresses](
	[BusinessAddressID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessID] [int] NOT NULL,
	[AddressID] [int] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
 CONSTRAINT [PK_BusinessAddresses] PRIMARY KEY CLUSTERED 
(
	[BusinessAddressID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BusinessAddresses] ON
INSERT [dbo].[BusinessAddresses] ([BusinessAddressID], [BusinessID], [AddressID], [IsPrimary]) VALUES (1, 6, 7, 1)
INSERT [dbo].[BusinessAddresses] ([BusinessAddressID], [BusinessID], [AddressID], [IsPrimary]) VALUES (2, 7, 8, 1)
INSERT [dbo].[BusinessAddresses] ([BusinessAddressID], [BusinessID], [AddressID], [IsPrimary]) VALUES (3, 8, 10, 1)
INSERT [dbo].[BusinessAddresses] ([BusinessAddressID], [BusinessID], [AddressID], [IsPrimary]) VALUES (4, 11, 11, 1)
INSERT [dbo].[BusinessAddresses] ([BusinessAddressID], [BusinessID], [AddressID], [IsPrimary]) VALUES (5, 12, 12, 1)
INSERT [dbo].[BusinessAddresses] ([BusinessAddressID], [BusinessID], [AddressID], [IsPrimary]) VALUES (6, 9, 13, 1)
INSERT [dbo].[BusinessAddresses] ([BusinessAddressID], [BusinessID], [AddressID], [IsPrimary]) VALUES (7, 10, 14, 1)
INSERT [dbo].[BusinessAddresses] ([BusinessAddressID], [BusinessID], [AddressID], [IsPrimary]) VALUES (8, 13, 15, 1)
INSERT [dbo].[BusinessAddresses] ([BusinessAddressID], [BusinessID], [AddressID], [IsPrimary]) VALUES (9, 14, 16, 1)
INSERT [dbo].[BusinessAddresses] ([BusinessAddressID], [BusinessID], [AddressID], [IsPrimary]) VALUES (10, 15, 17, 1)
INSERT [dbo].[BusinessAddresses] ([BusinessAddressID], [BusinessID], [AddressID], [IsPrimary]) VALUES (11, 16, 18, 1)
INSERT [dbo].[BusinessAddresses] ([BusinessAddressID], [BusinessID], [AddressID], [IsPrimary]) VALUES (12, 17, 19, 1)
INSERT [dbo].[BusinessAddresses] ([BusinessAddressID], [BusinessID], [AddressID], [IsPrimary]) VALUES (13, 7, 23, 1)
INSERT [dbo].[BusinessAddresses] ([BusinessAddressID], [BusinessID], [AddressID], [IsPrimary]) VALUES (14, 18, 24, 1)
INSERT [dbo].[BusinessAddresses] ([BusinessAddressID], [BusinessID], [AddressID], [IsPrimary]) VALUES (20, 9, 33, 0)
INSERT [dbo].[BusinessAddresses] ([BusinessAddressID], [BusinessID], [AddressID], [IsPrimary]) VALUES (21, 19, 35, 1)
INSERT [dbo].[BusinessAddresses] ([BusinessAddressID], [BusinessID], [AddressID], [IsPrimary]) VALUES (22, 19, 37, 0)
INSERT [dbo].[BusinessAddresses] ([BusinessAddressID], [BusinessID], [AddressID], [IsPrimary]) VALUES (23, 18, 38, 0)
INSERT [dbo].[BusinessAddresses] ([BusinessAddressID], [BusinessID], [AddressID], [IsPrimary]) VALUES (25, 7, 43, 0)
INSERT [dbo].[BusinessAddresses] ([BusinessAddressID], [BusinessID], [AddressID], [IsPrimary]) VALUES (28, 7, 46, 0)
SET IDENTITY_INSERT [dbo].[BusinessAddresses] OFF
/****** Object:  Table [dbo].[Achievements]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Achievements](
	[AchievementID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Date] [datetime] NULL,
	[UserID] [int] NULL,
	[BusinessID] [int] NULL,
 CONSTRAINT [PK_Achievements] PRIMARY KEY CLUSTERED 
(
	[AchievementID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Achievements] ON
INSERT [dbo].[Achievements] ([AchievementID], [Name], [Date], [UserID], [BusinessID]) VALUES (6, N'sdasda', NULL, NULL, 18)
INSERT [dbo].[Achievements] ([AchievementID], [Name], [Date], [UserID], [BusinessID]) VALUES (7, N'sdasdaasdasd', NULL, NULL, 18)
INSERT [dbo].[Achievements] ([AchievementID], [Name], [Date], [UserID], [BusinessID]) VALUES (11, N'asd21eqwdasd', NULL, NULL, 8)
INSERT [dbo].[Achievements] ([AchievementID], [Name], [Date], [UserID], [BusinessID]) VALUES (13, N'dasdasdweqwe', NULL, NULL, 9)
INSERT [dbo].[Achievements] ([AchievementID], [Name], [Date], [UserID], [BusinessID]) VALUES (14, N'asdfasdf asdf', NULL, NULL, 19)
INSERT [dbo].[Achievements] ([AchievementID], [Name], [Date], [UserID], [BusinessID]) VALUES (16, N'B.E.I.T', CAST(0x0000A5A800000000 AS DateTime), 17, NULL)
INSERT [dbo].[Achievements] ([AchievementID], [Name], [Date], [UserID], [BusinessID]) VALUES (24, N'Windows', NULL, NULL, 7)
INSERT [dbo].[Achievements] ([AchievementID], [Name], [Date], [UserID], [BusinessID]) VALUES (25, N'Worldwide', NULL, NULL, 7)
INSERT [dbo].[Achievements] ([AchievementID], [Name], [Date], [UserID], [BusinessID]) VALUES (26, N'Computer software', NULL, NULL, 7)
SET IDENTITY_INSERT [dbo].[Achievements] OFF
/****** Object:  Table [dbo].[BusinessUserMaps]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessUserMaps](
	[BusinessUserMapID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[IsOwner] [bit] NOT NULL,
	[BusinessUserTypeID] [int] NULL,
 CONSTRAINT [PK_BusinessUserMaps] PRIMARY KEY CLUSTERED 
(
	[BusinessUserMapID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_BusinessUserMaps_BusinessID_UserID_BusinessUserTypeID] UNIQUE NONCLUSTERED 
(
	[BusinessID] ASC,
	[UserID] ASC,
	[BusinessUserTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BusinessUserMaps] ON
INSERT [dbo].[BusinessUserMaps] ([BusinessUserMapID], [BusinessID], [UserID], [IsOwner], [BusinessUserTypeID]) VALUES (1, 6, 17, 1, 3)
INSERT [dbo].[BusinessUserMaps] ([BusinessUserMapID], [BusinessID], [UserID], [IsOwner], [BusinessUserTypeID]) VALUES (2, 7, 17, 1, 3)
INSERT [dbo].[BusinessUserMaps] ([BusinessUserMapID], [BusinessID], [UserID], [IsOwner], [BusinessUserTypeID]) VALUES (3, 8, 17, 1, 3)
INSERT [dbo].[BusinessUserMaps] ([BusinessUserMapID], [BusinessID], [UserID], [IsOwner], [BusinessUserTypeID]) VALUES (4, 10, 17, 1, 3)
INSERT [dbo].[BusinessUserMaps] ([BusinessUserMapID], [BusinessID], [UserID], [IsOwner], [BusinessUserTypeID]) VALUES (5, 11, 17, 1, 3)
INSERT [dbo].[BusinessUserMaps] ([BusinessUserMapID], [BusinessID], [UserID], [IsOwner], [BusinessUserTypeID]) VALUES (6, 12, 17, 1, 3)
INSERT [dbo].[BusinessUserMaps] ([BusinessUserMapID], [BusinessID], [UserID], [IsOwner], [BusinessUserTypeID]) VALUES (7, 9, 17, 1, 3)
INSERT [dbo].[BusinessUserMaps] ([BusinessUserMapID], [BusinessID], [UserID], [IsOwner], [BusinessUserTypeID]) VALUES (8, 13, 17, 1, 3)
INSERT [dbo].[BusinessUserMaps] ([BusinessUserMapID], [BusinessID], [UserID], [IsOwner], [BusinessUserTypeID]) VALUES (9, 14, 17, 1, 3)
INSERT [dbo].[BusinessUserMaps] ([BusinessUserMapID], [BusinessID], [UserID], [IsOwner], [BusinessUserTypeID]) VALUES (10, 15, 17, 1, 3)
INSERT [dbo].[BusinessUserMaps] ([BusinessUserMapID], [BusinessID], [UserID], [IsOwner], [BusinessUserTypeID]) VALUES (11, 16, 17, 1, 3)
INSERT [dbo].[BusinessUserMaps] ([BusinessUserMapID], [BusinessID], [UserID], [IsOwner], [BusinessUserTypeID]) VALUES (12, 17, 17, 1, 3)
INSERT [dbo].[BusinessUserMaps] ([BusinessUserMapID], [BusinessID], [UserID], [IsOwner], [BusinessUserTypeID]) VALUES (13, 7, 25, 0, NULL)
INSERT [dbo].[BusinessUserMaps] ([BusinessUserMapID], [BusinessID], [UserID], [IsOwner], [BusinessUserTypeID]) VALUES (14, 18, 17, 1, 3)
INSERT [dbo].[BusinessUserMaps] ([BusinessUserMapID], [BusinessID], [UserID], [IsOwner], [BusinessUserTypeID]) VALUES (19, 8, 31, 0, NULL)
INSERT [dbo].[BusinessUserMaps] ([BusinessUserMapID], [BusinessID], [UserID], [IsOwner], [BusinessUserTypeID]) VALUES (21, 9, 33, 0, NULL)
INSERT [dbo].[BusinessUserMaps] ([BusinessUserMapID], [BusinessID], [UserID], [IsOwner], [BusinessUserTypeID]) VALUES (22, 19, 34, 1, 3)
INSERT [dbo].[BusinessUserMaps] ([BusinessUserMapID], [BusinessID], [UserID], [IsOwner], [BusinessUserTypeID]) VALUES (23, 19, 35, 0, NULL)
INSERT [dbo].[BusinessUserMaps] ([BusinessUserMapID], [BusinessID], [UserID], [IsOwner], [BusinessUserTypeID]) VALUES (28, 7, 40, 0, NULL)
INSERT [dbo].[BusinessUserMaps] ([BusinessUserMapID], [BusinessID], [UserID], [IsOwner], [BusinessUserTypeID]) VALUES (29, 7, 41, 0, NULL)
INSERT [dbo].[BusinessUserMaps] ([BusinessUserMapID], [BusinessID], [UserID], [IsOwner], [BusinessUserTypeID]) VALUES (30, 7, 42, 0, NULL)
SET IDENTITY_INSERT [dbo].[BusinessUserMaps] OFF
/****** Object:  Table [dbo].[Services]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[BusinessID] [int] NOT NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Services] ON
INSERT [dbo].[Services] ([ServiceID], [Name], [BusinessID]) VALUES (10, N'Business Type ABA1', 11)
INSERT [dbo].[Services] ([ServiceID], [Name], [BusinessID]) VALUES (11, N'Business Type ABA 2', 11)
INSERT [dbo].[Services] ([ServiceID], [Name], [BusinessID]) VALUES (17, N'this is specialiist', 8)
INSERT [dbo].[Services] ([ServiceID], [Name], [BusinessID]) VALUES (19, N'this is anotjer oser specia;', 9)
INSERT [dbo].[Services] ([ServiceID], [Name], [BusinessID]) VALUES (20, N'fsdfsf', 19)
INSERT [dbo].[Services] ([ServiceID], [Name], [BusinessID]) VALUES (32, N'Paul Allen', 7)
INSERT [dbo].[Services] ([ServiceID], [Name], [BusinessID]) VALUES (33, N'Bill Gates', 7)
SET IDENTITY_INSERT [dbo].[Services] OFF
/****** Object:  Table [dbo].[UserImages]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserImages](
	[UserImageID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ImageID] [int] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
 CONSTRAINT [PK_UserImages] PRIMARY KEY CLUSTERED 
(
	[UserImageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserImages] ON
INSERT [dbo].[UserImages] ([UserImageID], [UserID], [ImageID], [IsPrimary]) VALUES (2, 17, 2, 1)
INSERT [dbo].[UserImages] ([UserImageID], [UserID], [ImageID], [IsPrimary]) VALUES (3, 44, 7, 1)
SET IDENTITY_INSERT [dbo].[UserImages] OFF
/****** Object:  Table [dbo].[UserEmails]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserEmails](
	[UserEmailID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[EmailID] [int] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
 CONSTRAINT [PK_UserEmails] PRIMARY KEY CLUSTERED 
(
	[UserEmailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_UserEmails_UserID_EmailID] UNIQUE NONCLUSTERED 
(
	[UserID] ASC,
	[EmailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserEmails] ON
INSERT [dbo].[UserEmails] ([UserEmailID], [UserID], [EmailID], [IsPrimary]) VALUES (1, 10, 2, 0)
INSERT [dbo].[UserEmails] ([UserEmailID], [UserID], [EmailID], [IsPrimary]) VALUES (2, 11, 3, 0)
INSERT [dbo].[UserEmails] ([UserEmailID], [UserID], [EmailID], [IsPrimary]) VALUES (3, 14, 4, 0)
INSERT [dbo].[UserEmails] ([UserEmailID], [UserID], [EmailID], [IsPrimary]) VALUES (4, 15, 5, 0)
INSERT [dbo].[UserEmails] ([UserEmailID], [UserID], [EmailID], [IsPrimary]) VALUES (5, 17, 6, 1)
INSERT [dbo].[UserEmails] ([UserEmailID], [UserID], [EmailID], [IsPrimary]) VALUES (6, 18, 9, 1)
INSERT [dbo].[UserEmails] ([UserEmailID], [UserID], [EmailID], [IsPrimary]) VALUES (7, 24, 20, 1)
INSERT [dbo].[UserEmails] ([UserEmailID], [UserID], [EmailID], [IsPrimary]) VALUES (8, 25, 21, 1)
INSERT [dbo].[UserEmails] ([UserEmailID], [UserID], [EmailID], [IsPrimary]) VALUES (9, 27, 23, 1)
INSERT [dbo].[UserEmails] ([UserEmailID], [UserID], [EmailID], [IsPrimary]) VALUES (10, 31, 24, 1)
INSERT [dbo].[UserEmails] ([UserEmailID], [UserID], [EmailID], [IsPrimary]) VALUES (11, 33, 25, 1)
INSERT [dbo].[UserEmails] ([UserEmailID], [UserID], [EmailID], [IsPrimary]) VALUES (12, 34, 26, 1)
INSERT [dbo].[UserEmails] ([UserEmailID], [UserID], [EmailID], [IsPrimary]) VALUES (13, 41, 28, 1)
INSERT [dbo].[UserEmails] ([UserEmailID], [UserID], [EmailID], [IsPrimary]) VALUES (14, 42, 29, 1)
INSERT [dbo].[UserEmails] ([UserEmailID], [UserID], [EmailID], [IsPrimary]) VALUES (15, 44, 30, 1)
SET IDENTITY_INSERT [dbo].[UserEmails] OFF
/****** Object:  Table [dbo].[UserAddresses]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddresses](
	[UserAddressID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[AddressID] [int] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
 CONSTRAINT [PK_UserAddresses] PRIMARY KEY CLUSTERED 
(
	[UserAddressID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_UserAddress_UserID_AddressID] UNIQUE NONCLUSTERED 
(
	[UserID] ASC,
	[AddressID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserAddresses] ON
INSERT [dbo].[UserAddresses] ([UserAddressID], [UserID], [AddressID], [IsPrimary]) VALUES (1, 6, 1, 1)
INSERT [dbo].[UserAddresses] ([UserAddressID], [UserID], [AddressID], [IsPrimary]) VALUES (2, 10, 2, 0)
INSERT [dbo].[UserAddresses] ([UserAddressID], [UserID], [AddressID], [IsPrimary]) VALUES (3, 11, 3, 0)
INSERT [dbo].[UserAddresses] ([UserAddressID], [UserID], [AddressID], [IsPrimary]) VALUES (4, 14, 4, 0)
INSERT [dbo].[UserAddresses] ([UserAddressID], [UserID], [AddressID], [IsPrimary]) VALUES (5, 15, 5, 0)
INSERT [dbo].[UserAddresses] ([UserAddressID], [UserID], [AddressID], [IsPrimary]) VALUES (6, 17, 6, 1)
INSERT [dbo].[UserAddresses] ([UserAddressID], [UserID], [AddressID], [IsPrimary]) VALUES (7, 18, 9, 1)
INSERT [dbo].[UserAddresses] ([UserAddressID], [UserID], [AddressID], [IsPrimary]) VALUES (9, 24, 21, 1)
INSERT [dbo].[UserAddresses] ([UserAddressID], [UserID], [AddressID], [IsPrimary]) VALUES (10, 25, 22, 1)
INSERT [dbo].[UserAddresses] ([UserAddressID], [UserID], [AddressID], [IsPrimary]) VALUES (11, 27, 25, 1)
INSERT [dbo].[UserAddresses] ([UserAddressID], [UserID], [AddressID], [IsPrimary]) VALUES (12, 31, 26, 1)
INSERT [dbo].[UserAddresses] ([UserAddressID], [UserID], [AddressID], [IsPrimary]) VALUES (13, 33, 28, 1)
INSERT [dbo].[UserAddresses] ([UserAddressID], [UserID], [AddressID], [IsPrimary]) VALUES (14, 34, 34, 1)
INSERT [dbo].[UserAddresses] ([UserAddressID], [UserID], [AddressID], [IsPrimary]) VALUES (15, 35, 36, 1)
INSERT [dbo].[UserAddresses] ([UserAddressID], [UserID], [AddressID], [IsPrimary]) VALUES (16, 40, 39, 1)
INSERT [dbo].[UserAddresses] ([UserAddressID], [UserID], [AddressID], [IsPrimary]) VALUES (17, 41, 41, 1)
INSERT [dbo].[UserAddresses] ([UserAddressID], [UserID], [AddressID], [IsPrimary]) VALUES (18, 42, 42, 1)
INSERT [dbo].[UserAddresses] ([UserAddressID], [UserID], [AddressID], [IsPrimary]) VALUES (20, 44, 48, 1)
SET IDENTITY_INSERT [dbo].[UserAddresses] OFF
/****** Object:  Table [dbo].[JobApplications]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobApplications](
	[JobApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[JobID] [int] NOT NULL,
	[ApplicantUserID] [int] NOT NULL,
	[ApplicationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_JobApplications] PRIMARY KEY CLUSTERED 
(
	[JobApplicationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_JobApplications_JobID_ApplicantUserID] UNIQUE NONCLUSTERED 
(
	[JobID] ASC,
	[ApplicantUserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[JobApplications] ON
INSERT [dbo].[JobApplications] ([JobApplicationID], [JobID], [ApplicantUserID], [ApplicationDate]) VALUES (28, 24, 34, CAST(0x0000A5B2012AE297 AS DateTime))
INSERT [dbo].[JobApplications] ([JobApplicationID], [JobID], [ApplicantUserID], [ApplicationDate]) VALUES (29, 25, 34, CAST(0x0000A5B2012AE587 AS DateTime))
INSERT [dbo].[JobApplications] ([JobApplicationID], [JobID], [ApplicantUserID], [ApplicationDate]) VALUES (31, 27, 34, CAST(0x0000A5B2012AFB59 AS DateTime))
INSERT [dbo].[JobApplications] ([JobApplicationID], [JobID], [ApplicantUserID], [ApplicationDate]) VALUES (39, 24, 44, CAST(0x0000A5B2012C7CC6 AS DateTime))
INSERT [dbo].[JobApplications] ([JobApplicationID], [JobID], [ApplicantUserID], [ApplicationDate]) VALUES (40, 25, 44, CAST(0x0000A5B2012C8012 AS DateTime))
INSERT [dbo].[JobApplications] ([JobApplicationID], [JobID], [ApplicantUserID], [ApplicationDate]) VALUES (42, 27, 44, CAST(0x0000A5B2012C8860 AS DateTime))
SET IDENTITY_INSERT [dbo].[JobApplications] OFF
/****** Object:  Table [dbo].[UserPhones]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPhones](
	[UserPhoneID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PhoneID] [int] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
 CONSTRAINT [PK_UserPhones] PRIMARY KEY CLUSTERED 
(
	[UserPhoneID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_UserPhones_UserID_PhoneID] UNIQUE NONCLUSTERED 
(
	[UserID] ASC,
	[PhoneID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserPhones] ON
INSERT [dbo].[UserPhones] ([UserPhoneID], [UserID], [PhoneID], [IsPrimary]) VALUES (1, 10, 1, 0)
INSERT [dbo].[UserPhones] ([UserPhoneID], [UserID], [PhoneID], [IsPrimary]) VALUES (2, 11, 2, 0)
INSERT [dbo].[UserPhones] ([UserPhoneID], [UserID], [PhoneID], [IsPrimary]) VALUES (3, 14, 3, 0)
INSERT [dbo].[UserPhones] ([UserPhoneID], [UserID], [PhoneID], [IsPrimary]) VALUES (4, 15, 4, 0)
INSERT [dbo].[UserPhones] ([UserPhoneID], [UserID], [PhoneID], [IsPrimary]) VALUES (5, 17, 5, 1)
INSERT [dbo].[UserPhones] ([UserPhoneID], [UserID], [PhoneID], [IsPrimary]) VALUES (6, 18, 8, 1)
INSERT [dbo].[UserPhones] ([UserPhoneID], [UserID], [PhoneID], [IsPrimary]) VALUES (7, 24, 22, 1)
INSERT [dbo].[UserPhones] ([UserPhoneID], [UserID], [PhoneID], [IsPrimary]) VALUES (8, 25, 23, 1)
INSERT [dbo].[UserPhones] ([UserPhoneID], [UserID], [PhoneID], [IsPrimary]) VALUES (9, 27, 24, 1)
INSERT [dbo].[UserPhones] ([UserPhoneID], [UserID], [PhoneID], [IsPrimary]) VALUES (10, 31, 25, 1)
INSERT [dbo].[UserPhones] ([UserPhoneID], [UserID], [PhoneID], [IsPrimary]) VALUES (11, 33, 26, 1)
INSERT [dbo].[UserPhones] ([UserPhoneID], [UserID], [PhoneID], [IsPrimary]) VALUES (12, 34, 27, 1)
INSERT [dbo].[UserPhones] ([UserPhoneID], [UserID], [PhoneID], [IsPrimary]) VALUES (13, 41, 29, 1)
INSERT [dbo].[UserPhones] ([UserPhoneID], [UserID], [PhoneID], [IsPrimary]) VALUES (14, 42, 30, 1)
INSERT [dbo].[UserPhones] ([UserPhoneID], [UserID], [PhoneID], [IsPrimary]) VALUES (15, 44, 31, 1)
SET IDENTITY_INSERT [dbo].[UserPhones] OFF
/****** Object:  Table [dbo].[BusinessPhones]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessPhones](
	[BusinessPhoneID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessID] [int] NOT NULL,
	[PhoneID] [int] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
 CONSTRAINT [PK_BusinessPhones] PRIMARY KEY CLUSTERED 
(
	[BusinessPhoneID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BusinessPhones] ON
INSERT [dbo].[BusinessPhones] ([BusinessPhoneID], [BusinessID], [PhoneID], [IsPrimary]) VALUES (1, 6, 6, 1)
INSERT [dbo].[BusinessPhones] ([BusinessPhoneID], [BusinessID], [PhoneID], [IsPrimary]) VALUES (2, 7, 7, 1)
INSERT [dbo].[BusinessPhones] ([BusinessPhoneID], [BusinessID], [PhoneID], [IsPrimary]) VALUES (3, 8, 9, 1)
INSERT [dbo].[BusinessPhones] ([BusinessPhoneID], [BusinessID], [PhoneID], [IsPrimary]) VALUES (4, 11, 10, 1)
INSERT [dbo].[BusinessPhones] ([BusinessPhoneID], [BusinessID], [PhoneID], [IsPrimary]) VALUES (5, 12, 11, 1)
INSERT [dbo].[BusinessPhones] ([BusinessPhoneID], [BusinessID], [PhoneID], [IsPrimary]) VALUES (6, 9, 12, 1)
INSERT [dbo].[BusinessPhones] ([BusinessPhoneID], [BusinessID], [PhoneID], [IsPrimary]) VALUES (7, 10, 13, 1)
INSERT [dbo].[BusinessPhones] ([BusinessPhoneID], [BusinessID], [PhoneID], [IsPrimary]) VALUES (8, 13, 14, 1)
INSERT [dbo].[BusinessPhones] ([BusinessPhoneID], [BusinessID], [PhoneID], [IsPrimary]) VALUES (9, 14, 15, 1)
INSERT [dbo].[BusinessPhones] ([BusinessPhoneID], [BusinessID], [PhoneID], [IsPrimary]) VALUES (10, 15, 16, 1)
INSERT [dbo].[BusinessPhones] ([BusinessPhoneID], [BusinessID], [PhoneID], [IsPrimary]) VALUES (11, 16, 17, 1)
INSERT [dbo].[BusinessPhones] ([BusinessPhoneID], [BusinessID], [PhoneID], [IsPrimary]) VALUES (12, 17, 18, 1)
INSERT [dbo].[BusinessPhones] ([BusinessPhoneID], [BusinessID], [PhoneID], [IsPrimary]) VALUES (13, 19, 28, 1)
SET IDENTITY_INSERT [dbo].[BusinessPhones] OFF
/****** Object:  Table [dbo].[JobApplicationStates]    Script Date: 02/24/2016 19:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobApplicationStates](
	[JobApplicationStateID] [int] IDENTITY(1,1) NOT NULL,
	[JobApplicationID] [int] NOT NULL,
	[JobApplicationStatusID] [int] NOT NULL,
	[insdt] [datetime] NOT NULL,
	[insuser] [int] NOT NULL,
 CONSTRAINT [PK_JobApplicationStates] PRIMARY KEY CLUSTERED 
(
	[JobApplicationStateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_Business_IsActive]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Businesses] ADD  CONSTRAINT [DF_Business_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Business_IsDeleted]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Businesses] ADD  CONSTRAINT [DF_Business_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_BusinessUserMaps_IsOwner]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[BusinessUserMaps] ADD  CONSTRAINT [DF_BusinessUserMaps_IsOwner]  DEFAULT ((0)) FOR [IsOwner]
GO
/****** Object:  Default [DF_Jobs_IsActive]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Jobs] ADD  CONSTRAINT [DF_Jobs_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Jobs_IsDeleted]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Jobs] ADD  CONSTRAINT [DF_Jobs_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_UserAccounts_IsActive]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[UserAccounts] ADD  CONSTRAINT [DF_UserAccounts_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_UserAccounts_IsDeleted]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[UserAccounts] ADD  CONSTRAINT [DF_UserAccounts_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_UserAddresses_Primary]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[UserAddresses] ADD  CONSTRAINT [DF_UserAddresses_Primary]  DEFAULT ((0)) FOR [IsPrimary]
GO
/****** Object:  Default [DF_UserEmails_Primary]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[UserEmails] ADD  CONSTRAINT [DF_UserEmails_Primary]  DEFAULT ((0)) FOR [IsPrimary]
GO
/****** Object:  Default [DF_UserPhones_Primary]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[UserPhones] ADD  CONSTRAINT [DF_UserPhones_Primary]  DEFAULT ((0)) FOR [IsPrimary]
GO
/****** Object:  Default [DF_Users_IsActive]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Users_IsDeleted]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  ForeignKey [FK_Achievements_Businesses]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Achievements]  WITH CHECK ADD  CONSTRAINT [FK_Achievements_Businesses] FOREIGN KEY([BusinessID])
REFERENCES [dbo].[Businesses] ([BusinessID])
GO
ALTER TABLE [dbo].[Achievements] CHECK CONSTRAINT [FK_Achievements_Businesses]
GO
/****** Object:  ForeignKey [FK_Achievements_Users]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Achievements]  WITH CHECK ADD  CONSTRAINT [FK_Achievements_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Achievements] CHECK CONSTRAINT [FK_Achievements_Users]
GO
/****** Object:  ForeignKey [FK_Address_Countries]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Countries] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([CountryID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Countries]
GO
/****** Object:  ForeignKey [FK_Address_TypeCodes]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_TypeCodes] FOREIGN KEY([AddressTypeID])
REFERENCES [dbo].[TypeCodes] ([TypeCodeID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_TypeCodes]
GO
/****** Object:  ForeignKey [FK_BusinessAddresses_Address]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[BusinessAddresses]  WITH CHECK ADD  CONSTRAINT [FK_BusinessAddresses_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[BusinessAddresses] CHECK CONSTRAINT [FK_BusinessAddresses_Address]
GO
/****** Object:  ForeignKey [FK_BusinessAddresses_Business]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[BusinessAddresses]  WITH CHECK ADD  CONSTRAINT [FK_BusinessAddresses_Business] FOREIGN KEY([BusinessID])
REFERENCES [dbo].[Businesses] ([BusinessID])
GO
ALTER TABLE [dbo].[BusinessAddresses] CHECK CONSTRAINT [FK_BusinessAddresses_Business]
GO
/****** Object:  ForeignKey [FK_BusinessEmails_Business]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[BusinessEmails]  WITH CHECK ADD  CONSTRAINT [FK_BusinessEmails_Business] FOREIGN KEY([BusinessID])
REFERENCES [dbo].[Businesses] ([BusinessID])
GO
ALTER TABLE [dbo].[BusinessEmails] CHECK CONSTRAINT [FK_BusinessEmails_Business]
GO
/****** Object:  ForeignKey [FK_BusinessEmails_Emails]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[BusinessEmails]  WITH CHECK ADD  CONSTRAINT [FK_BusinessEmails_Emails] FOREIGN KEY([EmailID])
REFERENCES [dbo].[Emails] ([EmailID])
GO
ALTER TABLE [dbo].[BusinessEmails] CHECK CONSTRAINT [FK_BusinessEmails_Emails]
GO
/****** Object:  ForeignKey [FK_Business_TypeCodes]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Businesses]  WITH CHECK ADD  CONSTRAINT [FK_Business_TypeCodes] FOREIGN KEY([BusinessTypeID])
REFERENCES [dbo].[TypeCodes] ([TypeCodeID])
GO
ALTER TABLE [dbo].[Businesses] CHECK CONSTRAINT [FK_Business_TypeCodes]
GO
/****** Object:  ForeignKey [FK_Business_Users]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Businesses]  WITH CHECK ADD  CONSTRAINT [FK_Business_Users] FOREIGN KEY([insuser])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Businesses] CHECK CONSTRAINT [FK_Business_Users]
GO
/****** Object:  ForeignKey [FK_Business_Users1]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Businesses]  WITH CHECK ADD  CONSTRAINT [FK_Business_Users1] FOREIGN KEY([upduser])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Businesses] CHECK CONSTRAINT [FK_Business_Users1]
GO
/****** Object:  ForeignKey [FK_BusinessImages_Business]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[BusinessImages]  WITH CHECK ADD  CONSTRAINT [FK_BusinessImages_Business] FOREIGN KEY([BusinessID])
REFERENCES [dbo].[Businesses] ([BusinessID])
GO
ALTER TABLE [dbo].[BusinessImages] CHECK CONSTRAINT [FK_BusinessImages_Business]
GO
/****** Object:  ForeignKey [FK_BusinessImages_Images]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[BusinessImages]  WITH CHECK ADD  CONSTRAINT [FK_BusinessImages_Images] FOREIGN KEY([ImageID])
REFERENCES [dbo].[Images] ([ImageID])
GO
ALTER TABLE [dbo].[BusinessImages] CHECK CONSTRAINT [FK_BusinessImages_Images]
GO
/****** Object:  ForeignKey [FK_BusinessPhones_Business]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[BusinessPhones]  WITH CHECK ADD  CONSTRAINT [FK_BusinessPhones_Business] FOREIGN KEY([BusinessID])
REFERENCES [dbo].[Businesses] ([BusinessID])
GO
ALTER TABLE [dbo].[BusinessPhones] CHECK CONSTRAINT [FK_BusinessPhones_Business]
GO
/****** Object:  ForeignKey [FK_BusinessPhones_Phones]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[BusinessPhones]  WITH CHECK ADD  CONSTRAINT [FK_BusinessPhones_Phones] FOREIGN KEY([PhoneID])
REFERENCES [dbo].[Phones] ([PhoneID])
GO
ALTER TABLE [dbo].[BusinessPhones] CHECK CONSTRAINT [FK_BusinessPhones_Phones]
GO
/****** Object:  ForeignKey [FK_BusinessUserMaps_Business]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[BusinessUserMaps]  WITH CHECK ADD  CONSTRAINT [FK_BusinessUserMaps_Business] FOREIGN KEY([BusinessID])
REFERENCES [dbo].[Businesses] ([BusinessID])
GO
ALTER TABLE [dbo].[BusinessUserMaps] CHECK CONSTRAINT [FK_BusinessUserMaps_Business]
GO
/****** Object:  ForeignKey [FK_BusinessUserMaps_TypeCodes]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[BusinessUserMaps]  WITH CHECK ADD  CONSTRAINT [FK_BusinessUserMaps_TypeCodes] FOREIGN KEY([BusinessUserTypeID])
REFERENCES [dbo].[TypeCodes] ([TypeCodeID])
GO
ALTER TABLE [dbo].[BusinessUserMaps] CHECK CONSTRAINT [FK_BusinessUserMaps_TypeCodes]
GO
/****** Object:  ForeignKey [FK_BusinessUserMaps_Users]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[BusinessUserMaps]  WITH CHECK ADD  CONSTRAINT [FK_BusinessUserMaps_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[BusinessUserMaps] CHECK CONSTRAINT [FK_BusinessUserMaps_Users]
GO
/****** Object:  ForeignKey [FK_Educations_Users]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Educations]  WITH CHECK ADD  CONSTRAINT [FK_Educations_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Educations] CHECK CONSTRAINT [FK_Educations_Users]
GO
/****** Object:  ForeignKey [FK_Emails_TypeCodes]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Emails]  WITH CHECK ADD  CONSTRAINT [FK_Emails_TypeCodes] FOREIGN KEY([EmailTypeID])
REFERENCES [dbo].[TypeCodes] ([TypeCodeID])
GO
ALTER TABLE [dbo].[Emails] CHECK CONSTRAINT [FK_Emails_TypeCodes]
GO
/****** Object:  ForeignKey [FK_Experiences_Businesses]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Experiences]  WITH CHECK ADD  CONSTRAINT [FK_Experiences_Businesses] FOREIGN KEY([BusinessID])
REFERENCES [dbo].[Businesses] ([BusinessID])
GO
ALTER TABLE [dbo].[Experiences] CHECK CONSTRAINT [FK_Experiences_Businesses]
GO
/****** Object:  ForeignKey [FK_Experiences_Users]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Experiences]  WITH CHECK ADD  CONSTRAINT [FK_Experiences_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Experiences] CHECK CONSTRAINT [FK_Experiences_Users]
GO
/****** Object:  ForeignKey [FK_Images_TypeCodes]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_TypeCodes] FOREIGN KEY([ImageTypeID])
REFERENCES [dbo].[TypeCodes] ([TypeCodeID])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_TypeCodes]
GO
/****** Object:  ForeignKey [FK_JobApplications_Jobs]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[JobApplications]  WITH CHECK ADD  CONSTRAINT [FK_JobApplications_Jobs] FOREIGN KEY([JobID])
REFERENCES [dbo].[Jobs] ([JobID])
GO
ALTER TABLE [dbo].[JobApplications] CHECK CONSTRAINT [FK_JobApplications_Jobs]
GO
/****** Object:  ForeignKey [FK_JobApplications_Users]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[JobApplications]  WITH CHECK ADD  CONSTRAINT [FK_JobApplications_Users] FOREIGN KEY([JobID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[JobApplications] CHECK CONSTRAINT [FK_JobApplications_Users]
GO
/****** Object:  ForeignKey [FK_JobApplicationStates__TypeCodes]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[JobApplicationStates]  WITH CHECK ADD  CONSTRAINT [FK_JobApplicationStates__TypeCodes] FOREIGN KEY([JobApplicationStatusID])
REFERENCES [dbo].[TypeCodes] ([TypeCodeID])
GO
ALTER TABLE [dbo].[JobApplicationStates] CHECK CONSTRAINT [FK_JobApplicationStates__TypeCodes]
GO
/****** Object:  ForeignKey [FK_JobApplicationStates_JobApplications]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[JobApplicationStates]  WITH CHECK ADD  CONSTRAINT [FK_JobApplicationStates_JobApplications] FOREIGN KEY([JobApplicationID])
REFERENCES [dbo].[JobApplications] ([JobApplicationID])
GO
ALTER TABLE [dbo].[JobApplicationStates] CHECK CONSTRAINT [FK_JobApplicationStates_JobApplications]
GO
/****** Object:  ForeignKey [FK_Jobs_Business]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Business] FOREIGN KEY([BusinessID])
REFERENCES [dbo].[Businesses] ([BusinessID])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Business]
GO
/****** Object:  ForeignKey [FK_Jobs_TypeCodes]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_TypeCodes] FOREIGN KEY([JobTypeID])
REFERENCES [dbo].[TypeCodes] ([TypeCodeID])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_TypeCodes]
GO
/****** Object:  ForeignKey [FK_Languages_Users]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Languages]  WITH CHECK ADD  CONSTRAINT [FK_Languages_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Languages] CHECK CONSTRAINT [FK_Languages_Users]
GO
/****** Object:  ForeignKey [FK_Phones_Address]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Phones]  WITH CHECK ADD  CONSTRAINT [FK_Phones_Address] FOREIGN KEY([AddressbookID])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[Phones] CHECK CONSTRAINT [FK_Phones_Address]
GO
/****** Object:  ForeignKey [FK_Phones_TypeCodes]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Phones]  WITH CHECK ADD  CONSTRAINT [FK_Phones_TypeCodes] FOREIGN KEY([PhoneTypeID])
REFERENCES [dbo].[TypeCodes] ([TypeCodeID])
GO
ALTER TABLE [dbo].[Phones] CHECK CONSTRAINT [FK_Phones_TypeCodes]
GO
/****** Object:  ForeignKey [FK_Services_Users]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Services]  WITH CHECK ADD  CONSTRAINT [FK_Services_Users] FOREIGN KEY([BusinessID])
REFERENCES [dbo].[Businesses] ([BusinessID])
GO
ALTER TABLE [dbo].[Services] CHECK CONSTRAINT [FK_Services_Users]
GO
/****** Object:  ForeignKey [FK_Skills_Users]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Skills]  WITH CHECK ADD  CONSTRAINT [FK_Skills_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Skills] CHECK CONSTRAINT [FK_Skills_Users]
GO
/****** Object:  ForeignKey [FK_TypeCodes_ClassTypes]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[TypeCodes]  WITH CHECK ADD  CONSTRAINT [FK_TypeCodes_ClassTypes] FOREIGN KEY([ClassTypeID])
REFERENCES [dbo].[ClassTypes] ([ClassTypeID])
GO
ALTER TABLE [dbo].[TypeCodes] CHECK CONSTRAINT [FK_TypeCodes_ClassTypes]
GO
/****** Object:  ForeignKey [FK_TypeCodes_TypeCodes]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[TypeCodes]  WITH CHECK ADD  CONSTRAINT [FK_TypeCodes_TypeCodes] FOREIGN KEY([ParentTypeCodeID])
REFERENCES [dbo].[TypeCodes] ([TypeCodeID])
GO
ALTER TABLE [dbo].[TypeCodes] CHECK CONSTRAINT [FK_TypeCodes_TypeCodes]
GO
/****** Object:  ForeignKey [FK_UserAccounts_Users]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[UserAccounts]  WITH CHECK ADD  CONSTRAINT [FK_UserAccounts_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserAccounts] CHECK CONSTRAINT [FK_UserAccounts_Users]
GO
/****** Object:  ForeignKey [FK_UserAddresses_Address]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[UserAddresses]  WITH CHECK ADD  CONSTRAINT [FK_UserAddresses_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[UserAddresses] CHECK CONSTRAINT [FK_UserAddresses_Address]
GO
/****** Object:  ForeignKey [FK_UserAddresses_Users]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[UserAddresses]  WITH CHECK ADD  CONSTRAINT [FK_UserAddresses_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserAddresses] CHECK CONSTRAINT [FK_UserAddresses_Users]
GO
/****** Object:  ForeignKey [FK_UserEmails_Emails]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[UserEmails]  WITH CHECK ADD  CONSTRAINT [FK_UserEmails_Emails] FOREIGN KEY([EmailID])
REFERENCES [dbo].[Emails] ([EmailID])
GO
ALTER TABLE [dbo].[UserEmails] CHECK CONSTRAINT [FK_UserEmails_Emails]
GO
/****** Object:  ForeignKey [FK_UserEmails_Users]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[UserEmails]  WITH CHECK ADD  CONSTRAINT [FK_UserEmails_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserEmails] CHECK CONSTRAINT [FK_UserEmails_Users]
GO
/****** Object:  ForeignKey [FK_UserImages_Images]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[UserImages]  WITH CHECK ADD  CONSTRAINT [FK_UserImages_Images] FOREIGN KEY([ImageID])
REFERENCES [dbo].[Images] ([ImageID])
GO
ALTER TABLE [dbo].[UserImages] CHECK CONSTRAINT [FK_UserImages_Images]
GO
/****** Object:  ForeignKey [FK_UserImages_Users]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[UserImages]  WITH CHECK ADD  CONSTRAINT [FK_UserImages_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserImages] CHECK CONSTRAINT [FK_UserImages_Users]
GO
/****** Object:  ForeignKey [FK_UserPhones_Phones]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[UserPhones]  WITH CHECK ADD  CONSTRAINT [FK_UserPhones_Phones] FOREIGN KEY([PhoneID])
REFERENCES [dbo].[Phones] ([PhoneID])
GO
ALTER TABLE [dbo].[UserPhones] CHECK CONSTRAINT [FK_UserPhones_Phones]
GO
/****** Object:  ForeignKey [FK_UserPhones_Users]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[UserPhones]  WITH CHECK ADD  CONSTRAINT [FK_UserPhones_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserPhones] CHECK CONSTRAINT [FK_UserPhones_Users]
GO
/****** Object:  ForeignKey [FK_UserRoles_Roles]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
/****** Object:  ForeignKey [FK_UserRoles_Users]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
/****** Object:  ForeignKey [FK_Users_Users]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users] FOREIGN KEY([insuser])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Users]
GO
/****** Object:  ForeignKey [FK_Users_Users1]    Script Date: 02/24/2016 19:35:21 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users1] FOREIGN KEY([upduser])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Users1]
GO
