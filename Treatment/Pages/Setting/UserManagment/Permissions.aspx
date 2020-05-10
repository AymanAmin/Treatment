<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="Permissions.aspx.cs" Inherits="Treatment.Pages.Setting.UserManagment.Permissions" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title><% = Treatment.Classes.FieldNames.getFieldName("Permissions-Title", "User Management - Permission") %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <!-- Page-body start -->
    <div class="page-body">
        <!-- Article Editor card start -->
        <div class="card ScrollStyle">
            <div class="card-header">
                <div class="card-header-right">
                    <ul class="list-unstyled card-option">
                        <li><i class="feather icon-maximize full-card"></i></li>
                    </ul>
                </div>
            </div>
            <div class="card-block">
                <div class="row col-sm-12">
                    <div id="add-model" class="modal fade" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <div class="login-card card-block login-card-modal">

                                <div class="text-center">
                                    <img src="..\..\..\..\Theme\files\assets\images\auth\logo.png" alt="logo.png">
                                </div>
                                <div class="card m-t-15">
                                    <div class="auth-box card-block">
                                        <div class="row m-b-20">
                                            <div class="col-md-12">
                                                <h3 class="text-center txt-primary"><% = Treatment.Classes.FieldNames.getFieldName("Permissions-AddPermission", "Add Permission") %></h3>
                                            </div>
                                        </div>
                                        <div class="row col-sm-12">
                                            <div class="form-group col-sm-6 j-unit">
                                                <label class="j-label"><% = Treatment.Classes.FieldNames.getFieldName("Permissions-NameArabic", "Name Arabic") %></label>
                                                <div class="input-group">
                                                    <span class="input-group-addon" id="basic-addon1"><i class="icofont icofont-underline"></i></span>
                                                    <asp:TextBox ID="txtPermission_Name" runat="server" class="form-control" placeholder="Enter Name in Arabic" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-12" style="margin-top: -5%">
                                                    <asp:RequiredFieldValidator ID="RFVtxtPermission_Name" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Arabic Name" ValidationGroup="Per" ControlToValidate="txtPermission_Name" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                            <div class="form-group col-sm-6 j-unit">
                                                <label class="j-label"><% = Treatment.Classes.FieldNames.getFieldName("Permissions-NameEnglish", "Name English") %></label>
                                                <div class="input-group">
                                                    <span class="input-group-addon" id="basic-addon2"><i class="icofont icofont-underline"></i></span>
                                                    <asp:TextBox ID="txtPermission_Name_En" runat="server" class="form-control" placeholder="Enter Name in English"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-12" style="margin-top: -5%">
                                                    <asp:RequiredFieldValidator ID="RFVtxtPermission_Name_En" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter English Name" ValidationGroup="Per" ControlToValidate="txtPermission_Name_En" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                            <div class="form-group col-sm-6 j-unit">
                                                <label class="j-label"><% = Treatment.Classes.FieldNames.getFieldName("Permissions-ParentForm", "Parent Form") %></label>
                                                <div class="input-group">
                                                    <span class="input-group-addon" id="basic-addon3"><i class="icofont icofont-tree"></i></span>
                                                    <asp:DropDownList ID="txtParent" runat="server" class="form-control form-control-primary" DataSourceID="PermissionDataSource" DataTextField="Permission_Name_En" DataValueField="Permission_Id">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="form-group col-sm-6 j-unit">
                                                <label class="j-label"><% = Treatment.Classes.FieldNames.getFieldName("Permissions-System", "System") %></label>
                                                <div class="input-group">
                                                    <span class="input-group-addon" id="basic-addon6"><i class="icofont icofont-tree"></i></span>
                                                    <asp:DropDownList ID="txtSystem" runat="server" class="form-control form-control-primary" DataSourceID="SystemDataSource" DataTextField="System_Name_En" DataValueField="ID">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="form-group col-sm-6 j-unit" style="margin-top: -1%">
                                                <label class="j-label"><% = Treatment.Classes.FieldNames.getFieldName("Permissions-ClassIcon", "Class Icon") %> (<a href="https://icofont.com/icons" target="_blank"><% = Treatment.Classes.FieldNames.getFieldName("Permissions-ClickHere", "Click Here") %></a>)</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon" id="basic-addon5"><i class="icofont icofont-lens"></i></span>
                                                    <asp:TextBox ID="txtClass_Icon" runat="server" class="form-control" placeholder="icofont icofont-navigation-menu"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="form-group col-sm-8 j-unit" style="margin-top: -1%">
                                                <label class="j-label"><% = Treatment.Classes.FieldNames.getFieldName("Permissions-URLPath", "URL Path") %></label>
                                                <div class="input-group">
                                                    <span class="input-group-addon" id="basic-addon4"><i class="icofont icofont-link-alt"></i></span>
                                                    <asp:TextBox ID="txtUrl_Path" runat="server" class="form-control" placeholder="Enter URL Path Ex(Pages/Setting/...)"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="form-group col-sm-4 j-unit" style="margin-top: -2%">
                                                <div class="col-sm-12 col-xl-12 m-b-30">
                                                    <h5 class="sub-title"><% = Treatment.Classes.FieldNames.getFieldName("Permissions-MainParent", "Main Parent") %></h5>
                                                    <input runat="server" id="MainMenu" type="checkbox" style="color: #452a74" class="js-single" />
                                                </div>
                                            </div>

                                            <div class="form-group col-sm-12" style="text-align: right; margin-top: -2%">
                                                <asp:Button ID="Save" runat="server" Text="Save" class="btn btn-primary" ValidationGroup="Per" OnClick="Save_Click" />
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <!-- end of form -->
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-sm-12" style="text-align: right; margin-top: -2%">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add-model"><% = Treatment.Classes.FieldNames.getFieldName("Permissions-AddPermission", "Add Permission") %></button>
                    </div>
                    <div class="form-group col-sm-12 dt-responsive table-responsive">
                        <dx:ASPxTreeList ID="PermissionTreeList" Style="width: 100%; text-align: center" runat="server" AutoGenerateColumns="False" DataSourceID="PermissionDataSource" EnableTheming="True" KeyFieldName="Permission_Id" Theme="Mulberry" OnAutoFilterCellEditorInitialize="PermissionTreeList_AutoFilterCellEditorInitialize" ParentFieldName="Parent" PreviewFieldName="Permission_Name_En">

                            <Columns>
                                <dx:TreeListTextColumn AutoFilterCondition="Default" Caption="Arabic Name" FieldName="Permission_Name_Ar" ShowInFilterControl="Default" VisibleIndex="1">
                                </dx:TreeListTextColumn>
                                <dx:TreeListTextColumn AutoFilterCondition="Default" Caption="English Name" FieldName="Permission_Name_En" ShowInFilterControl="Default" VisibleIndex="0">
                                </dx:TreeListTextColumn>
                                <dx:TreeListTextColumn AutoFilterCondition="Default" FieldName="Url_Path" ShowInFilterControl="Default" VisibleIndex="5" Caption="URL Path">
                                </dx:TreeListTextColumn>
                                <dx:TreeListTextColumn AutoFilterCondition="Default" Caption="Icon" FieldName="Permission_Icon" ShowInFilterControl="Default" VisibleIndex="4">
                                </dx:TreeListTextColumn>
                                <dx:TreeListComboBoxColumn AutoFilterCondition="Default" FieldName="Parent" ShowInFilterControl="Default" VisibleIndex="2" Caption="Parent">
                                    <PropertiesComboBox DataSourceID="PermissionDataSource" TextField="Permission_Name_En" ValueField="Permission_Id">
                                    </PropertiesComboBox>
                                </dx:TreeListComboBoxColumn>
                                <dx:TreeListComboBoxColumn AutoFilterCondition="Default" Caption="System" FieldName="System_Id" ShowInFilterControl="Default" VisibleIndex="3">
                                    <PropertiesComboBox DataSourceID="SystemDataSource" TextField="System_Name_En" ValueField="ID">
                                    </PropertiesComboBox>
                                </dx:TreeListComboBoxColumn>
                                <dx:TreeListCommandColumn VisibleIndex="6" Caption="Action">
                                    <EditButton Visible="True" Text=" ">
                                        <Styles>
                                            <Style CssClass="icofont icofont-ui-edit text-primary h5">
                                            </Style>
                                        </Styles>
                                    </EditButton>
                                    <DeleteButton Visible="True" Text=" ">
                                        <Styles>
                                            <Style CssClass="icofont icofont-ui-delete text-danger h5">
                                            </Style>
                                        </Styles>
                                    </DeleteButton>
                                    <UpdateButton Text=" ">
                                        <Styles>
                                            <Style CssClass="icofont icofont-save text-primary h5" VerticalAlign="Middle">
                                            </Style>
                                        </Styles>
                                    </UpdateButton>

                                    <CancelButton Text=" ">
                                        <Styles>
                                            <Style CssClass="icofont icofont-ui-close text-warning h5" VerticalAlign="Middle">
                                            </Style>
                                        </Styles>
                                    </CancelButton>
                                </dx:TreeListCommandColumn>
                            </Columns>
                            <SettingsBehavior AllowAutoFilter="True" AutoExpandAllNodes="True"></SettingsBehavior>

                            <SettingsCustomizationWindow PopupHorizontalAlign="RightSides" PopupVerticalAlign="BottomSides"></SettingsCustomizationWindow>

                            <SettingsEditing AllowNodeDragDrop="True" />

                            <SettingsPopupEditForm VerticalOffset="-1"></SettingsPopupEditForm>

                            <SettingsDataSecurity AllowInsert="False" />

                            <SettingsPopup>
                                <EditForm VerticalOffset="-1"></EditForm>
                            </SettingsPopup>
                        </dx:ASPxTreeList>
                        <asp:EntityDataSource ID="PermissionDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Permissions">
                        </asp:EntityDataSource>
                        <asp:EntityDataSource ID="SystemDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="OurSystems" EntityTypeFilter="OurSystem">
                        </asp:EntityDataSource>
                    </div>
                </div>

            </div>
            <!-- Article Editor card end -->
        </div>
        <!-- Page-body end -->

    </div>


</asp:Content>
