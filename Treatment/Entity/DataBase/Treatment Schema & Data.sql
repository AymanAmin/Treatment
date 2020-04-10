USE [master]
GO
/****** Object:  Database [ECMS]    Script Date: 4/10/2020 11:55:55 AM ******/
CREATE DATABASE [ECMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ECMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SOFTWARECORNERIT\MSSQL\DATA\ECMS.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ECMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SOFTWARECORNERIT\MSSQL\DATA\ECMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ECMS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ECMS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ECMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ECMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ECMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ECMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ECMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECMS] SET RECOVERY FULL 
GO
ALTER DATABASE [ECMS] SET  MULTI_USER 
GO
ALTER DATABASE [ECMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ECMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ECMS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ECMS]
GO
/****** Object:  Table [dbo].[Assignment_Status]    Script Date: 4/10/2020 11:55:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignment_Status](
	[Assignment_Status_Id] [int] IDENTITY(1,1) NOT NULL,
	[Assignment_Status_Name_Ar] [nvarchar](max) NULL,
	[Assignment_Status_Name_En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Assignment_Status] PRIMARY KEY CLUSTERED 
(
	[Assignment_Status_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Attachment]    Script Date: 4/10/2020 11:55:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attachment](
	[Attachment_id] [int] IDENTITY(1,1) NOT NULL,
	[Treatment_Id] [int] NULL,
	[Attachment_Path] [nvarchar](max) NULL,
 CONSTRAINT [PK_Attachment] PRIMARY KEY CLUSTERED 
(
	[Attachment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 4/10/2020 11:55:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_Id] [int] IDENTITY(1,1) NOT NULL,
	[Employee_Name_Ar] [nvarchar](max) NULL,
	[Employee_Email] [nvarchar](max) NULL,
	[Employee_Phone] [nvarchar](max) NULL,
	[Group_Id] [int] NULL,
	[Employee_Name_En] [nvarchar](max) NULL,
	[Employee_Profile] [nvarchar](max) NULL,
	[Employee_Signature] [nvarchar](max) NULL,
	[Employee_Password] [nvarchar](max) NULL,
	[Employee_Active] [bit] NULL,
	[Language_id] [int] NULL,
	[Calendar_id] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Structure]    Script Date: 4/10/2020 11:55:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Structure](
	[Employee_Structure_Id] [int] IDENTITY(1,1) NOT NULL,
	[Structure_Id] [int] NULL,
	[Employee_Id] [int] NULL,
	[Status_Structure] [bit] NULL,
	[Type_Delegation] [bit] NULL,
	[Default_Structure] [bit] NULL,
 CONSTRAINT [PK_Employee_Structure] PRIMARY KEY CLUSTERED 
(
	[Employee_Structure_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Group]    Script Date: 4/10/2020 11:55:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Group_Id] [int] IDENTITY(1,1) NOT NULL,
	[Group_Name_Ar] [nvarchar](max) NULL,
	[Group_Name_En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Group_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LanguageMaster]    Script Date: 4/10/2020 11:55:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Language_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_LanguageMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lanuage_Detials]    Script Date: 4/10/2020 11:55:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lanuage_Detials](
	[Language_Detial_ID] [int] IDENTITY(1,1) NOT NULL,
	[Language_Master_ID] [int] NULL,
	[Language_Detial_FieldName] [nvarchar](150) NULL,
	[Language_Detial_Value] [nvarchar](150) NULL,
 CONSTRAINT [PK_Lanuage_Detials] PRIMARY KEY CLUSTERED 
(
	[Language_Detial_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Log_File]    Script Date: 4/10/2020 11:55:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log_File](
	[Log_Id] [int] IDENTITY(1,1) NOT NULL,
	[Log_Date] [datetime] NULL,
	[Log_Note] [ntext] NULL,
	[Login_Id] [int] NULL,
	[Form_Id] [int] NULL,
	[Log_Name] [nvarchar](max) NULL,
	[Log_Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Log_File] PRIMARY KEY CLUSTERED 
(
	[Log_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Owner_Relationship]    Script Date: 4/10/2020 11:55:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owner_Relationship](
	[Owner_Id] [int] IDENTITY(1,1) NOT NULL,
	[Treatment_Id] [int] NULL,
	[Owner_Name] [nvarchar](max) NULL,
	[Owner_Phone] [nvarchar](max) NULL,
	[Identity_Type] [nvarchar](max) NULL,
	[Identity_Number] [nvarchar](max) NULL,
 CONSTRAINT [PK_Owner_Relationship] PRIMARY KEY CLUSTERED 
(
	[Owner_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permission]    Script Date: 4/10/2020 11:55:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Permission_Id] [int] IDENTITY(1,1) NOT NULL,
	[Permission_Name_Ar] [nvarchar](max) NULL,
	[Permission_Name_En] [nvarchar](max) NULL,
	[Parent] [int] NULL,
	[Url_Path] [nvarchar](max) NULL,
	[Permission_Icon] [nvarchar](max) NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[Permission_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permission_Group]    Script Date: 4/10/2020 11:55:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission_Group](
	[Permission_Group_Id] [int] IDENTITY(1,1) NOT NULL,
	[Permission_Id] [int] NULL,
	[Group_Id] [int] NULL,
 CONSTRAINT [PK_Permission_Group] PRIMARY KEY CLUSTERED 
(
	[Permission_Group_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Structure]    Script Date: 4/10/2020 11:55:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Structure](
	[Structure_Id] [int] IDENTITY(1,1) NOT NULL,
	[Structure_Name_Ar] [nvarchar](max) NULL,
	[Structure_Parent] [int] NULL,
	[Structure_Name_En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Structure] PRIMARY KEY CLUSTERED 
(
	[Structure_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Treatment_Class]    Script Date: 4/10/2020 11:55:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Treatment_Class](
	[Treatment_Class_Id] [int] IDENTITY(1,1) NOT NULL,
	[Treatment_Class_Name_Ar] [nvarchar](max) NULL,
	[Treatment_Class_Name_En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Treatment_Class] PRIMARY KEY CLUSTERED 
(
	[Treatment_Class_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Treatment_Confidentiality]    Script Date: 4/10/2020 11:55:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Treatment_Confidentiality](
	[Treatment_Confidentiality_Id] [int] IDENTITY(1,1) NOT NULL,
	[Treatment_Confidentiality_Name_Ar] [nvarchar](max) NULL,
	[Treatment_Confidentiality_Name_En] [nvarchar](max) NULL,
	[Css_Class] [nvarchar](50) NULL,
 CONSTRAINT [PK_Treatment_Confidentiality] PRIMARY KEY CLUSTERED 
(
	[Treatment_Confidentiality_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Treatment_Delivery]    Script Date: 4/10/2020 11:55:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Treatment_Delivery](
	[Treatment_Delivery_Id] [int] IDENTITY(1,1) NOT NULL,
	[Treatment_Delivery_Name_Ar] [nvarchar](max) NULL,
	[Treatment_Delivery_Name_En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Treatment_Delivery] PRIMARY KEY CLUSTERED 
(
	[Treatment_Delivery_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Treatment_Detial]    Script Date: 4/10/2020 11:55:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Treatment_Detial](
	[Treatment_Detial_Id] [int] IDENTITY(1,1) NOT NULL,
	[Treatment_Id] [int] NULL,
	[To_Employee_Structure_Id] [int] NULL,
	[Parent] [int] NULL,
	[Assignment_Status_Id] [int] NULL,
	[Is_Read] [bit] NULL,
	[Read_Date] [datetime] NULL,
	[Is_Delete] [bit] NULL,
	[Delete_Date] [datetime] NULL,
	[Note] [ntext] NULL,
	[Key_Word] [ntext] NULL,
	[Treatment_Copy_To] [bit] NULL,
	[Treatment_Detial_Date] [datetime] NULL,
 CONSTRAINT [PK_Treatment_Detial] PRIMARY KEY CLUSTERED 
(
	[Treatment_Detial_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Treatment_Master]    Script Date: 4/10/2020 11:55:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Treatment_Master](
	[Treatment_Id] [int] IDENTITY(1,1) NOT NULL,
	[Treatment_Subject] [nvarchar](max) NULL,
	[Treatment_Date] [datetime] NULL,
	[Create_Date] [datetime] NULL,
	[Update_Date] [datetime] NULL,
	[Treatment_Body] [ntext] NULL,
	[Required_Reply] [bit] NULL,
	[From_Employee_Structure_Id] [int] NULL,
	[Treatment_Type_Id] [int] NULL,
	[Treatment_Class_Id] [int] NULL,
	[Treatment_Priority_id] [int] NULL,
	[Treatment_Confidentiality_Id] [int] NULL,
	[Treatment_Delivery_Id] [int] NULL,
	[Treatment_Status_Id] [int] NULL,
	[Treatment_Procedure_Id] [int] NULL,
	[Prepared_Administration_Id] [int] NULL,
	[Required_Reply_Date] [datetime] NULL,
	[Treatment_Number] [nvarchar](50) NULL,
	[Treatment_Keywork] [nvarchar](max) NULL,
	[Treatment_Mother] [int] NULL,
 CONSTRAINT [PK_Treatment] PRIMARY KEY CLUSTERED 
(
	[Treatment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Treatment_Priority]    Script Date: 4/10/2020 11:55:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Treatment_Priority](
	[Treatment_Priority_Id] [int] IDENTITY(1,1) NOT NULL,
	[Treatment_Priority_Name_Ar] [nvarchar](max) NULL,
	[Treatment_Priority_Name_En] [nvarchar](max) NULL,
	[Css_Class] [nvarchar](50) NULL,
	[Card_Class] [nvarchar](50) NULL,
 CONSTRAINT [PK_Treatment_Priority] PRIMARY KEY CLUSTERED 
(
	[Treatment_Priority_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Treatment_Procedure]    Script Date: 4/10/2020 11:55:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Treatment_Procedure](
	[Treatment_Procedure_Id] [int] IDENTITY(1,1) NOT NULL,
	[Treatment_Procedure_Name_Ar] [nvarchar](max) NULL,
	[Treatment_Procedure_Name_En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Treatment_Procedure] PRIMARY KEY CLUSTERED 
(
	[Treatment_Procedure_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Treatment_Status]    Script Date: 4/10/2020 11:55:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Treatment_Status](
	[Treatment_Status_Id] [int] IDENTITY(1,1) NOT NULL,
	[Treatment_Status_Name_Ar] [nvarchar](max) NULL,
	[Treatment_Status_Name_En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Treatment_Status] PRIMARY KEY CLUSTERED 
(
	[Treatment_Status_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Treatment_Type]    Script Date: 4/10/2020 11:55:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Treatment_Type](
	[Treatment_Type_Id] [int] IDENTITY(1,1) NOT NULL,
	[Treatment_Type_Name_Ar] [nvarchar](max) NULL,
	[Treatment_Type_Name_En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Treatment_Type] PRIMARY KEY CLUSTERED 
(
	[Treatment_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Assignment_Status] ON 

INSERT [dbo].[Assignment_Status] ([Assignment_Status_Id], [Assignment_Status_Name_Ar], [Assignment_Status_Name_En]) VALUES (1, N'1', N'1')
SET IDENTITY_INSERT [dbo].[Assignment_Status] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Name_En], [Employee_Profile], [Employee_Signature], [Employee_Password], [Employee_Active], [Language_id], [Calendar_id]) VALUES (1, N'أيمن امين', N'ayman@softwarecornerit.com', N'0550932548', 1, N'Ayman Amin', N'', NULL, N'rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK', 1, 2, 1)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Name_En], [Employee_Profile], [Employee_Signature], [Employee_Password], [Employee_Active], [Language_id], [Calendar_id]) VALUES (2, N'عمر احمد', N'ayman1793@gmail.com', N'09246548451', 2, N'Omer Ahmed', N'', NULL, N'xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt', 1, 1, 0)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Name_En], [Employee_Profile], [Employee_Signature], [Employee_Password], [Employee_Active], [Language_id], [Calendar_id]) VALUES (3, N'مازن عوض', N'mazin@gmail.com', N'0550932518', 1, N'Mazin Awad', N'', NULL, N'123', 1, 2, 0)
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Employee_Structure] ON 

INSERT [dbo].[Employee_Structure] ([Employee_Structure_Id], [Structure_Id], [Employee_Id], [Status_Structure], [Type_Delegation], [Default_Structure]) VALUES (1, 1, 1, 1, 1, NULL)
INSERT [dbo].[Employee_Structure] ([Employee_Structure_Id], [Structure_Id], [Employee_Id], [Status_Structure], [Type_Delegation], [Default_Structure]) VALUES (2, 2, 2, 1, 1, NULL)
INSERT [dbo].[Employee_Structure] ([Employee_Structure_Id], [Structure_Id], [Employee_Id], [Status_Structure], [Type_Delegation], [Default_Structure]) VALUES (3, 3, 3, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Employee_Structure] OFF
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (1, N'الاداريين', N'Management')
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (2, N'الموارد البشرية', N'Human Resource')
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (3, N'الاطباء', N'Doctors')
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (5, N'هيئة التدريس', N'Teachers')
SET IDENTITY_INSERT [dbo].[Group] OFF
SET IDENTITY_INSERT [dbo].[LanguageMaster] ON 

INSERT [dbo].[LanguageMaster] ([ID], [Language_Name]) VALUES (1, N'Arabic')
INSERT [dbo].[LanguageMaster] ([ID], [Language_Name]) VALUES (2, N'English')
SET IDENTITY_INSERT [dbo].[LanguageMaster] OFF
SET IDENTITY_INSERT [dbo].[Lanuage_Detials] ON 

INSERT [dbo].[Lanuage_Detials] ([Language_Detial_ID], [Language_Master_ID], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (11, 1, N'Language-Title', N'شاشة اللغات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_ID], [Language_Master_ID], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (12, 2, N'Language-Language', N'Selected Language')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_ID], [Language_Master_ID], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (13, 2, N'Language-FieldName', N'The Field Name')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_ID], [Language_Master_ID], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (14, 2, N'PermissionGroups-ArabicName', N'Arabic Name')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_ID], [Language_Master_ID], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (15, 1, N'Default-Total', N'الكل')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_ID], [Language_Master_ID], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (16, 1, N'Default-Treatment', N'المعاملة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_ID], [Language_Master_ID], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (17, 1, N'Default-TreatmentPerMounths', N'المعاملات بالشهور')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_ID], [Language_Master_ID], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (19, 1, N'Default-Sent', N'المرسلة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_ID], [Language_Master_ID], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (20, 2, N'Language-Value', N'The Translation')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_ID], [Language_Master_ID], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (22, 1, N'Language-Value', N'الترجمة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_ID], [Language_Master_ID], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (23, 1, N'TreatmentManagement-ID', N'الرقم')
SET IDENTITY_INSERT [dbo].[Lanuage_Detials] OFF
SET IDENTITY_INSERT [dbo].[Log_File] ON 

INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (4, CAST(0x0000AB91013910AB AS DateTime), N'data:{"Employees":[],"Permission_Group":[],"Group_Id":40,"Group_Name_Ar":"5","Group_Name_En":"5"}', 1, 4, N'إنشاء مجموعة جديدة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7, CAST(0x0000AB910152188C AS DateTime), N'data:{"Employees":[],"Permission_Group":[],"Group_Id":41,"Group_Name_Ar":"6","Group_Name_En":"6"}', 1, 4, N'إنشاء مجموعة جديدة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (8, CAST(0x0000AB910167D933 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":2,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1, N'إعادة تعين كلمة السر', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9, CAST(0x0000AB91016A6C50 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":2,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (11, CAST(0x0000AB9300AE8057 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":2,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (12, CAST(0x0000AB93010951DE AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":1017,"Permission_Name_Ar":"سجل العمليات","Permission_Name_En":"Log File","Parent":1010,"Url_Path":"Pages/Admin/LogFile.aspx","Permission_Icon":""}', 1, 3, N'إضافة صلاحية جديدة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (13, CAST(0x0000AB930118D2E6 AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":1018,"Permission_Name_Ar":"المصادقة","Permission_Name_En":"Authentication","Parent":1010,"Url_Path":"Pages/Setting/Auth","Permission_Icon":""}', 1, 3, N'إضافة صلاحية جديدة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (14, CAST(0x0000AB93011917A1 AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":1019,"Permission_Name_Ar":"تسجيل دخول","Permission_Name_En":"Login","Parent":1018,"Url_Path":"Pages/Setting/Auth/Login.aspx","Permission_Icon":""}', 1, 3, N'إضافة صلاحية جديدة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (15, CAST(0x0000AB9301195264 AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":1020,"Permission_Name_Ar":"تعليق النظام","Permission_Name_En":"Lock Screen","Parent":1018,"Url_Path":"Pages/Setting/Auth/LockScreen.aspx","Permission_Icon":""}', 1, 3, N'إضافة صلاحية جديدة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (16, CAST(0x0000AB9301199251 AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":1021,"Permission_Name_Ar":"ضبط كلمة السر","Permission_Name_En":"Reset Password","Parent":1018,"Url_Path":"Pages/Setting/Auth/ResetPassword.aspx","Permission_Icon":""}', 1, 3, N'إضافة صلاحية جديدة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (17, CAST(0x0000AB93011C8341 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":2,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (18, CAST(0x0000AB93011D4F3E AS DateTime), N'data:1', 1, 4, N'تعديل صلاحيات المجموعة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (19, CAST(0x0000AB93011D6112 AS DateTime), N'data:2', 1, 4, N'تعديل صلاحيات المجموعة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (20, CAST(0x0000AB93012487C8 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":2,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (21, CAST(0x0000AB930125C79F AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":2,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (22, CAST(0x0000AB9301260F35 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":2,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (23, CAST(0x0000AB930126251B AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":2,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1020, N'إنشاء مجموعة جديدة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (24, CAST(0x0000AB930126BA2E AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":2,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (25, CAST(0x0000AB930126DEE7 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":2,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1020, N'الدخول بعد الايقاف المؤقت', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (26, CAST(0x0000AB93012742B6 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"omeralharith44@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"ArOL/MpgB3wBNAkuw0Q/uARlgkn52XJLZuKGAnCZOs5tZNnRAeFmKqq0XXFqQ4is9fEaJ81oRGYg+Eai4GykDRbxmjvTsSdk9PZ3tUScywLBH/Dig5s13xBKM16pBMuM","Employee_Active":true}', 1, 1021, N'إعادة تعين كلمة السر', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (27, CAST(0x0000AB9301296F34 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"oRHfBpCpvXqPLbUauTEZF3oAFcjijm42uiypIZCBWYdqAHnzl8MQNQMmDdxFX6vxZERZQCNMPrIL4R1eQRFdoerr9VDxD1QuiUhWV0Eary73PIpjLlfV1ecgjMbnJv8F","Employee_Active":true}', 1, 1021, N'إعادة تعين كلمة السر', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (28, CAST(0x0000AB930129FBDF AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 1, 1021, N'إعادة تعين كلمة السر', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (29, CAST(0x0000AB93012B3763 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (30, CAST(0x0000AB93012CBF6E AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (31, CAST(0x0000AB9301368DA2 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (32, CAST(0x0000AB93013C6F8F AS DateTime), N'data:1', 2, 4, N'تعديل صلاحيات المجموعة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (33, CAST(0x0000AB93013CA949 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":2,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (34, CAST(0x0000AB93013EB3A5 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":2,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (35, CAST(0x0000AB9301402A39 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (36, CAST(0x0000AB93014152A5 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (37, CAST(0x0000AB93014C9323 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":2,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (38, CAST(0x0000AB930150FF7A AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (39, CAST(0x0000AB93015B1D88 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (40, CAST(0x0000AB930163EFFA AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (41, CAST(0x0000AB9400A276B5 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (42, CAST(0x0000AB9400A3E423 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (43, CAST(0x0000AB9400A5BA80 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":2,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (44, CAST(0x0000AB9400A5CB70 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (45, CAST(0x0000AB9400BB7866 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (46, CAST(0x0000AB9400BC905F AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (47, CAST(0x0000AB9400C46F85 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (48, CAST(0x0000AB9400CAAECB AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (49, CAST(0x0000AB9400CAD10F AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":2,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (50, CAST(0x0000AB9400CAF157 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (51, CAST(0x0000AB9400CB0FC7 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (52, CAST(0x0000AB9400CB370F AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":2,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (53, CAST(0x0000AB9400CB5253 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (54, CAST(0x0000AB9400CB77E5 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (55, CAST(0x0000AB9400CDBEAF AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (56, CAST(0x0000AB9400D8A0CA AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (57, CAST(0x0000AB9400E4B792 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (58, CAST(0x0000AB94010980B9 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (59, CAST(0x0000AB950105EE63 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (60, CAST(0x0000AB9501062B51 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (61, CAST(0x0000AB95013CEB96 AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":1022,"Permission_Name_Ar":"اللغة","Permission_Name_En":"Language","Parent":1010,"Url_Path":"Pages/Admin/Language.aspx","Permission_Icon":""}', 1, 3, N'إضافة صلاحية جديدة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (62, CAST(0x0000AB950151481F AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (63, CAST(0x0000AB950151769F AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (64, CAST(0x0000AB950154F1CD AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (65, CAST(0x0000AB950156AF9E AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (66, CAST(0x0000AB9600D27DF2 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (67, CAST(0x0000AB9600DEE549 AS DateTime), N'data:1', 1, 4, N'تعديل صلاحيات المجموعة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (68, CAST(0x0000AB960123962C AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (69, CAST(0x0000AB9601271D85 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (70, CAST(0x0000AB9601408826 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (71, CAST(0x0000AB960140BB59 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (72, CAST(0x0000AB96014155CD AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (73, CAST(0x0000AB960141BDB3 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (74, CAST(0x0000AB960146E289 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (75, CAST(0x0000AB9601477F0C AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (76, CAST(0x0000AB960148C473 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (77, CAST(0x0000AB96014906EC AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (78, CAST(0x0000AB9601496AB8 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (79, CAST(0x0000AB960149C354 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (80, CAST(0x0000AB96014D5BA8 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (81, CAST(0x0000AB960150CC01 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (82, CAST(0x0000AB9601522A98 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (83, CAST(0x0000AB9601553D8F AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (84, CAST(0x0000AB97010C1098 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (85, CAST(0x0000AB970112ADE2 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (86, CAST(0x0000AB97011C5734 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (87, CAST(0x0000AB970121B574 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (88, CAST(0x0000AB9701227B02 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (89, CAST(0x0000AB9701231A4E AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (90, CAST(0x0000AB9701252E03 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (91, CAST(0x0000AB970127E396 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (92, CAST(0x0000AB97012BFDCF AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (93, CAST(0x0000AB9701332B08 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (94, CAST(0x0000AB970138E3A8 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (95, CAST(0x0000AB97013B1C46 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (96, CAST(0x0000AB97013C4E68 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (97, CAST(0x0000AB97013E491C AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (98, CAST(0x0000AB97013F53B8 AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":1023,"Permission_Name_Ar":"عرض المعاملة","Permission_Name_En":"Show Treatment","Parent":1018,"Url_Path":"Pages/Treatment/ShowTreatment.aspx","Permission_Icon":""}', 1, 3, N'إضافة صلاحية جديدة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (99, CAST(0x0000AB97013F9DEE AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (100, CAST(0x0000AB9701405281 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (101, CAST(0x0000AB9701413A30 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":1,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (102, CAST(0x0000AB970141B5CC AS DateTime), N'data:2', 2, 4, N'تعديل صلاحيات المجموعة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (103, CAST(0x0000AB9701423975 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (104, CAST(0x0000AB97014443FA AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (105, CAST(0x0000AB970144D9BA AS DateTime), N'data:2', 1, 4, N'تعديل صلاحيات المجموعة', N'')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (106, CAST(0x0000AB970144E52B AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (107, CAST(0x0000AB97014855B4 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (108, CAST(0x0000AB970149530F AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (109, CAST(0x0000AB97014D4A94 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (110, CAST(0x0000AB9701518116 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (111, CAST(0x0000AB97015630AC AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (112, CAST(0x0000AB970156DD26 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (113, CAST(0x0000AB9701579CD7 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (114, CAST(0x0000AB970157E174 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (115, CAST(0x0000AB97015B5048 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (116, CAST(0x0000AB97015C5F23 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (117, CAST(0x0000AB97015CEE85 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (118, CAST(0x0000AB97015E64E4 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (119, CAST(0x0000AB97015EE0F0 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (120, CAST(0x0000AB97015F36D4 AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (121, CAST(0x0000AB97015F98FC AS DateTime), N'data:{"Group":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (122, CAST(0x0000AB9800D9EFA4 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":null,"Calendar_id":null}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (123, CAST(0x0000AB9800DFBBFE AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":1024,"Permission_Name_Ar":"صفحتي الشخصية","Permission_Name_En":"My Profile","Parent":5,"Url_Path":"Pages/Setting/UserManagment/Profile.aspx","Permission_Icon":""}', 2, 3, N'إضافة صلاحية جديدة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (124, CAST(0x0000AB9800DFCA9F AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":2,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (125, CAST(0x0000AB9800DFE514 AS DateTime), N'data:1', 2, 4, N'تعديل صلاحيات المجموعة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (126, CAST(0x0000AB9800DFF33F AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":2,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (127, CAST(0x0000AB9800E41191 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":2,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (128, CAST(0x0000AB9800E52B02 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":2,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (129, CAST(0x0000AB9800E5A902 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (130, CAST(0x0000AB9800E7017A AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (131, CAST(0x0000AB9800E7A314 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (132, CAST(0x0000AB9800E80087 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (133, CAST(0x0000AB9800E865B3 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (134, CAST(0x0000AB9800EAD74F AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (135, CAST(0x0000AB9800EC173A AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (136, CAST(0x0000AB9800ED626D AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (137, CAST(0x0000AB9800F477CC AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (138, CAST(0x0000AB9800FDFF25 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true,"Language_id":2,"Calendar_id":0}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (139, CAST(0x0000AB98010542EC AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (140, CAST(0x0000AB98010829FE AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (141, CAST(0x0000AB980109DF51 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (142, CAST(0x0000AB98010D15C6 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (143, CAST(0x0000AB98010ED525 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true,"Language_id":2,"Calendar_id":0}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (144, CAST(0x0000AB98010FF6AE AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (145, CAST(0x0000AB9801120D5C AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true,"Language_id":2,"Calendar_id":0}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (146, CAST(0x0000AB98011252B7 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true,"Language_id":2,"Calendar_id":0}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (147, CAST(0x0000AB980112961A AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (148, CAST(0x0000AB9801154286 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (149, CAST(0x0000AB9801186C78 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true,"Language_id":2,"Calendar_id":0}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (150, CAST(0x0000AB980118FB41 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true,"Language_id":2,"Calendar_id":0}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (151, CAST(0x0000AB980119CFEA AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true,"Language_id":2,"Calendar_id":0}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (152, CAST(0x0000AB98011A1642 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true,"Language_id":2,"Calendar_id":0}', 1, 1022, N'تم تعديل الترجمة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (153, CAST(0x0000AB98011ADFA2 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true,"Language_id":2,"Calendar_id":0}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (154, CAST(0x0000AB98011BD65C AS DateTime), N'data:{"LanguageMaster":null,"Language_Detial_ID":15,"Language_Master_ID":1,"Language_Detial_FieldName":"Default-Total","Language_Detial_Value":"الكل"}', 1, 1022, N'تم تعديل الترجمة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (155, CAST(0x0000AB98011D9D7C AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true,"Language_id":2,"Calendar_id":0}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (156, CAST(0x0000AB98011E85F1 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true,"Language_id":2,"Calendar_id":0}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (157, CAST(0x0000AB98011EA97D AS DateTime), N'data:{"LanguageMaster":null,"Language_Detial_ID":20,"Language_Master_ID":2,"Language_Detial_FieldName":"Language-Value","Language_Detial_Value":"The Translation"}', 1, 1022, N'تم تعديل الترجمة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (158, CAST(0x0000AB98012152B6 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (159, CAST(0x0000AB98012198CA AS DateTime), N'data:{"LanguageMaster":null,"Language_Detial_ID":22,"Language_Master_ID":1,"Language_Detial_FieldName":"Language-Value","Language_Detial_Value":"الترجمة"}', 2, 1022, N'تم اضافة ترجمة جديدة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (160, CAST(0x0000AB980128DB33 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (161, CAST(0x0000AB9801290CED AS DateTime), N'data:{"Language_Detial_ID":18,"Language_Master_ID":1,"Language_Detial_FieldName":"Default-AllTreatment","Language_Detial_Value":"كل المعاملات","LanguageMaster":null}', 2, 1022, N'تم حذف الترجمة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (162, CAST(0x0000AB98012D25A9 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (163, CAST(0x0000AB98012D9504 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (164, CAST(0x0000AB98012EBA7B AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true,"Language_id":2,"Calendar_id":0}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (165, CAST(0x0000AB98012F7FFA AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (166, CAST(0x0000AB98013007F6 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (167, CAST(0x0000AB98013021F7 AS DateTime), N'data:{"Treatment_Master":[],"Treatment_Priority_Id":1,"Treatment_Priority_Name_Ar":"عادية","Treatment_Priority_Name_En":"Normal","Css_Class":"icofont icofont-star text-success","Card_Class":"card card-border-success"}', 2, 6, N'تم تعديل اولوية', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (168, CAST(0x0000AB9801308FC5 AS DateTime), N'data:{"Treatment_Master":[],"Treatment_Priority_Id":3,"Treatment_Priority_Name_Ar":"تجربة","Treatment_Priority_Name_En":"Try","Css_Class":"Class Css","Card_Class":"Class Card"}', 2, 6, N'تم اضافة اولوية جديدة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (169, CAST(0x0000AB980130A2E3 AS DateTime), N'data:{"Treatment_Priority_Id":3,"Treatment_Priority_Name_Ar":"تجربة","Treatment_Priority_Name_En":"Try","Css_Class":"Class Css","Card_Class":"Class Card","Treatment_Master":[]}', 2, 6, N'تم حذف الاولوية', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (170, CAST(0x0000AB9801333049 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true,"Language_id":2,"Calendar_id":0}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (171, CAST(0x0000AB980133DDDC AS DateTime), N'data:{"Treatment_Master":[],"Treatment_Confidentiality_Id":1,"Treatment_Confidentiality_Name_Ar":"عادي","Treatment_Confidentiality_Name_En":"Normal - Edited","Css_Class":"label label-success"}', 1, 6, N'تم تعديل اولوية', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (172, CAST(0x0000AB980134475F AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true,"Language_id":2,"Calendar_id":0}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (173, CAST(0x0000AB98013462F3 AS DateTime), N'data:{"Treatment_Master":[],"Treatment_Confidentiality_Id":1,"Treatment_Confidentiality_Name_Ar":"عادي","Treatment_Confidentiality_Name_En":"Normal ","Css_Class":"label label-success"}', 1, 6, N'تم تعديل درجة السرية', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (174, CAST(0x0000AB980134A4A0 AS DateTime), N'data:{"Treatment_Master":[],"Treatment_Confidentiality_Id":3,"Treatment_Confidentiality_Name_Ar":"تجربة اضافة درحة سرية","Treatment_Confidentiality_Name_En":"Try to add Confidentiality","Css_Class":"label label-success"}', 1, 6, N'تم اضافة درجة سرية', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (175, CAST(0x0000AB980134C61E AS DateTime), N'data:{"Treatment_Confidentiality_Id":3,"Treatment_Confidentiality_Name_Ar":"تجربة اضافة درحة سرية","Treatment_Confidentiality_Name_En":"Try to add Confidentiality","Css_Class":"label label-success","Treatment_Master":[]}', 1, 6, N'تم حذف درجة سرية', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (176, CAST(0x0000AB9801355BBA AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true,"Language_id":1,"Calendar_id":1}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (177, CAST(0x0000AB9801366405 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true,"Language_id":1,"Calendar_id":1}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (178, CAST(0x0000AB980136B7A9 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true,"Language_id":2,"Calendar_id":1}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (179, CAST(0x0000AB98013C7CFF AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (180, CAST(0x0000AB98013D090C AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (181, CAST(0x0000AB98013D3D69 AS DateTime), N'data:{"Treatment_Master":[],"Treatment_Type_Id":1,"Treatment_Type_Name_Ar":"سرية","Treatment_Type_Name_En":"Secrit"}', 2, 6, N'تم تعديل نوع', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (182, CAST(0x0000AB98013D77DB AS DateTime), N'data:{"Treatment_Master":[],"Treatment_Type_Id":4,"Treatment_Type_Name_Ar":"تجربة اضافة نوع","Treatment_Type_Name_En":"Try to add Type of treatment"}', 2, 6, N'تم اضافة نوع جديد', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (183, CAST(0x0000AB98013D7D4F AS DateTime), N'data:{"Treatment_Type_Id":4,"Treatment_Type_Name_Ar":"تجربة اضافة نوع","Treatment_Type_Name_En":"Try to add Type of treatment","Treatment_Master":[]}', 2, 6, N'تم حذف النوع ', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (184, CAST(0x0000AB98013F9A43 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (185, CAST(0x0000AB98013FF622 AS DateTime), N'data:{"Treatment_Master":[],"Treatment_Status_Id":1,"Treatment_Status_Name_Ar":"جديدة","Treatment_Status_Name_En":"New - Edited"}', 2, 6, N'تم تعديل حالة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (186, CAST(0x0000AB98014000C6 AS DateTime), N'data:{"Treatment_Master":[],"Treatment_Status_Id":1,"Treatment_Status_Name_Ar":"جديدة","Treatment_Status_Name_En":"New"}', 2, 6, N'تم تعديل حالة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (187, CAST(0x0000AB9801401857 AS DateTime), N'data:{"Treatment_Master":[],"Treatment_Status_Id":4,"Treatment_Status_Name_Ar":"تجربة اضافة حالة","Treatment_Status_Name_En":"Try To add status"}', 2, 6, N'تم اضافة نوع جديد', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (188, CAST(0x0000AB9801401AEF AS DateTime), N'data:{"Treatment_Status_Id":4,"Treatment_Status_Name_Ar":"تجربة اضافة حالة","Treatment_Status_Name_En":"Try To add status","Treatment_Master":[]}', 2, 6, N'تم حذف حالة ', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (189, CAST(0x0000AB9801438D7F AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true,"Language_id":2,"Calendar_id":1}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (190, CAST(0x0000AB9801440357 AS DateTime), N'data:{"Treatment_Master":[],"Treatment_Procedure_Id":2,"Treatment_Procedure_Name_Ar":"للاحاطة","Treatment_Procedure_Name_En":"Briefing"}', 1, 6, N'تم اضافة اجراء جديد', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (191, CAST(0x0000AB9801443898 AS DateTime), N'data:{"Treatment_Master":[],"Treatment_Procedure_Id":3,"Treatment_Procedure_Name_Ar":"تجربة اضافة اجراء","Treatment_Procedure_Name_En":"Try to add Procedure"}', 1, 6, N'تم اضافة اجراء جديد', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (192, CAST(0x0000AB9801445208 AS DateTime), N'data:{"Treatment_Master":[],"Treatment_Procedure_Id":3,"Treatment_Procedure_Name_Ar":"تجربة اضافة اجراء (تعديل الاجراء)","Treatment_Procedure_Name_En":"Try to add Procedure"}', 1, 6, N'تم تعديل اجراء', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (193, CAST(0x0000AB980144555B AS DateTime), N'data:{"Treatment_Procedure_Id":3,"Treatment_Procedure_Name_Ar":"تجربة اضافة اجراء (تعديل الاجراء)","Treatment_Procedure_Name_En":"Try to add Procedure","Treatment_Master":[]}', 1, 6, N'تم حذف اجراء ', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (194, CAST(0x0000AB980147961F AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true,"Language_id":2,"Calendar_id":1}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (195, CAST(0x0000AB980147D15A AS DateTime), N'data:{"Treatment_Master":[],"Treatment_Delivery_Id":2,"Treatment_Delivery_Name_Ar":"ليس بعد","Treatment_Delivery_Name_En":"Not Yet"}', 1, 6, N'تم اضافة حالة تسليم جديدة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (196, CAST(0x0000AB980147DC1A AS DateTime), N'data:{"Treatment_Master":[],"Treatment_Delivery_Id":2,"Treatment_Delivery_Name_Ar":"ليس بعد","Treatment_Delivery_Name_En":"Not Yet - Edite"}', 1, 6, N'تم تعديل حالة التسليم', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (197, CAST(0x0000AB980147E055 AS DateTime), N'data:{"Treatment_Delivery_Id":2,"Treatment_Delivery_Name_Ar":"ليس بعد","Treatment_Delivery_Name_En":"Not Yet - Edite","Treatment_Master":[]}', 1, 6, N'تم حذف حالة التسليم ', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (198, CAST(0x0000AB980147F6DA AS DateTime), N'data:{"Treatment_Master":[],"Treatment_Delivery_Id":3,"Treatment_Delivery_Name_Ar":"ليس بعد","Treatment_Delivery_Name_En":"Not Yet"}', 1, 6, N'تم اضافة حالة تسليم جديدة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (199, CAST(0x0000AB980148364E AS DateTime), N'data:{"Treatment_Master":[],"Treatment_Class_Id":2,"Treatment_Class_Name_Ar":"للاحالة","Treatment_Class_Name_En":"To Resend Again"}', 1, 6, N'تم اضافة حالة تصنيف جديد', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (200, CAST(0x0000AB9801484256 AS DateTime), N'data:{"Treatment_Master":[],"Treatment_Class_Id":2,"Treatment_Class_Name_Ar":"للاحالة","Treatment_Class_Name_En":"To Resend Again - Edited"}', 1, 6, N'تم تعديل تصنيف', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (201, CAST(0x0000AB9801484433 AS DateTime), N'data:{"Treatment_Class_Id":2,"Treatment_Class_Name_Ar":"للاحالة","Treatment_Class_Name_En":"To Resend Again - Edited","Treatment_Master":[]}', 1, 6, N'تم حذف تصنيف', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (202, CAST(0x0000AB9801498F48 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (203, CAST(0x0000AB98014A0C92 AS DateTime), N'data:{"LanguageMaster":null,"Language_Detial_ID":23,"Language_Master_ID":1,"Language_Detial_FieldName":"TreatmentManagement-ID","Language_Detial_Value":"الرقم"}', 2, 1022, N'تم اضافة ترجمة جديدة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (204, CAST(0x0000AB98014AC68C AS DateTime), N'data:{"LanguageMaster":null,"Language_Detial_ID":24,"Language_Master_ID":1,"Language_Detial_FieldName":"TreatmentManagement-ClassCard","Language_Detial_Value":"تصميم البطاقة"}', 2, 1022, N'تم اضافة ترجمة جديدة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (205, CAST(0x0000AB98014B3653 AS DateTime), N'data:{"Language_Detial_ID":24,"Language_Master_ID":1,"Language_Detial_FieldName":"TreatmentManagement-ClassCard","Language_Detial_Value":"تصميم البطاقة","LanguageMaster":null}', 2, 1022, N'تم حذف الترجمة', N'')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (206, CAST(0x0000AB98014C1E96 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (207, CAST(0x0000AB98014C31B4 AS DateTime), N'data:{"Treatment_Priority_Id":1,"Treatment_Priority_Name_Ar":"عادية","Treatment_Priority_Name_En":"Normal","Css_Class":"icofont icofont-star text-success","Card_Class":"card card-border-success","Treatment_Master":[]}', 2, 6, N'تم حذف الاولوية', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (208, CAST(0x0000AB98014C3625 AS DateTime), N'data:{"Treatment_Priority_Id":1,"Treatment_Priority_Name_Ar":"عادية","Treatment_Priority_Name_En":"Normal","Css_Class":"icofont icofont-star text-success","Card_Class":"card card-border-success","Treatment_Master":[]}', 2, 6, N'تم حذف الاولوية', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (209, CAST(0x0000AB98014C5313 AS DateTime), N'data:{"Treatment_Priority_Id":1,"Treatment_Priority_Name_Ar":"عادية","Treatment_Priority_Name_En":"Normal","Css_Class":"icofont icofont-star text-success","Card_Class":"card card-border-success","Treatment_Master":[]}', 2, 6, N'تم حذف الاولوية', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (210, CAST(0x0000AB98014DC80D AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":2,"Employee_Name_Ar":"عمر احمد","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"09246548451","Group_Id":2,"Employee_Name_En":"Omer Ahmed","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"xmwvhpRHlwhuKQ7yMJeYPzopSKzrH2t8aL+3iwNOpIAi3vuAxkU+U4S0fgfH2kEQY20ycP50RWr/vBwCFhZ1axWYRTHqpwXlcyjOiacmgtUNgPdmGvoDyQ2XuG/JyzWt","Employee_Active":true,"Language_id":1,"Calendar_id":0}', 2, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (211, CAST(0x0000AB98014DDAD5 AS DateTime), N'data:{"Treatment_Priority_Id":1,"Treatment_Priority_Name_Ar":"عادية","Treatment_Priority_Name_En":"Normal","Css_Class":"icofont icofont-star text-success","Card_Class":"card card-border-success","Treatment_Master":[]}', 2, 6, N'تم حذف الاولوية', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (212, CAST(0x0000AB980150A0CA AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true,"Language_id":2,"Calendar_id":1}', 1, 1019, N'تسجيل دخول', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (213, CAST(0x0000AB98015149BC AS DateTime), N'data:{"LanguageMaster":null,"Language_Detial_ID":14,"Language_Master_ID":2,"Language_Detial_FieldName":"PermissionGroups-ArabicName","Language_Detial_Value":"Arabic Name"}', 1, 1022, N'تم تعديل الترجمة', N'')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (214, CAST(0x0000AB980155116A AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Employee_Structure":[],"Log_File":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Name_En":"Ayman Amin","Employee_Profile":"","Employee_Signature":null,"Employee_Password":"rsmlPTyipCXiC1khSwZCGewkDreD0DDyysJvad1ST03IA65wnPRKk+RkBGiF6EpWgc6hLKvPTXDs5ZTSw5hHsYY/YmZ5o8RXJmyQLUrGuLC7oop+2QdR1Wga4lR/FGLK","Employee_Active":true,"Language_id":2,"Calendar_id":1}', 1, 1019, N'تسجيل دخول', N'')
SET IDENTITY_INSERT [dbo].[Log_File] OFF
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (1, N'المعاملات', N'Treatment', 0, N'Pages/Treatment/', N'icofont icofont-email')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (2, N'الصلاحيات', N'Permissions', 0, N'Pages/Setting/UserManagment/', N'icofont icofont-ui-settings')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (3, N'إنشاء صلاحيات', N'Create Permissions', 1010, N'Pages/Setting/UserManagment/Permissions.aspx', N'icofont icofont-navigation-menu')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (4, N'المجموعات و الصلاحيات', N'Groups & Permission', 2, N'Pages/Setting/UserManagment/PermissionGroups.aspx', N'icofont icofont-navigation-menu')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (5, N'إدارة الموظفين', N'Employee Managment', 0, N'Pages/Setting/TreatmentManagment/', N'icofont icofont-user-suited')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (6, N'قوائم المعاملات', N'Treatment Lookup', 1010, N'Pages/Setting/TreatmentManagement/TreatmentManagement.aspx', N'icofont icofont-navigation-menu')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (1009, N'أنشاء معاملة', N'New Treatment', 1, N'Pages/Treatment/NewTreatment.aspx', N'icofont icofont-ui-add')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (1010, N'إعدادات النظام', N'System Configuration', 0, N'Pages/Admin/', N'icofont icofont-ui-lock')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (1011, N'الهيكل التنظيمي', N'Structure', 5, N'Pages/Setting/UserManagment/Structure.aspx', N'')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (1012, N'الوارد', N'Inbox', 1, N'Pages/Treatment/Inbox.aspx', N'')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (1013, N'الموظفين', N'Employees', 5, N'Pages/Setting/UserManagment/Employees.aspx', NULL)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (1017, N'سجل العمليات', N'Log File', 1010, N'Pages/Admin/LogFile.aspx', N'')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (1018, N'بعض الصفحات', N'Some Pages ', 1010, NULL, NULL)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (1019, N'تسجيل دخول', N'Login', 1018, N'Pages/Setting/Auth/Login.aspx', N'')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (1020, N'تعليق النظام', N'Lock Screen', 1018, N'Pages/Setting/Auth/LockScreen.aspx', N'')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (1021, N'ضبط كلمة السر', N'Reset Password', 1018, N'Pages/Setting/Auth/ResetPassword.aspx', N'')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (1022, N'اللغة', N'Language', 1010, N'Pages/Admin/Language.aspx', N'')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (1023, N'عرض المعاملة', N'Show Treatment', 1018, N'Pages/Treatment/ShowTreatment.aspx', N'')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (1024, N'صفحتي الشخصية', N'My Profile', 5, N'Pages/Setting/UserManagment/Profile.aspx', N'')
SET IDENTITY_INSERT [dbo].[Permission] OFF
SET IDENTITY_INSERT [dbo].[Permission_Group] ON 

INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (98, 1, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (99, 2, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (100, 3, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (101, 4, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (102, 5, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (103, 6, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (104, 1009, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (105, 1011, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (106, 1012, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (107, 1013, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (108, 1017, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (109, 1019, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (110, 1020, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (111, 1021, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (112, 1022, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (113, 1023, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (114, 1010, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (115, 1, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (116, 2, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (117, 3, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (118, 4, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (119, 5, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (120, 6, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (121, 1009, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (122, 1010, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (123, 1011, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (124, 1012, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (125, 1013, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (126, 1017, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (127, 1018, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (128, 1019, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (129, 1020, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (130, 1021, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (131, 1022, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (132, 1024, 1)
SET IDENTITY_INSERT [dbo].[Permission_Group] OFF
SET IDENTITY_INSERT [dbo].[Structure] ON 

INSERT [dbo].[Structure] ([Structure_Id], [Structure_Name_Ar], [Structure_Parent], [Structure_Name_En]) VALUES (1, N'مجلس الامناء', 0, N'مجلس الامناء')
INSERT [dbo].[Structure] ([Structure_Id], [Structure_Name_Ar], [Structure_Parent], [Structure_Name_En]) VALUES (2, N'مجلس الجامعة', 1, N'مجلس الجامعة')
INSERT [dbo].[Structure] ([Structure_Id], [Structure_Name_Ar], [Structure_Parent], [Structure_Name_En]) VALUES (3, N'مجلس الادارة', 1, N'مجلس الادارة')
INSERT [dbo].[Structure] ([Structure_Id], [Structure_Name_Ar], [Structure_Parent], [Structure_Name_En]) VALUES (4, N'الكليات', 2, N'الكليات')
INSERT [dbo].[Structure] ([Structure_Id], [Structure_Name_Ar], [Structure_Parent], [Structure_Name_En]) VALUES (5, N'كلية الطب', 4, N'كلية الطب')
INSERT [dbo].[Structure] ([Structure_Id], [Structure_Name_Ar], [Structure_Parent], [Structure_Name_En]) VALUES (6, N'كلية الصيدلة', 4, N'كلية الصيدلة')
SET IDENTITY_INSERT [dbo].[Structure] OFF
SET IDENTITY_INSERT [dbo].[Treatment_Class] ON 

INSERT [dbo].[Treatment_Class] ([Treatment_Class_Id], [Treatment_Class_Name_Ar], [Treatment_Class_Name_En]) VALUES (1, N'تعميم', N'For All')
SET IDENTITY_INSERT [dbo].[Treatment_Class] OFF
SET IDENTITY_INSERT [dbo].[Treatment_Confidentiality] ON 

INSERT [dbo].[Treatment_Confidentiality] ([Treatment_Confidentiality_Id], [Treatment_Confidentiality_Name_Ar], [Treatment_Confidentiality_Name_En], [Css_Class]) VALUES (1, N'عادي', N'Normal ', N'label label-success')
INSERT [dbo].[Treatment_Confidentiality] ([Treatment_Confidentiality_Id], [Treatment_Confidentiality_Name_Ar], [Treatment_Confidentiality_Name_En], [Css_Class]) VALUES (2, N'سري', N'Sercrit', N'label label-danger')
SET IDENTITY_INSERT [dbo].[Treatment_Confidentiality] OFF
SET IDENTITY_INSERT [dbo].[Treatment_Delivery] ON 

INSERT [dbo].[Treatment_Delivery] ([Treatment_Delivery_Id], [Treatment_Delivery_Name_Ar], [Treatment_Delivery_Name_En]) VALUES (1, N'تم الاسلام', N'Delivered')
INSERT [dbo].[Treatment_Delivery] ([Treatment_Delivery_Id], [Treatment_Delivery_Name_Ar], [Treatment_Delivery_Name_En]) VALUES (3, N'ليس بعد', N'Not Yet')
SET IDENTITY_INSERT [dbo].[Treatment_Delivery] OFF
SET IDENTITY_INSERT [dbo].[Treatment_Detial] ON 

INSERT [dbo].[Treatment_Detial] ([Treatment_Detial_Id], [Treatment_Id], [To_Employee_Structure_Id], [Parent], [Assignment_Status_Id], [Is_Read], [Read_Date], [Is_Delete], [Delete_Date], [Note], [Key_Word], [Treatment_Copy_To], [Treatment_Detial_Date]) VALUES (1022, 1007, 2, 0, 1, 0, NULL, 0, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Treatment_Detial] ([Treatment_Detial_Id], [Treatment_Id], [To_Employee_Structure_Id], [Parent], [Assignment_Status_Id], [Is_Read], [Read_Date], [Is_Delete], [Delete_Date], [Note], [Key_Word], [Treatment_Copy_To], [Treatment_Detial_Date]) VALUES (1023, 1008, 1, 0, 1, 0, NULL, 0, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Treatment_Detial] ([Treatment_Detial_Id], [Treatment_Id], [To_Employee_Structure_Id], [Parent], [Assignment_Status_Id], [Is_Read], [Read_Date], [Is_Delete], [Delete_Date], [Note], [Key_Word], [Treatment_Copy_To], [Treatment_Detial_Date]) VALUES (1024, 1008, 2, 0, 1, 0, NULL, 0, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Treatment_Detial] ([Treatment_Detial_Id], [Treatment_Id], [To_Employee_Structure_Id], [Parent], [Assignment_Status_Id], [Is_Read], [Read_Date], [Is_Delete], [Delete_Date], [Note], [Key_Word], [Treatment_Copy_To], [Treatment_Detial_Date]) VALUES (1025, 1009, 2, 0, 1, 0, NULL, 0, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Treatment_Detial] ([Treatment_Detial_Id], [Treatment_Id], [To_Employee_Structure_Id], [Parent], [Assignment_Status_Id], [Is_Read], [Read_Date], [Is_Delete], [Delete_Date], [Note], [Key_Word], [Treatment_Copy_To], [Treatment_Detial_Date]) VALUES (1026, 1009, 1, 0, 1, 0, NULL, 0, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Treatment_Detial] ([Treatment_Detial_Id], [Treatment_Id], [To_Employee_Structure_Id], [Parent], [Assignment_Status_Id], [Is_Read], [Read_Date], [Is_Delete], [Delete_Date], [Note], [Key_Word], [Treatment_Copy_To], [Treatment_Detial_Date]) VALUES (1027, 1009, 3, 0, 1, 0, NULL, 0, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Treatment_Detial] ([Treatment_Detial_Id], [Treatment_Id], [To_Employee_Structure_Id], [Parent], [Assignment_Status_Id], [Is_Read], [Read_Date], [Is_Delete], [Delete_Date], [Note], [Key_Word], [Treatment_Copy_To], [Treatment_Detial_Date]) VALUES (1028, 1010, 1, 0, 1, 0, NULL, 0, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Treatment_Detial] ([Treatment_Detial_Id], [Treatment_Id], [To_Employee_Structure_Id], [Parent], [Assignment_Status_Id], [Is_Read], [Read_Date], [Is_Delete], [Delete_Date], [Note], [Key_Word], [Treatment_Copy_To], [Treatment_Detial_Date]) VALUES (1029, 1010, 3, 0, 1, 0, NULL, 0, NULL, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Treatment_Detial] OFF
SET IDENTITY_INSERT [dbo].[Treatment_Master] ON 

INSERT [dbo].[Treatment_Master] ([Treatment_Id], [Treatment_Subject], [Treatment_Date], [Create_Date], [Update_Date], [Treatment_Body], [Required_Reply], [From_Employee_Structure_Id], [Treatment_Type_Id], [Treatment_Class_Id], [Treatment_Priority_id], [Treatment_Confidentiality_Id], [Treatment_Delivery_Id], [Treatment_Status_Id], [Treatment_Procedure_Id], [Prepared_Administration_Id], [Required_Reply_Date], [Treatment_Number], [Treatment_Keywork], [Treatment_Mother]) VALUES (1007, N'Text messaging', CAST(0x0000AB9700000000 AS DateTime), CAST(0x0000AB97013E9864 AS DateTime), CAST(0x0000AB97013E9864 AS DateTime), N'<h1>Text messaging</h1>

<div class="mw-body-content" id="bodyContent">
<div class="noprint" id="siteSub">From Wikipedia, the free encyclopedia</div>

<div id="contentSub">&nbsp;</div>

<div id="jump-to-nav">&nbsp;</div>
<a class="mw-jump-link" href="https://en.wikipedia.org/wiki/Text_messaging#mw-head">Jump to navigation</a> <a class="mw-jump-link" href="https://en.wikipedia.org/wiki/Text_messaging#p-search">Jump to search</a>

<div class="mw-content-ltr" dir="ltr" id="mw-content-text" lang="en">
<div class="mw-parser-output">
<div class="hatnote navigation-not-searchable">&quot;Txt msg&quot; redirects here. For the TV series, see <a href="https://en.wikipedia.org/wiki/Pop-Up_Video" title="Pop-Up Video">Pop-Up Video</a>.</div>

<p><strong>Text messaging</strong>, or <strong>texting</strong>, is the act of composing and sending electronic messages, typically consisting of alphabetic and numeric characters, between two or more users of <a href="https://en.wikipedia.org/wiki/Mobile_device" title="Mobile device">mobile devices</a>, <a href="https://en.wikipedia.org/wiki/Desktop_computer" title="Desktop computer">desktops</a>/<a href="https://en.wikipedia.org/wiki/Laptop" title="Laptop">laptops</a>, or other type of compatible computer. Text messages may be sent over a <a href="https://en.wikipedia.org/wiki/Cellular_network" title="Cellular network">cellular network</a>, or may also be sent via an <a href="https://en.wikipedia.org/wiki/Internet" title="Internet">Internet</a> connection.</p>

<p>The term originally referred to messages sent using the <a href="https://en.wikipedia.org/wiki/SMS" title="SMS">Short Message Service</a> (SMS). It has grown beyond alphanumeric text to include multimedia messages using the <a href="https://en.wikipedia.org/wiki/Multimedia_Messaging_Service" title="Multimedia Messaging Service">Multimedia Messaging Service</a> (MMS) containing digital images, videos, and sound content, as well as ideograms known as <a href="https://en.wikipedia.org/wiki/Emoji" title="Emoji">emoji</a> (<a href="https://en.wikipedia.org/wiki/Smiley" title="Smiley">happy faces</a>, sad faces, and other icons).</p>
</div>
</div>
</div>
', 0, 1, 1, 1, 1, 1, 1, 1, 1, 4, NULL, N'202001007', NULL, 0)
INSERT [dbo].[Treatment_Master] ([Treatment_Id], [Treatment_Subject], [Treatment_Date], [Create_Date], [Update_Date], [Treatment_Body], [Required_Reply], [From_Employee_Structure_Id], [Treatment_Type_Id], [Treatment_Class_Id], [Treatment_Priority_id], [Treatment_Confidentiality_Id], [Treatment_Delivery_Id], [Treatment_Status_Id], [Treatment_Procedure_Id], [Prepared_Administration_Id], [Required_Reply_Date], [Treatment_Number], [Treatment_Keywork], [Treatment_Mother]) VALUES (1008, N'مقالة اليوم المختارة', CAST(0x0000AB9700000000 AS DateTime), CAST(0x0000AB97014927C5 AS DateTime), CAST(0x0000AB97014927C5 AS DateTime), N'<p dir="rtl"><strong><a href="https://ar.wikipedia.org/wiki/%D8%A7%D9%84%D9%85%D8%BA%D8%B1%D8%A8" title="المغرب">المغرب</a></strong> أو <strong><a href="https://ar.wikipedia.org/wiki/%D8%A7%D9%84%D9%85%D8%BA%D8%B1%D8%A8" title="المغرب">المملكة المغربية</a></strong> هي دولة عربية إسلامية ذات سيادة كاملة. عاصمتها <a href="https://ar.wikipedia.org/wiki/%D8%A7%D9%84%D8%B1%D8%A8%D8%A7%D8%B7" title="الرباط">الرباط</a>، ولغتها الرسمية هي <a class="mw-redirect" href="https://ar.wikipedia.org/wiki/%D9%84%D8%BA%D8%A9_%D8%B9%D8%B1%D8%A8%D9%8A%D8%A9" title="لغة عربية">العربية</a> وأضيفت إليها <a class="mw-redirect" href="https://ar.wikipedia.org/wiki/%D9%84%D8%BA%D8%A9_%D8%A3%D9%85%D8%A7%D8%B2%D9%8A%D8%BA%D9%8A%D8%A9" title="لغة أمازيغية">الأمازيغية</a> حديثاً. تعتبر جزءاً من <a href="https://ar.wikipedia.org/wiki/%D8%A7%D9%84%D9%85%D8%BA%D8%B1%D8%A8_%D8%A7%D9%84%D8%B9%D8%B1%D8%A8%D9%8A" title="المغرب العربي">المغرب العربي</a> الكبير، وتقع في أقصى غربي <a href="https://ar.wikipedia.org/wiki/%D8%B4%D9%85%D8%A7%D9%84_%D8%A3%D9%81%D8%B1%D9%8A%D9%82%D9%8A%D8%A7" title="شمال أفريقيا">شمال أفريقيا</a>، وتطل على <a href="https://ar.wikipedia.org/wiki/%D8%A7%D9%84%D8%A8%D8%AD%D8%B1_%D8%A7%D9%84%D8%A3%D8%A8%D9%8A%D8%B6_%D8%A7%D9%84%D9%85%D8%AA%D9%88%D8%B3%D8%B7" title="البحر الأبيض المتوسط">البحر المتوسط</a> شمالا <a href="https://ar.wikipedia.org/wiki/%D8%A7%D9%84%D9%85%D8%AD%D9%8A%D8%B7_%D8%A7%D9%84%D8%A3%D8%B7%D9%84%D8%B3%D9%8A" title="المحيط الأطلسي">والمحيط الأطلسي</a> غربا، ويتوسطهما <a href="https://ar.wikipedia.org/wiki/%D9%85%D8%B6%D9%8A%D9%82_%D8%AC%D8%A8%D9%84_%D8%B7%D8%A7%D8%B1%D9%82" title="مضيق جبل طارق">مضيق جبل طارق</a>. تحدها شرقا <a href="https://ar.wikipedia.org/wiki/%D8%A7%D9%84%D8%AC%D8%B2%D8%A7%D8%A6%D8%B1" title="الجزائر">الجزائر</a> وجنوبا <a href="https://ar.wikipedia.org/wiki/%D9%85%D9%88%D8%B1%D9%8A%D8%AA%D8%A7%D9%86%D9%8A%D8%A7" title="موريتانيا">موريتانيا</a>؛ تقابلها شمالا <a href="https://ar.wikipedia.org/wiki/%D8%A5%D8%B3%D8%A8%D8%A7%D9%86%D9%8A%D8%A7" title="إسبانيا">إسبانيا</a> <a href="https://ar.wikipedia.org/wiki/%D8%A7%D9%84%D8%A8%D8%B1%D8%AA%D8%BA%D8%A7%D9%84" title="البرتغال">والبرتغال</a> <a class="mw-redirect" href="https://ar.wikipedia.org/wiki/%D8%AC%D8%A8%D9%84_%D8%B7%D8%A7%D8%B1%D9%82_(%D9%85%D9%86%D8%B7%D9%82%D8%A9_%D8%AD%D9%83%D9%85_%D8%B0%D8%A7%D8%AA%D9%8A)" title="جبل طارق (منطقة حكم ذاتي)">وجبل طارق</a>. ترفض بعض الجهات سيادتها على <a href="https://ar.wikipedia.org/wiki/%D8%A7%D9%84%D8%B5%D8%AD%D8%B1%D8%A7%D8%A1_%D8%A7%D9%84%D8%BA%D8%B1%D8%A8%D9%8A%D8%A9" title="الصحراء الغربية">إقليم الصحراء الغربية</a>. كان للمغرب تأثير كبير على منطقة <a href="https://ar.wikipedia.org/wiki/%D8%A7%D9%84%D9%85%D8%BA%D8%B1%D8%A8_%D8%A7%D9%84%D9%83%D8%A8%D9%8A%D8%B1" title="المغرب الكبير">المغرب الكبير</a> <a href="https://ar.wikipedia.org/wiki/%D8%A7%D9%84%D8%A3%D9%86%D8%AF%D9%84%D8%B3" title="الأندلس">والأندلس</a> من حيث مدهما. امتدت حدوده قديما إلى <a class="mw-redirect" href="https://ar.wikipedia.org/wiki/%D8%B4%D8%A8%D9%87_%D8%AC%D8%B2%D9%8A%D8%B1%D8%A9_%D8%A3%D9%8A%D8%A8%D9%8A%D8%B1%D9%8A%D8%A7" title="شبه جزيرة أيبيريا">شبه جزيرة إيبيريا</a> شمالا <a href="https://ar.wikipedia.org/wiki/%D9%86%D9%87%D8%B1_%D8%A7%D9%84%D8%B3%D9%86%D8%BA%D8%A7%D9%84" title="نهر السنغال">ونهر السنغال</a> جنوبا. تشكلت نواة الدولة المرابطية وخضعت لها المناطق الجنوبية من حدود <a href="https://ar.wikipedia.org/wiki/%D8%A7%D9%84%D8%B3%D9%86%D8%BA%D8%A7%D9%84" title="السنغال">السنغال</a> حتى سجلماسة. وبعدها امتدت حدود الدولة نحو الشمال خاصة خلال عهد السلطان <a href="https://ar.wikipedia.org/wiki/%D9%8A%D9%88%D8%B3%D9%81_%D8%A8%D9%86_%D8%AA%D8%A7%D8%B4%D9%81%D9%8A%D9%86" title="يوسف بن تاشفين">يوسف بن تاشفين</a> الذي استطاع فتح الأندلس. اضطلع السلطان أحمد المنصور بأعباء دولته بعد <a href="https://ar.wikipedia.org/wiki/%D9%85%D8%B9%D8%B1%D9%83%D8%A9_%D9%88%D8%A7%D8%AF%D9%8A_%D8%A7%D9%84%D9%85%D8%AE%D8%A7%D8%B2%D9%86" title="معركة وادي المخازن">معركة وادي المخازن</a> وأخضع الإمارات السودانية الصغيرة في منطقة حوض السنغال. أصبحت رقعة نفوذ <a class="mw-redirect" href="https://ar.wikipedia.org/wiki/%D8%B3%D9%84%D8%A7%D9%84%D8%A9_%D8%A7%D9%84%D8%B3%D8%B9%D8%AF%D9%8A%D9%8A%D9%86" title="سلالة السعديين">الدولة السعدية</a> تمتد جنوبا إلى ما وراء <a href="https://ar.wikipedia.org/wiki/%D9%86%D9%87%D8%B1_%D8%A7%D9%84%D9%86%D9%8A%D8%AC%D8%B1" title="نهر النيجر">نهر النيجر</a>، وتصل شرقا إلى <a href="https://ar.wikipedia.org/wiki/%D9%86%D9%88%D8%A8%D9%8A%D9%88%D9%86" title="نوبيون">بلاد النوبة</a> المتاخمة لصعيد مصر. المغرب حاليا عضو في <a href="https://ar.wikipedia.org/wiki/%D8%AC%D8%A7%D9%85%D8%B9%D8%A9_%D8%A7%D9%84%D8%AF%D9%88%D9%84_%D8%A7%D9%84%D8%B9%D8%B1%D8%A8%D9%8A%D8%A9" title="جامعة الدول العربية">جامعة الدول العربية</a> <a href="https://ar.wikipedia.org/wiki/%D8%A7%D8%AA%D8%AD%D8%A7%D8%AF_%D8%A7%D9%84%D9%85%D8%BA%D8%B1%D8%A8_%D8%A7%D9%84%D8%B9%D8%B1%D8%A8%D9%8A" title="اتحاد المغرب العربي">واتحاد المغرب العربي</a> <a href="https://ar.wikipedia.org/wiki/%D9%85%D9%86%D8%B8%D9%85%D8%A9_%D8%A7%D9%84%D8%AA%D8%B9%D8%A7%D9%88%D9%86_%D8%A7%D9%84%D8%A5%D8%B3%D9%84%D8%A7%D9%85%D9%8A" title="منظمة التعاون الإسلامي">ومنظمة التعاون الإسلامي</a> <a class="mw-redirect" href="https://ar.wikipedia.org/wiki/%D9%81%D8%B1%D8%A7%D9%86%D9%83%D9%88%D9%81%D9%88%D9%86%D9%8A%D8%A9" title="فرانكوفونية">والمنظمة الدولية للفرانكوفونية</a> ومجموعة <a href="https://ar.wikipedia.org/wiki/%D8%AD%D9%88%D8%A7%D8%B1_%D9%85%D8%AA%D9%88%D8%B3%D8%B7%D9%8A" title="حوار متوسطي">الحوار المتوسطي</a> <a href="https://ar.wikipedia.org/wiki/%D9%85%D8%AC%D9%85%D9%88%D8%B9%D8%A9_%D8%A7%D9%8477" title="مجموعة ال77">ومجموعة السبع والسبعين</a> <a href="https://ar.wikipedia.org/wiki/%D8%AD%D9%84%D9%8A%D9%81_%D8%B1%D8%A6%D9%8A%D8%B3%D9%8A_%D8%AE%D8%A7%D8%B1%D8%AC_%D8%A7%D9%84%D9%86%D8%A7%D8%AA%D9%88" title="حليف رئيسي خارج الناتو">وحليف رئيسي خارج الناتو</a> <a href="https://ar.wikipedia.org/wiki/%D8%A7%D9%84%D8%A7%D8%AA%D8%AD%D8%A7%D8%AF_%D9%85%D9%86_%D8%A3%D8%AC%D9%84_%D8%A7%D9%84%D9%85%D8%AA%D9%88%D8%B3%D8%B7" title="الاتحاد من أجل المتوسط">والاتحاد من أجل المتوسط</a>. المغرب دولة ذات نظام <a class="mw-redirect" href="https://ar.wikipedia.org/wiki/%D9%85%D9%84%D9%83%D9%8A%D8%A9_%D8%A8%D8%B1%D9%84%D9%85%D8%A7%D9%86%D9%8A%D8%A9" title="ملكية برلمانية">ملكي برلماني دستوري</a> ببرلمان يتم انتخابه. في <a href="https://ar.wikipedia.org/wiki/%D8%A7%D9%84%D9%82%D8%B1%D9%86_1_%D9%82_%D9%85" title="القرن 1 ق م">القرن الأول قبل الميلاد</a> أنشأ <a href="https://ar.wikipedia.org/wiki/%D8%A3%D9%85%D8%A7%D8%B2%D9%8A%D8%BA" title="أمازيغ">الأمازيغ</a> مملكة على سواحل <a class="mw-redirect" href="https://ar.wikipedia.org/wiki/%D8%A7%D9%84%D8%A8%D8%AD%D8%B1_%D8%A7%D9%84%D9%85%D8%AA%D9%88%D8%B3%D8%B7" title="البحر المتوسط">البحر المتوسط</a>، عرفت <a href="https://ar.wikipedia.org/wiki/%D9%85%D9%88%D8%B1%D9%8A%D8%B7%D9%86%D9%8A%D8%A9" title="موريطنية">بمملكة موريطنية</a> نسبة إلى كلمة <a class="mw-redirect" href="https://ar.wikipedia.org/wiki/%D9%85%D9%88%D8%B1%D9%88%D8%B3" title="موروس">موروس</a> هذه المملكة انقسمت سنة <a href="https://ar.wikipedia.org/wiki/40" title="40">40</a> إلى <a href="https://ar.wikipedia.org/wiki/%D9%85%D9%88%D8%B1%D9%8A%D8%B7%D9%86%D9%8A%D8%A9_%D8%A7%D9%84%D8%B7%D9%86%D8%AC%D9%8A%D8%A9" title="موريطنية الطنجية">موريطنية الطنجية</a> في شمال المغرب <a class="mw-redirect" href="https://ar.wikipedia.org/wiki/%D9%85%D9%88%D8%B1%D9%8A%D8%B7%D9%86%D9%8A%D8%A9_%D8%A7%D9%84%D9%82%D9%8A%D8%B5%D8%B1%D9%8A%D8%A9" title="موريطنية القيصرية">وموريطنية القيصرية</a> في شمال <a href="https://ar.wikipedia.org/wiki/%D8%A7%D9%84%D8%AC%D8%B2%D8%A7%D8%A6%D8%B1" title="الجزائر">الجزائر</a>؛ لاحقا تمت الإشارة للمملكة المغربية الحالية باسم المغرب الأقصى <a href="https://ar.wikipedia.org/wiki/%D8%A7%D9%84%D9%84%D8%BA%D8%A9_%D8%A7%D9%84%D8%B9%D8%B1%D8%A8%D9%8A%D8%A9" title="اللغة العربية">باللغة العربية</a>.</p>
', 0, 2, 1, 1, 2, 1, 1, 1, 1, 1, NULL, N'202001008', NULL, 0)
INSERT [dbo].[Treatment_Master] ([Treatment_Id], [Treatment_Subject], [Treatment_Date], [Create_Date], [Update_Date], [Treatment_Body], [Required_Reply], [From_Employee_Structure_Id], [Treatment_Type_Id], [Treatment_Class_Id], [Treatment_Priority_id], [Treatment_Confidentiality_Id], [Treatment_Delivery_Id], [Treatment_Status_Id], [Treatment_Procedure_Id], [Prepared_Administration_Id], [Required_Reply_Date], [Treatment_Number], [Treatment_Keywork], [Treatment_Mother]) VALUES (1009, N'Welcome to Wikipedia', CAST(0x0000AB9700000000 AS DateTime), CAST(0x0000AB97014A0446 AS DateTime), CAST(0x0000AB97014A0446 AS DateTime), N'<h2 style="margin-left:0.5em; margin-right:0.5em">From today&#39;s featured article</h2>

<div id="mp-tfa" style="padding:0.1em 0.6em"><strong><a href="https://en.wikipedia.org/wiki/Gerard_(archbishop_of_York)" title="Gerard (archbishop of York)">Gerard</a></strong> (died 1108) was <a href="https://en.wikipedia.org/wiki/Archbishop_of_York" title="Archbishop of York">Archbishop of York</a> between 1100 and 1108 and <a href="https://en.wikipedia.org/wiki/Lord_Chancellor" title="Lord Chancellor">Lord Chancellor</a> of England from 1085 until 1092. A <a href="https://en.wikipedia.org/wiki/Normans" title="Normans">Norman</a>, he was a member of the cathedral clergy at <a href="https://en.wikipedia.org/wiki/Rouen" title="Rouen">Rouen</a> before becoming a <a href="https://en.wikipedia.org/wiki/Clerk#History_and_etymology" title="Clerk">royal clerk</a> under King <a href="https://en.wikipedia.org/wiki/William_the_Conqueror" title="William the Conqueror">William&nbsp;I of England</a>, who appointed him Lord Chancellor. He continued in that office under King <a href="https://en.wikipedia.org/wiki/William_II_of_England" title="William II of England">William&nbsp;II Rufus</a>, who rewarded him with the <a href="https://en.wikipedia.org/wiki/Bishop_of_Hereford" title="Bishop of Hereford">Bishopric of Hereford</a> in 1096. Soon after <a href="https://en.wikipedia.org/wiki/Henry_I_of_England" title="Henry I of England">Henry&nbsp;I</a>&#39;s coronation, Gerard was appointed to the recently vacant <a href="https://en.wikipedia.org/wiki/Diocese_of_York" title="Diocese of York">see of York</a>, and became embroiled in the dispute between York and the <a href="https://en.wikipedia.org/wiki/Diocese_of_Canterbury" title="Diocese of Canterbury">see of Canterbury</a> concerning which archbishopric had primacy over England. He secured <a href="https://en.wikipedia.org/wiki/Pope" title="Pope">papal</a> recognition of York&#39;s jurisdiction over the church in Scotland but was forced to accept Canterbury&#39;s authority over York. He also worked on reconciling the <a href="https://en.wikipedia.org/wiki/Investiture_Controversy" title="Investiture Controversy">Investiture Controversy</a> between the king and the papacy over the right to appoint bishops until the controversy&#39;s resolution in 1107. Because of rumours, as a student of <a href="https://en.wikipedia.org/wiki/Astrology" title="Astrology">astrology</a>, that he was a magician and a sorcerer, and also because of his unpopular attempts to reform his clergy, he was denied a burial inside <a href="https://en.wikipedia.org/wiki/York_Minster" title="York Minster">York Minster</a> but his remains were later moved into the cathedral. (<strong><a href="https://en.wikipedia.org/wiki/Gerard_(archbishop_of_York)" title="Gerard (archbishop of York)">Full&nbsp;article...</a></strong>)

<div class="tfa-recent" style="text-align:right">Recently featured:
<div class="hlist inline">
<ul>
	<li><a href="https://en.wikipedia.org/wiki/South_Pacific_(musical)" title="South Pacific (musical)"><em>South Pacific</em> (musical)</a></li>
	<li><a href="https://en.wikipedia.org/wiki/Operation_Retribution_(1941)" title="Operation Retribution (1941)">Operation Retribution (1941)</a></li>
	<li><em><a href="https://en.wikipedia.org/wiki/Adventure_Time" title="Adventure Time">Adventure Time</a></em></li>
</ul>
</div>
</div>

<div class="hlist noprint tfa-footer" style="text-align:right">
<ul>
	<li><strong><a href="https://en.wikipedia.org/wiki/Wikipedia:Today%27s_featured_article/April_2020" title="Wikipedia:Today''s featured article/April 2020">Archive</a></strong></li>
	<li><strong><a class="extiw" href="https://lists.wikimedia.org/mailman/listinfo/daily-article-l" title="mail:daily-article-l">By email</a></strong></li>
	<li><strong><a href="https://en.wikipedia.org/wiki/Wikipedia:Featured_articles" title="Wikipedia:Featured articles">More featured articles</a></strong></li>
</ul>
</div>
</div>
', 0, 1, 3, 1, 1, 2, 1, 1, 1, 1, NULL, N'202001009', NULL, 0)
INSERT [dbo].[Treatment_Master] ([Treatment_Id], [Treatment_Subject], [Treatment_Date], [Create_Date], [Update_Date], [Treatment_Body], [Required_Reply], [From_Employee_Structure_Id], [Treatment_Type_Id], [Treatment_Class_Id], [Treatment_Priority_id], [Treatment_Confidentiality_Id], [Treatment_Delivery_Id], [Treatment_Status_Id], [Treatment_Procedure_Id], [Prepared_Administration_Id], [Required_Reply_Date], [Treatment_Number], [Treatment_Keywork], [Treatment_Mother]) VALUES (1010, N'الموضوع', CAST(0x0000AB9800000000 AS DateTime), CAST(0x0000AB9800DEEC8B AS DateTime), CAST(0x0000AB9800DEEC8B AS DateTime), N'<p>نص الخطاب</p>

<p>بالسلام والكمال</p>
', 0, 2, 1, 1, 1, 1, 1, 1, 1, 1, NULL, N'202001010', NULL, 0)
SET IDENTITY_INSERT [dbo].[Treatment_Master] OFF
SET IDENTITY_INSERT [dbo].[Treatment_Priority] ON 

INSERT [dbo].[Treatment_Priority] ([Treatment_Priority_Id], [Treatment_Priority_Name_Ar], [Treatment_Priority_Name_En], [Css_Class], [Card_Class]) VALUES (1, N'عادية', N'Normal', N'icofont icofont-star text-success', N'card card-border-success')
INSERT [dbo].[Treatment_Priority] ([Treatment_Priority_Id], [Treatment_Priority_Name_Ar], [Treatment_Priority_Name_En], [Css_Class], [Card_Class]) VALUES (2, N'عاجلة', N'urgent', N'icofont icofont-star text-danger', N'card card-border-danger')
SET IDENTITY_INSERT [dbo].[Treatment_Priority] OFF
SET IDENTITY_INSERT [dbo].[Treatment_Procedure] ON 

INSERT [dbo].[Treatment_Procedure] ([Treatment_Procedure_Id], [Treatment_Procedure_Name_Ar], [Treatment_Procedure_Name_En]) VALUES (1, N'للتعميم', N'For all')
INSERT [dbo].[Treatment_Procedure] ([Treatment_Procedure_Id], [Treatment_Procedure_Name_Ar], [Treatment_Procedure_Name_En]) VALUES (2, N'للاحاطة', N'Briefing')
SET IDENTITY_INSERT [dbo].[Treatment_Procedure] OFF
SET IDENTITY_INSERT [dbo].[Treatment_Status] ON 

INSERT [dbo].[Treatment_Status] ([Treatment_Status_Id], [Treatment_Status_Name_Ar], [Treatment_Status_Name_En]) VALUES (1, N'جديدة', N'New')
INSERT [dbo].[Treatment_Status] ([Treatment_Status_Id], [Treatment_Status_Name_Ar], [Treatment_Status_Name_En]) VALUES (2, N'قيد الإنجاز', N'Under Process')
INSERT [dbo].[Treatment_Status] ([Treatment_Status_Id], [Treatment_Status_Name_Ar], [Treatment_Status_Name_En]) VALUES (3, N'منتهية', N'Finished')
SET IDENTITY_INSERT [dbo].[Treatment_Status] OFF
SET IDENTITY_INSERT [dbo].[Treatment_Type] ON 

INSERT [dbo].[Treatment_Type] ([Treatment_Type_Id], [Treatment_Type_Name_Ar], [Treatment_Type_Name_En]) VALUES (1, N'سرية', N'Secrit')
INSERT [dbo].[Treatment_Type] ([Treatment_Type_Id], [Treatment_Type_Name_Ar], [Treatment_Type_Name_En]) VALUES (3, N'عادي', N'Noraml')
SET IDENTITY_INSERT [dbo].[Treatment_Type] OFF
ALTER TABLE [dbo].[Attachment]  WITH CHECK ADD  CONSTRAINT [FK_Attachment_Treatment] FOREIGN KEY([Treatment_Id])
REFERENCES [dbo].[Treatment_Master] ([Treatment_Id])
GO
ALTER TABLE [dbo].[Attachment] CHECK CONSTRAINT [FK_Attachment_Treatment]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Group] FOREIGN KEY([Group_Id])
REFERENCES [dbo].[Group] ([Group_Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Group]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_LanguageMaster] FOREIGN KEY([Language_id])
REFERENCES [dbo].[LanguageMaster] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_LanguageMaster]
GO
ALTER TABLE [dbo].[Employee_Structure]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Structure_Employee] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO
ALTER TABLE [dbo].[Employee_Structure] CHECK CONSTRAINT [FK_Employee_Structure_Employee]
GO
ALTER TABLE [dbo].[Employee_Structure]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Structure_Structure] FOREIGN KEY([Structure_Id])
REFERENCES [dbo].[Structure] ([Structure_Id])
GO
ALTER TABLE [dbo].[Employee_Structure] CHECK CONSTRAINT [FK_Employee_Structure_Structure]
GO
ALTER TABLE [dbo].[Lanuage_Detials]  WITH CHECK ADD  CONSTRAINT [FK_Lanuage_Detials_LanguageMaster] FOREIGN KEY([Language_Master_ID])
REFERENCES [dbo].[LanguageMaster] ([ID])
GO
ALTER TABLE [dbo].[Lanuage_Detials] CHECK CONSTRAINT [FK_Lanuage_Detials_LanguageMaster]
GO
ALTER TABLE [dbo].[Log_File]  WITH CHECK ADD  CONSTRAINT [FK_Log_File_Employee] FOREIGN KEY([Login_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO
ALTER TABLE [dbo].[Log_File] CHECK CONSTRAINT [FK_Log_File_Employee]
GO
ALTER TABLE [dbo].[Log_File]  WITH CHECK ADD  CONSTRAINT [FK_Log_File_Permission] FOREIGN KEY([Form_Id])
REFERENCES [dbo].[Permission] ([Permission_Id])
GO
ALTER TABLE [dbo].[Log_File] CHECK CONSTRAINT [FK_Log_File_Permission]
GO
ALTER TABLE [dbo].[Owner_Relationship]  WITH CHECK ADD  CONSTRAINT [FK_Owner_Relationship_Treatment] FOREIGN KEY([Treatment_Id])
REFERENCES [dbo].[Treatment_Master] ([Treatment_Id])
GO
ALTER TABLE [dbo].[Owner_Relationship] CHECK CONSTRAINT [FK_Owner_Relationship_Treatment]
GO
ALTER TABLE [dbo].[Permission_Group]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Group_Group] FOREIGN KEY([Group_Id])
REFERENCES [dbo].[Group] ([Group_Id])
GO
ALTER TABLE [dbo].[Permission_Group] CHECK CONSTRAINT [FK_Permission_Group_Group]
GO
ALTER TABLE [dbo].[Permission_Group]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Group_Permission] FOREIGN KEY([Permission_Id])
REFERENCES [dbo].[Permission] ([Permission_Id])
GO
ALTER TABLE [dbo].[Permission_Group] CHECK CONSTRAINT [FK_Permission_Group_Permission]
GO
ALTER TABLE [dbo].[Treatment_Detial]  WITH CHECK ADD  CONSTRAINT [FK_Treatment_Detial_Assignment_Status] FOREIGN KEY([Assignment_Status_Id])
REFERENCES [dbo].[Assignment_Status] ([Assignment_Status_Id])
GO
ALTER TABLE [dbo].[Treatment_Detial] CHECK CONSTRAINT [FK_Treatment_Detial_Assignment_Status]
GO
ALTER TABLE [dbo].[Treatment_Detial]  WITH CHECK ADD  CONSTRAINT [FK_Treatment_Detial_Employee_Structure] FOREIGN KEY([To_Employee_Structure_Id])
REFERENCES [dbo].[Employee_Structure] ([Employee_Structure_Id])
GO
ALTER TABLE [dbo].[Treatment_Detial] CHECK CONSTRAINT [FK_Treatment_Detial_Employee_Structure]
GO
ALTER TABLE [dbo].[Treatment_Detial]  WITH CHECK ADD  CONSTRAINT [FK_Treatment_Detial_Treatment] FOREIGN KEY([Treatment_Id])
REFERENCES [dbo].[Treatment_Master] ([Treatment_Id])
GO
ALTER TABLE [dbo].[Treatment_Detial] CHECK CONSTRAINT [FK_Treatment_Detial_Treatment]
GO
ALTER TABLE [dbo].[Treatment_Master]  WITH CHECK ADD  CONSTRAINT [FK_Treatment_Employee_Structure] FOREIGN KEY([From_Employee_Structure_Id])
REFERENCES [dbo].[Employee_Structure] ([Employee_Structure_Id])
GO
ALTER TABLE [dbo].[Treatment_Master] CHECK CONSTRAINT [FK_Treatment_Employee_Structure]
GO
ALTER TABLE [dbo].[Treatment_Master]  WITH CHECK ADD  CONSTRAINT [FK_Treatment_Prepared_Administration] FOREIGN KEY([Prepared_Administration_Id])
REFERENCES [dbo].[Structure] ([Structure_Id])
GO
ALTER TABLE [dbo].[Treatment_Master] CHECK CONSTRAINT [FK_Treatment_Prepared_Administration]
GO
ALTER TABLE [dbo].[Treatment_Master]  WITH CHECK ADD  CONSTRAINT [FK_Treatment_Treatment_Class] FOREIGN KEY([Treatment_Class_Id])
REFERENCES [dbo].[Treatment_Class] ([Treatment_Class_Id])
GO
ALTER TABLE [dbo].[Treatment_Master] CHECK CONSTRAINT [FK_Treatment_Treatment_Class]
GO
ALTER TABLE [dbo].[Treatment_Master]  WITH CHECK ADD  CONSTRAINT [FK_Treatment_Treatment_Confidentiality] FOREIGN KEY([Treatment_Confidentiality_Id])
REFERENCES [dbo].[Treatment_Confidentiality] ([Treatment_Confidentiality_Id])
GO
ALTER TABLE [dbo].[Treatment_Master] CHECK CONSTRAINT [FK_Treatment_Treatment_Confidentiality]
GO
ALTER TABLE [dbo].[Treatment_Master]  WITH CHECK ADD  CONSTRAINT [FK_Treatment_Treatment_Delivery] FOREIGN KEY([Treatment_Delivery_Id])
REFERENCES [dbo].[Treatment_Delivery] ([Treatment_Delivery_Id])
GO
ALTER TABLE [dbo].[Treatment_Master] CHECK CONSTRAINT [FK_Treatment_Treatment_Delivery]
GO
ALTER TABLE [dbo].[Treatment_Master]  WITH CHECK ADD  CONSTRAINT [FK_Treatment_Treatment_Priority] FOREIGN KEY([Treatment_Priority_id])
REFERENCES [dbo].[Treatment_Priority] ([Treatment_Priority_Id])
GO
ALTER TABLE [dbo].[Treatment_Master] CHECK CONSTRAINT [FK_Treatment_Treatment_Priority]
GO
ALTER TABLE [dbo].[Treatment_Master]  WITH CHECK ADD  CONSTRAINT [FK_Treatment_Treatment_Procedure] FOREIGN KEY([Treatment_Procedure_Id])
REFERENCES [dbo].[Treatment_Procedure] ([Treatment_Procedure_Id])
GO
ALTER TABLE [dbo].[Treatment_Master] CHECK CONSTRAINT [FK_Treatment_Treatment_Procedure]
GO
ALTER TABLE [dbo].[Treatment_Master]  WITH CHECK ADD  CONSTRAINT [FK_Treatment_Treatment_Status] FOREIGN KEY([Treatment_Status_Id])
REFERENCES [dbo].[Treatment_Status] ([Treatment_Status_Id])
GO
ALTER TABLE [dbo].[Treatment_Master] CHECK CONSTRAINT [FK_Treatment_Treatment_Status]
GO
ALTER TABLE [dbo].[Treatment_Master]  WITH CHECK ADD  CONSTRAINT [FK_Treatment_Treatment_Type] FOREIGN KEY([Treatment_Type_Id])
REFERENCES [dbo].[Treatment_Type] ([Treatment_Type_Id])
GO
ALTER TABLE [dbo].[Treatment_Master] CHECK CONSTRAINT [FK_Treatment_Treatment_Type]
GO
USE [master]
GO
ALTER DATABASE [ECMS] SET  READ_WRITE 
GO
