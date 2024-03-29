USE [master]
GO
/****** Object:  Database [REU_Registration]    Script Date: 07/04/2020 12:54:12 ******/
CREATE DATABASE [REU_Registration] ON  PRIMARY 
( NAME = N'REU_Registration', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\REU_Registration.mdf' , SIZE = 19456KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'REU_Registration_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\REU_Registration_log.ldf' , SIZE = 6272KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [REU_Registration].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [REU_Registration] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [REU_Registration] SET ANSI_NULLS OFF
GO
ALTER DATABASE [REU_Registration] SET ANSI_PADDING OFF
GO
ALTER DATABASE [REU_Registration] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [REU_Registration] SET ARITHABORT OFF
GO
ALTER DATABASE [REU_Registration] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [REU_Registration] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [REU_Registration] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [REU_Registration] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [REU_Registration] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [REU_Registration] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [REU_Registration] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [REU_Registration] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [REU_Registration] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [REU_Registration] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [REU_Registration] SET  DISABLE_BROKER
GO
ALTER DATABASE [REU_Registration] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [REU_Registration] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [REU_Registration] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [REU_Registration] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [REU_Registration] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [REU_Registration] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [REU_Registration] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [REU_Registration] SET  READ_WRITE
GO
ALTER DATABASE [REU_Registration] SET RECOVERY FULL
GO
ALTER DATABASE [REU_Registration] SET  MULTI_USER
GO
ALTER DATABASE [REU_Registration] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [REU_Registration] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'REU_Registration', N'ON'
GO
USE [REU_Registration]
GO
/****** Object:  User [reg]    Script Date: 07/04/2020 12:54:12 ******/
CREATE USER [reg] FOR LOGIN [reg] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 07/04/2020 12:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Status_Id] [int] IDENTITY(1,1) NOT NULL,
	[Status_Code] [int] NULL,
	[Status_Name_Ar] [nvarchar](max) NULL,
	[Status_Name_En] [nvarchar](max) NULL,
	[Status_Color] [nvarchar](max) NULL,
	[Status_Icon] [nvarchar](max) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Status_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Status] ON
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (1, 1, N'جديدة', N'New', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (2, 2, N'قيد الانتظار', N'Pending', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (3, 3, N'مخصصة', N'Assigned', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (4, 4, N'غير مكتملة', N'Not Complete', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (5, 5, N'مكتملة البيانات', N'Data Completed', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (6, 6, N'جاهز للدفع (التسجيل)', N'Ready to pay (Registration)', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (7, 7, N'تم الدفع (التسجيل)', N'Paid (Registration)', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (8, 8, N'حجز موعد', N'Appointment Booking', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (9, 9, N'فشل في الامتحان', N'Failure in Exam', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (10, 10, N'نجح في الامتحان', N'Successful in Exam', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (11, 11, N'جاهز للدفع (الدراسة)', N'Ready to pay (study)', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (12, 12, N'تم الدفع (الدراسة)', N'Paid (study)', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (13, 13, N'اصدار الرقم الجامعي', N'Issuance University ID', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (14, 14, N'اكتمال الملف بنجاح', N'File Completed Successfully', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (15, 15, N'اكتمال الملف بالفشل', N'File Completed with Failure', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (16, 16, N'اكمال ملفات العقد', N'Complete Contract Files', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (17, 17, N'تم تكملة الملف', N'Files Contract Completed', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (18, 18, N'مرحلة العقد', N'Contract Stage', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (19, 19, N'معادلة الشهادة', N'Certificate Equation', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (1016, 20, N'تم معادلة الشهادة', N'Certificate Equation Completed', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Status] OFF
/****** Object:  Table [dbo].[Permission]    Script Date: 07/04/2020 12:54:13 ******/
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
	[System_Id] [int] NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[Permission_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Permission] ON
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (1, N'ادارة ملفات الطلاب', N'Manage students', 0, NULL, N'icofont icofont-group-students', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (2, N'عرض الملف', N'View Student File', 11, N'Pages/RegistrationProcess/view.aspx', N'icofont icofont-listing-box', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (3, N'الصلاحيات', N'Permissions', 0, NULL, N'icofont icofont-ui-settings', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (4, N'الصلاحيات', N'Permissions', 3, N'Pages/UserManagment/Permissions.aspx', N'icofont icofont-fix-tools', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (5, N'المجموعات', N'Groups', 3, N'Pages/UserManagment/PermissionGroups.aspx', N'icofont icofont-ui-user-group', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (6, N'قائمة الطلاب', N'Students List', 1, N'Pages/RegistrationProcess/ListView.aspx', N'icofont icofont-group-students', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (7, N'اعدادات القوائم', N'Lookup Forms', 19, N'Pages/Setting/', N'', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (8, N'الكليات', N'Collage', 7, N'Pages/Setting/FormCollege.aspx', N'icofont icofont-university', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (9, N'المصادر', N'Resource', 7, N'Pages/Setting/FormResource.aspx', N'icofont icofont-ui-social-link', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (10, N'التخصصات', N'Specialization', 7, N'Pages/Setting/FormSpecialization.aspx', N'icofont icofont-notebook', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (11, N'بعض الصفحات', N'SomePage', 19, N'', N'', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (12, N'بيانات الطالب', N'Students Data', 1, N'Pages/RegistrationProcess/StudentInfo.aspx', N'icofont icofont-group-students', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (13, N'حذف طالب', N'Delete Student', 11, N'Pages/RegistrationProcess/DeleteStudent.ashx', N'icofont icofont-delete-alt', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (14, N'ادارة الموظفين', N'Employees Managment', 0, NULL, N'icofont icofont-group-students', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (15, N'الصفحة الشخصية', N'My Profile', 14, N'Pages/UserManagment/Profile.aspx', N'icofont icofont-group-students', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (16, N'الموظفين', N'Employees', 14, N'Pages/UserManagment/Employees.aspx', N'icofont icofont-ui-contact-list', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (17, N'الجنسيات', N'Nationality', 7, N'Pages/Setting/FormNationality.aspx', N'icofont icofont-native-american', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (18, N'سلة المحذوفات', N'Recycle', 1, N'Pages/RegistrationProcess/RestoreStudent.aspx', N'icofont icofont-recycle-alt', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (19, N'مدير النظام', N'Adminstrator', 0, N'', N'icofont icofont-tools-alt-2', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (20, N'ملف التتبع', N'Log File', 19, N'Pages/Admin/LogFile.aspx', N'icofont icofont-frog-tracks', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (21, N'اللغة', N'Language', 19, N'Pages/Admin/Language.aspx', N'icofont icofont-flag', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (22, N'نشاطاتي', N'My Activity', 14, N'Pages/UserManagment/MyNotifications.aspx', N'icofont icofont-notification', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (23, N'كل الملفات', N'All Student Files', 1, N'Pages/RegistrationProcess/AllRecords.aspx', N'icofont icofont-history', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (24, N'لوحة المعلومات', N'Control Panel', 1, N'default.aspx', N'icofont icofont-listing-box', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (25, N'الإتصال', N'Contact', 0, N'Pages/Contact', N'icofont icofont-ui-contact-list', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (26, N'قائمة الإتصال', N'Contact List', 25, N'Pages/Contact/ListContact.aspx', N'', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (27, N'عرض معلومات الإتصال', N'View Contact  Info', 11, N'Pages/Contact/ViewContact.aspx', N'icofont icofont-contacts', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (28, N'تسجيل دخول', N'Login', 11, N'Pages/Auth/Login.aspx', N'icofont icofont-login', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (29, N'تعليق النظام', N'Lock Screen', 11, N'Pages/Auth/LockScreen.aspx', N'icofont icofont-lock', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (30, N'استعادة كلمة السر', N'Reset Password', 11, N'Pages/Auth/ResetPassword.aspx', N'icofont icofont-cloud-refresh', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (31, N'معلومات اخرى', N'Other Informations', 1, N'Pages/RegistrationProcess/OtherInfo.aspx', N'icofont icofont-info-circle', 1)
SET IDENTITY_INSERT [dbo].[Permission] OFF
/****** Object:  Table [dbo].[Payment_Type]    Script Date: 07/04/2020 12:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_Type](
	[Payment_Type_Id] [int] IDENTITY(1,1) NOT NULL,
	[Payment_Name_Ar] [nvarchar](max) NULL,
	[Payment_Name_En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Payment_Registration] PRIMARY KEY CLUSTERED 
(
	[Payment_Type_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Payment_Type] ON
INSERT [dbo].[Payment_Type] ([Payment_Type_Id], [Payment_Name_Ar], [Payment_Name_En]) VALUES (1, N'تسجيل', N'Registration')
INSERT [dbo].[Payment_Type] ([Payment_Type_Id], [Payment_Name_Ar], [Payment_Name_En]) VALUES (2, N'دراسة', N'Study')
SET IDENTITY_INSERT [dbo].[Payment_Type] OFF
/****** Object:  Table [dbo].[Nationality]    Script Date: 07/04/2020 12:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nationality](
	[Nationality_Id] [int] IDENTITY(1,1) NOT NULL,
	[Country_code] [varchar](2) NOT NULL,
	[Country_Name_En] [varchar](100) NOT NULL,
	[Country_Name_Ar] [nvarchar](100) NOT NULL,
	[Nationality_Name_En] [varchar](100) NOT NULL,
	[Nationality_Name_Ar] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__countrie__3436E9A406F40284] PRIMARY KEY CLUSTERED 
(
	[Nationality_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Nationality] ON
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (1, N'AD', N'Andorra', N'أندورا', N'Andorran', N'أندوري')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (2, N'AE', N'United Arab Emirates', N'الإمارات العربية المتحدة', N'Emirati', N'إماراتي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (3, N'AF', N'Afghanistan', N'أفغانستان', N'Afghan', N'أفغانستاني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (4, N'AG', N'Antigua and Barbuda', N'أنتيغوا وبربودا', N'Antiguan', N'بربودي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (5, N'AI', N'Anguilla', N'أنغويلا', N'Anguillan', N'أنغويلي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (6, N'AL', N'Albania', N'ألبانيا', N'Albanian', N'ألباني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (7, N'AM', N'Armenia', N'أرمينيا', N'Armenian', N'أرميني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (8, N'AN', N'Netherlands Antilles', N'جزر الأنتيل الهولندي', N'Dutch Antilier', N'هولندي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (9, N'AO', N'Angola', N'أنغولا', N'Angolan', N'أنقولي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (10, N'AQ', N'Antarctica', N'أنتاركتيكا', N'Antarctican', N'أنتاركتيكي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (11, N'AR', N'Argentina', N'الأرجنتين', N'Argentinian', N'أرجنتيني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (12, N'AS', N'American Samoa', N'ساموا-الأمريكي', N'American Samoan', N'أمريكي سامواني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (13, N'AT', N'Austria', N'النمسا', N'Austrian', N'نمساوي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (14, N'AU', N'Australia', N'أستراليا', N'Australian', N'أسترالي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (15, N'AW', N'Aruba', N'أروبه', N'Aruban', N'أوروبهيني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (16, N'AX', N'Aland Islands', N'جزر آلاند', N'Aland Islander', N'آلاندي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (17, N'AZ', N'Azerbaijan', N'أذربيجان', N'Azerbaijani', N'أذربيجاني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (18, N'BA', N'Bosnia and Herzegovina', N'البوسنة و الهرسك', N'Bosnian / Herzegovinian', N'بوسني/هرسكي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (19, N'BB', N'Barbados', N'بربادوس', N'Barbadian', N'بربادوسي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (20, N'BD', N'Bangladesh', N'بنغلاديش', N'Bangladeshi', N'بنغلاديشي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (21, N'BE', N'Belgium', N'بلجيكا', N'Belgian', N'بلجيكي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (22, N'BF', N'Burkina Faso', N'بوركينا فاسو', N'Burkinabe', N'بوركيني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (23, N'BG', N'Bulgaria', N'بلغاريا', N'Bulgarian', N'بلغاري')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (24, N'BH', N'Bahrain', N'البحرين', N'Bahraini', N'بحريني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (25, N'BI', N'Burundi', N'بوروندي', N'Burundian', N'بورونيدي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (26, N'BJ', N'Benin', N'بنين', N'Beninese', N'بنيني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (27, N'BL', N'Saint Barthelemy', N'سان بارتيلمي', N'Saint Barthelmian', N'سان بارتيلمي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (28, N'BM', N'Bermuda', N'جزر برمودا', N'Bermudan', N'برمودي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (29, N'BN', N'Brunei Darussalam', N'بروني', N'Bruneian', N'بروني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (30, N'BO', N'Bolivia', N'بوليفيا', N'Bolivian', N'بوليفي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (31, N'BR', N'Brazil', N'البرازيل', N'Brazilian', N'برازيلي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (32, N'BS', N'Bahamas', N'الباهاماس', N'Bahamian', N'باهاميسي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (33, N'BT', N'Bhutan', N'بوتان', N'Bhutanese', N'بوتاني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (34, N'BV', N'Bouvet Island', N'جزيرة بوفيه', N'Bouvetian', N'بوفيهي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (35, N'BW', N'Botswana', N'بوتسوانا', N'Botswanan', N'بوتسواني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (36, N'BY', N'Belarus', N'روسيا البيضاء', N'Belarusian', N'روسي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (37, N'BZ', N'Belize', N'بيليز', N'Belizean', N'بيليزي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (38, N'CA', N'Canada', N'كندا', N'Canadian', N'كندي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (39, N'CC', N'Cocos (Keeling) Islands', N'جزر كوكوس', N'Cocos Islander', N'جزر كوكوس')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (40, N'CF', N'Central African Republic', N'جمهورية أفريقيا الوسطى', N'Central African', N'أفريقي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (41, N'CG', N'Congo', N'الكونغو', N'Congolese', N'كونغي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (42, N'CH', N'Switzerland', N'سويسرا', N'Swiss', N'سويسري')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (43, N'CI', N'Ivory Coast', N'ساحل العاج', N'Ivory Coastian', N'ساحل العاج')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (44, N'CK', N'Cook Islands', N'جزر كوك', N'Cook Islander', N'جزر كوك')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (45, N'CL', N'Chile', N'شيلي', N'Chilean', N'شيلي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (46, N'CM', N'Cameroon', N'كاميرون', N'Cameroonian', N'كاميروني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (47, N'CN', N'China', N'الصين', N'Chinese', N'صيني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (48, N'CO', N'Colombia', N'كولومبيا', N'Colombian', N'كولومبي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (49, N'CR', N'Costa Rica', N'كوستاريكا', N'Costa Rican', N'كوستاريكي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (50, N'CU', N'Cuba', N'كوبا', N'Cuban', N'كوبي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (51, N'CV', N'Cape Verde', N'الرأس الأخضر', N'Cape Verdean', N'الرأس الأخضر')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (52, N'CW', N'Curaçao', N'كوراساو', N'Curacian', N'كوراساوي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (53, N'CX', N'Christmas Island', N'جزيرة عيد الميلاد', N'Christmas Islander', N'جزيرة عيد الميلاد')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (54, N'CY', N'Cyprus', N'قبرص', N'Cypriot', N'قبرصي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (55, N'CZ', N'Czech Republic', N'الجمهورية التشيكية', N'Czech', N'تشيكي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (56, N'DE', N'Germany', N'ألمانيا', N'German', N'ألماني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (57, N'DJ', N'Djibouti', N'جيبوتي', N'Djiboutian', N'جيبوتي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (58, N'DK', N'Denmark', N'الدانمارك', N'Danish', N'دنماركي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (59, N'DM', N'Dominica', N'دومينيكا', N'Dominican', N'دومينيكي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (60, N'DO', N'Dominican Republic', N'الجمهورية الدومينيكية', N'Dominican', N'دومينيكي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (61, N'DZ', N'Algeria', N'الجزائر', N'Algerian', N'جزائري')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (62, N'EC', N'Ecuador', N'إكوادور', N'Ecuadorian', N'إكوادوري')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (63, N'EE', N'Estonia', N'استونيا', N'Estonian', N'استوني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (64, N'EG', N'Egypt', N'مصر', N'Egyptian', N'مصري')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (65, N'EH', N'Western Sahara', N'الصحراء الغربية', N'Sahrawian', N'صحراوي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (66, N'ER', N'Eritrea', N'إريتريا', N'Eritrean', N'إريتيري')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (67, N'ES', N'Spain', N'إسبانيا', N'Spanish', N'إسباني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (68, N'ET', N'Ethiopia', N'أثيوبيا', N'Ethiopian', N'أثيوبي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (69, N'FI', N'Finland', N'فنلندا', N'Finnish', N'فنلندي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (70, N'FJ', N'Fiji', N'فيجي', N'Fijian', N'فيجي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (71, N'FK', N'Falkland Islands (Malvinas)', N'جزر فوكلاند', N'Falkland Islander', N'فوكلاندي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (72, N'FM', N'Micronesia', N'مايكرونيزيا', N'Micronesian', N'مايكرونيزيي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (73, N'FO', N'Faroe Islands', N'جزر فارو', N'Faroese', N'جزر فارو')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (74, N'FR', N'France', N'فرنسا', N'French', N'فرنسي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (75, N'GA', N'Gabon', N'الغابون', N'Gabonese', N'غابوني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (76, N'GB', N'United Kingdom', N'المملكة المتحدة', N'British', N'بريطاني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (77, N'GD', N'Grenada', N'غرينادا', N'Grenadian', N'غرينادي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (78, N'GE', N'Georgia', N'جيورجيا', N'Georgian', N'جيورجي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (79, N'GF', N'French Guiana', N'غويانا الفرنسية', N'French Guianese', N'غويانا الفرنسية')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (80, N'GG', N'Guernsey', N'غيرنزي', N'Guernsian', N'غيرنزي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (81, N'GH', N'Ghana', N'غانا', N'Ghanaian', N'غاني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (82, N'GI', N'Gibraltar', N'جبل طارق', N'Gibraltar', N'جبل طارق')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (83, N'GL', N'Greenland', N'جرينلاند', N'Greenlandic', N'جرينلاندي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (84, N'GM', N'Gambia', N'غامبيا', N'Gambian', N'غامبي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (85, N'GN', N'Guinea', N'غينيا', N'Guinean', N'غيني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (86, N'GP', N'Guadeloupe', N'جزر جوادلوب', N'Guadeloupe', N'جزر جوادلوب')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (87, N'GQ', N'Equatorial Guinea', N'غينيا الاستوائي', N'Equatorial Guinean', N'غيني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (88, N'GR', N'Greece', N'اليونان', N'Greek', N'يوناني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (89, N'GS', N'South Georgia and the South Sandwich', N'المنطقة القطبية الجنوبية', N'South Georgia and the South Sandwich', N'لمنطقة القطبية الجنوبية')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (90, N'GT', N'Guatemala', N'غواتيمال', N'Guatemalan', N'غواتيمالي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (91, N'GU', N'Guam', N'جوام', N'Guamanian', N'جوامي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (92, N'GW', N'Guinea-Bissau', N'غينيا-بيساو', N'Guinea-Bissauan', N'غيني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (93, N'GY', N'Guyana', N'غيانا', N'Guyanese', N'غياني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (94, N'HK', N'Hong Kong', N'هونغ كونغ', N'Hongkongese', N'هونغ كونغي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (95, N'HM', N'Heard and Mc Donald Islands', N'جزيرة هيرد وجزر ماكدونالد', N'Heard and Mc Donald Islanders', N'جزيرة هيرد وجزر ماكدونالد')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (96, N'HN', N'Honduras', N'هندوراس', N'Honduran', N'هندوراسي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (97, N'HR', N'Croatia', N'كرواتيا', N'Croatian', N'كوراتي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (98, N'HT', N'Haiti', N'هايتي', N'Haitian', N'هايتي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (99, N'HU', N'Hungary', N'المجر', N'Hungarian', N'مجري')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (100, N'ID', N'Indonesia', N'أندونيسيا', N'Indonesian', N'أندونيسيي')
GO
print 'Processed 100 total records'
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (101, N'IE', N'Ireland', N'إيرلندا', N'Irish', N'إيرلندي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (102, N'IL', N'Israel', N'إسرائيل', N'Israeli', N'إسرائيلي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (103, N'IM', N'Isle of Man', N'جزيرة مان', N'Manx', N'ماني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (104, N'IN', N'India', N'الهند', N'Indian', N'هندي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (105, N'IO', N'British Indian Ocean Territory', N'إقليم المحيط الهندي البريطاني', N'British Indian Ocean Territory', N'إقليم المحيط الهندي البريطاني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (106, N'IQ', N'Iraq', N'العراق', N'Iraqi', N'عراقي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (107, N'IR', N'Iran', N'إيران', N'Iranian', N'إيراني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (108, N'IS', N'Iceland', N'آيسلندا', N'Icelandic', N'آيسلندي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (109, N'IT', N'Italy', N'إيطاليا', N'Italian', N'إيطالي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (110, N'JE', N'Jersey', N'جيرزي', N'Jersian', N'جيرزي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (111, N'JM', N'Jamaica', N'جمايكا', N'Jamaican', N'جمايكي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (112, N'JO', N'Jordan', N'الأردن', N'Jordanian', N'أردني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (113, N'JP', N'Japan', N'اليابان', N'Japanese', N'ياباني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (114, N'KE', N'Kenya', N'كينيا', N'Kenyan', N'كيني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (115, N'KG', N'Kyrgyzstan', N'قيرغيزستان', N'Kyrgyzstani', N'قيرغيزستاني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (116, N'KH', N'Cambodia', N'كمبوديا', N'Cambodian', N'كمبودي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (117, N'KI', N'Kiribati', N'كيريباتي', N'I-Kiribati', N'كيريباتي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (118, N'KM', N'Comoros', N'جزر القمر', N'Comorian', N'جزر القمر')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (119, N'KN', N'Saint Kitts and Nevis', N'سانت كيتس ونيفس,', N'Kittitian/Nevisian', N'سانت كيتس ونيفس')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (120, N'KP', N'Korea(North Korea)', N'كوريا الشمالية', N'North Korean', N'كوري')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (121, N'KR', N'Korea(South Korea)', N'كوريا الجنوبية', N'South Korean', N'كوري')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (122, N'KW', N'Kuwait', N'الكويت', N'Kuwaiti', N'كويتي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (123, N'KY', N'Cayman Islands', N'جزر كايمان', N'Caymanian', N'كايماني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (124, N'KZ', N'Kazakhstan', N'كازاخستان', N'Kazakh', N'كازاخستاني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (125, N'LA', N'Lao PDR', N'لاوس', N'Laotian', N'لاوسي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (126, N'LB', N'Lebanon', N'لبنان', N'Lebanese', N'لبناني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (127, N'LC', N'Saint Pierre and Miquelon', N'سان بيير وميكلون', N'St. Pierre and Miquelon', N'سان بيير وميكلوني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (128, N'LI', N'Liechtenstein', N'ليختنشتين', N'Liechtenstein', N'ليختنشتيني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (129, N'LK', N'Sri Lanka', N'سريلانكا', N'Sri Lankian', N'سريلانكي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (130, N'LR', N'Liberia', N'ليبيريا', N'Liberian', N'ليبيري')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (131, N'LS', N'Lesotho', N'ليسوتو', N'Basotho', N'ليوسيتي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (132, N'LT', N'Lithuania', N'لتوانيا', N'Lithuanian', N'لتوانيي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (133, N'LU', N'Luxembourg', N'لوكسمبورغ', N'Luxembourger', N'لوكسمبورغي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (134, N'LV', N'Latvia', N'لاتفيا', N'Latvian', N'لاتيفي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (135, N'LY', N'Libya', N'ليبيا', N'Libyan', N'ليبي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (136, N'MA', N'Morocco', N'المغرب', N'Moroccan', N'مغربي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (137, N'MC', N'Monaco', N'موناكو', N'Monacan', N'مونيكي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (138, N'MD', N'Moldova', N'مولدافيا', N'Moldovan', N'مولديفي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (139, N'ME', N'Montenegro', N'الجبل الأسود', N'Montenegrin', N'الجبل الأسود')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (140, N'MF', N'Saint Martin (French part)', N'ساينت مارتن فرنسي', N'St. Martian(French)', N'ساينت مارتني فرنسي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (141, N'MG', N'Madagascar', N'مدغشقر', N'Malagasy', N'مدغشقري')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (142, N'MH', N'Marshall Islands', N'جزر مارشال', N'Marshallese', N'مارشالي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (143, N'MK', N'Macedonia', N'مقدونيا', N'Macedonian', N'مقدوني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (144, N'ML', N'Mali', N'مالي', N'Malian', N'مالي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (145, N'MM', N'Myanmar', N'ميانمار', N'Myanmarian', N'ميانماري')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (146, N'MN', N'Mongolia', N'منغوليا', N'Mongolian', N'منغولي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (147, N'MO', N'Macau', N'ماكاو', N'Macanese', N'ماكاوي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (148, N'MP', N'Northern Mariana Islands', N'جزر ماريانا الشمالية', N'Northern Marianan', N'ماريني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (149, N'MQ', N'Martinique', N'مارتينيك', N'Martiniquais', N'مارتينيكي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (150, N'MR', N'Mauritania', N'موريتانيا', N'Mauritanian', N'موريتانيي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (151, N'MS', N'Montserrat', N'مونتسيرات', N'Montserratian', N'مونتسيراتي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (152, N'MT', N'Malta', N'مالطا', N'Maltese', N'مالطي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (153, N'MU', N'Mauritius', N'موريشيوس', N'Mauritian', N'موريشيوسي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (154, N'MV', N'Maldives', N'المالديف', N'Maldivian', N'مالديفي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (155, N'MW', N'Malawi', N'مالاوي', N'Malawian', N'مالاوي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (156, N'MX', N'Mexico', N'المكسيك', N'Mexican', N'مكسيكي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (157, N'MY', N'Malaysia', N'ماليزيا', N'Malaysian', N'ماليزي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (158, N'MZ', N'Mozambique', N'موزمبيق', N'Mozambican', N'موزمبيقي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (159, N'NA', N'Namibia', N'ناميبيا', N'Namibian', N'ناميبي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (160, N'NC', N'New Caledonia', N'كاليدونيا الجديدة', N'New Caledonian', N'كاليدوني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (161, N'NE', N'Niger', N'النيجر', N'Nigerien', N'نيجيري')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (162, N'NF', N'Norfolk Island', N'جزيرة نورفولك', N'Norfolk Islander', N'نورفوليكي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (163, N'NG', N'Nigeria', N'نيجيريا', N'Nigerian', N'نيجيري')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (164, N'NI', N'Nicaragua', N'نيكاراجوا', N'Nicaraguan', N'نيكاراجوي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (165, N'NL', N'Netherlands', N'هولندا', N'Dutch', N'هولندي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (166, N'NO', N'Norway', N'النرويج', N'Norwegian', N'نرويجي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (167, N'NP', N'Nepal', N'نيبال', N'Nepalese', N'نيبالي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (168, N'NR', N'Nauru', N'نورو', N'Nauruan', N'نوري')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (169, N'NU', N'Niue', N'ني', N'Niuean', N'ني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (170, N'NZ', N'New Zealand', N'نيوزيلندا', N'New Zealander', N'نيوزيلندي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (171, N'OM', N'Oman', N'عمان', N'Omani', N'عماني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (172, N'PA', N'Panama', N'بنما', N'Panamanian', N'بنمي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (173, N'PE', N'Peru', N'بيرو', N'Peruvian', N'بيري')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (174, N'PF', N'French Polynesia', N'بولينيزيا الفرنسية', N'French Polynesian', N'بولينيزيي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (175, N'PG', N'Papua New Guinea', N'بابوا غينيا الجديدة', N'Papua New Guinean', N'بابوي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (176, N'PH', N'Philippines', N'الفليبين', N'Filipino', N'فلبيني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (177, N'PK', N'Pakistan', N'باكستان', N'Pakistani', N'باكستاني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (178, N'PL', N'Poland', N'بولونيا', N'Polish', N'بوليني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (179, N'PN', N'Pitcairn', N'بيتكيرن', N'Pitcairn Islander', N'بيتكيرني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (180, N'PR', N'Puerto Rico', N'بورتو ريكو', N'Puerto Rican', N'بورتي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (181, N'PS', N'Palestine', N'فلسطين', N'Palestinian', N'فلسطيني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (182, N'PT', N'Portugal', N'البرتغال', N'Portuguese', N'برتغالي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (183, N'PW', N'Palau', N'بالاو', N'Palauan', N'بالاوي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (184, N'PY', N'Paraguay', N'باراغواي', N'Paraguayan', N'بارغاوي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (185, N'QA', N'Qatar', N'قطر', N'Qatari', N'قطري')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (186, N'RE', N'Reunion Island', N'ريونيون', N'Reunionese', N'ريونيوني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (187, N'RO', N'Romania', N'رومانيا', N'Romanian', N'روماني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (188, N'RS', N'Serbia', N'صربيا', N'Serbian', N'صربي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (189, N'RU', N'Russian', N'روسيا', N'Russian', N'روسي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (190, N'RW', N'Rwanda', N'رواندا', N'Rwandan', N'رواندا')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (191, N'SA', N'Saudi Arabia', N'المملكة العربية السعودية', N'Saudi Arabian', N'سعودي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (192, N'SB', N'Solomon Islands', N'جزر سليمان', N'Solomon Island', N'جزر سليمان')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (193, N'SC', N'Seychelles', N'سيشيل', N'Seychellois', N'سيشيلي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (194, N'SD', N'Sudan', N'السودان', N'Sudanese', N'سوداني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (195, N'SE', N'Sweden', N'السويد', N'Swedish', N'سويدي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (196, N'SG', N'Singapore', N'سنغافورة', N'Singaporean', N'سنغافوري')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (197, N'SH', N'Saint Helena', N'سانت هيلانة', N'St. Helenian', N'هيلاني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (198, N'SI', N'Slovenia', N'سلوفينيا', N'Slovenian', N'سولفيني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (199, N'SJ', N'Svalbard and Jan Mayen', N'سفالبارد ويان ماين', N'Svalbardian/Jan Mayenian', N'سفالبارد ويان ماين')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (200, N'SK', N'Slovakia', N'سلوفاكيا', N'Slovak', N'سولفاكي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (201, N'SL', N'Sierra Leone', N'سيراليون', N'Sierra Leonean', N'سيراليوني')
GO
print 'Processed 200 total records'
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (202, N'SM', N'San Marino', N'سان مارينو', N'Sammarinese', N'ماريني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (203, N'SN', N'Senegal', N'السنغال', N'Senegalese', N'سنغالي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (204, N'SO', N'Somalia', N'الصومال', N'Somali', N'صومالي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (205, N'SR', N'Suriname', N'سورينام', N'Surinamese', N'سورينامي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (206, N'SS', N'South Sudan', N'السودان الجنوبي', N'South Sudanese', N'سوادني جنوبي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (207, N'ST', N'Sao Tome and Principe', N'ساو تومي وبرينسيبي', N'Sao Tomean', N'ساو تومي وبرينسيبي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (208, N'SV', N'El Salvador', N'إلسلفادور', N'Salvadoran', N'سلفادوري')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (209, N'SX', N'Sint Maarten (Dutch part)', N'ساينت مارتن هولندي', N'St. Martian(Dutch)', N'ساينت مارتني هولندي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (210, N'SY', N'Syria', N'سوريا', N'Syrian', N'سوري')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (211, N'SZ', N'Swaziland', N'سوازيلند', N'Swazi', N'سوازيلندي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (212, N'TC', N'Turks and Caicos Islands', N'جزر توركس وكايكوس', N'Turks and Caicos Islands', N'جزر توركس وكايكوس')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (213, N'TD', N'Chad', N'تشاد', N'Chadian', N'تشادي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (214, N'TF', N'French Southern and Antarctic Lands', N'أراض فرنسية جنوبية وأنتارتيكية', N'French', N'أراض فرنسية جنوبية وأنتارتيكية')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (215, N'TG', N'Togo', N'توغو', N'Togolese', N'توغي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (216, N'TH', N'Thailand', N'تايلندا', N'Thai', N'تايلندي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (217, N'TJ', N'Tajikistan', N'طاجيكستان', N'Tajikistani', N'طاجيكستاني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (218, N'TK', N'Tokelau', N'توكيلاو', N'Tokelaian', N'توكيلاوي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (219, N'TL', N'Timor-Leste', N'تيمور الشرقية', N'Timor-Lestian', N'تيموري')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (220, N'TM', N'Turkmenistan', N'تركمانستان', N'Turkmen', N'تركمانستاني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (221, N'TN', N'Tunisia', N'تونس', N'Tunisian', N'تونسي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (222, N'TO', N'Tonga', N'تونغا', N'Tongan', N'تونغي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (223, N'TR', N'Turkey', N'تركيا', N'Turkish', N'تركي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (224, N'TT', N'Trinidad and Tobago', N'ترينيداد وتوباغو', N'Trinidadian/Tobagonian', N'ترينيداد وتوباغو')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (225, N'TV', N'Tuvalu', N'توفالو', N'Tuvaluan', N'توفالي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (226, N'TW', N'Taiwan', N'تايوان', N'Taiwanese', N'تايواني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (227, N'TZ', N'Tanzania', N'تنزانيا', N'Tanzanian', N'تنزانيي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (228, N'UA', N'Ukraine', N'أوكرانيا', N'Ukrainian', N'أوكراني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (229, N'UG', N'Uganda', N'أوغندا', N'Ugandan', N'أوغندي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (230, N'UM', N'US Minor Outlying Islands', N'قائمة الولايات والمناطق الأمريكية', N'US Minor Outlying Islander', N'أمريكي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (231, N'US', N'United States', N'الولايات المتحدة', N'American', N'أمريكي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (232, N'UY', N'Uruguay', N'أورغواي', N'Uruguayan', N'أورغواي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (233, N'UZ', N'Uzbekistan', N'أوزباكستان', N'Uzbek', N'أوزباكستاني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (234, N'VA', N'Vatican City', N'فنزويلا', N'Vatican', N'فاتيكاني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (235, N'VC', N'Saint Vincent and the Grenadines', N'سانت فنسنت وجزر غرينادين', N'Saint Vincent and the Grenadines', N'سانت فنسنت وجزر غرينادين')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (236, N'VE', N'Venezuela', N'فنزويلا', N'Venezuelan', N'فنزويلي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (237, N'VI', N'Virgin Islands (U.S.)', N'الجزر العذراء الأمريكي', N'American Virgin Islander', N'أمريكي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (238, N'VN', N'Vietnam', N'فيتنام', N'Vietnamese', N'فيتنامي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (239, N'VU', N'Vanuatu', N'فانواتو', N'Vanuatuan', N'فانواتي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (240, N'WF', N'Wallis and Futuna Islands', N'والس وفوتونا', N'Wallisian/Futunan', N'فوتوني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (241, N'WS', N'Samoa', N'ساموا', N'Samoan', N'ساموي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (242, N'XK', N'Kosovo', N'كوسوفو', N'Kosovar', N'كوسيفي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (243, N'YE', N'Yemen', N'اليمن', N'Yemeni', N'يمني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (244, N'YT', N'Mayotte', N'مايوت', N'Mahoran', N'مايوتي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (245, N'ZA', N'South Africa', N'جنوب أفريقيا', N'South African', N'أفريقي')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (246, N'ZM', N'Zambia', N'زامبيا', N'Zambian', N'زامبياني')
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (247, N'ZW', N'Zimbabwe', N'زمبابوي', N'Zimbabwean', N'زمبابوي')
SET IDENTITY_INSERT [dbo].[Nationality] OFF
/****** Object:  Table [dbo].[Resource]    Script Date: 07/04/2020 12:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource](
	[ResourceID] [int] IDENTITY(1,1) NOT NULL,
	[Resource_Name_Ar] [nchar](100) NULL,
	[Resource_Name_En] [nvarchar](100) NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[ResourceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Resource] ON
INSERT [dbo].[Resource] ([ResourceID], [Resource_Name_Ar], [Resource_Name_En]) VALUES (1, N'فيس بوك                                                                                             ', N'Facebook')
INSERT [dbo].[Resource] ([ResourceID], [Resource_Name_Ar], [Resource_Name_En]) VALUES (2, N'تويتر                                                                                               ', N'Tiweter')
INSERT [dbo].[Resource] ([ResourceID], [Resource_Name_Ar], [Resource_Name_En]) VALUES (3, N'انستقرام                                                                                            ', N'Instegram')
INSERT [dbo].[Resource] ([ResourceID], [Resource_Name_Ar], [Resource_Name_En]) VALUES (4, N'صديق                                                                                                ', N'Friends')
SET IDENTITY_INSERT [dbo].[Resource] OFF
/****** Object:  Table [dbo].[Notification_Show]    Script Date: 07/04/2020 12:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification_Show](
	[Notification_Show_Id] [int] NOT NULL,
	[Notification_Show_Name_Ar] [nvarchar](max) NULL,
	[Notification_Show_Name_En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Notification_Show] PRIMARY KEY CLUSTERED 
(
	[Notification_Show_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 07/04/2020 12:54:13 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Group] ON
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (1, N'الادارة', N'Management')
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (2, N'مركز الاتصالات', N'Call Center')
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (3, N'مشرف مركز الاتصال', N'Call Center Supervisor')
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (4, N'لجنة الامتحان', N'Examination committee')
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (5, N'لجنة اصدار الرقم الجامعي', N'University number issuance committee')
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (6, N'اللجنة المالية', N'Finance committee')
SET IDENTITY_INSERT [dbo].[Group] OFF
/****** Object:  Table [dbo].[LanguageMaster]    Script Date: 07/04/2020 12:54:13 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LanguageMaster] ON
INSERT [dbo].[LanguageMaster] ([ID], [Language_Name]) VALUES (1, N'Arabic')
INSERT [dbo].[LanguageMaster] ([ID], [Language_Name]) VALUES (2, N'English')
SET IDENTITY_INSERT [dbo].[LanguageMaster] OFF
/****** Object:  Table [dbo].[Collage]    Script Date: 07/04/2020 12:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collage](
	[Collage_ID] [int] IDENTITY(1,1) NOT NULL,
	[Collage_Name_Ar] [nvarchar](max) NULL,
	[Collage_Name_En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Collage] PRIMARY KEY CLUSTERED 
(
	[Collage_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Collage] ON
INSERT [dbo].[Collage] ([Collage_ID], [Collage_Name_Ar], [Collage_Name_En]) VALUES (1, N'كلية طب الأسنان', N'College of Dentistry')
INSERT [dbo].[Collage] ([Collage_ID], [Collage_Name_Ar], [Collage_Name_En]) VALUES (2, N'كلية الصيدلة', N'College of Pharmacy')
INSERT [dbo].[Collage] ([Collage_ID], [Collage_Name_Ar], [Collage_Name_En]) VALUES (3, N'كلية التمريض', N'College of Nursing')
INSERT [dbo].[Collage] ([Collage_ID], [Collage_Name_Ar], [Collage_Name_En]) VALUES (4, N'كلية العلوم الطبية التطبيقية', N'College of Applied Medical Sciences')
INSERT [dbo].[Collage] ([Collage_ID], [Collage_Name_Ar], [Collage_Name_En]) VALUES (5, N'البورد السعودي', N'Saudi Board')
INSERT [dbo].[Collage] ([Collage_ID], [Collage_Name_Ar], [Collage_Name_En]) VALUES (6, N'دبلوم عالي في زراعة الأسنان اكمال التعليم', N'Higher Diploma in Implant Dentistry Continuing Education')
INSERT [dbo].[Collage] ([Collage_ID], [Collage_Name_Ar], [Collage_Name_En]) VALUES (7, N'', N'')
SET IDENTITY_INSERT [dbo].[Collage] OFF
/****** Object:  Table [dbo].[LastUpdate]    Script Date: 07/04/2020 12:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LastUpdate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Counter] [int] NULL,
	[CreationDate] [datetime] NULL,
 CONSTRAINT [PK_LastUpdate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LastUpdate] ON
INSERT [dbo].[LastUpdate] ([Id], [Counter], [CreationDate]) VALUES (1, 4, CAST(0x0000ABCE01611836 AS DateTime))
SET IDENTITY_INSERT [dbo].[LastUpdate] OFF
/****** Object:  Table [dbo].[Lanuage_Detials]    Script Date: 07/04/2020 12:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lanuage_Detials](
	[Language_Detial_Id] [int] IDENTITY(1,1) NOT NULL,
	[Language_Master_Id] [int] NULL,
	[Language_Detial_FieldName] [nvarchar](150) NULL,
	[Language_Detial_Value] [nvarchar](150) NULL,
 CONSTRAINT [PK_Lanuage_Detials] PRIMARY KEY CLUSTERED 
(
	[Language_Detial_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Lanuage_Detials] ON
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1, 2, N'homepage-title', N'REU - Admission')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2, 1, N'homepage-title', N'جامعة رياض العلم - القبول')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (3, 2, N'homepage-work', N'sat - fri: 24 hour')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (4, 1, N'homepage-work', N'السبت - الجمعة: 24 ساعة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (5, 2, N'homepage-login', N'Login')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (6, 1, N'homepage-login', N'تسجيل الدخول')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (7, 2, N'homepage-Address', N'King Fahd Branch Road, An Namudhajiyah, Riyadh 12734, Saudi Arabia')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (8, 1, N'homepage-Address', N'طريق الملك فهد الفرعي ، النموذجية ، الرياض 12734 ، المملكة العربية السعودية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (9, 2, N'homepage-home', N'Home')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (10, 1, N'homepage-home', N'الرئيسية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (11, 2, N'homepage-Colleges', N'Colleges')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (12, 1, N'homepage-Colleges', N'الكليات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (13, 2, N'homepage-Steps', N'Steps')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (14, 1, N'homepage-Steps', N'خطوات التقديم')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (15, 2, N'homepage-Contact', N'Contact As')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (16, 1, N'homepage-Contact', N'الإتصال')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (17, 2, N'homepage-About', N'About As')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (18, 1, N'homepage-About', N'حول الجامعة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (19, 2, N'homepage-Admission', N'Admission')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (20, 1, N'homepage-Admission', N'التقديم للقبول')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (21, 2, N'homepage-ReadMore', N'Read More')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (22, 1, N'homepage-ReadMore', N'قراء المزيد')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (23, 1, N'homepage-bannerHeadOne', N'جامعة رياض العلم')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (24, 2, N'homepage-bannerHeadOne', N'Riyadh Elm University')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (25, 2, N'homepage-bannerDetailOne', N'Riyadh Elm University, Formerly Riyadh Colleges of Dentistry and Pharmacy (RCsDP) is a privately supported post-secondary...')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (26, 1, N'homepage-bannerDetailOne', N'تعد جامعة رياض علم ، التي كانت تسمى سابقًا كليات الرياض لطب الأسنان والصيدلة ، دعمًا خاصًا لما بعد المرحلة الثانوية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (27, 2, N'homepage-bannerHeadTow', N'Bachelors Degrees')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (28, 1, N'homepage-bannerHeadTow', N'درجة البكالوريوس')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (29, 2, N'homepage-bannerDetailTow', N'The core of Riyadh Elm University, Formerly Riyadh Colleges of Dentistry and Pharmacy (RCsDP) is the academic excellence')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (30, 1, N'homepage-bannerDetailTow', N'جوهر جامعة الرياض علم ، سابقا كليات الرياض لطب الأسنان والصيدلة هو التميز الأكاديمي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (31, 2, N'homepage-bannerHeadThree', N'Research & Business')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (32, 1, N'homepage-bannerHeadThree', N'البحث والأعمال')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (33, 2, N'homepage-bannerDetailThree', N'The scientific community nominates CRISPR System, based on research developed at the UA.')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (34, 1, N'homepage-bannerDetailThree', N'يرشح المجتمع العلمي نظام CRISPR ، بناءً على الأبحاث التي تم تطويرها في UA.')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (35, 2, N'homepage-BachelorsOfUniversity', N'<span>Bachelors </span> Of University')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (36, 1, N'homepage-BachelorsOfUniversity', N'<span>البكالوريوس</span> في الجامعة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (37, 2, N'homepage-FindYourBachelors', N'Find Your Bachelors')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (38, 1, N'homepage-FindYourBachelors', N'البحث عن بكالوريوس')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (39, 2, N'homepage-FillBachelors', N'Fill in the form below to find your Bachelors:')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (40, 1, N'homepage-FillBachelors', N'املأ النموذج أدناه للعثور على البكالوريوس:')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1031, 2, N'homepage-WhyChoose', N'Why <span> Choose Us</span>')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1032, 1, N'homepage-WhyChoose', N'لماذا<span> تختارنا</span>')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1033, 2, N'homepage-WhyChooseOne', N'of our trainees have got a prestigious job')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1034, 1, N'homepage-WhyChooseOne', N'الاختيار')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1035, 2, N'homepage-WhyChooseTwo', N'students have established successful business')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1036, 1, N'homepage-WhyChooseTwo', N'الاختيار')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1037, 2, N'homepage-WhyChooseThree', N'have already earned their first million')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1038, 1, N'homepage-WhyChooseThree', N'الاختيار')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1039, 2, N'homepage-QuestionsHead', N'Questions about studying with us?')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1040, 1, N'homepage-QuestionsHead', N'الاسئلة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1041, 2, N'homepage-QuestionsDetail', N'We have a team of student advisers & officers to answer any questions:')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1042, 1, N'homepage-QuestionsDetail', N'اذا كان لديك اي سؤال الرجاء كتابته في مكان الاتصال')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1043, 2, N'homepage-QuestionsButton', N'Ask us now')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1044, 1, N'homepage-QuestionsButton', N'إسئل الان')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1045, 2, N'homepage-StepOne', N'Electronic submission.')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1046, 1, N'homepage-StepOne', N'التقديم الإلكتروني')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1047, 2, N'homepage-StepTwo', N'Pay the registration fees.')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1048, 1, N'homepage-StepTwo', N'سداد رسوم التسجيل')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1049, 2, N'homepage-StepThree', N'English test personal interview.')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1050, 1, N'homepage-StepThree', N'اختبار اللغة الانجليزية والمقابلة الشخصية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1051, 2, N'homepage-StepFour', N'Congratulations acceptance.')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1052, 1, N'homepage-StepFour', N'تهنئة بالقبول')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1053, 2, N'homepage-StepFive', N'Pay the tuition fees.')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1054, 1, N'homepage-StepFive', N'سداد الرسوم الدراسية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1055, 2, N'homepage-StepSix', N'Issuing the university number.')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1056, 1, N'homepage-StepSix', N'اصدار الرقم الجامعي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1057, 2, N'homepage-StillNotConvincedHead', N'Still not convinced? We can help you!')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1058, 1, N'homepage-StillNotConvincedHead', N'للتواصل عن طريقة التقديم')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1059, 2, N'homepage-StillNotConvincedDetail', N'Fill out the form below and we will contact you.')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1060, 1, N'homepage-StillNotConvincedDetail', N'للاستفسار عن خطوات التقديم الرجاء ملاء الاستمارة ادناه')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1061, 2, N'homepage-InformationDetails', N'Information Details')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1062, 1, N'homepage-InformationDetails', N'معلومات إضافة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1063, 2, N'homepage-TalkToday', N'Talk To Us Today')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1064, 1, N'homepage-TalkToday', N'تواصل اليوم')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1065, 2, N'homepage-ContactInfo', N'Contact Info')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1066, 1, N'homepage-ContactInfo', N'معلومات الاتصال')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1067, 2, N'homepage-AddressName', N'Address')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1068, 1, N'homepage-AddressName', N'العنوان')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1069, 2, N'homepage-Phone', N'Phone')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1070, 1, N'homepage-Phone', N'رقم الهاتف')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1071, 1, N'homepage-Email', N'البريد الإلكتروني')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1072, 2, N'homepage-Email', N'E-mail')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1073, 2, N'homepage-Facebook', N'Facebook')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1074, 1, N'homepage-Facebook', N'فيس بوك')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1075, 2, N'homepage-Twitter', N'Twitter')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1076, 1, N'homepage-Twitter', N'تويتر')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1077, 2, N'homepage-Youtube', N'Youtube')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1078, 1, N'homepage-Youtube', N'يوتيوب')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1079, 2, N'homepage-Instagram', N'Instagram')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1080, 1, N'homepage-Instagram', N'انستغرام')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1081, 2, N'homepage-Flickr', N'Flickr')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1082, 1, N'homepage-Flickr', N'فليقر')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1083, 2, N'homepage-Snapchat', N'Snapchat')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1084, 1, N'homepage-Snapchat', N'سناب شات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1085, 2, N'homepage-QuickLinks', N'Quick Links')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1086, 1, N'homepage-QuickLinks', N'روابط سريعة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1087, 2, N'homepage-OurVisionHead', N'Our Vision')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1088, 1, N'homepage-OurVisionHead', N'الرؤية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1089, 2, N'homepage-OurVisionDetail', N'To become a preeminent educational institution locally, regionally, and internationally.')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1090, 1, N'homepage-OurVisionDetail', N'تحقيق الريادة و التميز لنكون في طليعة المؤسسات التعليمية محلياً و إقليمياً و عالمياً')
GO
print 'Processed 100 total records'
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1091, 2, N'homepage-OurMissionHead', N'Our Mission')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1092, 1, N'homepage-OurMissionHead', N'الرسالة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1093, 2, N'homepage-OurMissionDetail', N'Effective education and training with active contribution to scientific research and community service.')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1094, 1, N'homepage-OurMissionDetail', N'تعليم و تدريب فعال و مساهمة نشطة في البحث العلمي و خدمة المجتمع')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1095, 2, N'homepage-OurGoals', N'Our Goals')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1096, 1, N'homepage-OurGoals', N'الاهداف')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1097, 2, N'homepage-GoalOne', N'Graduate competent professionals to meet the needs of the labor market.')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1098, 1, N'homepage-GoalOne', N'إعداد كوادر مؤهلة لسد حاجة سوق العمل')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1099, 2, N'homepage-GoalTwo', N'Engage in community service.')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1100, 1, N'homepage-GoalTwo', N'خدمة المجتمع')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1101, 2, N'homepage-GoalThree', N'Conduct scientific research.')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1102, 1, N'homepage-GoalThree', N'تنفيذ البحوث العلمية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1103, 2, N'homepage-GoalFour', N'Provide competitive postgraduate programs.')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1104, 1, N'homepage-GoalFour', N'تقديم برامج دراسات عليا منافسة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1105, 2, N'homepage-GoalFive', N'Provide health care and promote health awareness to the public.')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1106, 1, N'homepage-GoalFive', N'تقديم برامج علاجية و توعوية للمجتمع')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1107, 2, N'homepage-GoalSix', N'Encourage lifelong learning through accredited continuous education programs.')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1108, 1, N'homepage-GoalSix', N'تشجيع التعلم مدى الحياة من خلال برامج معتمدة للتعليم المستمر')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1109, 2, N'homepage-Copyright', N'© Riyadh Elm University, Formerly Riyadh Colleges of Dentistry and Pharmacy | All Rights Reserved')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1110, 1, N'homepage-Copyright', N'© جامعة رياض العلم سابقاَ كلية الرياض لطب الأسنان والصيدلة | جميع الحقوق محفوظة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1111, 2, N'homepage-RiyadhElmUniversity', N'Riyadh Elm University')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1112, 1, N'homepage-RiyadhElmUniversity', N'جامعة رياض العلم')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1113, 2, N'homepage-ForgotPassword', N'Forgot Password?')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1114, 1, N'homepage-ForgotPassword', N'إسترجاع كلمة المرور؟')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1115, 2, N'Bachelors-Bachelors', N'Bachelors')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1116, 1, N'Bachelors-Bachelors', N'بكالوريوس')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1117, 2, N'Bachelors-title', N'REU - Bachelors')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1118, 1, N'Bachelors-title', N'جامعة رياض العلم - البكالوريوس')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1119, 2, N'homepage-FormRequest', N'Form Request')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1120, 1, N'homepage-FormRequest', N'إستمارة الطلب')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1121, 2, N'homepage-Admissionrequirements', N'Admission Requirements')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1122, 1, N'homepage-Admissionrequirements', N'متطلبات القبول')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2031, 2, N'homepage-AdmissionFormRequest', N'Admission Form Request')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2032, 1, N'homepage-AdmissionFormRequest', N'إستمارة طلب القبول')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2033, 1, N'Default-AllStudents', N'كل الطلاب')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2034, 1, N'Default-InProgress', N'جاري التنفيذ')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2035, 1, N'Default-Successfully', N'تم بنجاح')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2036, 1, N'Default-Failure', N'تم بالفشل')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2037, 1, N'Default-DelayPerStatus', N'التأخير حسب الحالات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2038, 1, N'Default-Update', N'تحديث')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2039, 1, N'Default-RecordPerMounths', N'احصائيات حسب الايام')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2040, 1, N'Default-RecordsPerStatus', N'احصائيات حسب الحالات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2041, 1, N'Default-TheSourceoftheInformation', N'احصائية حسب المصدر')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2042, 1, N'Default-NumberOfRecordPerMounths', N'عدد الملفات في اليوم')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2043, 1, N'Default-Title', N'التقديم - لوحة المعلومات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2044, 1, N'ListView-AllRecords', N'كل الملفات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2045, 1, N'ListView-InProgress', N'تحت التنفيذ')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2046, 1, N'ListView-CompletedSuccessfully', N'اكتمل بنحاج')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2047, 1, N'ListView-EndinFailure', N'اكتمل بالفشل')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2048, 1, N'ListView-ListofStudents', N'قائمة الطلاب')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2049, 1, N'ListView-Actions', N'العمليات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2050, 1, N'ListView-Status', N'الحالة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2051, 1, N'ListView-AssignTo', N'مسنده الي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2052, 1, N'ListView-EnglishName', N'الاسم بالانجليزية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2053, 1, N'ListView-ArabicName', N'الاسم بالعربية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2054, 1, N'ListView-Phone', N'جوال')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2055, 1, N'ListView-Email', N'الايميل')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2056, 1, N'ListView-Address', N'العنوان')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2057, 1, N'ListView-CreationDate', N'تاريخ الانشاء')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2058, 1, N'ListView-Expand', N'عرض المزيد')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2059, 1, N'Permissions-AddPermission', N'اضافة صلاحية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2060, 1, N'Permissions-EnglishName', N'الاسم الانجليزية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2061, 1, N'Permissions-ArabicName', N'الاسم بالعربية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2062, 1, N'Permissions-Parent', N'تندرج تحت')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2063, 1, N'Permissions-System', N'تتبع لنظام')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2064, 1, N'Permissions-Icon', N'ايقونة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2065, 1, N'Permissions-URLPath', N'الرابط')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2066, 1, N'Permissions-Action', N'العمليات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2067, 1, N'Permissions-NameArabic', N'الاسم بالعربية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2068, 1, N'Permissions-NameEnglish', N'الاسم بالانجليزية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2069, 1, N'Permissions-MainParent', N'صفحة رئيسية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2070, 1, N'Permissions-ClassIcon', N'تصميم الايقونة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2071, 1, N'Permissions-ClickHere', N'إضغط هنا')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2072, 1, N'Permissions-Save', N'حفظ')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2073, 1, N'PermissionGroups-ArabicName', N'الاسم بالعربية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2074, 1, N'PermissionGroups-AddGroup', N'إضافة مجموعة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2075, 1, N'PermissionGroups-EnglishName', N'الاسم بالانجليزية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2076, 1, N'PermissionGroups-ID', N'الرقم')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2077, 1, N'PermissionGroups-Action', N'العمليات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2078, 1, N'PermissionGroups-Groups', N'المجموعة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2079, 1, N'PermissionGroups-PermissionID', N'رقم الصلاحية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2080, 1, N'PermissionGroups-URLPath', N'الرابط')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2081, 1, N'PermissionGroups-Save', N'حفظ')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2082, 1, N'PermissionGroups-Title', N'ادارة الموظفين - المجموعات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2083, 1, N'MyNotifications-Title', N'نشاطاتي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2084, 1, N'MyNotifications-MyActivites', N'نشاطاتي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2085, 1, N'MyNotifications-Youhave', N'لقد قمت بـ')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2086, 1, N'Master-Profile', N'الصفحة الشخصية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2087, 1, N'Master-LockScreen', N'قفل النظام')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2088, 1, N'Master-Logout', N'تسجيل خروج')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2089, 1, N'Language-Title', N'شاشة اللغات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2090, 1, N'Language-Language', N'اللغه')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2091, 1, N'Language-FieldName', N'اسم الخانة(مركب)')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2092, 1, N'Language-ID', N'الرقم')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2093, 1, N'Language-Value', N'الترجمة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2094, 1, N'LogFile-Title', N'شاشة التتبع')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2095, 1, N'LogFile-ID', N'الرقم')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2096, 1, N'LogFile-MainPage', N'الصفحة الرئيسية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2097, 1, N'LogFile-Employee', N'الموظف')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2098, 1, N'LogFile-Date', N'التاريخ')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2099, 1, N'LogFile-LogName', N'النص بالعربي')
GO
print 'Processed 200 total records'
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2100, 1, N'LogFile-Description', N'النص بالانجليزي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2101, 1, N'Employees-Group', N'المجموعة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2102, 1, N'Employees-Language', N'اللغة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2103, 1, N'View-Employees', N'الموظفين')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2104, 1, N'Employees-Active', N'نشط')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2105, 1, N'View-SSN', N'رقم الهوية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2106, 1, N'View-StudentName', N'اسم الطالب')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2107, 1, N'View-Nationality', N'الجنسية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2108, 1, N'View-Specialization', N'التخصص')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2109, 1, N'View-Resource', N'المصدر')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2110, 1, N'View-ContactInfo', N'معلومات الاتصال')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2111, 1, N'View-AdditionalInformation', N'معلومات اضافية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2112, 1, N'Employees-Employee', N'الموظفين')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2113, 1, N'View-IdTrack', N'رقم الملف')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2114, 1, N'View-Date', N'التاريخ')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2115, 1, N'Employees-ArabicName', N'الإسم بالعربي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2116, 1, N'View-Status', N'الحالة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2117, 1, N'View-DegreesInformation', N'معلومات النسب')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2118, 1, N'View-HighSchool', N'درجة الثانوية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2119, 1, N'Employees-EnglishName', N'الإسم بالانجليزي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2120, 1, N'View-Capabilities', N'درجة القدرات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2121, 1, N'View-Achievement', N'درجة التحصيلي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2122, 1, N'View-Total', N'النسبة الكلية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2123, 1, N'Employees-Phone', N'رقم الهاتف')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2124, 1, N'View-FileName', N'اسم المستند')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2125, 1, N'View-Type', N'نوع المستند')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2126, 1, N'Employees-Email', N'البريد الإلكتروني')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2127, 1, N'View-Delete', N'حذف')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2128, 1, N'View-View', N'عرض')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2129, 1, N'Employees-Language', N'اللغة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2130, 1, N'View-SequenceOfOperations', N'تسلسل العمليات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2131, 1, N'View-Assign', N'اسناد الي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2132, 1, N'Employees-Group', N'المجموعة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2133, 1, N'Employees-Active', N'نشط')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2134, 1, N'View-MyAchievement', N'تحصيلي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2135, 1, N'View-ChangeStatusTo', N'تغير الحالة الي ')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2136, 1, N'Profile-AboutMe', N'البيانات الشخصية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2137, 1, N'Profile-ArabicName', N'الإسم بالعربي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2138, 1, N'Profile-EnglishName', N'الإسم بالإنجليزي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2139, 1, N'Profile-Email', N'البريد الإلكتروني')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2140, 1, N'Profile-Phone', N'رقم الهاتف')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2141, 1, N'Profile-Language', N'اللغة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2142, 1, N'Profile-Group', N'المجموعات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2143, 1, N'Profile-Active', N'نشط')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2144, 1, N'Profile-changePassWord', N'تغير كلمة المرور')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2145, 1, N'Profile-Personal', N'البيانات الشخصية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2146, 1, N'Profile-Change Password', N'تغير كلمة المرور')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2147, 1, N'Profile-OldPassword', N'كلمة المرور القديمة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2148, 1, N'Profile-NewPassword', N'كلمة المرور الجديدة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2149, 1, N'Profile-TryNewPassword', N'إعادة كلمة المرور الجديدة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2150, 1, N'StudentInfo-RegistrationDate', N'تاريخ التسجيل')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2151, 1, N'StudentInfo-StudentID', N'رقم الطالب')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2152, 1, N'StudentInfo-StudentArabicName', N'إسم الطالب بالعربي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2153, 1, N'StudentInfo-StudentEnglishName', N'إسم الطالب بالانجليزي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2154, 1, N'StudentInfo-StudentPhone', N'رقم الهاتف')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2155, 1, N'StudentInfo-StudentEmail', N'البريد الإلكتروني')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2156, 1, N'StudentInfo-StudentSSN', N'رقم الهوية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2157, 1, N'StudentInfo-AddStudentSSNAttachments', N'أضف مرفقات الهوية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2158, 1, N'StudentInfo-StudentAddress', N'العنوان')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2159, 1, N'StudentInfo-Specialization', N'التخصص')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2160, 1, N'StudentInfo-Resource', N'المصدر')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2161, 1, N'StudentInfo-Nationality', N'الجنسية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2162, 1, N'StudentInfo-HighSchoolDegree', N'الشهادة الثانوية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2163, 1, N'StudentInfo-CapabilitiesDegree', N'درجة القدرات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2164, 1, N'StudentInfo-MyAchievementDegree', N'درجة التحصيلي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2165, 1, N'StudentInfo-Note', N'الملاحظات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2166, 1, N'StudentInfo-Title', N'بيانات الطالب')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2167, 1, N'Profile-Title', N'الصفحة الشخصية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2168, 1, N'Employees-Title', N'الموظفين')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2169, 2, N'FormCollege-Title', N'REU - College')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2170, 1, N'FormCollege-Title', N'جامعة رياض العلم - الكليات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2171, 2, N'FormCollege-AddCollege', N'Add College')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2172, 1, N'FormCollege-AddCollege', N'إضافة كلية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2173, 2, N'FormCollege-ArabicName', N'Arabic Name')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2174, 1, N'FormCollege-ArabicName', N'الإسم عربي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2175, 2, N'FormCollege-EnglishName', N'English Name')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2176, 1, N'FormCollege-EnglishName', N'الإسم إنجليزي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2177, 2, N'FormNationality-Title', N'REU - Nationality')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2178, 1, N'FormNationality-Title', N'جامعة رياض العلم - الجنسيات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2179, 2, N'FormNationality-AddNationality', N'Add Nationality')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2180, 1, N'FormNationality-AddNationality', N'إضافة جنسية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2181, 2, N'FormNationality-ArabicName', N'Arabic Name')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2182, 1, N'FormNationality-ArabicName', N'الإسم عربي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2183, 2, N'FormNationality-EnglishName', N'English Name')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2184, 1, N'FormNationality-EnglishName', N'الإسم إنجليزي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2185, 2, N'FormResource-Title', N'REU - Resource')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2186, 1, N'FormResource-Title', N'جامعة رياض العلم - مصادر المعرفة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2187, 2, N'FormResource-AddResource', N'Add Resource')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2188, 1, N'FormResource-AddResource', N'إضافة مصادر معرفة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2189, 2, N'FormResource-ArabicName', N'Arabic Name')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2190, 1, N'FormResource-ArabicName', N'الإسم عربي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2191, 2, N'FormResource-EnglishName', N'English Name')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2192, 1, N'FormResource-EnglishName', N'الإسم إنجليزي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2193, 2, N'FormSpecialization-Title', N'REU - Specialization')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2194, 1, N'FormSpecialization-Title', N'جامعة رياض العلم - التخصصات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2195, 2, N'FormSpecialization-College', N'College Name')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2196, 1, N'FormSpecialization-College', N'إسم الكلية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2197, 2, N'FormSpecialization-Keyword', N'Keyword')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2198, 1, N'FormSpecialization-Keyword', N'كلمة مفتاحية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2199, 2, N'FormSpecialization-Specialization', N'Specialization')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2200, 1, N'FormSpecialization-Specialization', N'التخصصات')
GO
print 'Processed 300 total records'
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2201, 2, N'FormSpecialization-ArabicName', N'Arabic Name')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2202, 1, N'FormSpecialization-ArabicName', N'الإسم عربي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2203, 2, N'FormSpecialization-EnglishName', N'English Name')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2204, 1, N'FormSpecialization-EnglishName', N'الإسم إنجليزي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2205, 2, N'FormSpecialization-Icon', N'Specialization Icon')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2206, 1, N'FormSpecialization-Icon', N'أيقونة التخصص')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2207, 2, N'FormSpecialization-HighSchoolPercent', N'High School Percent')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2208, 1, N'FormSpecialization-HighSchoolPercent', N'نسبة الثانوية العامة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2209, 2, N'FormSpecialization-CapabilitiesPercent', N'Capabilities Percent')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2210, 1, N'FormSpecialization-CapabilitiesPercent', N'نسبة القدرات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2211, 2, N'FormSpecialization-MyAchievementPercent', N'My Achievement Percent')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2212, 1, N'FormSpecialization-MyAchievementPercent', N'نسبة التحصيلي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2213, 2, N'FormSpecialization-WeightedRatioPercent', N'Weighted Ratio Percent')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2214, 1, N'FormSpecialization-WeightedRatioPercent', N'النسبة المئوية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2215, 2, N'FormSpecialization-SpecializationImage', N'Specialization Image')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2216, 1, N'FormSpecialization-SpecializationImage', N'صورة التخصص')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2217, 2, N'FormSpecialization-SpecializationDescriptionArabic', N'Specialization Description Arabic')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2218, 1, N'FormSpecialization-SpecializationDescriptionArabic', N'وصف التخصص بالعربي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2219, 2, N'FormSpecialization-SpecializationDescriptionEnglish', N'Specialization Description English')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2220, 1, N'FormSpecialization-SpecializationDescriptionEnglish', N'وصف التخصص بالإنجليزي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2221, 2, N'FormSpecialization-ConditionArabic', N'Admission Requirements Arabic')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2222, 1, N'FormSpecialization-ConditionArabic', N'شروط القبول بالعربي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2223, 2, N'FormSpecialization-ConditionEnglish', N'Admission Requirements English')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2224, 1, N'FormSpecialization-ConditionEnglish', N'شروط القبول بالإنجليزي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2225, 2, N'ListContact-Title', N'REU - List Contact')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2226, 1, N'ListContact-Title', N'جامعة رياض العلم - قائمة الإتصال')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2227, 2, N'ListContact-AllRecords', N'All Records')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2228, 1, N'ListContact-AllRecords', N'كل السجلات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2229, 2, N'ListContact-InProgress', N'In Progress')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2230, 1, N'ListContact-InProgress', N'قيد التنفيذ')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2231, 2, N'ListContact-CompletedSuccessfully', N'Completed Successfully')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2232, 1, N'ListContact-CompletedSuccessfully', N'إكتمل بنجاح')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2233, 2, N'ListContact-EndinFailure', N'End In Failure')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2234, 1, N'ListContact-EndinFailure', N'انتهي بالفشل')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2235, 2, N'ListContact-ListofContact', N'List Of Contact')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2236, 1, N'ListContact-ListofContact', N'قاتمة الإتصال')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2237, 2, N'ListContact-Expand', N'Expand')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2238, 1, N'ListContact-Expand', N'وسع')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2239, 2, N'ListContact-Actions', N'Action')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2240, 1, N'ListContact-Actions', N'الأكشن')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2241, 2, N'ListContact-Status', N'Status')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2242, 1, N'ListContact-Status', N'الحالة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2243, 2, N'ListContact-Name', N'Name')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2244, 1, N'ListContact-Name', N'الإسم')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2245, 2, N'ListContact-Phone', N'Phone')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2246, 1, N'ListContact-Phone', N'رقم الهاتف')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2247, 2, N'ListContact-Email', N'E-mail')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2248, 1, N'ListContact-Email', N'البريد الإلكتروني')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2249, 2, N'ListContact-CreationDate', N'Creation Date')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2250, 1, N'ListContact-CreationDate', N'تاريخ الإنشاء')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2251, 2, N'ListContact-Message', N'Message')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2252, 1, N'ListContact-Message', N'الرسالة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2253, 2, N'ViewContact-Title', N'REU - View Contact')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2254, 1, N'ViewContact-Title', N'جامعة رياض العلم - عرض الإتصال')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2255, 2, N'ViewContact-Id', N'Student Id')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2256, 1, N'ViewContact-Id', N'رقم الطالب')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2257, 2, N'ViewContact-Name', N'Student Name')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2258, 1, N'ViewContact-Name', N'إسم الطالب')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2259, 2, N'ViewContact-Phone', N'Student Phone')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2260, 1, N'ViewContact-Phone', N'رقم هاتف الطالب')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2261, 2, N'ViewContact-Email', N'Student E-mail')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2262, 1, N'ViewContact-Email', N'البريد الإلكتروني للطالب')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2263, 2, N'ViewContact-CreationDate', N'Creation Date')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2264, 1, N'ViewContact-CreationDate', N'تاريخ الإنشاء')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2265, 2, N'ViewContact-Status', N'Status')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2266, 1, N'ViewContact-Status', N'الحالة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2267, 2, N'ViewContact-Message', N'Message')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2268, 1, N'ViewContact-Message', N'الرسالة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2269, 1, N'Master-Title', N'نظام التقديم الالكتروني')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2270, 2, N'Master-Title', N'Admission System')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2271, 1, N'StudentInfo-AddHighSchoolDegreeAttachments', N'أضف مرفقات الشهادة الثانوية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2272, 1, N'StudentInfo-AddCapabilitiesDegreeAttachments', N'أضف مرفقات القدرات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2273, 1, N'StudentInfo-AddMyAchievementDegreeAttachments', N'أضف مرفقات التحصيلي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2274, 1, N'Profile-Cancel', N'إلغاء')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2275, 1, N'Profile-Profile', N'الصورة الشخصية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2276, 1, N'AllRecords-Title', N'كل الملفات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2277, 1, N'RestoreStudent-Title', N' سلة المحذوفات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2278, 1, N'ListView-Title', N'الملفات النشطة')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2279, 1, N'View-Title', N'عرض ملف الطالب')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2280, 1, N'Permissions-Title', N'شاشة الصلاحيات')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2281, 2, N'FormSpecialization-AddSpecialization', N'Add Specialization')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2282, 1, N'FormSpecialization-AddSpecialization', N'إضافة تخصص')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2283, 1, N'StudentSubmitting-Applicationform', N'إستمارة التقديم')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2284, 1, N'ListView-DeleteHeader', N'حذف ملف طالب')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2285, 1, N'ListView-DeleteMessage', N'هل انت متأكد انك تريد حذف ملف هذا الطالب ؟')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2286, 1, N'ListView-Delete', N'حذف')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2287, 1, N'ListView-Cancel', N'الغاء')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2288, 1, N'View-DeleteHeader', N'حذف ملف')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2289, 1, N'View-Delete', N'حذف')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2290, 1, N'View-Cancel', N'الغاء')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2291, 1, N'View-DeleteMessage', N'هل انت متأكد انك تريد حذف هذا ملف ؟')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2292, 1, N'RestoreStudent-Cancel', N'الغاء')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2293, 1, N'RestoreStudent-Restore', N'استرجاع')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2294, 1, N'RestoreStudent-DeleteHeader', N'استعادة ملف طالب')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2295, 1, N'RestoreStudent-DeleteMessage', N'هل انت متأكد انك تريد استعادة ملف الطالب؟')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2296, 1, N'FormSpecialization-DeleteHeader', N'حذف التخصص')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2297, 1, N'FormSpecialization-DeleteMessage', N'هل أنت متأكد أنك تريد حذف هذا التخصص؟')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2298, 1, N'FormSpecialization-RegisterationPayment', N'رسوم التسجيل')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2299, 1, N'FormSpecialization-StudyPayment', N'الرسوم الدراسية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2300, 1, N'View-URLVideoLink', N'رابط الاجتماع')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2301, 2, N'StudentInfo-StudentSSN', N'Student National ID')
GO
print 'Processed 400 total records'
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2302, 2, N'StudentInfo-AddStudentSSNAttachments', N'Add Student National ID Attachments')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2303, 1, N'homepage-SAR', N'ريال سعودي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2304, 1, N'Bachelors-RegisterFees', N'رسوم التسجيل')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2305, 1, N'Bachelors-StudyFees', N'الرسوم الدراسية')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2306, 1, N'FormSpecialization-SpecializationSuspend', N'ايقاف التخصص')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2307, 1, N'FormSpecialization-PaymentSemester', N'رسوم الفصل الدراسي')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2308, 1, N'FormSpecialization-PaymentContract', N'رسوم العقد')
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2309, 1, N'FormSpecialization-PaymentEquation', N'معادلة الرسوم')
SET IDENTITY_INSERT [dbo].[Lanuage_Detials] OFF
/****** Object:  Table [dbo].[Group_Status]    Script Date: 07/04/2020 12:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Status](
	[Group_Status_Id] [int] IDENTITY(1,1) NOT NULL,
	[Group_Id] [int] NULL,
	[Status_Id] [int] NULL,
 CONSTRAINT [PK_Group_Status] PRIMARY KEY CLUSTERED 
(
	[Group_Status_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Group_Status] ON
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (352, 5, 12)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (353, 5, 13)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (358, 6, 5)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (359, 6, 10)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (360, 1, 2)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (361, 1, 3)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (362, 1, 4)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (363, 1, 5)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (364, 1, 6)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (365, 1, 7)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (366, 1, 8)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (367, 1, 9)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (368, 1, 10)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (369, 1, 11)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (370, 1, 12)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (371, 1, 13)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (372, 1, 15)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (373, 1, 1)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (374, 1, 14)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (375, 2, 3)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (376, 2, 4)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (377, 3, 1)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (378, 3, 2)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (379, 4, 8)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (380, 4, 7)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (381, 4, 9)
SET IDENTITY_INSERT [dbo].[Group_Status] OFF
/****** Object:  Table [dbo].[Employee]    Script Date: 07/04/2020 12:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_Id] [int] IDENTITY(1,1) NOT NULL,
	[Employee_Name_Ar] [nvarchar](max) NULL,
	[Employee_Name_En] [nvarchar](max) NULL,
	[Employee_Email] [nvarchar](max) NULL,
	[Employee_Phone] [nvarchar](max) NULL,
	[Group_Id] [int] NULL,
	[Employee_Profile] [nvarchar](max) NULL,
	[Employee_Password] [nvarchar](max) NULL,
	[Employee_Active] [bit] NULL,
	[Language_id] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (1, N'مدير النظام', N'Admin System', N'ayman@softwarecornerit.com', N'0550932548', 1, N'815ba3f3-40a6-4145-8895-915771ea594d.jpg', N'R1+S3kNwFGQZ5r74zdUhwdUX+e0Jb1QjXP2tua72oF3UgnNFDfyfoJZJhR6seVoSOrVpKEmHSXHDrdMIOe4yO7KmORH1fpEAapI0c5j42KH2bzkK6+YETp3tgdpyI7BU', 1, 1)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (10, N'فهد الشمري', N'Fahad', N'fahad@riyadh.edu.sa', N'050000259', 1, N'0fba115a-773c-4461-9360-0f0903c4482e.jpg', N'tLq9hdIRdAubqwvNQOL86k/o+fflqLG8jWta73NzlT0cHtgT5iTW7B9OP166VrdBU1Cpz0Kc2qBdk+nUuw9g4ZPDFuQO3KZJWxNXUdUVKflcmWsBEU+hSghlFkoWF8Wc', 1, 2)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (11, N'ايمن امين ', N'Ayman Amin', N'ayman1793@gmail.com', N'0550932548', 1, N'Profile.JPG', N'zljJVVhWYR1dsQ1UXR4NOvX4wgdQ1224y76kEdAdscJK6F/fWgnVLFuA5IkAcN9zMwyF1G+agLg65jym1SQCGAQkzcFqdMsFwNpstrccBA/K2EmpMBbTeq9zOcCMPfHR', 1, 2)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (12, N'عبدالمجيد الرمال ', N'عبدالمجيد الرمال ', N'abdulmajed@nedacomm.com', N'0534444481', 1, N'Profile.JPG', N'76Utsxl3zJl/yjYjvLnFITd+H3GNqOdW/hxzSv8etKcZe9B0i2I9R9RU9551AqmGWWTcb/UP/4BgykBaxinbfByn+0WG3/xoXdeDlhX858hKwveErhnvGNgeacCM5nRh', 1, 1)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (14, N'نوره المعيبد ', N'نوره المعيبد', N'nalmoaibed@nedacomm.com	', N'0599477366', 2, N'Profile.JPG', N'ydw3bQxF1kerYeEJhRMHVvDt2x2sWTyjLOUmTQJe8EhS8WBAsDl+wwiOm3hOultDdbBEZrNU1cOtY357LJjnm1I2B5EpUYnVlXlTc49QaaTgsCjAuY7ec/w6W1usVelw', 1, 1)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (15, N'ترفة الرشيد', N'ترفة الرشيد', N'talrasheed@nedacomm.com', N'0561342253', 2, N'Profile.JPG', N'b4r/QCUGyIqnHn8OXXdeailAs4RXPF/3zXTbPMlS1If1qLmRYDSInp/e+mQARUsRyfDOopfnMlw+27WWFfOL4dcboVAQfkluDTBYAWCOB7ZuQ2le2MFford+Zfn85Bhf', 1, 1)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (16, N'ساره البركة', N'ساره البركة', N'salbarakah@nedacomm.com', N'0555261421', 2, N'Profile.JPG', N'Ai4k51M03oqP9buO6y01V3rvs5zUuCJ/LSs49rz7BYEjP8VUZOLmmHEc8LspcNLOsEVl4mFYBvxmMOzGqZS5m9K8neypbSnshgUbcdLoYP5bVEajdv0nCPp6kL6F7tF4', 1, 1)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (17, N'ساره العمري', N'ساره العمري', N'salamri@nedacomm.com', N'0563181887', 3, N'Profile.JPG', N'P235OvoUtHd+9qsD1gGlw+xq5LK7NtiHIU81iXTQEwq0LZLCj6cBZ1sX7Yaqm6LCn8awRpr1TxW9eFLJORRdErYvKvcr+ff3rZ8lkE7kQnn/aXon+zV1RcT3n0LmqcHs', 1, 1)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (18, N'فريال العتيبي', N'فريال العتيبي', N'falotaibi@nedacomm.com', N'0549181798', 2, N'Profile.JPG', N'tHdfro2kU9K7kOJQCO49zHByU0mZ0eGfTs7ruMfbpqeu9U0JMbLhagvymt6HHrDunVK3or+r895Fo0mSi4bGP3BTsN387EyB0GmoaNnV9bejtP5Y5GLcDS8oGcz2DdFo', 1, 1)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (19, N'سحر الغامدي', N'سحر الغامدي', N'salghamdi@nedacomm.com', N'0533055434', 3, N'Profile.JPG', N'QGfbOrQvPBM58EjjUtc/dOF3vmLf9WnobkHLGs2B1I+hxn72l2Dr6iU9u09eJKEB9Tp8QnNYvqlVjkQGr59sXWOxm6gREEAlTkYRchS5Qhgbe8u+cy8MCaNOM6zjDvVt', 1, 1)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (20, N'شمسة العنزي', N'شمسة العنزي', N'shamsahalenze@riyadh.edu.sa', N'0534108163', 2, N'Profile.JPG', N'r+pv9QnsfUAB1HRI9oPc5n6TQ6wTq4zjP7EMm8RM6ilYmOLO0CwrPUaaAh4oSPx7uulFUrddBKTEgAg9XIrDZ4CUx5hzT3oKavbGtddQT/QBqHzVnF5NORvjuRpjfcwy', 1, 1)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (21, N'مشاعل المقرن', N'مشاعل المقرن', N'Mashaael.almogrn@riyadh.edu.sa', N'0557977479', 2, N'Profile.JPG', N'NiNM4EK9Jxv4EbxpmtiLi3eYIrIKm3L5Ub0EUVB09ErZazRS+pvmJTMkSnGuJuD7v0mogk7p2QiZLOWGzDI10H+A95nr2gA4NkFSGoZ/ad0o5kfRRCvzj6A2Sz5WbX1H', 1, 1)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (22, N'غاده أباحسين', N'غاده أباحسين', N' Ghadah.abahsin@riyadh.edu.sa', N'0548899555', 2, N'Profile.JPG', N'y/xtqhPaLSj0CwjZIUozrwgoHBmnAOamdHVsLV2cSGVFy3j7PfS7QA4tJWKo313BPIU3qJhYytZWevt+ZH4u5bm9wUmhBcKKz2Vxv8KdZOMDSYo34aS4sLIrwmnKJxzN', 1, 1)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (23, N'مجدى عبدالغني ', N'مجدي عبدالغني ', N'magdy.a.ghany@riyadh.edu.sa', N'0593890195', 6, N'Profile.JPG', N'+EdmcjVqe8K4sRGVkpiKs9G0/F9csfmwOpuoC5hl9uNjq6K1rgopyEZnj81idFroIxM+aoOVaKSXR8ctMzJKj5c5iygtNC5i3RRB16mLBcwP4cCrwMrRuE6OXDBV1ioA', 1, 1)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (24, N'محمد الميرغني', N'محمد الميرغني', N'mohamed.elmarghny@riyadh.edu.sa', N'0542437397', 6, N'474239a4-9041-46b8-866d-afcc6d1b8961.jpg', N'9AUw46+1hLUX5BW5bD/xxUXwEf/RmGjllbPSefUoxSUoI3SUFWRPpYZE0RhWLGRBa+fwpnJe/x7cxxxIvx9+9PWsKqijPRE3jGgK+ysXxfQHBU8qpxDTkdonCHTFylHa', 1, 1)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (25, N'نورة محمد الخضيري', N'نورة محمد الخضيري', N'n.khodiry@riyadh.edu.sa', N'966595267762', 6, N'Profile.JPG', N'VArdpcPoFaXxOcEZrfYYsPY/WLKZguOrjmLOckPMw8whMWZazmnN85868ECf1diXEdP8lr/qcP4LG/o1tNpyI293HOZC937iMRYBKfoKu2tfYjDZQnJPU6u69tTKfriK', 1, 1)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (26, N'اسماء الحيدري', N'اسماء الحيدري', N'asmaabdlaziz@riyadh.edu.sa', N'966504149131', 6, N'Profile.JPG', N'H3LyfuzYfolgeWIflG5c7JF9zAhMtC9bkYb9XhSq6jmgW7fRZHhnOikGdZ6ozCS0E9r7NaACwmcceu/h60H9ueVvWYiLFBX++wlwnTcJ5mbLh3SGbQHuZwgDbfqiKuw2', 1, 1)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (27, N'د. فلوة الحديثي', N'د. فلوة الحديثي', N'felwa.alhudaithi@riyadh.edu.sa', N'0555407219', 4, N'Profile.JPG', N'73kcbsKVTzkm3MtlSC5oWFf45miKxd1DkMPLnbCBacdmM+DeLEReorVbAT4Zhe+wUac97CmPHmzRs/N6lRcAu80T3iYXC7M3O7i10XpY0ADo7hY0WeY4ulolfThkKHus', 1, 1)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (28, N'فواز البطاطي', N'فواز البطاطي', N'fawaz.albatati@riyadh.edu.sa', N'0505286793', 4, N'Profile.JPG', N'Aq2eB8Xl/PPCJa5WsbSFwjWols/4wVMMiIwu0wB52Pew0xcjvejyFVS3X2NgeioZwMMk8V+9e9aifT79YV0fdUY2ugS4I6ap3zHWiRJxGIZEepT9YpMm1j5k2S/Zx4BN', 1, 1)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (29, N'البندري العجمي', N'البندري العجمي', N'bandiralajmi@riyadh.edu.sa', N'0503492208', 5, N'Profile.JPG', N'TnihTPCxvnGDpwsdfa7abK1VSfFrKL/C7YK4KVAWRgaVqlm73o+L2ZbAi42WOzZvusRpJadeoooWT3tjDR/cfvUzvXtkuqHRq5wx9rhMo+PNcJ/OW5Q2s89sKZKiSvPb', 1, 1)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (30, N'د. ساره  مباركي', N'د. ساره  مباركي', N'Sarah.mubaraki@riyadh.edu.sa', N'0542305554', 5, N'Profile.JPG', N'uvF1lS6U22pfQJUX+3Krgux2d7jTbyELbMBSZv0MHNJAFhlEhibU0gNbehZz9JAHfVisVulCslh+cYIKwIAYPJtvZ10J1tX0FrbP3dUm4Po3gYzfH81qBJMGGNJFGKzq', 1, 1)
SET IDENTITY_INSERT [dbo].[Employee] OFF
/****** Object:  Table [dbo].[Notification_Master]    Script Date: 07/04/2020 12:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification_Master](
	[Notification_Id] [int] IDENTITY(1,1) NOT NULL,
	[Notification_Date] [datetime] NULL,
	[Notification_Description_Ar] [nvarchar](max) NULL,
	[Notification_Description_En] [nvarchar](max) NULL,
	[Is_Read] [bit] NULL,
	[Date_Read] [datetime] NULL,
	[From_Employee_Structure_Id] [int] NULL,
	[To_Employee_Structure_Id] [int] NULL,
	[Master_Id] [int] NULL,
	[Notification_Link] [nvarchar](max) NULL,
	[Is_Show_Reply] [bit] NULL,
	[Date_Show_Reply] [datetime] NULL,
	[Notification_Show_Id] [int] NULL,
 CONSTRAINT [PK_Notification_Master] PRIMARY KEY CLUSTERED 
(
	[Notification_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission_Group]    Script Date: 07/04/2020 12:54:13 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Permission_Group] ON
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1672, 1, 5)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1673, 2, 5)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1674, 6, 5)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1675, 12, 5)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1676, 13, 5)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1677, 14, 5)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1678, 15, 5)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1679, 18, 5)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1680, 22, 5)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1681, 23, 5)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1682, 28, 5)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1683, 29, 5)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1684, 30, 5)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1698, 1, 6)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1699, 2, 6)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1700, 6, 6)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1701, 12, 6)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1702, 13, 6)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1703, 14, 6)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1704, 15, 6)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1705, 18, 6)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1706, 22, 6)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1707, 23, 6)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1708, 28, 6)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1709, 29, 6)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1710, 30, 6)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1711, 1, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1712, 2, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1713, 3, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1714, 4, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1715, 5, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1716, 6, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1717, 7, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1718, 8, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1719, 9, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1720, 10, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1721, 12, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1722, 13, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1723, 14, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1724, 15, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1725, 16, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1726, 28, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1727, 17, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1728, 18, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1729, 19, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1730, 20, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1731, 21, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1732, 22, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1733, 23, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1734, 24, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1735, 25, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1736, 26, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1737, 27, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1738, 29, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1739, 30, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1740, 31, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1741, 1, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1742, 2, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1743, 6, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1744, 7, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1745, 12, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1746, 13, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1747, 14, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1748, 15, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1749, 18, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1750, 22, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1751, 23, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1752, 25, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1753, 26, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1754, 27, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1755, 29, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1756, 28, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1757, 30, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1758, 31, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1759, 1, 3)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1760, 2, 3)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1761, 6, 3)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1762, 7, 3)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1763, 12, 3)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1764, 13, 3)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1765, 14, 3)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1766, 15, 3)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1767, 16, 3)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1768, 18, 3)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1769, 22, 3)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1770, 23, 3)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1771, 25, 3)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1772, 26, 3)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1773, 27, 3)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1774, 29, 3)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1775, 30, 3)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1776, 28, 3)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1777, 31, 3)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1778, 1, 4)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1779, 2, 4)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1780, 6, 4)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1781, 12, 4)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1782, 13, 4)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1783, 14, 4)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1784, 15, 4)
GO
print 'Processed 100 total records'
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1785, 16, 4)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1786, 18, 4)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1787, 22, 4)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1788, 23, 4)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1789, 31, 4)
SET IDENTITY_INSERT [dbo].[Permission_Group] OFF
/****** Object:  Table [dbo].[Specialization]    Script Date: 07/04/2020 12:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialization](
	[Specialization_Id] [int] IDENTITY(1,1) NOT NULL,
	[Specialization_Name_Ar] [nvarchar](max) NULL,
	[Specialization_Name_En] [nvarchar](max) NULL,
	[Collage_Id] [int] NULL,
	[Condition_Ar] [nvarchar](max) NULL,
	[High_School_Percent] [nvarchar](50) NULL,
	[Capabilities_Percent] [nvarchar](50) NULL,
	[My_Achievement_Percent] [nvarchar](50) NULL,
	[Weighted_Ratio_Percent] [nvarchar](50) NULL,
	[Specialization_Icon] [nvarchar](max) NULL,
	[Specialization_Image] [nvarchar](max) NULL,
	[Condition_En] [nvarchar](max) NULL,
	[Specialization_Description_Ar] [nvarchar](max) NULL,
	[Specialization_Description_En] [nvarchar](max) NULL,
	[Specialization_Registeration_Payment] [float] NULL,
	[Specialization_Study_Payment] [float] NULL,
	[Specialization_Suspend] [bit] NULL,
	[Specialization_Study_Payment_NonSaudi] [float] NULL,
	[Specialization_Study_Payment_Semester] [float] NULL,
	[Specialization_Study_Payment_Contract] [float] NULL,
	[Specialization_Study_Payment_Equation] [float] NULL,
 CONSTRAINT [PK_Specialization] PRIMARY KEY CLUSTERED 
(
	[Specialization_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Specialization] ON
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_NonSaudi], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (1, N'بكالوريوس طب و جراحه الفم و الأسنان', N'Bachelor of Dental Surgery', 1, N'<p dir="rtl">1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>

<ul dir="rtl">
	<li>أن ال تقل النسبة الموزونة عن ) <span style="color:#2980b9">80</span> ) % موزعة على النحو التالي:

	<ul>
		<li>) 30 ) % ثانوية عامة.</li>
		<li>) 30 ) % قدرات</li>
		<li>) 40 ) % تحصيلي [ على أن ال تقل درجة االختبار التحصيلي عن ) 70</li>
	</ul>
	</li>
</ul>

<p dir="rtl">2-&nbsp;أن يكون حسن السيرة والسلوك.</p>

<p dir="rtl">3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>

<p dir="rtl">4-&nbsp;أن يكون الئقاً طبياً.</p>

<p dir="rtl">5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>
', N'30', N'30', N'40', N'80', N'fa fa-user-md', N'dental-surgery.jpg', N'<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>

<p>The weighted percentage should not be less than (<span style="color:#2980b9">80%</span>) distributed as follows:</p>

<ul>
	<li>(30%) of high school.</li>
	<li>(30%) capabilities.</li>
	<li>(40%) achievement, provided that the achievement test score is not less than (70).</li>
</ul>

<p>2- To be of good conduct and behavior.</p>

<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>

<p>4- To be medically fit.</p>

<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>
', N'منذ إعتماد هذا البرنامج بموجب موافقة وزير التعليم بالرقم / 32630 وتاريخ 16/1/1426 هـ وقبلت الدفعة الأولى فيه مع بداية الفصل الدراسي الثاني من العام الدراسي 1424 – 1425 .هـ (2003 – 2004 مـ)تتكون الخطة الدراسية للبرنامج من 212 ساعة موزعة على اثنى عشر مستوى دراسي و تستغرق الدراسة ست سنوات بالإضافة لسنة الإمتياز
هو برنامج لمدة ست سنوات في طب الأسنان و يهتم بالحفاظ على صحة الأسنان واللثة ، و الأنسجة المحيطة في الفم. 

 و تماشياً مع النهضة كان لابد من تطوير عملية ووسائل التعليم المختلفة و مواكبة آخر المستجدات في علوم طب الفم و الاسنان. لذلك حرصت جامعة رياض العلم على أن تكون خطة البرنامج مواكبة للتطور العلمي بتقديم منهجاً تعليماً لمختلف المراحل الدراسية في جامعة رياض العلم ويهدف إلى  تعزيزالمهارات العلمية و العملية اللازمة لتحقيق أفضل استخدام للمواد و التقنيات الجديدة.', N'The six-year Bachelor of Dental Surgery Program at Riyadh Elm University, Formerly Riyadh Colleges of Dentistry and Pharmacy is a professional dentistry program where students are involved with clinical procedures from the outset of the program, with an emphasis on the recognition and prevention of oral diseases.
The Department of Dentistry aims towards presenting a program that is stimulating and enjoyable and one that develops skills and attitudes to continue learning after graduation; in other words to become life-long learners.
The curriculum enjoys a balance of problem-based, self-directed, traditional and hands-on learning approaches with early exposure of students to clinical dental practice. The curriculum provides students with a broad dental education that encourages continual professional development and produces graduates that are well-rounded, thinking and mature clinicians.
In today’s exciting and challenging era for dentistry, much of dental disease can be prevented. Although there is now a wide array of techniques to alleviate pain and treat dental disease, there is still that need for further improvements and better ways to prevent and treat these diseases. With this also comes the need to develop new teaching methods for the dental student of today.
At RCDP, we are trying to meet these challenges with undergraduate and postgraduate courses designed to provide both the scientific background and the practical skills needed to make the best use of new materials and put into practice the most up-to-date advances in dentistry. It is RCDP’s goal to provide our dental students with the basic understanding of oral diseases and the skills for applied aspects of their prevention and treatment in order to prepare them to practice dentistry in the 21st Century.
The curriculum is a competency based curriculum. It has been designed and modified over the years to reflect the changing needs of the dental profession and public. The school’s primary mission is patient centered. Our goal is to develop dental practitioners who are able to utilize the basic principles of human biology and human behavior in conjunction with their technical skills in diagnosing, treating, and preventing oral disease. The RCDP graduate should be able to integrate knowledge across disciplines and perform procedures with patient well-being in mind. They should understand the importance of life-long learning to continually improve their knowledge and skill base.
The B.D.S. program, which extends over a six- year period, consists of a series of:

Didactic (lecture and seminar),
Patient simulation (patient simulation clinic, introductory clinical experience, and workshop), and
Clinical (group practice, rotations and Community Service Learning Internship) experiences. These are designed and sequenced to result in the logical development of concepts and skills from simple to advanced procedures. Included in the curriculum is an awareness of research methodology and the search techniques to support Evidence-Based Dentistry. Also included is a sense of community responsibility so that all patients can access needed care.', 1000, 90000, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_NonSaudi], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (2, N'بكالوريوس علوم الصيدلة', N'Bachelor of Pharmacy Science', 2, N'<p dir="rtl">1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>

<ul dir="rtl">
	<li>أن ال تقل النسبة الموزونة عن ) <span style="color:#2980b9">70</span> ) % موزعة على النحو التالي:

	<ul>
		<li>) 30 ) % ثانوية عامة.</li>
		<li>) 30 ) % قدرات</li>
		<li>) 40 ) % تحصيلي</li>
	</ul>
	</li>
</ul>

<p dir="rtl">2-&nbsp;أن يكون حسن السيرة والسلوك.</p>

<p dir="rtl">3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>

<p dir="rtl">4-&nbsp;أن يكون الئقاً طبياً.</p>

<p dir="rtl">5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>
', N'30', N'30', N'40', N'70', N'fa fa-eraser', N'Pharmaceutical-Chemistry-1024x630.jpg', N'<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>

<p>The weighted percentage should not be less than (<span style="color:#2980b9">70%</span>) distributed as follows:</p>

<ul>
	<li>(30%) of high school.</li>
	<li>(30%) capabilities.</li>
	<li>(40%) achievement.</li>
</ul>

<p>2- To be of good conduct and behavior.</p>

<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>

<p>4- To be medically fit.</p>

<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>
', N'يتميز خريج برنامج البكالوريوس في علوم الصيدلة بما لدية من خبرات نظرية وعملية, وبقدرته على القيام بدور فعال ضمن الفريق الطب يالعلاجي من حيث العمل في المستشفيات و الصيدليات العامه و الخاصة بالاضافة الى كونه لديه القدرة على العمل في مؤسسات تصنيع الادوية و مراكز البحوث العلمية المهتمة في العلوم الصيدلانية.
 
المقررات التي تقدمها كلية الرياض للصيدلة و العلوم الطبية تهدف إلى تزويد الطلاب بالمعرفة والمهارات اللازمة من اجل الممارسة العملية. هذه المقررات من شأنها تعريف الطلاب على سيناريوهات مختلفة قد يواجهها الطلبة أثناء الممارسة, و يتم ذلك من خلال دراسة حالات, ومناقشات المجموعة، و التدرب في مستشفى اوصيدلية، الخ.
 
كما و يهدف البرنامج إلى تزويد الطلاب بالتعليم الجامعي المتميز مع التركيز على العلوم الصيدلية ودمج المعرفة مع التدريب العملي لتعزيز وتنمية المسار الوظيفي.
 
يمتد برنامج البكالوريوس في علوم الصيدلة لمدة خمس سنوات, السنة الاولى يبدأ فيها الطالب بالمقررات الدراسية الاساسية مثل الرياضيات والعلوم الأساسية (الكيمياء والأحياء والفيزياء). ومع تقدم الطالب في البرنامج سوف يأخذ العديد من المقررات الدراسية المتخصصة في العلوم الصيدلية، بما في ذلك جوانب تصميم الادوية والتوليف، وآلية عمل الدواء، علم العقاقير، وعلم الصيدلة وعلم السموم، ووضع الدواء والصناعات التحويلية.', N'The courses at Riyadh Elm University (REU), Formerly Riyadh Colleges of Dentistry and Pharmacy (RCsDP) under the practice of pharmacy aims to equip the students with the necessary knowledge and skills that will be utilized when they go into hospital or community pharmacy practice. These courses also expose the students to different scenarios that they may encounter during their practice through case studies, small group discussions, hospital and community pharmacy exposures, etc., thus ensuring that they would know how to respond when they face similar settings.
The program aims to provide the students a well-rounded undergraduate education with an emphasis on the pharmaceutical sciences and to integrate knowledge with practical hands-on experience to enhance career path development.', 1000, 90000, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_NonSaudi], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (3, N'بكالوريوس التمريض', N'Bachelor of Nursing', 3, N'<p>1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>

<ul>
	<li>أن ال تقل النسبة الموزونة عن ) <span style="color:#2980b9">65</span> ) % موزعة على النحو التالي:

	<ul>
		<li>) 30 ) % ثانوية عامة.</li>
		<li>) 30 ) % قدرات</li>
		<li>) 40 ) % تحصيلي</li>
	</ul>
	</li>
</ul>

<p>2-&nbsp;أن يكون حسن السيرة والسلوك.</p>

<p>3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>

<p>4-&nbsp;أن يكون الئقاً طبياً.</p>

<p>5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>
', N'30', N'30', N'40', N'65', N'fa fa-stethoscope', N'Nursing-Stethoscope-1.jpg', N'<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>

<p>The weighted percentage should not be less than (<span style="color:#2980b9">65%</span>) distributed as follows:</p>

<ul>
	<li>(30%) of high school.</li>
	<li>(30%) capabilities.</li>
	<li>(40%) achievement.</li>
</ul>

<p>2- To be of good conduct and behavior.</p>

<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>

<p>4- To be medically fit.</p>

<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>
', N'تقدم جامعة رياض العلم برنامج الدراسة لمدة أربع سنوات والذي يؤدي إلى منح درجة البكالوريوس في التمريض وبرنامج تدريب الامتياز لمدة سنة واحدة (12 شهرا). من أجل التأهل للحصول على درجة البكالوريوس، يجب على الطلبة المسجلين إتمام مهام البرنامج الموصوف بنجاح، التدريب السريري، وغيرها من المتطلبات أثناء برنامج التدريب. ويعد برنامج بكالوريوس التمريض في كليات الرياض لطب الأسنان والصيدلة أحد برامج التدريب المهني المتعددة في الرعاية الصحية التي أقرتها وزارة التعليم العالي والهيئة السعودية للتخصصات الصحية تباعاً.', N'Riyadh Elm University (REU) offers a four-year study program that leads to the award of the degree of Bachelor of Science Nursing and 1 year (12 months) Internship. To be eligible for the award of the degree, an enrolled student must have successfully completed the prescribed course work, clinical training and other requirements during the course of training. Nursing education at Riyadh Elm University (REU) is one of the several health care professional training programs approved by the Ministry of Education and Saudi Commission for Health Specialties respectively.', 1000, 90000, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_NonSaudi], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (4, N'بكالوريوس مساعد طبيب الأسنان', N'Bachelor of Dental Assisting', 4, N'<p>1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>

<ul>
	<li>أن ال تقل النسبة الموزونة عن ) <span style="color:#2980b9">65</span> ) % موزعة على النحو التالي:

	<ul>
		<li>) 30 ) % ثانوية عامة.</li>
		<li>) 30 ) % قدرات</li>
		<li>) 40 ) % تحصيلي</li>
	</ul>
	</li>
</ul>

<p>2-&nbsp;أن يكون حسن السيرة والسلوك.</p>

<p>3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>

<p>4-&nbsp;أن يكون الئقاً طبياً.</p>

<p>5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>
', N'30', N'30', N'40', N'65', N'fa fa-medkit', N'dental-assistant.png', N'<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>

<p>The weighted percentage should not be less than (<span style="color:#2980b9">65%</span>) distributed as follows:</p>

<ul>
	<li>(30%) of high school.</li>
	<li>(30%) capabilities.</li>
	<li>(40%) achievement.</li>
</ul>

<p>2- To be of good conduct and behavior.</p>

<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>

<p>4- To be medically fit.</p>

<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>
', N'برنامج بكالوريوس مساعد طبيب أسنان سيزود الطالب بالمواصفات و العلوم الأساسية لمساعد طبيب الاسنان. و يشمل هذا البرنامج تدريبا مهنيا يهدف الى تحسين و رفع أداء جودة رعاية المرضى, بالإضافة إلى مجموعة متنوعة وواسعة من المهام المكتبية ومهام مختبرات الأسنان.
 
احد اهم و ابرز أدوار مساعد طبيب الاسنان هو مساعدة المرضى كي يشعروا بالراحة و تخفيف حدة القلق لديهم خلال جميع مراحل إجراءات العلاج.
 
في جامعة رياض العلم, طلبة برنامج مساعد طبيب أسنان يتم تدريبهم على تقديم المساعد السريرية حيث يقوم مساعد طبيب الأسنان بالعمل مباشرة مع طبيب الأسنان على إجراءات تجري في فم المريض. إضافة الى ذلك يتم تدريبهم على كيفية استخدام الأشعة ومواد طب الأسنان. ويشمل برنامج التدريب عدد من المهام الإدارية مثل(إدارة السجلات المالية، وملء استمارات التأمين وجدولة المرضى). و يضمن هذا البرنامج تأهيل مساعد طبيب الاسنان للحصول على شهادة وطنية، قيمة لصاحب العمل وللمشاركة في عضوية الجهات المناسبة.
 
تم أعتماد برنامج مساعد طبيب الاسنان بموجب موافقة وزارة التعليم العالي بتاريخ 1/1/1429هجري و هو مخصص للطالبات فقط. تتكون الخطة الدراسية لهذا البرنامج من 140 ساعة معتمدة و موزعة على ثمانية مستويات دراسية تستغرق أربع سنوات و يضاف لها سنة الامتياز.', N'A dental assistant education will provide the essential characteristics of a great dental assistant.
The dental assistant’s most important role is to help patients feel comfortable as he/she strives to reduce their anxiety through all stages of dental procedures.
In Riyadh Elm University, students who would be dental assistants are trained in chair side assisting, four-handed dentistry, radiology, and the use of dental materials. Dental assistant training in Riyadh Elm University includes areas of study such as administrative tasks (managing financial records, completing insurance forms, and scheduling patients), The dental assistant education program includes practical instruction or supervised training in a dental clinic.
Dental assistant education in Riyadh Elm University prepares the students for these tasks and a successful career.', 1000, 90000, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_NonSaudi], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (14, N'بكالوريوس تقنية الأسنان', N'Bachelor of Dental Laboratory Technology', 4, N'<p>1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>

<ul>
	<li>أن ال تقل النسبة الموزونة عن ) <span style="color:#2980b9">65</span> ) % موزعة على النحو التالي:

	<ul>
		<li>) 30 ) % ثانوية عامة.</li>
		<li>) 30 ) % قدرات</li>
		<li>) 40 ) % تحصيلي</li>
	</ul>
	</li>
</ul>

<p>2-&nbsp;أن يكون حسن السيرة والسلوك.</p>

<p>3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>

<p>4-&nbsp;أن يكون الئقاً طبياً.</p>

<p>5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>
', N'30', N'30', N'40', N'65', N'fa fa-stethoscope', N'iStock.jpg', N'<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>

<p>The weighted percentage should not be less than (<span style="color:#2980b9">65%</span>) distributed as follows:</p>

<ul>
	<li>(30%) of high school.</li>
	<li>(30%) capabilities.</li>
	<li>(40%) achievement.</li>
</ul>

<p>2- To be of good conduct and behavior.</p>

<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>

<p>4- To be medically fit.</p>

<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>
', N'طالب تقنية الأسنان في جامعة رياض العلم يتعلم كل المهارات التقنية اللازمة للعمل مع القوالب والمعادن وغيرها من المواد لعمل تركيبات مخصصة. ويتعلم الطلاب كيفية تركيب وإصلاح أجهزة تقويم الأسنان، التيجان ,الجسور وأطقم الأسنان الكاملة، وأطقم الأسنان الجزئية، وغيرها.
 
كما يتعلم الطالب/الطالبة كيفية تعبئة الطلبات من أطباء الأسنان لمجموعة متنوعة من أجهزة طب الأسنان. ويتم تدريبهم على كيفية استخدام الإرشادات التفصيلية المكتوبة وقوالب اسنان المرضى و كيفية التعامل مع الأنسجة الرخوة في الفم', N'A Dental Technology student in Riyadh Elm University learns all the technical skills necessary to work with molds, metals, and other materials to create customized fixtures for the perfect fit. Students learn how to make and repair orthodontic appliances, crowns and bridges, complete dentures, partial dentures, and other dental appliances.
They also learn how to fill orders from dentists for a variety of dental appliances. They are trained how to use the dentists’ detailed written directions and molds of the patient’s teeth or oral soft tissues and therefrom, how to make the following items:', 1000, 90000, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_NonSaudi], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (15, N'بكالوريوس صحة الفم والأسنان', N'Bachelor in Oral and Dental Health', 4, N'<p>1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>

<ul>
	<li>أن ال تقل النسبة الموزونة عن ) <span style="color:#2980b9">65</span> ) % موزعة على النحو التالي:

	<ul>
		<li>) 30 ) % ثانوية عامة.</li>
		<li>) 30 ) % قدرات</li>
		<li>) 40 ) % تحصيلي</li>
	</ul>
	</li>
</ul>

<p>2-&nbsp;أن يكون حسن السيرة والسلوك.</p>

<p>3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>

<p>4-&nbsp;أن يكون الئقاً طبياً.</p>

<p>5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>
', N'30', N'30', N'40', N'65', N'fa fa-university', N'dentalhygiene.jpg', N'<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>

<p>The weighted percentage should not be less than (<span style="color:#2980b9">65%</span>) distributed as follows:</p>

<ul>
	<li>(30%) of high school.</li>
	<li>(30%) capabilities.</li>
	<li>(40%) achievement.</li>
</ul>

<p>2- To be of good conduct and behavior.</p>

<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>

<p>4- To be medically fit.</p>

<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>
', N'تم اعتماد هذا البرنامج بموجب موافقة وزارة التعليم العالي بتاريخ 25/7/ 1427هجري و قبلت اول دفعة من الطالبات مع بداية الفصل الدراسي من العام الدراسي 2005-2006م.


تتكون الخطة الدراسية لهذا البرنامج من 124 ساعة معتمدة و موزعة عل ثماني مستويات دراسية تستغرق اربع سنوات و يضاف لها سنة الإمتياز. البرنامج يدمج التعليم النظري والتدريب التجريبي والممارسة السريرية لإعداد الطلاب للعمل مع طبيب الأسنان وفريق طب الأسنان لعلاج جميع أنواع المرضى. صحة الأسنان تعمل جنبا إلى جنب مع أطباء الأسنان لمنع وتشخيص وعلاج أمراض الفم.', N'The Riyadh Elm University program has established a (48) – month program of studies leading to a bachelor of science degree in dental hygiene. This four year (8 Semesters).
The program integrates education, experiential learning and clinical practice to prepare the students to work with the dentist and the dental team to treat all kinds of patients. Dental hygienists work hand in hand with dentists to prevent, diagnose and treat oral diseases.
Students of the dental hygiene program are trained to provide quality dental hygiene care, in general. They are trained to assess, plan, implement and evaluate dental hygiene services for individual patients and community oral health programs; develop patient counseling programs to encourage disease prevention and good oral health; and provide prescribed clinical patient care for patients of all ages and backgrounds, including those with special needs.
They are also expected to continuously improve and enhance their professional development and face the challenges of the dental hygiene profession.', 1000, 90000, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_NonSaudi], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (16, N'بكالوريوس المختبرات الإكلينيكية', N'Bachelor of Clinical Laboratory', 4, N'<p>1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>

<ul>
	<li>أن ال تقل النسبة الموزونة عن ) <span style="color:#2980b9">65</span> ) % موزعة على النحو التالي:

	<ul>
		<li>) 30 ) % ثانوية عامة.</li>
		<li>) 30 ) % قدرات</li>
		<li>) 40 ) % تحصيلي</li>
	</ul>
	</li>
</ul>

<p>2-&nbsp;أن يكون حسن السيرة والسلوك.</p>

<p>3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>

<p>4-&nbsp;أن يكون الئقاً طبياً.</p>

<p>5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>
', N'30', N'30', N'40', N'65', N'fa fa-flask', N'biotech.jpeg', N'<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>

<p>The weighted percentage should not be less than (<span style="color:#2980b9">65%</span>) distributed as follows:</p>

<ul>
	<li>(30%) of high school.</li>
	<li>(30%) capabilities.</li>
	<li>(40%) achievement.</li>
</ul>

<p>2- To be of good conduct and behavior.</p>

<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>

<p>4- To be medically fit.</p>

<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>
', N'تم اعتماد هذا البرنامج بموجب موافقة وزارة التعليم العالي بتاريخ 8/5/1426هجري وهو مخصص للطالبات فقط و قد قبلت اول دفعة من الطالبات في الفصل الاول من العام الدراسي 2005-2006م.
تتكون الخطة الدراسية لهذا البرنامج من 132 ساعة معتمدة وموزعة على ثمانية مستويات دراسية تستغرق اربع سنوات و يضاف لها سنة امتياز للتدريب في المعامل و المختبرات الطبية. وتشمل الخطة الدراسية لهذا البرنامج مجموعة من المواد المتخصصة مثل الكيمياء والعلوم البيولوجية وعلم الأحياء المجهرية، والرياضيات، والإحصاء، وكذلك مقررات متخصصة مكرسة للعلوم والمهارات المستخدمة في المختبرات الطبية.', N'Graduates of the Riyadh Elm University’s Clinical Laboratory Sciences program emerge with the knowledge and skills necessary for a successful career in the field. Bachelor’s degree programs in clinical laboratory sciences include courses in chemistry, biological sciences, microbiology, mathematics, and statistics, as well as specialized courses devoted to knowledge and skills used in the clinical laboratory.', 1000, 90000, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_NonSaudi], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (17, N'إدارة الخدمات الصحية والمستشفيات', N'Health Services and Hospitals Department', 4, N'<p>1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>

<ul>
	<li>أن ال تقل النسبة الموزونة عن ) <span style="color:#2980b9">65</span> ) % موزعة على النحو التالي:

	<ul>
		<li>) 30 ) % ثانوية عامة.</li>
		<li>) 30 ) % قدرات</li>
		<li>) 40 ) % تحصيلي</li>
	</ul>
	</li>
</ul>

<p>2-&nbsp;أن يكون حسن السيرة والسلوك.</p>

<p>3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>

<p>4-&nbsp;أن يكون الئقاً طبياً.</p>

<p>5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>
', N'30', N'30', N'40', N'65', N'fa fa-hospital-o', N'blue-and-silver.jpg', N'<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>

<p>The weighted percentage should not be less than (<span style="color:#2980b9">65%</span>) distributed as follows:</p>

<ul>
	<li>(30%) of high school.</li>
	<li>(30%) capabilities.</li>
	<li>(40%) achievement.</li>
</ul>

<p>2- To be of good conduct and behavior.</p>

<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>

<p>4- To be medically fit.</p>

<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>
', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.', 1000, 90000, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_NonSaudi], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (18, N'بكالوريوس الحاسب الآلي', N'Bachelor of Computer', 6, N'<p>1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>

<ul>
	<li>أن ال تقل النسبة الموزونة عن ) <span style="color:#2980b9">70</span>&nbsp;) % موزعة على النحو التالي:

	<ul>
		<li>) 30 ) % ثانوية عامة.</li>
		<li>) 30 ) % قدرات</li>
		<li>) 40 ) % تحصيلي</li>
	</ul>
	</li>
</ul>

<p>2-&nbsp;أن يكون حسن السيرة والسلوك.</p>

<p>3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>

<p>4-&nbsp;أن يكون الئقاً طبياً.</p>

<p>5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>
', N'30', N'30', N'40', N'70', N'fa fa-desktop', N'christopher-gower.jpg', N'<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>

<p>The weighted percentage should not be less than (<span style="color:#2980b9">70%</span>) distributed as follows:</p>

<ul>
	<li>(30%) of high school.</li>
	<li>(30%) capabilities.</li>
	<li>(40%) achievement.</li>
</ul>

<p>2- To be of good conduct and behavior.</p>

<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>

<p>4- To be medically fit.</p>

<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>
', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.', 1000, 90000, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_NonSaudi], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (19, N' شهادة الاختصاص السعودي في برنامج طب الأسنان الترميمي', N'The Saudi Specialty Certificate in Restorative Dentistry Program', 5, N'', N'30', N'30', N'40', N'150', N'fa fa-stethoscope', NULL, N'', N'شهادة الاختصاص السعودي في طب الأسنان الترميمي هو برنامج للتعليم المتقدم في طب الأسنان الترميمي, بدأ في أكتوبر 1999, وهو برنامج مصمم لتوفير التعليم المتخصص التدريبي والسريري لرفع مستوى مهنة طب الأسنان في المملكة العربية السعودية. يقدم برنامج البورد السعودي SBARD التعليمات, المعرفة, والخبرات المتقدمة لغاية تجهيز اطباء اسنان على درجة عالية من الكفاءة في مجال طب الأسنان الترميمي، حشو الأسنان والتركيبات الثابتة.', N'The Saudi Specialty Certificate in Restorative Dentistry [SSC-(Dent) Resto] former SBARD is an advanced education program in restorative dentistry started October 1999 designed to provide didactic, clinical and hospital training to upgrade the level of dental profession in Saudi Arabia. The instruction and experience provided in SBARD prepare residents to be highly qualified restorative dentists who are able to treat complex restorative cases of the following disciplines; Restorative dentistry, Endodontics and Fixed Prosthodontics.', 1000, 90000, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_NonSaudi], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (20, N'شهادة الاختصاص السعودي في برنامج الاستعاضة السنية', N'The Saudi Specialty Certificate in Prosthodontics Program', 5, N'', N'30', N'30', N'40', N'100', N'fa fa-stethoscope', NULL, N'', N'شهادة الاختصاص السعودي في الاستعاضة السنية هو عبارة عن برنامج تدريب لمدة أربع سنوات ويقدم التدريب التعليمي السريري والمختبري في مجال التعويضات السنية. يقدم برنامج البورد السعودي SBARD التعليمات, المعرفة, والخبرات المتقدمة لغاية تجهيز اطباء اسنان على درجة عالية من الكفاءة في توفير هذه الرعاية التعويضية المثلى للمجتمع.', N'The Saudi Specialty Certificate in Prosthodontics (SSC-Dent (Prosth) program is a four-year training program that offers didactic, clinical and laboratory training in the field of prosthodontics. As the adult population in the Kingdom of Saudi Arabia increases, there will be a proportional increase in need for high quality trained Prosthodontists becomes evident. Graduates of the Saudi Specialty Certificate in Prosthodontics (SSC-Dent (Prosth) program will contribute in providing such optimal prosthodontic care.', 1000, 90000, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_NonSaudi], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (21, N'شهادة الاختصاص السعودي في برنامج اللبية', N'The Saudi Specialty Certificate in Endodontic Program', 5, N'', N'30', N'30', N'40', N'100', N'fa fa-stethoscope', NULL, N'', N'شهادة الاختصاص السعودي في علاج الجذور و عصب الاسنان هو فرع من فروع طب الأسنان يعنى بمورفولوجيا، فسيولوجيا، والخواص الباثولوجية للب السني البشري والأنسجة المحيطه بالجذر. كما و يشمل الدراسة و التدريب على العلوم الإكلينيكية الأساسية بما في ذلك بيولوجيا اللب العادي، والأسباب المرضية والتشخيص والوقاية والعلاج من الأمراض والإصابات.
 
يمتد البرنامج لمدة أربع سنوات، وقد تم تصميمه لتلبية احتياجات الذين يرغبون في اكتساب المزيد من المهارات والمعرفة والخبرة في علاج الجذور الإكلينيكية، فضلا عن خلفية في العلوم البيولوجية. ويتضمن البرنامج مشاركة فاعلة في المحاضرات والندوات والكتب.', N'The Saudi Specialty Certificate in Endodontics [SSC-(Dent) Endo] is the branch of dentistry, which is concerned with the morphology, physiology, and pathology of the human dental pulp and periradicular tissues. Its studies and practice encompass the basic clinical sciences, including biology of the normal pulp, the etiology, diagnosis, prevention and treatment of diseases and injuries of the pulp and associated periradicular conditions. The program extends for four years and it has been designed to satisfy the needs for those who wish to acquire greater skill, knowledge, and experience in clinical Endodontics, as well as a background in biological sciences. The program includes participation in formal lectures, seminars, book and literature reviews.', 1000, 90000, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_NonSaudi], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (22, N'شهادة الاختصاص السعودي في برنامج اللثة', N'The Saudi Specialty Certificate in Periodontics Program', 5, N'', N'30', N'30', N'40', N'100', N'fa fa-stethoscope', NULL, N'', N'شهادة الاختصاص السعودي في برنامج اللثة هو برنامج لمدة أربع سنوات يهدف إلى تلبية احتياجات أولئك الذين يرغبون في اكتساب مهارات عالية ومعرفة وخبرة في علوم اللثة, فضلا عن خلفية في العلوم البيولوجية. سيتم تقديم تدريب متقدم في impantology، الجراحة التجميلية للثة، الجراحة الترميمية للثة. يتم إنجاز الأهداف التعليمية من خلال المحاضرات والندوات والعروض التعليمية, والمؤتمرات والممارسة السريرية.', N'The Saudi Specialty Certificate in Periodontics [SSC-Dent (Perio)] Program is a four year program designed to satisfy the needs of those who wish to acquire high skills, knowledge and experience in clinical Periodontics, as well as a background in biological sciences. Significant training will be given in impantology, periodontal plastic surgery, oral reconstructive surgery, and periodontal medicine. Educational objectives are accomplished through lectures, seminars, case presentation, conferences and clinical practice.', 1000, 90000, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_NonSaudi], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (23, N'برنامج شهادة الاختصاص السعودي في تقويم الأسنان', N'The Saudi Specialty Certificate Program in Orthodontics', 5, N'', N'30', N'30', N'40', N'100', N'fa fa-stethoscope', NULL, N'', N'برنامج شهادة الاختصاص السعودي في تقويم الأسنان هو برنامج للتدريب السريري لمدة 5 سنوات في مجال تقويم الأسنان. وتم الموافقة عليه من قبل الهيئة السعودية للتخصصات الصحية (SCHS). حيث ان المرشحين الذين يتم قبولهم في البرنامج ينالون تدريبا تعليما وسريريا مكثفا في تقويم الأسنان.', N'The Saudi Specialty Certificate Program in Orthodontics (SSCPO) is a 5-year clinical training program in the field of orthodontics approved by the Saudi Commission for Health Specialties (SCHS). Candidates who are accepted into the program undergo intensive didactic and clinical orthodontic training.', 1000, 90000, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_NonSaudi], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (24, N'شهادة الاختصاص السعودي في برنامج طب اسنان الأطفال', N'The Saudi Specialty Certificate in Pediatric Dentistry Program', 5, N'', N'30', N'30', N'40', N'100', N'fa fa-stethoscope', NULL, N'', N'شهادة الاختصاص السعودي في طب أسنان الأطفال هو برنامج لمدة أربع سنوات مصمم لتلبية المعايير التعليمية وفقا للهيئة السعودية للتخصصات الصحية. عند الانتهاء من البرنامج، يحصل المقيم على شهادة الاختصاص السعودي في طب أسنان الأطفال.
 
ويتضمن البرنامج تدريبا سريريا مكثفا في طب أسنان الأطفال, ويشمل توفير الرعاية الصحية الأولية والشاملة لمرضى أسنان الأطفال من الرضع والأطفال والمراهقين وللمرضى من ذوي الاحتياجات الخاصة. وبالإضافة إلى ذلك، يشمل التشخيص والعلاج من مشاكل الإطباق في الأسنان. يتم تحقيق اهداف البرنامج من خلال المحاضرات والندوات والعروض التعليمية, والمؤتمرات والممارسة السريرية.', N'The Saudi Specialty Certificate in Pediatric Dentistry is a four years program designed to meet the educational standards of the Saudi Commission for Health Specialties. Upon completion of the program, the resident receives a Saudi Specialty Certificate in Pediatric Dentistry.
The Program involves intensive clinical training in Pediatric Dentistry which includes providing primary and comprehensive dental care for pediatric patients from infant, child, adolescents and for patients with special needs. In addition, it includes diagnosis and treatment of occlusal problems in the primary, mixed and young permanent dentition. The program will also include Pediatric Dentistry literature review and basic sciences.', 1000, 90000, 0, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Specialization] OFF
/****** Object:  Table [dbo].[Student_Concat]    Script Date: 07/04/2020 12:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Concat](
	[Student_Concat_Id] [int] IDENTITY(1,1) NOT NULL,
	[Student_Concat_Name] [nvarchar](max) NULL,
	[Student_Concat_Phone] [nvarchar](max) NULL,
	[Student_Concat_Email] [nvarchar](max) NULL,
	[Student_Concat_Message] [nvarchar](max) NULL,
	[Student_Concat_Status] [int] NULL,
	[Student_Concat_CreationDate] [datetime] NULL,
 CONSTRAINT [PK_Student_Concat] PRIMARY KEY CLUSTERED 
(
	[Student_Concat_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Student_Concat] ON
INSERT [dbo].[Student_Concat] ([Student_Concat_Id], [Student_Concat_Name], [Student_Concat_Phone], [Student_Concat_Email], [Student_Concat_Message], [Student_Concat_Status], [Student_Concat_CreationDate]) VALUES (1, N'ساره العمري', N'0563181887', N'sa3arah18@gmail.com', N'السلام عليكم ورحمة الله وبركاته 
أرغب بالتقديم في الجامعة ماهي الآلية', 2, CAST(0x0000ABE900AB8979 AS DateTime))
SET IDENTITY_INSERT [dbo].[Student_Concat] OFF
/****** Object:  Table [dbo].[Student]    Script Date: 07/04/2020 12:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Student_Id] [int] IDENTITY(1,1) NOT NULL,
	[Student_SSN] [nvarchar](50) NULL,
	[Student_Name_En] [nvarchar](max) NULL,
	[Student_Name_Ar] [nvarchar](max) NULL,
	[Student_Address] [nvarchar](max) NULL,
	[Student_Phone] [nvarchar](50) NULL,
	[Student_Email] [nvarchar](max) NULL,
	[Student_High_School_Degree] [nvarchar](50) NULL,
	[Student_Capabilities_Degree] [nvarchar](50) NULL,
	[Student_My_Achievement_Degree] [nvarchar](50) NULL,
	[Student_CreationDate] [datetime] NULL,
	[Student_Employee_Id] [int] NULL,
	[Student_Assign_Date] [datetime] NULL,
	[Student_Image_Profile] [nvarchar](max) NULL,
	[Student_Specialization_Id] [int] NULL,
	[Student_Nationality_Id] [int] NULL,
	[Student_Resource_Id] [int] NULL,
	[Student_Status_Id] [int] NULL,
	[Student_Total] [nvarchar](50) NULL,
	[Suspended] [int] NULL,
	[Notes] [nvarchar](max) NULL,
	[Student_URL_Video] [nvarchar](max) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Student_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Student_SSN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log_File]    Script Date: 07/04/2020 12:54:13 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Log_File] ON
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7179, CAST(0x0000ABE8011C2889 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7180, CAST(0x0000ABE8011C791B AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":31,"Permission_Name_Ar":"معلومات اخرى","Permission_Name_En":"Other Informations","Parent":1,"Url_Path":"Pages/RegistrationProcess/OtherInfo.aspx","Permission_Icon":"icofont icofont-info-circle","System_Id":1}', 1, 4, N'إضافة صلاحية جديدة', N'add new permission')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7181, CAST(0x0000ABE8011CAE1A AS DateTime), N'data:1', 1, 5, N'تعديل صلاحيات المجموعة', N'update group permissions')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7182, CAST(0x0000ABE8011CCDBC AS DateTime), N'data:2', 1, 5, N'تعديل صلاحيات المجموعة', N'update group permissions')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7183, CAST(0x0000ABE8011CFB7B AS DateTime), N'data:3', 1, 5, N'تعديل صلاحيات المجموعة', N'update group permissions')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7184, CAST(0x0000ABE8011D0E77 AS DateTime), N'data:4', 1, 5, N'تعديل صلاحيات المجموعة', N'update group permissions')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7185, CAST(0x0000ABE800F03003 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7186, CAST(0x0000ABE800F82FEF AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7187, CAST(0x0000ABE8010081D5 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7188, CAST(0x0000ABE80100B9F1 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":11,"Employee_Name_Ar":"ايمن امين ","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"Profile.JPG","Employee_Password":"nVzvg7cMEsjPaYHvYUz6e3mrpHx77l4u16SzvtHCLErlcOjJxf0Cdlst4apxphDrma7YdaPKCBEGgSJLGedo8zwgJcu6iZm63v5z3RLWBB66CtUclVBmsvFsK/rMvfCi","Employee_Active":true,"Language_id":2}', 1, 16, N'إضافة موظف', N'Add Employee')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7189, CAST(0x0000ABE80100D611 AS DateTime), N'data:{"Employee_Id":11,"Employee_Name_Ar":"ايمن امين ","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 11, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7190, CAST(0x0000ABE80100E96D AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":11,"Employee_Name_Ar":"ايمن امين ","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"Profile.JPG","Employee_Password":"nVzvg7cMEsjPaYHvYUz6e3mrpHx77l4u16SzvtHCLErlcOjJxf0Cdlst4apxphDrma7YdaPKCBEGgSJLGedo8zwgJcu6iZm63v5z3RLWBB66CtUclVBmsvFsK/rMvfCi","Employee_Active":true,"Language_id":2}', 11, 15, N'تعديل بيانات الموظف', N'Update Employee Info')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7191, CAST(0x0000ABE80100FED2 AS DateTime), N'data:{"Employee_Id":11,"Employee_Name_Ar":"ايمن امين ","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 11, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7192, CAST(0x0000ABE801010FBD AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":11,"Employee_Name_Ar":"ايمن امين ","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"Profile.JPG","Employee_Password":"zljJVVhWYR1dsQ1UXR4NOvX4wgdQ1224y76kEdAdscJK6F/fWgnVLFuA5IkAcN9zMwyF1G+agLg65jym1SQCGAQkzcFqdMsFwNpstrccBA/K2EmpMBbTeq9zOcCMPfHR","Employee_Active":true,"Language_id":2}', 11, 15, N'تعديل كلمة المرور', N'Change PassWord')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7193, CAST(0x0000ABE801011B06 AS DateTime), N'data:{"Employee_Id":11,"Employee_Name_Ar":"ايمن امين ","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 11, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7194, CAST(0x0000ABE900A4D425 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7195, CAST(0x0000ABE900AB8981 AS DateTime), N'data:{"Student_Concat_Id":1,"Student_Concat_Name":"ساره العمري","Student_Concat_Phone":"0563181887","Student_Concat_Email":"sa3arah18@gmail.com","Student_Concat_Message":"السلام عليكم ورحمة الله وبركاته \r\nأرغب بالتقديم في الجامعة ماهي الآلية","Student_Concat_Status":1,"Student_Concat_CreationDate":"2020-06-29T10:24:32.8294113+03:00","Status":null}', 1, 1, N'الاتصال', N'Contact As')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7196, CAST(0x0000ABE900C633A2 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7197, CAST(0x0000ABE900C66F6E AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7198, CAST(0x0000ABE900C6C33E AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":1,"Employee_Profile":"Profile.JPG","Employee_Password":"qsgH3F6g6dDnCSvMFHzKKiaUkuF9pxl7xkj1LjVTP5cBSV1u9WL3AVbtJDQDvIHyBddCTCVrw6BmLBzKHAVXpmE47oBY1v+pm3986ENGwuKrcoNvRtediD/S/zjV2bpF","Employee_Active":true,"Language_id":1}', 1, 16, N'إضافة موظف', N'Add Employee')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7199, CAST(0x0000ABE900C77536 AS DateTime), N'data:{"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 12, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7200, CAST(0x0000ABE900C84980 AS DateTime), N'data:{"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 12, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7201, CAST(0x0000ABE900C88383 AS DateTime), N'data:{"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 12, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7202, CAST(0x0000ABE900C8A6D8 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":1,"Employee_Profile":"Profile.JPG","Employee_Password":"wEzOC6MTH7UBc/fSmuuH3a8Me054wgDzj22/kx7aTOxu0qOO3v2RsfEnQUOlGS+Eh4ZRa7Sfl1rKD2Y1Frs5fClZvwWMircuZtZy+IVvozaaAOWbj0Kzyr6tr9Z5ouB/","Employee_Active":true,"Language_id":1}', 12, 15, N'تعديل كلمة المرور', N'Change PassWord')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7203, CAST(0x0000ABE900C8C03E AS DateTime), N'data:{"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 12, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7204, CAST(0x0000ABE900C90497 AS DateTime), N'data:{"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 12, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7205, CAST(0x0000ABE900C94C21 AS DateTime), N'data:{"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 12, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7206, CAST(0x0000ABE900CA11A9 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7207, CAST(0x0000ABE900DAAFE1 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7208, CAST(0x0000ABE900DB77EE AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":13,"Employee_Name_Ar":"تجربة","Employee_Name_En":"Test","Employee_Email":"ayman1793@hotmail.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"Profile.JPG","Employee_Password":"pEEpm6dosyFgeQjvHR6xZjZx3DnePbHHytAXlBrcjWlgzYIsw/y96U3XTIhcruWOXqtTCzvW89BUoTKPynzpY3tDhry9ub4t04tGPEP+zCYM0gWMdDTsynMuPGqKGi/7","Employee_Active":true,"Language_id":2}', 1, 16, N'إضافة موظف', N'Add Employee')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7209, CAST(0x0000ABE900DCC753 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"xK5MDjOTYkeI0proPUPxAJUzS9UUJka1P15cn9AFnVDO4/R6dsgZKwL4LyNDm4ZgfS3XCCOHcmsiOqK+F3Jx9wjxB5lGP/WslXiXVUIj8TiPNPVokiWdCRRp8yopoCTO","Employee_Active":true,"Language_id":1}', 1, 30, N'إعادة تعين كلمة السر', N'reset your password')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7210, CAST(0x0000ABE900EB4243 AS DateTime), N'data:{"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 12, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7211, CAST(0x0000ABE900EF3E31 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":14,"Employee_Name_Ar":"نوره المعيبد ","Employee_Name_En":"نوره المعيبد","Employee_Email":"nalmoaibed@nedacomm.com\t","Employee_Phone":"0599477366","Group_Id":2,"Employee_Profile":"Profile.JPG","Employee_Password":"ydw3bQxF1kerYeEJhRMHVvDt2x2sWTyjLOUmTQJe8EhS8WBAsDl+wwiOm3hOultDdbBEZrNU1cOtY357LJjnm1I2B5EpUYnVlXlTc49QaaTgsCjAuY7ec/w6W1usVelw","Employee_Active":true,"Language_id":1}', 12, 16, N'إضافة موظف', N'Add Employee')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7212, CAST(0x0000ABE900EF8E7B AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":15,"Employee_Name_Ar":"ترفة الرشيد","Employee_Name_En":"ترفة الرشيد","Employee_Email":"talrasheed@nedacomm.com","Employee_Phone":"0561342253","Group_Id":2,"Employee_Profile":"Profile.JPG","Employee_Password":"b4r/QCUGyIqnHn8OXXdeailAs4RXPF/3zXTbPMlS1If1qLmRYDSInp/e+mQARUsRyfDOopfnMlw+27WWFfOL4dcboVAQfkluDTBYAWCOB7ZuQ2le2MFford+Zfn85Bhf","Employee_Active":true,"Language_id":1}', 12, 16, N'إضافة موظف', N'Add Employee')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7213, CAST(0x0000ABE900EFF4F7 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":16,"Employee_Name_Ar":"ساره البركة","Employee_Name_En":"ساره البركة","Employee_Email":"salbarakah@nedacomm.com","Employee_Phone":"0555261421","Group_Id":2,"Employee_Profile":"Profile.JPG","Employee_Password":"wAHb8XJKfE2GqYXVU8LAdyWA6+JkPk93MDSpoRkQgq9DzlHVSONfvaajML5DdNhgmJv6xyyLXdaGH5G86Qb1w4SX3kW5TWSMRUR94GN9bYt4gbBfY15BS5n1rxd6ZSB0","Employee_Active":true,"Language_id":1}', 12, 16, N'إضافة موظف', N'Add Employee')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7214, CAST(0x0000ABE900F03623 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":17,"Employee_Name_Ar":"ساره العمري","Employee_Name_En":"ساره العمري","Employee_Email":"salamri@nedacomm.com","Employee_Phone":"0563181887","Group_Id":3,"Employee_Profile":"Profile.JPG","Employee_Password":"B3aiqPUMbJfIfQn91gPES7ZCLRCab1YWvLaVSJeJ68yAyVZ+a0kD4fzqE+OWiIhzgeV2mnKloKRtOsxUjvtThB0/dKh5+fH4yPj9GhryjnxdGzXd2v8uyHtWw/p3AOfl","Employee_Active":true,"Language_id":1}', 12, 16, N'إضافة موظف', N'Add Employee')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7215, CAST(0x0000ABE900F081EF AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":18,"Employee_Name_Ar":"فريال العتيبي","Employee_Name_En":"فريال العتيبي","Employee_Email":"falotaibi@nedacomm.com","Employee_Phone":"0549181798","Group_Id":2,"Employee_Profile":"Profile.JPG","Employee_Password":"tHdfro2kU9K7kOJQCO49zHByU0mZ0eGfTs7ruMfbpqeu9U0JMbLhagvymt6HHrDunVK3or+r895Fo0mSi4bGP3BTsN387EyB0GmoaNnV9bejtP5Y5GLcDS8oGcz2DdFo","Employee_Active":true,"Language_id":1}', 12, 16, N'إضافة موظف', N'Add Employee')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7216, CAST(0x0000ABE900F0D9E5 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":19,"Employee_Name_Ar":"سحر الغامدي","Employee_Name_En":"سحر الغامدي","Employee_Email":"salghamdi@nedacomm.com","Employee_Phone":"0533055434","Group_Id":2,"Employee_Profile":"Profile.JPG","Employee_Password":"QGfbOrQvPBM58EjjUtc/dOF3vmLf9WnobkHLGs2B1I+hxn72l2Dr6iU9u09eJKEB9Tp8QnNYvqlVjkQGr59sXWOxm6gREEAlTkYRchS5Qhgbe8u+cy8MCaNOM6zjDvVt","Employee_Active":true,"Language_id":1}', 12, 16, N'إضافة موظف', N'Add Employee')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7217, CAST(0x0000ABE900F16346 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":20,"Employee_Name_Ar":"شمسة العنزي","Employee_Name_En":"شمسة العنزي","Employee_Email":"shamsahalenze@riyadh.edu.sa","Employee_Phone":"0534108163","Group_Id":2,"Employee_Profile":"Profile.JPG","Employee_Password":"r+pv9QnsfUAB1HRI9oPc5n6TQ6wTq4zjP7EMm8RM6ilYmOLO0CwrPUaaAh4oSPx7uulFUrddBKTEgAg9XIrDZ4CUx5hzT3oKavbGtddQT/QBqHzVnF5NORvjuRpjfcwy","Employee_Active":true,"Language_id":1}', 12, 16, N'إضافة موظف', N'Add Employee')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7218, CAST(0x0000ABE900F1A7B5 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":21,"Employee_Name_Ar":"مشاعل المقرن","Employee_Name_En":"مشاعل المقرن","Employee_Email":"Mashaael.almogrn@riyadh.edu.sa","Employee_Phone":"0557977479","Group_Id":2,"Employee_Profile":"Profile.JPG","Employee_Password":"sRkrgC4FubwdpTs/CSLN07wQLRrVLtVuYTaDYGiRfBLsOZqBwrwHlloIwU79qUi+CSMyraifwXnd9Qdd9KilkaawfAi7CF5I7dOeACHXx4nRTdroIp43UXPuZXUW6Mlu","Employee_Active":true,"Language_id":1}', 12, 16, N'إضافة موظف', N'Add Employee')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7219, CAST(0x0000ABE900F20290 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":22,"Employee_Name_Ar":"غاده أباحسين","Employee_Name_En":"غاده أباحسين","Employee_Email":" Ghadah.abahsin@riyadh.edu.sa","Employee_Phone":"0548899555","Group_Id":2,"Employee_Profile":"Profile.JPG","Employee_Password":"y/xtqhPaLSj0CwjZIUozrwgoHBmnAOamdHVsLV2cSGVFy3j7PfS7QA4tJWKo313BPIU3qJhYytZWevt+ZH4u5bm9wUmhBcKKz2Vxv8KdZOMDSYo34aS4sLIrwmnKJxzN","Employee_Active":true,"Language_id":1}', 12, 16, N'إضافة موظف', N'Add Employee')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7220, CAST(0x0000ABE90102A7FF AS DateTime), N'data:{"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 12, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7221, CAST(0x0000ABE90103521B AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":23,"Employee_Name_Ar":"مجدى عبدالغني ","Employee_Name_En":"مجدي عبدالغني ","Employee_Email":"magdy.a.ghany@riyadh.edu.sa","Employee_Phone":"0593890195","Group_Id":6,"Employee_Profile":"Profile.JPG","Employee_Password":"46rysukt17qQzkLq5sNmDTiW526qY1VizeK776nXH2zDPR2mc0xK9MwUHlY5oBjDXp7bhowshsqo6PiPN1EkSMZQHU+fM9h6oXDtS0QuczjEyv+kPT2Px+xbgPgZvosr","Employee_Active":true,"Language_id":1}', 12, 16, N'إضافة موظف', N'Add Employee')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7222, CAST(0x0000ABE90103D315 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":24,"Employee_Name_Ar":"محمد الميرغني","Employee_Name_En":"محمد الميرغني","Employee_Email":"mohamed.elmarghny@riyadh.edu.sa","Employee_Phone":"0542437397","Group_Id":6,"Employee_Profile":"Profile.JPG","Employee_Password":"3y6i2TPIhyY7DbUKluxkV44KzA83MBHanVtPDKi/QXeuL1voM01GlTIq70NggRI0CXHzqmF1y73r+y8lJsssOjjbFa1EFD4cIocivAMzbO2GVChcq2t9SCdyCd25GHbO","Employee_Active":true,"Language_id":1}', 12, 16, N'إضافة موظف', N'Add Employee')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7223, CAST(0x0000ABE901042F48 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":25,"Employee_Name_Ar":"نورة محمد الخضيري","Employee_Name_En":"نورة محمد الخضيري","Employee_Email":"n.khodiry@riyadh.edu.sa","Employee_Phone":"966595267762","Group_Id":6,"Employee_Profile":"Profile.JPG","Employee_Password":"bg7/0YpVEzLjHFpUpu9RrrP5tvEUpIyXcGZaQqoGXT/YCUdlcElvIvCZuP4DdVBtDgQOe2u8zkvxwgualjL8iud0uOtsXUcEcjLc49lxtBzNH1HNQ7TMfnFIhpnZTbQb","Employee_Active":true,"Language_id":1}', 12, 16, N'إضافة موظف', N'Add Employee')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7224, CAST(0x0000ABE90104770B AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":26,"Employee_Name_Ar":"اسماء الحيدري","Employee_Name_En":"اسماء الحيدري","Employee_Email":"asmaabdlaziz@riyadh.edu.sa","Employee_Phone":"966504149131","Group_Id":6,"Employee_Profile":"Profile.JPG","Employee_Password":"NXFIm3sjdBFSwRmA1m+JcPd5Vm7Uk5NprJBUCqfMiwMimpr/8+AEwvvSdduaoPbmus3i1uwMoKnetize/HcC33j1wAHO1xU5vQSEHos7DVoQTTHxXJyjBaIzqSuYolzr","Employee_Active":true,"Language_id":1}', 12, 16, N'إضافة موظف', N'Add Employee')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7225, CAST(0x0000ABE90107437A AS DateTime), N'data:{"Employee_Id":19,"Employee_Name_Ar":"سحر الغامدي","Employee_Name_En":"سحر الغامدي","Employee_Email":"salghamdi@nedacomm.com","Employee_Phone":"0533055434","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 19, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7226, CAST(0x0000ABE901092FA3 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":19,"Employee_Name_Ar":"سحر الغامدي","Employee_Name_En":"سحر الغامدي","Employee_Email":"salghamdi@nedacomm.com","Employee_Phone":"0533055434","Group_Id":3,"Employee_Profile":"Profile.JPG","Employee_Password":"QGfbOrQvPBM58EjjUtc/dOF3vmLf9WnobkHLGs2B1I+hxn72l2Dr6iU9u09eJKEB9Tp8QnNYvqlVjkQGr59sXWOxm6gREEAlTkYRchS5Qhgbe8u+cy8MCaNOM6zjDvVt","Employee_Active":true,"Language_id":1}', 12, 16, N'تعديل بيانات موظف', N'update Employee')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7227, CAST(0x0000ABE90109E5C1 AS DateTime), N'data:{"Employee_Id":26,"Employee_Name_Ar":"اسماء الحيدري","Employee_Name_En":"اسماء الحيدري","Employee_Email":"asmaabdlaziz@riyadh.edu.sa","Employee_Phone":"966504149131","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 26, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7228, CAST(0x0000ABE90154DD28 AS DateTime), N'data:{"Employee_Id":25,"Employee_Name_Ar":"نورة محمد الخضيري","Employee_Name_En":"نورة محمد الخضيري","Employee_Email":"n.khodiry@riyadh.edu.sa","Employee_Phone":"966595267762","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 25, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7229, CAST(0x0000ABEA00555ED2 AS DateTime), N'data:{"Employee_Id":14,"Employee_Name_Ar":"نوره المعيبد ","Employee_Name_En":"نوره المعيبد","Employee_Email":"nalmoaibed@nedacomm.com\t","Employee_Phone":"0599477366","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 14, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7230, CAST(0x0000ABEA007AB233 AS DateTime), N'data:{"Employee_Id":14,"Employee_Name_Ar":"نوره المعيبد ","Employee_Name_En":"نوره المعيبد","Employee_Email":"nalmoaibed@nedacomm.com\t","Employee_Phone":"0599477366","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 14, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7231, CAST(0x0000ABEA00887CCD AS DateTime), N'data:{"Employee_Id":15,"Employee_Name_Ar":"ترفة الرشيد","Employee_Name_En":"ترفة الرشيد","Employee_Email":"talrasheed@nedacomm.com","Employee_Phone":"0561342253","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 15, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7232, CAST(0x0000ABEA00938B9A AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"VlXK1an45ue8SJSYPw4AIZFwBNQdxH7nWwCodiU+Cj7ymVgNKgDK+KbQWx+rezLIWI+QK2iCFtZt91gln4aLBQOgGh4TiQrqoGi3uiAsP7p3SLNkzCwbktdf9vlENs/G","Employee_Active":true,"Language_id":1}', 1, 30, N'إعادة تعين كلمة السر', N'reset your password')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7233, CAST(0x0000ABEA009449FD AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7234, CAST(0x0000ABEA0095672C AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":13,"Employee_Name_Ar":"تجربة","Employee_Name_En":"Test","Employee_Email":"ayman1793@hotmail.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":"Profile.JPG","Employee_Password":"pEEpm6dosyFgeQjvHR6xZjZx3DnePbHHytAXlBrcjWlgzYIsw/y96U3XTIhcruWOXqtTCzvW89BUoTKPynzpY3tDhry9ub4t04tGPEP+zCYM0gWMdDTsynMuPGqKGi/7","Employee_Active":true,"Language_id":null}', 1, 16, N'حذف الموظف', N'Delete Employee')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7235, CAST(0x0000ABEA009C0F5B AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":17,"Employee_Name_Ar":"ساره العمري","Employee_Name_En":"ساره العمري","Employee_Email":"salamri@nedacomm.com","Employee_Phone":"0563181887","Group_Id":3,"Employee_Profile":"Profile.JPG","Employee_Password":"Q3jOq9QzPHDbK6np6hojx4sJCE89yqAOjUGG5FTEVqJIdyru5NR3c9/MRHzgxd1JiIEPXxjjJvT2EgwbNniXLZLibeUDG46Q+84tqKRUvurJXauHAcTBltbYxx5Uub/r","Employee_Active":true,"Language_id":1}', 1, 30, N'إعادة تعين كلمة السر', N'reset your password')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7236, CAST(0x0000ABEA009C33E5 AS DateTime), N'data:{"Employee_Id":17,"Employee_Name_Ar":"ساره العمري","Employee_Name_En":"ساره العمري","Employee_Email":"salamri@nedacomm.com","Employee_Phone":"0563181887","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 17, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7237, CAST(0x0000ABEA009DD0AE AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":16,"Employee_Name_Ar":"ساره البركة","Employee_Name_En":"ساره البركة","Employee_Email":"salbarakah@nedacomm.com","Employee_Phone":"0555261421","Group_Id":2,"Employee_Profile":"Profile.JPG","Employee_Password":"Ai4k51M03oqP9buO6y01V3rvs5zUuCJ/LSs49rz7BYEjP8VUZOLmmHEc8LspcNLOsEVl4mFYBvxmMOzGqZS5m9K8neypbSnshgUbcdLoYP5bVEajdv0nCPp6kL6F7tF4","Employee_Active":true,"Language_id":1}', 1, 30, N'إعادة تعين كلمة السر', N'reset your password')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7238, CAST(0x0000ABEA009DEE17 AS DateTime), N'data:{"Employee_Id":16,"Employee_Name_Ar":"ساره البركة","Employee_Name_En":"ساره البركة","Employee_Email":"salbarakah@nedacomm.com","Employee_Phone":"0555261421","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 16, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7239, CAST(0x0000ABEA009F2AF4 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":21,"Employee_Name_Ar":"مشاعل المقرن","Employee_Name_En":"مشاعل المقرن","Employee_Email":"Mashaael.almogrn@riyadh.edu.sa","Employee_Phone":"0557977479","Group_Id":2,"Employee_Profile":"Profile.JPG","Employee_Password":"NiNM4EK9Jxv4EbxpmtiLi3eYIrIKm3L5Ub0EUVB09ErZazRS+pvmJTMkSnGuJuD7v0mogk7p2QiZLOWGzDI10H+A95nr2gA4NkFSGoZ/ad0o5kfRRCvzj6A2Sz5WbX1H","Employee_Active":true,"Language_id":1}', 1, 30, N'إعادة تعين كلمة السر', N'reset your password')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7240, CAST(0x0000ABEA009F4F1F AS DateTime), N'data:{"Employee_Id":14,"Employee_Name_Ar":"نوره المعيبد ","Employee_Name_En":"نوره المعيبد","Employee_Email":"nalmoaibed@nedacomm.com\t","Employee_Phone":"0599477366","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 14, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7241, CAST(0x0000ABEA009F5A8F AS DateTime), N'data:{"Employee_Id":21,"Employee_Name_Ar":"مشاعل المقرن","Employee_Name_En":"مشاعل المقرن","Employee_Email":"Mashaael.almogrn@riyadh.edu.sa","Employee_Phone":"0557977479","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 21, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7242, CAST(0x0000ABEA00A13A84 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":17,"Employee_Name_Ar":"ساره العمري","Employee_Name_En":"ساره العمري","Employee_Email":"salamri@nedacomm.com","Employee_Phone":"0563181887","Group_Id":3,"Employee_Profile":"Profile.JPG","Employee_Password":"P235OvoUtHd+9qsD1gGlw+xq5LK7NtiHIU81iXTQEwq0LZLCj6cBZ1sX7Yaqm6LCn8awRpr1TxW9eFLJORRdErYvKvcr+ff3rZ8lkE7kQnn/aXon+zV1RcT3n0LmqcHs","Employee_Active":true,"Language_id":1}', 17, 15, N'تعديل كلمة المرور', N'Change PassWord')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7243, CAST(0x0000ABEA00C8CECF AS DateTime), N'data:{"Employee_Id":18,"Employee_Name_Ar":"فريال العتيبي","Employee_Name_En":"فريال العتيبي","Employee_Email":"falotaibi@nedacomm.com","Employee_Phone":"0549181798","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 18, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7244, CAST(0x0000ABEA0119790A AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":24,"Employee_Name_Ar":"محمد الميرغني","Employee_Name_En":"محمد الميرغني","Employee_Email":"mohamed.elmarghny@riyadh.edu.sa","Employee_Phone":"0542437397","Group_Id":6,"Employee_Profile":"Profile.JPG","Employee_Password":"RPNTd81ZIIyCFONqbpqRekmo5HsLYJ9xGDsB0brUCZAHz2WD0lzb0fnCOtXSKVuuOWMNYqFzVw0YtVXafXXxRlXYnSi+lrkABxFKWO0KbHD+EyayopdDwjT0fj1mw1VU","Employee_Active":true,"Language_id":1}', 1, 30, N'إعادة تعين كلمة السر', N'reset your password')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7245, CAST(0x0000ABEA0119F3B9 AS DateTime), N'data:{"Employee_Id":24,"Employee_Name_Ar":"محمد الميرغني","Employee_Name_En":"محمد الميرغني","Employee_Email":"mohamed.elmarghny@riyadh.edu.sa","Employee_Phone":"0542437397","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 24, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7246, CAST(0x0000ABEA011BB6BC AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":24,"Employee_Name_Ar":"محمد الميرغني","Employee_Name_En":"محمد الميرغني","Employee_Email":"mohamed.elmarghny@riyadh.edu.sa","Employee_Phone":"0542437397","Group_Id":6,"Employee_Profile":"Profile.JPG","Employee_Password":"9AUw46+1hLUX5BW5bD/xxUXwEf/RmGjllbPSefUoxSUoI3SUFWRPpYZE0RhWLGRBa+fwpnJe/x7cxxxIvx9+9PWsKqijPRE3jGgK+ysXxfQHBU8qpxDTkdonCHTFylHa","Employee_Active":true,"Language_id":1}', 24, 15, N'تعديل كلمة المرور', N'Change PassWord')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7247, CAST(0x0000ABEA0122DDBE AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":26,"Employee_Name_Ar":"اسماء الحيدري","Employee_Name_En":"اسماء الحيدري","Employee_Email":"asmaabdlaziz@riyadh.edu.sa","Employee_Phone":"966504149131","Group_Id":6,"Employee_Profile":"Profile.JPG","Employee_Password":"hDnoNthFCzaRpLo01pB3Qa+HKebo9PpH6TaO7td1jkH1j3gDo7fsAs1uDaxGoBy0Jomt7L/1Y3/YsuGHNVh00H9k0A+EmslA8jyCZK/Hb7V/ZflnI3FvtgkhW7ifUBSU","Employee_Active":true,"Language_id":1}', 1, 30, N'إعادة تعين كلمة السر', N'reset your password')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7248, CAST(0x0000ABEA0122DFA2 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":26,"Employee_Name_Ar":"اسماء الحيدري","Employee_Name_En":"اسماء الحيدري","Employee_Email":"asmaabdlaziz@riyadh.edu.sa","Employee_Phone":"966504149131","Group_Id":6,"Employee_Profile":"Profile.JPG","Employee_Password":"H3LyfuzYfolgeWIflG5c7JF9zAhMtC9bkYb9XhSq6jmgW7fRZHhnOikGdZ6ozCS0E9r7NaACwmcceu/h60H9ueVvWYiLFBX++wlwnTcJ5mbLh3SGbQHuZwgDbfqiKuw2","Employee_Active":true,"Language_id":1}', 1, 30, N'إعادة تعين كلمة السر', N'reset your password')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7249, CAST(0x0000ABEA01240415 AS DateTime), N'data:{"Employee_Id":26,"Employee_Name_Ar":"اسماء الحيدري","Employee_Name_En":"اسماء الحيدري","Employee_Email":"asmaabdlaziz@riyadh.edu.sa","Employee_Phone":"966504149131","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 26, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7250, CAST(0x0000ABEA0125A092 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":24,"Employee_Name_Ar":"محمد الميرغني","Employee_Name_En":"محمد الميرغني","Employee_Email":"mohamed.elmarghny@riyadh.edu.sa","Employee_Phone":"0542437397","Group_Id":6,"Employee_Profile":"474239a4-9041-46b8-866d-afcc6d1b8961.jpg","Employee_Password":"9AUw46+1hLUX5BW5bD/xxUXwEf/RmGjllbPSefUoxSUoI3SUFWRPpYZE0RhWLGRBa+fwpnJe/x7cxxxIvx9+9PWsKqijPRE3jGgK+ysXxfQHBU8qpxDTkdonCHTFylHa","Employee_Active":true,"Language_id":1}', 24, 15, N'تعديل بيانات الموظف', N'Update Employee Info')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7251, CAST(0x0000ABEA0137D34B AS DateTime), N'data:{"Employee_Id":25,"Employee_Name_Ar":"نورة محمد الخضيري","Employee_Name_En":"نورة محمد الخضيري","Employee_Email":"n.khodiry@riyadh.edu.sa","Employee_Phone":"966595267762","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 25, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7252, CAST(0x0000ABEA01394C57 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":25,"Employee_Name_Ar":"نورة محمد الخضيري","Employee_Name_En":"نورة محمد الخضيري","Employee_Email":"n.khodiry@riyadh.edu.sa","Employee_Phone":"966595267762","Group_Id":6,"Employee_Profile":"Profile.JPG","Employee_Password":"VArdpcPoFaXxOcEZrfYYsPY/WLKZguOrjmLOckPMw8whMWZazmnN85868ECf1diXEdP8lr/qcP4LG/o1tNpyI293HOZC937iMRYBKfoKu2tfYjDZQnJPU6u69tTKfriK","Employee_Active":true,"Language_id":1}', 25, 15, N'تعديل كلمة المرور', N'Change PassWord')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7253, CAST(0x0000ABEA01530439 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":23,"Employee_Name_Ar":"مجدى عبدالغني ","Employee_Name_En":"مجدي عبدالغني ","Employee_Email":"magdy.a.ghany@riyadh.edu.sa","Employee_Phone":"0593890195","Group_Id":6,"Employee_Profile":"Profile.JPG","Employee_Password":"G+Kdt8KCkKdr8jkMKlG9Xl106zNiJ8mZ22KVmSDAXypnEGKC5FVPo2KorQ5WpyZ7CAZwRvMJkQU3B8MMQByhI5IJALg0ql4Jw91OGQbUje8ZG4gL0M0xK0PJqg06iqAH","Employee_Active":true,"Language_id":1}', 1, 30, N'إعادة تعين كلمة السر', N'reset your password')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7254, CAST(0x0000ABEA0154A345 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":23,"Employee_Name_Ar":"مجدى عبدالغني ","Employee_Name_En":"مجدي عبدالغني ","Employee_Email":"magdy.a.ghany@riyadh.edu.sa","Employee_Phone":"0593890195","Group_Id":6,"Employee_Profile":"Profile.JPG","Employee_Password":"1a4o4u/XL9RPnlTFnt9Ul/detdYH0Z0lu03n+UGoVTRr1pZgdXLh7syRsg3O8w5ehRr2wuar2IN9/0V7syLWvmN7hZ6sMefDB+WLQ8AKeD4UNrqekOjQAEAAGsdXU3jp","Employee_Active":true,"Language_id":1}', 1, 30, N'إعادة تعين كلمة السر', N'reset your password')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7255, CAST(0x0000ABEA0157D188 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":23,"Employee_Name_Ar":"مجدى عبدالغني ","Employee_Name_En":"مجدي عبدالغني ","Employee_Email":"magdy.a.ghany@riyadh.edu.sa","Employee_Phone":"0593890195","Group_Id":6,"Employee_Profile":"Profile.JPG","Employee_Password":"+EdmcjVqe8K4sRGVkpiKs9G0/F9csfmwOpuoC5hl9uNjq6K1rgopyEZnj81idFroIxM+aoOVaKSXR8ctMzJKj5c5iygtNC5i3RRB16mLBcwP4cCrwMrRuE6OXDBV1ioA","Employee_Active":true,"Language_id":1}', 1, 30, N'إعادة تعين كلمة السر', N'reset your password')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7256, CAST(0x0000ABEA015E90C8 AS DateTime), N'data:{"Employee_Id":23,"Employee_Name_Ar":"مجدى عبدالغني ","Employee_Name_En":"مجدي عبدالغني ","Employee_Email":"magdy.a.ghany@riyadh.edu.sa","Employee_Phone":"0593890195","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 23, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7257, CAST(0x0000ABEA015E9D26 AS DateTime), N'data:{"Employee_Id":24,"Employee_Name_Ar":"محمد الميرغني","Employee_Name_En":"محمد الميرغني","Employee_Email":"mohamed.elmarghny@riyadh.edu.sa","Employee_Phone":"0542437397","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 24, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7258, CAST(0x0000ABEA015F499A AS DateTime), N'data:{"Employee_Id":24,"Employee_Name_Ar":"محمد الميرغني","Employee_Name_En":"محمد الميرغني","Employee_Email":"mohamed.elmarghny@riyadh.edu.sa","Employee_Phone":"0542437397","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 24, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7259, CAST(0x0000ABEB007AD5B4 AS DateTime), N'data:{"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 12, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7260, CAST(0x0000ABEB007B7643 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":27,"Employee_Name_Ar":"د. فلوة الحديثي","Employee_Name_En":"د. فلوة الحديثي","Employee_Email":"felwa.alhudaithi@riyadh.edu.sa","Employee_Phone":"0555407219","Group_Id":4,"Employee_Profile":"Profile.JPG","Employee_Password":"73kcbsKVTzkm3MtlSC5oWFf45miKxd1DkMPLnbCBacdmM+DeLEReorVbAT4Zhe+wUac97CmPHmzRs/N6lRcAu80T3iYXC7M3O7i10XpY0ADo7hY0WeY4ulolfThkKHus","Employee_Active":true,"Language_id":1}', 12, 16, N'إضافة موظف', N'Add Employee')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7261, CAST(0x0000ABEB007BDC9D AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":28,"Employee_Name_Ar":"فواز البطاطي","Employee_Name_En":"فواز البطاطي","Employee_Email":"fawaz.albatati@riyadh.edu.sa","Employee_Phone":"0505286793","Group_Id":4,"Employee_Profile":"Profile.JPG","Employee_Password":"3QZsT/+54TDz2Q585TYrfMTpTEqX27WBcNx9mnxvJXbrelnioTiiG2dbbCUwrMf6Ld8aT2U6clqsiqr2aFSZqiqw2MXd7dbOSmx7qEOs+FfOGC++3Tb7+NxCnVBpqHEx","Employee_Active":true,"Language_id":1}', 12, 16, N'إضافة موظف', N'Add Employee')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7262, CAST(0x0000ABEB007BF262 AS DateTime), N'data:{"Employee_Id":27,"Employee_Name_Ar":"د. فلوة الحديثي","Employee_Name_En":"د. فلوة الحديثي","Employee_Email":"felwa.alhudaithi@riyadh.edu.sa","Employee_Phone":"0555407219","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 27, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7263, CAST(0x0000ABEB007C518E AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":29,"Employee_Name_Ar":"البندري العجمي","Employee_Name_En":"البندري العجمي","Employee_Email":"bandiralajmi@riyadh.edu.sa","Employee_Phone":"0503492208","Group_Id":5,"Employee_Profile":"Profile.JPG","Employee_Password":"TnihTPCxvnGDpwsdfa7abK1VSfFrKL/C7YK4KVAWRgaVqlm73o+L2ZbAi42WOzZvusRpJadeoooWT3tjDR/cfvUzvXtkuqHRq5wx9rhMo+PNcJ/OW5Q2s89sKZKiSvPb","Employee_Active":true,"Language_id":1}', 12, 16, N'إضافة موظف', N'Add Employee')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7264, CAST(0x0000ABEB007DEA4F AS DateTime), N'data:{"Employee_Id":21,"Employee_Name_Ar":"مشاعل المقرن","Employee_Name_En":"مشاعل المقرن","Employee_Email":"Mashaael.almogrn@riyadh.edu.sa","Employee_Phone":"0557977479","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 21, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7265, CAST(0x0000ABEB00824BEB AS DateTime), N'data:{"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 12, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7266, CAST(0x0000ABEB0083C973 AS DateTime), N'data:{"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 12, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7267, CAST(0x0000ABEB0083F65D AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":1,"Employee_Profile":"Profile.JPG","Employee_Password":"6nfKoqmU0RC68ZP2YB01FGH28vxmt4v1ggnmTPHs257r2WPmAeBIkQTiReJOqY97tje8g873GjDyTGzdPxMTtjuqGfZvN8PjVVGmMdRODF1ijeQGR4jr8YnouEBvB/It","Employee_Active":true,"Language_id":1}', 12, 15, N'تعديل كلمة المرور', N'Change PassWord')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7268, CAST(0x0000ABEB0083FFC3 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":1,"Employee_Profile":"Profile.JPG","Employee_Password":"cFbKnCHXSjFYrVTTINj0DvXGy131CwAkolb61jrGF2VcPWy73pDDIGTKQcjoLZnSkfVsA0ayFIkDBd8gfECLftGvgLrfy5e1fo9kji4hzq0x9l0nd22jf+CrOajvWCPx","Employee_Active":true,"Language_id":1}', 12, 15, N'تعديل كلمة المرور', N'Change PassWord')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7269, CAST(0x0000ABEB0084761C AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":1,"Employee_Profile":"Profile.JPG","Employee_Password":"UmNTgdmur+FqfcG8MRMosLrlIth6ao3LyBKc1fUHl8JS2OzGePrL4jBIang/Ejrud05xNR+2rvWuZmO7rePswsBYPF97uoFeQt44gWzDFtMSowzasEdOtLBnFV89Iq/d","Employee_Active":true,"Language_id":1}', 1, 30, N'إعادة تعين كلمة السر', N'reset your password')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7270, CAST(0x0000ABEB0084AFA4 AS DateTime), N'data:{"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 12, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7271, CAST(0x0000ABEB0084CB34 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":1,"Employee_Profile":"Profile.JPG","Employee_Password":"UmNTgdmur+FqfcG8MRMosLrlIth6ao3LyBKc1fUHl8JS2OzGePrL4jBIang/Ejrud05xNR+2rvWuZmO7rePswsBYPF97uoFeQt44gWzDFtMSowzasEdOtLBnFV89Iq/d","Employee_Active":true,"Language_id":1}', 12, 15, N'تعديل بيانات الموظف', N'Update Employee Info')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7272, CAST(0x0000ABEB0084F61A AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":1,"Employee_Profile":"Profile.JPG","Employee_Password":"UmNTgdmur+FqfcG8MRMosLrlIth6ao3LyBKc1fUHl8JS2OzGePrL4jBIang/Ejrud05xNR+2rvWuZmO7rePswsBYPF97uoFeQt44gWzDFtMSowzasEdOtLBnFV89Iq/d","Employee_Active":true,"Language_id":1}', 12, 15, N'تعديل بيانات الموظف', N'Update Employee Info')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7273, CAST(0x0000ABEB00863217 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":1,"Employee_Profile":"Profile.JPG","Employee_Password":"76Utsxl3zJl/yjYjvLnFITd+H3GNqOdW/hxzSv8etKcZe9B0i2I9R9RU9551AqmGWWTcb/UP/4BgykBaxinbfByn+0WG3/xoXdeDlhX858hKwveErhnvGNgeacCM5nRh","Employee_Active":true,"Language_id":1}', 12, 15, N'تعديل كلمة المرور', N'Change PassWord')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7274, CAST(0x0000ABEB00864D96 AS DateTime), N'data:{"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 12, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7275, CAST(0x0000ABEB00978C1E AS DateTime), N'data:{"Employee_Id":28,"Employee_Name_Ar":"فواز البطاطي","Employee_Name_En":"فواز البطاطي","Employee_Email":"fawaz.albatati@riyadh.edu.sa","Employee_Phone":"0505286793","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 28, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7276, CAST(0x0000ABEB0097DAEE AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":28,"Employee_Name_Ar":"فواز البطاطي","Employee_Name_En":"فواز البطاطي","Employee_Email":"fawaz.albatati@riyadh.edu.sa","Employee_Phone":"0505286793","Group_Id":4,"Employee_Profile":"Profile.JPG","Employee_Password":"Aq2eB8Xl/PPCJa5WsbSFwjWols/4wVMMiIwu0wB52Pew0xcjvejyFVS3X2NgeioZwMMk8V+9e9aifT79YV0fdUY2ugS4I6ap3zHWiRJxGIZEepT9YpMm1j5k2S/Zx4BN","Employee_Active":true,"Language_id":1}', 28, 15, N'تعديل كلمة المرور', N'Change PassWord')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7277, CAST(0x0000ABEB00A00DB0 AS DateTime), N'data:{"Employee_Id":24,"Employee_Name_Ar":"محمد الميرغني","Employee_Name_En":"محمد الميرغني","Employee_Email":"mohamed.elmarghny@riyadh.edu.sa","Employee_Phone":"0542437397","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 24, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7278, CAST(0x0000ABEC0070BB23 AS DateTime), N'data:{"Employee_Id":27,"Employee_Name_Ar":"د. فلوة الحديثي","Employee_Name_En":"د. فلوة الحديثي","Employee_Email":"felwa.alhudaithi@riyadh.edu.sa","Employee_Phone":"0555407219","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 27, 28, N'تسجيل دخول', N'login to system')
GO
print 'Processed 100 total records'
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7279, CAST(0x0000ABEC00864886 AS DateTime), N'data:{"Employee_Id":29,"Employee_Name_Ar":"البندري العجمي","Employee_Name_En":"البندري العجمي","Employee_Email":"bandiralajmi@riyadh.edu.sa","Employee_Phone":"0503492208","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 29, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7280, CAST(0x0000ABEC00A541B7 AS DateTime), N'data:{"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 12, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7281, CAST(0x0000ABEC00A856F0 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"HtYIJm61Cy9wOAUpyX+Bq+xbUUfILh1oDI61rJR+8Lpy90oNHx8EbI0Pv9gMSU8lyOxQ+BmwzE/FCF99TS/dVSoHWn5OUW74xvZHUUEKLdt/mFkALMNwQUM1/kKeKiOL","Employee_Active":true,"Language_id":1}', 1, 30, N'إعادة تعين كلمة السر', N'reset your password')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7282, CAST(0x0000ABEC00A90817 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7283, CAST(0x0000ABEC00AA6F9B AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":30,"Employee_Name_Ar":"د. ساره  مباركي","Employee_Name_En":"د. ساره  مباركي","Employee_Email":"Sarah.mubaraki@riyadh.edu.sa","Employee_Phone":"0542305554","Group_Id":5,"Employee_Profile":"Profile.JPG","Employee_Password":"uvF1lS6U22pfQJUX+3Krgux2d7jTbyELbMBSZv0MHNJAFhlEhibU0gNbehZz9JAHfVisVulCslh+cYIKwIAYPJtvZ10J1tX0FrbP3dUm4Po3gYzfH81qBJMGGNJFGKzq","Employee_Active":true,"Language_id":1}', 12, 16, N'إضافة موظف', N'Add Employee')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7284, CAST(0x0000ABEC00ACFA22 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"R1+S3kNwFGQZ5r74zdUhwdUX+e0Jb1QjXP2tua72oF3UgnNFDfyfoJZJhR6seVoSOrVpKEmHSXHDrdMIOe4yO7KmORH1fpEAapI0c5j42KH2bzkK6+YETp3tgdpyI7BU","Employee_Active":true,"Language_id":1}', 1, 15, N'تعديل كلمة المرور', N'Change PassWord')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7285, CAST(0x0000ABEC00AD3532 AS DateTime), N'data:{"LanguageMaster":null,"Language_Detial_Id":2307,"Language_Master_Id":1,"Language_Detial_FieldName":"FormSpecialization-PaymentSemester","Language_Detial_Value":"رسوم الفصل الدراسي"}', 1, 21, N' اضافة ترجمة جديدة', N'Add a new translation')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7286, CAST(0x0000ABEC00AD4DE1 AS DateTime), N'data:{"LanguageMaster":null,"Language_Detial_Id":2308,"Language_Master_Id":1,"Language_Detial_FieldName":"FormSpecialization-PaymentContract","Language_Detial_Value":"رسوم العقد"}', 1, 21, N' اضافة ترجمة جديدة', N'Add a new translation')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7287, CAST(0x0000ABEC00AD68C8 AS DateTime), N'data:{"LanguageMaster":null,"Language_Detial_Id":2309,"Language_Master_Id":1,"Language_Detial_FieldName":"FormSpecialization-PaymentEquation","Language_Detial_Value":"معادلة الرسوم"}', 1, 21, N' اضافة ترجمة جديدة', N'Add a new translation')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7288, CAST(0x0000ABEC00AD8A60 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7289, CAST(0x0000ABEC00C5A4B5 AS DateTime), N'data:{"Employee_Id":30,"Employee_Name_Ar":"د. ساره  مباركي","Employee_Name_En":"د. ساره  مباركي","Employee_Email":"Sarah.mubaraki@riyadh.edu.sa","Employee_Phone":"0542305554","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 30, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7290, CAST(0x0000ABEC00E1FF48 AS DateTime), N'data:{"Employee_Id":21,"Employee_Name_Ar":"مشاعل المقرن","Employee_Name_En":"مشاعل المقرن","Employee_Email":"Mashaael.almogrn@riyadh.edu.sa","Employee_Phone":"0557977479","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 21, 28, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7291, CAST(0x0000ABEC00E5FECD AS DateTime), N'data:{"Employee_Id":12,"Employee_Name_Ar":"عبدالمجيد الرمال ","Employee_Name_En":"عبدالمجيد الرمال ","Employee_Email":"abdulmajed@nedacomm.com","Employee_Phone":"0534444481","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 12, 1, N'تسجيل دخول', N'login to system')
SET IDENTITY_INSERT [dbo].[Log_File] OFF
/****** Object:  Table [dbo].[Notification_Employee]    Script Date: 07/04/2020 12:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification_Employee](
	[NotificationShow_Employee_Id] [int] IDENTITY(1,1) NOT NULL,
	[Employee_Id] [int] NULL,
	[NotificationShow_Id] [int] NULL,
 CONSTRAINT [PK_Notification_Employee] PRIMARY KEY CLUSTERED 
(
	[NotificationShow_Employee_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment_Process]    Script Date: 07/04/2020 12:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payment_Process](
	[Payment_Id] [int] IDENTITY(1,1) NOT NULL,
	[Student_Id] [int] NULL,
	[Payment_IsPaid] [bit] NULL,
	[Comment] [nvarchar](max) NULL,
	[DateCreation] [datetime] NULL,
	[Send_EntityId] [nvarchar](max) NULL,
	[Send_Amount] [float] NULL,
	[Send_Currency] [nvarchar](max) NULL,
	[Send_PaymentType] [nvarchar](max) NULL,
	[Result_Code] [nvarchar](max) NULL,
	[Result_Description] [nvarchar](max) NULL,
	[Result_BuildNumber] [nvarchar](max) NULL,
	[Result_Timestamp] [nvarchar](max) NULL,
	[Result_Ndc] [nvarchar](max) NULL,
	[Result_Id] [nvarchar](max) NULL,
	[Payment_Date] [datetime] NULL,
	[Payment_Type_Id] [int] NULL,
	[Payment_Trackingkey] [nvarchar](max) NULL,
	[Payment_URL_IsValid] [bit] NULL,
	[Payment_Result_Json] [varchar](max) NULL,
	[Payment_SMS_Result] [varchar](max) NULL,
 CONSTRAINT [PK_Payment_Study] PRIMARY KEY CLUSTERED 
(
	[Payment_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Files]    Script Date: 07/04/2020 12:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[File_Id] [int] IDENTITY(1,1) NOT NULL,
	[File_Name] [nvarchar](max) NULL,
	[File_Path] [nvarchar](max) NULL,
	[DateCreation] [datetime] NULL,
	[Student_Id] [int] NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[File_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sequence]    Script Date: 07/04/2020 12:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sequence](
	[Sequence_Id] [int] IDENTITY(1,1) NOT NULL,
	[Emp_Id] [int] NULL,
	[Status_Id] [int] NULL,
	[Student_Id] [int] NULL,
	[DateCreation] [datetime] NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sequence] PRIMARY KEY CLUSTERED 
(
	[Sequence_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Other_Info]    Script Date: 07/04/2020 12:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Other_Info](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Student_Id] [int] NULL,
	[MessageType] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[DateCreation] [datetime] NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_Student_Other_Info] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VISA_MADA]    Script Date: 07/04/2020 12:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VISA_MADA](
	[VISA_MADA_Id] [int] IDENTITY(1,1) NOT NULL,
	[PaymentProcess_Id] [int] NULL,
	[Trackingkey] [nvarchar](max) NULL,
	[UUID] [nvarchar](max) NULL,
	[Result_JSON] [nvarchar](max) NULL,
	[DateCreation] [datetime] NULL,
 CONSTRAINT [PK_VISA_MADA] PRIMARY KEY CLUSTERED 
(
	[VISA_MADA_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rosom_Request]    Script Date: 07/04/2020 12:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rosom_Request](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Trackingkey] [nvarchar](100) NULL,
	[Payment_Process_Id] [int] NULL,
	[PaymentType] [int] NULL,
	[DateCreation] [datetime] NULL,
	[UUID] [nvarchar](200) NULL,
	[Timestamp] [nvarchar](50) NULL,
	[MerchantId] [nchar](10) NULL,
	[Invoice_Students_Id] [nvarchar](200) NULL,
	[Invoice_Students_FirstName] [nvarchar](200) NULL,
	[Invoice_Students_LastName] [nvarchar](200) NULL,
	[InvoiceId] [nvarchar](200) NULL,
	[PayeeId] [nvarchar](200) NULL,
	[InvoiceStatus] [nvarchar](200) NULL,
	[BillType] [nvarchar](200) NULL,
	[DisplayInfo] [nvarchar](max) NULL,
	[AmountDue] [nvarchar](200) NULL,
	[CreateDate] [nvarchar](200) NULL,
	[ExpiryDate] [nvarchar](200) NULL,
	[PaymentRange_MinPartialAmount] [nvarchar](200) NULL,
	[PaymentRange_MinAdvanceAmount] [nvarchar](200) NULL,
	[PaymentRange_MaxAdvanceAmount] [nvarchar](200) NULL,
	[IsPaid] [bit] NULL,
	[Result_JSON] [nvarchar](max) NULL,
	[Response_InvoiceId] [nvarchar](200) NULL,
	[Response_SADADNumber] [nvarchar](200) NULL,
	[Response_Status_Code] [nvarchar](200) NULL,
	[Response_Status_Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Rosom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rosom_Response]    Script Date: 07/04/2020 12:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rosom_Response](
	[Id] [int] NOT NULL,
	[Payment_Process_Id] [int] NULL,
	[Rosom_Request_Id] [int] NULL,
	[Trackingkey] [nvarchar](max) NULL,
	[InvoiceId] [nvarchar](250) NULL,
	[PaymentId] [nvarchar](250) NULL,
	[SADADTransactionId] [nvarchar](max) NULL,
	[BankTransactionId] [nvarchar](max) NULL,
	[PaidAmount] [nvarchar](250) NULL,
	[PaymentDate] [nvarchar](250) NULL,
	[SADADNumber] [nvarchar](250) NULL,
	[MerchantId] [nvarchar](max) NULL,
	[BankName] [nvarchar](250) NULL,
	[DistrictCode] [nvarchar](max) NULL,
	[BranchCode] [nvarchar](max) NULL,
	[AccessChannel] [nvarchar](max) NULL,
	[PmtMethod] [nvarchar](250) NULL,
	[PmtType] [nvarchar](250) NULL,
	[ServiceType] [nvarchar](250) NULL,
 CONSTRAINT [PK_Rosom_Response] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Default [DF__countries__count__5A4F643B]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Nationality] ADD  CONSTRAINT [DF__countries__count__5A4F643B]  DEFAULT ('') FOR [Country_code]
GO
/****** Object:  Default [DF__countries__count__5B438874]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Nationality] ADD  CONSTRAINT [DF__countries__count__5B438874]  DEFAULT ('') FOR [Country_Name_En]
GO
/****** Object:  Default [DF__countries__count__5C37ACAD]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Nationality] ADD  CONSTRAINT [DF__countries__count__5C37ACAD]  DEFAULT ('') FOR [Country_Name_Ar]
GO
/****** Object:  Default [DF__countries__count__5D2BD0E6]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Nationality] ADD  CONSTRAINT [DF__countries__count__5D2BD0E6]  DEFAULT ('') FOR [Nationality_Name_En]
GO
/****** Object:  Default [DF__countries__count__5E1FF51F]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Nationality] ADD  CONSTRAINT [DF__countries__count__5E1FF51F]  DEFAULT ('') FOR [Nationality_Name_Ar]
GO
/****** Object:  ForeignKey [FK_Nationality_Nationality]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Nationality]  WITH CHECK ADD  CONSTRAINT [FK_Nationality_Nationality] FOREIGN KEY([Nationality_Id])
REFERENCES [dbo].[Nationality] ([Nationality_Id])
GO
ALTER TABLE [dbo].[Nationality] CHECK CONSTRAINT [FK_Nationality_Nationality]
GO
/****** Object:  ForeignKey [FK_Lanuage_Detials_LanguageMaster]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Lanuage_Detials]  WITH CHECK ADD  CONSTRAINT [FK_Lanuage_Detials_LanguageMaster] FOREIGN KEY([Language_Master_Id])
REFERENCES [dbo].[LanguageMaster] ([ID])
GO
ALTER TABLE [dbo].[Lanuage_Detials] CHECK CONSTRAINT [FK_Lanuage_Detials_LanguageMaster]
GO
/****** Object:  ForeignKey [FK_Group_Status_Group]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Group_Status]  WITH CHECK ADD  CONSTRAINT [FK_Group_Status_Group] FOREIGN KEY([Group_Id])
REFERENCES [dbo].[Group] ([Group_Id])
GO
ALTER TABLE [dbo].[Group_Status] CHECK CONSTRAINT [FK_Group_Status_Group]
GO
/****** Object:  ForeignKey [FK_Group_Status_Status]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Group_Status]  WITH CHECK ADD  CONSTRAINT [FK_Group_Status_Status] FOREIGN KEY([Status_Id])
REFERENCES [dbo].[Status] ([Status_Id])
GO
ALTER TABLE [dbo].[Group_Status] CHECK CONSTRAINT [FK_Group_Status_Status]
GO
/****** Object:  ForeignKey [FK_Employee_Group]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Group] FOREIGN KEY([Group_Id])
REFERENCES [dbo].[Group] ([Group_Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Group]
GO
/****** Object:  ForeignKey [FK_Employee_LanguageMaster]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_LanguageMaster] FOREIGN KEY([Language_id])
REFERENCES [dbo].[LanguageMaster] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_LanguageMaster]
GO
/****** Object:  ForeignKey [FK_Notification_Master_Notification_Show]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Notification_Master]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Master_Notification_Show] FOREIGN KEY([Notification_Show_Id])
REFERENCES [dbo].[Notification_Show] ([Notification_Show_Id])
GO
ALTER TABLE [dbo].[Notification_Master] CHECK CONSTRAINT [FK_Notification_Master_Notification_Show]
GO
/****** Object:  ForeignKey [FK_Permission_Group_Group]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Permission_Group]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Group_Group] FOREIGN KEY([Group_Id])
REFERENCES [dbo].[Group] ([Group_Id])
GO
ALTER TABLE [dbo].[Permission_Group] CHECK CONSTRAINT [FK_Permission_Group_Group]
GO
/****** Object:  ForeignKey [FK_Permission_Group_Permission]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Permission_Group]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Group_Permission] FOREIGN KEY([Permission_Id])
REFERENCES [dbo].[Permission] ([Permission_Id])
GO
ALTER TABLE [dbo].[Permission_Group] CHECK CONSTRAINT [FK_Permission_Group_Permission]
GO
/****** Object:  ForeignKey [FK_Specialization_Collage]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Specialization]  WITH CHECK ADD  CONSTRAINT [FK_Specialization_Collage] FOREIGN KEY([Collage_Id])
REFERENCES [dbo].[Collage] ([Collage_ID])
GO
ALTER TABLE [dbo].[Specialization] CHECK CONSTRAINT [FK_Specialization_Collage]
GO
/****** Object:  ForeignKey [FK_Student_Concat_Status]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Student_Concat]  WITH CHECK ADD  CONSTRAINT [FK_Student_Concat_Status] FOREIGN KEY([Student_Concat_Status])
REFERENCES [dbo].[Status] ([Status_Id])
GO
ALTER TABLE [dbo].[Student_Concat] CHECK CONSTRAINT [FK_Student_Concat_Status]
GO
/****** Object:  ForeignKey [FK_Student_Employee]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Employee] FOREIGN KEY([Student_Employee_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Employee]
GO
/****** Object:  ForeignKey [FK_Student_Nationality]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Nationality] FOREIGN KEY([Student_Nationality_Id])
REFERENCES [dbo].[Nationality] ([Nationality_Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Nationality]
GO
/****** Object:  ForeignKey [FK_Student_Resource]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Resource] FOREIGN KEY([Student_Resource_Id])
REFERENCES [dbo].[Resource] ([ResourceID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Resource]
GO
/****** Object:  ForeignKey [FK_Student_Specialization]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Specialization] FOREIGN KEY([Student_Specialization_Id])
REFERENCES [dbo].[Specialization] ([Specialization_Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Specialization]
GO
/****** Object:  ForeignKey [FK_Student_Status]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Status] FOREIGN KEY([Student_Status_Id])
REFERENCES [dbo].[Status] ([Status_Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Status]
GO
/****** Object:  ForeignKey [FK_Log_File_Employee]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Log_File]  WITH CHECK ADD  CONSTRAINT [FK_Log_File_Employee] FOREIGN KEY([Login_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO
ALTER TABLE [dbo].[Log_File] CHECK CONSTRAINT [FK_Log_File_Employee]
GO
/****** Object:  ForeignKey [FK_Log_File_Permission]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Log_File]  WITH CHECK ADD  CONSTRAINT [FK_Log_File_Permission] FOREIGN KEY([Form_Id])
REFERENCES [dbo].[Permission] ([Permission_Id])
GO
ALTER TABLE [dbo].[Log_File] CHECK CONSTRAINT [FK_Log_File_Permission]
GO
/****** Object:  ForeignKey [FK_Notification_Employee_Employee]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Notification_Employee]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Employee_Employee] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO
ALTER TABLE [dbo].[Notification_Employee] CHECK CONSTRAINT [FK_Notification_Employee_Employee]
GO
/****** Object:  ForeignKey [FK_Notification_Employee_Notification_Show]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Notification_Employee]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Employee_Notification_Show] FOREIGN KEY([NotificationShow_Id])
REFERENCES [dbo].[Notification_Show] ([Notification_Show_Id])
GO
ALTER TABLE [dbo].[Notification_Employee] CHECK CONSTRAINT [FK_Notification_Employee_Notification_Show]
GO
/****** Object:  ForeignKey [FK_Payment_Process_Payment_Type]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Payment_Process]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Process_Payment_Type] FOREIGN KEY([Payment_Type_Id])
REFERENCES [dbo].[Payment_Type] ([Payment_Type_Id])
GO
ALTER TABLE [dbo].[Payment_Process] CHECK CONSTRAINT [FK_Payment_Process_Payment_Type]
GO
/****** Object:  ForeignKey [FK_Payment_Study_Student]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Payment_Process]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Study_Student] FOREIGN KEY([Student_Id])
REFERENCES [dbo].[Student] ([Student_Id])
GO
ALTER TABLE [dbo].[Payment_Process] CHECK CONSTRAINT [FK_Payment_Study_Student]
GO
/****** Object:  ForeignKey [FK_Files_Student]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK_Files_Student] FOREIGN KEY([Student_Id])
REFERENCES [dbo].[Student] ([Student_Id])
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK_Files_Student]
GO
/****** Object:  ForeignKey [FK_Sequence_Employee]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Sequence]  WITH CHECK ADD  CONSTRAINT [FK_Sequence_Employee] FOREIGN KEY([Emp_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO
ALTER TABLE [dbo].[Sequence] CHECK CONSTRAINT [FK_Sequence_Employee]
GO
/****** Object:  ForeignKey [FK_Sequence_Status]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Sequence]  WITH CHECK ADD  CONSTRAINT [FK_Sequence_Status] FOREIGN KEY([Status_Id])
REFERENCES [dbo].[Status] ([Status_Id])
GO
ALTER TABLE [dbo].[Sequence] CHECK CONSTRAINT [FK_Sequence_Status]
GO
/****** Object:  ForeignKey [FK_Sequence_Student]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Sequence]  WITH CHECK ADD  CONSTRAINT [FK_Sequence_Student] FOREIGN KEY([Student_Id])
REFERENCES [dbo].[Student] ([Student_Id])
GO
ALTER TABLE [dbo].[Sequence] CHECK CONSTRAINT [FK_Sequence_Student]
GO
/****** Object:  ForeignKey [FK_Student_Other_Info_Student]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Student_Other_Info]  WITH CHECK ADD  CONSTRAINT [FK_Student_Other_Info_Student] FOREIGN KEY([Student_Id])
REFERENCES [dbo].[Student] ([Student_Id])
GO
ALTER TABLE [dbo].[Student_Other_Info] CHECK CONSTRAINT [FK_Student_Other_Info_Student]
GO
/****** Object:  ForeignKey [FK_VISA_MADA_Payment_Process]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[VISA_MADA]  WITH CHECK ADD  CONSTRAINT [FK_VISA_MADA_Payment_Process] FOREIGN KEY([PaymentProcess_Id])
REFERENCES [dbo].[Payment_Process] ([Payment_Id])
GO
ALTER TABLE [dbo].[VISA_MADA] CHECK CONSTRAINT [FK_VISA_MADA_Payment_Process]
GO
/****** Object:  ForeignKey [FK_Rosom_Request_Payment_Process]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Rosom_Request]  WITH CHECK ADD  CONSTRAINT [FK_Rosom_Request_Payment_Process] FOREIGN KEY([Payment_Process_Id])
REFERENCES [dbo].[Payment_Process] ([Payment_Id])
GO
ALTER TABLE [dbo].[Rosom_Request] CHECK CONSTRAINT [FK_Rosom_Request_Payment_Process]
GO
/****** Object:  ForeignKey [FK_Rosom_Response_Payment_Process]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Rosom_Response]  WITH CHECK ADD  CONSTRAINT [FK_Rosom_Response_Payment_Process] FOREIGN KEY([Payment_Process_Id])
REFERENCES [dbo].[Payment_Process] ([Payment_Id])
GO
ALTER TABLE [dbo].[Rosom_Response] CHECK CONSTRAINT [FK_Rosom_Response_Payment_Process]
GO
/****** Object:  ForeignKey [FK_Rosom_Response_Rosom_Request]    Script Date: 07/04/2020 12:54:13 ******/
ALTER TABLE [dbo].[Rosom_Response]  WITH CHECK ADD  CONSTRAINT [FK_Rosom_Response_Rosom_Request] FOREIGN KEY([Rosom_Request_Id])
REFERENCES [dbo].[Rosom_Request] ([Id])
GO
ALTER TABLE [dbo].[Rosom_Response] CHECK CONSTRAINT [FK_Rosom_Response_Rosom_Request]
GO
