<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="PermissionGroups.aspx.cs" Inherits="Treatment.Pages.Setting.UserManagment.PermissionGroups" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("PermissionGroups-Title", "User Management - Groups") %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <!-- Page-body start -->
    <div class="page-body">
        <!-- Article Editor card start -->
        <div class="card ScrollStyle ">
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
                        <div class="modal-dialog">
                            <div class="login-card card-block login-card-modal">

                                <div class="text-center">
                                    <img src="..\..\..\..\Theme\files\assets\images\auth\logo.png" alt="logo.png" />
                                </div>
                                <div class="card m-t-15">
                                    <div class="auth-box card-block">
                                        <div class="row m-b-20">
                                            <div class="col-md-12">
                                                <h3 class="text-center txt-primary"><% = Treatment.Classes.FieldNames.getFieldName("PermissionGroups-AddGroup", "Add Group") %></h3>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 ">
                                            <div class="form-group col-sm-12 j-unit" style="margin-top: 5%">
                                                <label class="j-label"><% = Treatment.Classes.FieldNames.getFieldName("PermissionGroups-ArabicName", "Arabic Name") %></label>
                                                <div class="input-group">
                                                    <span class="input-group-addon" id="basic-addon1"><i class="icofont icofont-underline"></i></span>
                                                    <asp:TextBox ID="txtGroup_Name" runat="server" class="form-control" placeholder="Enter Name in Arabic" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-12" style="">
                                                    <asp:RequiredFieldValidator ID="RFVtxtPermission_Name" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Arabic Name" ValidationGroup="Group" ControlToValidate="txtGroup_Name" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group col-sm-12 j-unit">
                                                <label class="j-label"><% = Treatment.Classes.FieldNames.getFieldName("PermissionGroups-EnglishName", "English Name") %></label>
                                                <div class="input-group">
                                                    <span class="input-group-addon" id="basic-addon2"><i class="icofont icofont-underline"></i></span>
                                                    <asp:TextBox ID="txtGroup_Name_En" runat="server" class="form-control" placeholder="Enter Name in English" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-12" style="">
                                                    <asp:RequiredFieldValidator ID="RFVtxtGroup_Name_En" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter English Name" ValidationGroup="Group" ControlToValidate="txtGroup_Name_En" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group col-sm-12" style="text-align: right; margin-top: -2%">
                                                <asp:Button ID="Save" runat="server" Text="Save" class="btn btn-primary" ValidationGroup="Group" OnClick="Save_Click" />

                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <!-- end of form -->
                            </div>
                        </div>
                    </div>

                    <div class="form-group col-sm-12" style="text-align: right; margin-top: -2%">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add-model"><% = Treatment.Classes.FieldNames.getFieldName("PermissionGroups-AddGroup", "Add Group") %></button>
                    </div>
                    <div class="form-group col-sm-12 blockquote">
                        <div class="dt-responsive table-responsive">
                            <dx:ASPxGridView ID="GroupGridView" Style="width: 100%; text-align: center; margin-top: 0%" runat="server" AutoGenerateColumns="False" DataSourceID="GroupDataSource" KeyFieldName="Group_Id" Theme="Mulberry">
                                <Settings />
                                <SettingsCommandButton>
                                    <EditButton Text=" ">
                                        <Styles>
                                            <Style CssClass=" icofont icofont-ui-edit text-primary h5">
                                </Style>
                                        </Styles>
                                    </EditButton>
                                    <DeleteButton Text=" ">
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
                                </SettingsCommandButton>
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Group_Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Caption="ID">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Group_Name_Ar" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Arabic Name">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="3" ButtonRenderMode="Link" ButtonType="Link" Caption="Action">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn Caption="English Name" FieldName="Group_Name_En" Name="English Name" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                        </div>
                        <asp:EntityDataSource ID="GroupDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Groups" EntityTypeFilter="Group">
                        </asp:EntityDataSource>
                    </div>
                    <hr />
                    <div class="form-group col-sm-6 j-unit" style="margin-top: 0%">
                        <label class="j-label"><% = Treatment.Classes.FieldNames.getFieldName("PermissionGroups-Groups", "Groups") %></label>
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon3"><i class="icofont icofont-tree"></i></span>
                            <asp:DropDownList ID="ddlGroups" runat="server" AutoPostBack="true" class="form-control form-control-primary" OnSelectedIndexChanged="ddlGroups_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group col-sm-12">
                        <div class="dt-responsive table-responsive">
                            <dx:ASPxGridView ID="PermissionGroupGridView" Style="width: 100%; text-align: center;" runat="server" AutoGenerateColumns="False" DataSourceID="PermissonsDataSource" EnableTheming="True" KeyFieldName="Permission_Id" Theme="Mulberry">
                                <SettingsPager PageSize="50">
                                </SettingsPager>
                                <Settings ShowGroupPanel="True" />
                                <SettingsSearchPanel Visible="True" />
                                <Columns>
                                    <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowSelectCheckbox="True" VisibleIndex="0">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="Permission_Id" ReadOnly="True" VisibleIndex="1" Caption="Permission ID">
                                        <FilterCellStyle HorizontalAlign="Center">
                                        </FilterCellStyle>
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Permission_Name_Ar" VisibleIndex="2" Caption="Permission Arabic Name">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Permission_Name_En" VisibleIndex="3" Caption="Permission English Name">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Url_Path" VisibleIndex="4" Caption="URL Path">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                            <asp:EntityDataSource ID="PermissonsDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableFlattening="False" EntitySetName="Permissions" EntityTypeFilter="Permission">
                            </asp:EntityDataSource>
                        </div>
                    </div>
                    <div class="form-group col-sm-12" style="text-align: right; margin-top: -2%">
                        <asp:Button ID="SaveChanges" runat="server" Text="Save" class="btn btn-primary" OnClick="SaveChanges_Click" />
                    </div>
                </div>

            </div>
            <!-- Article Editor card end -->
        </div>
        <!-- Page-body end -->

    </div>
</asp:Content>
