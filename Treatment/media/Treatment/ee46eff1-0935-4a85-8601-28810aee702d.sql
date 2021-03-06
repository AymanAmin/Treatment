USE [ECMS]
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (1, N'الاداريين', N'Management')
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (2, N'الموارد البشرية', N'Human Resource')
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (3, N'الاطباء', N'Doctors')
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (5, N'هيئة التدريس', N'Teachers')
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (30, N'2', N'2')
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (31, N'3', N'3')
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (32, N'5', N'5')
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (33, N'6', N'5')
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (34, N'10', N'10')
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (35, N'12', N'12')
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (36, N'13', N'13')
SET IDENTITY_INSERT [dbo].[Group] OFF
SET IDENTITY_INSERT [dbo].[Treatment_Class] ON 

INSERT [dbo].[Treatment_Class] ([Treatment_Class_Id], [Treatment_Class_Name_Ar], [Treatment_Class_Name_En]) VALUES (1, N'تعميم', N'For All')
SET IDENTITY_INSERT [dbo].[Treatment_Class] OFF
SET IDENTITY_INSERT [dbo].[Treatment_Confidentiality] ON 

INSERT [dbo].[Treatment_Confidentiality] ([Treatment_Confidentiality_Id], [Treatment_Confidentiality_Name_Ar], [Treatment_Confidentiality_Name_En]) VALUES (1, N'عادي', N'Normal')
INSERT [dbo].[Treatment_Confidentiality] ([Treatment_Confidentiality_Id], [Treatment_Confidentiality_Name_Ar], [Treatment_Confidentiality_Name_En]) VALUES (2, N'سري', N'Sercrit')
SET IDENTITY_INSERT [dbo].[Treatment_Confidentiality] OFF
SET IDENTITY_INSERT [dbo].[Treatment_Delivery] ON 

INSERT [dbo].[Treatment_Delivery] ([Treatment_Delivery_Id], [Treatment_Delivery_Name_Ar], [Treatment_Delivery_Name_En]) VALUES (1, N'تم الاسلام', N'Delivered')
SET IDENTITY_INSERT [dbo].[Treatment_Delivery] OFF
SET IDENTITY_INSERT [dbo].[Treatment_Priority] ON 

INSERT [dbo].[Treatment_Priority] ([Treatment_Priority_Id], [Treatment_Priority_Name_Ar], [Treatment_Priority_Name_En]) VALUES (1, N'عالية', N'Height')
SET IDENTITY_INSERT [dbo].[Treatment_Priority] OFF
SET IDENTITY_INSERT [dbo].[Treatment_Procedure] ON 

INSERT [dbo].[Treatment_Procedure] ([Treatment_Procedure_Id], [Treatment_Procedure_Name_Ar], [Treatment_Procedure_Name_En]) VALUES (1, N'للتعميم', N'For all')
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
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (1, N'الضبط', N'Setting', 0, N'Pages/Setting/', N'icofont icofont-football')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (2, N'ادارة المستخدمين', N'User Management', 1, N'Pages/Setting/UserManagment/', N'icofont icofont-navigation-menu')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (3, N'إنشاء صلاحيات', N'Create Permissions', 2, N'Pages/Setting/UserManagment/Permissions.aspx', N'icofont icofont-navigation-menu')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (4, N'المجموعات و الصلاحيات', N'Groups & Permission', 2, N'Pages/Setting/UserManagment/PermissionGroups.aspx', N'icofont icofont-navigation-menu')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (5, N'ضبط المعاملات', N'Treatment Setting', 1, N'Pages/Setting/TreatmentManagment/', N'icofont icofont-navigation-menu')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (6, N'الجداول', N'Lookup', 5, N'Pages/Setting/TreatmentManagement/TreatmentManagement.aspx', N'icofont icofont-navigation-menu')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (1008, N'المعاملات', N'Treatment', 0, N'Pages/Treatment/', N'icofont icofont-email')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (1009, N'أنشاء معاملة', N'New Treatment', 1008, N'Pages/Treatment/NewTreatment.aspx', N'icofont icofont-ui-add')
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon]) VALUES (1010, N'مدير النظام', N'administrator', 0, N'Pages/Admin/', N'icofont icofont-ui-lock')
SET IDENTITY_INSERT [dbo].[Permission] OFF
SET IDENTITY_INSERT [dbo].[Permission_Group] ON 

INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1, 4, 2)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (6, 1, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (7, 2, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (8, 3, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (9, 4, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (10, 5, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (11, 6, 1)
SET IDENTITY_INSERT [dbo].[Permission_Group] OFF
