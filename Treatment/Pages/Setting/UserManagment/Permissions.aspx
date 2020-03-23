<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="Permissions.aspx.cs" Inherits="Treatment.Pages.Setting.UserManagment.Permissions" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>User Management - Permission</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="row col-sm-12">
        <div class="form-group col-sm-4 j-unit">
            <label class="j-label">Name Arabic</label>
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon1"><i class="icofont icofont-underline"></i></span>
                <asp:TextBox ID="txtPermission_Name" runat="server" class="form-control" placeholder="Enter Name in Arabic" TextMode="SingleLine"></asp:TextBox>
            </div>
            <div class="col-sm-12" style="margin-top:-5%">
                <asp:RequiredFieldValidator ID="RFVtxtPermission_Name" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Arabic Name" ValidationGroup="Per" ControlToValidate="txtPermission_Name" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group col-sm-4 j-unit" >
            <label class="j-label">Name English</label>
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon2"><i class="icofont icofont-underline"></i></span>
                <asp:TextBox ID="txtPermission_Name_En" runat="server" class="form-control" placeholder="Enter Name in English"></asp:TextBox>
            </div>
            <div class="col-sm-12" style="margin-top:-5%">
                <asp:RequiredFieldValidator ID="RFVtxtPermission_Name_En" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter English Name" ValidationGroup="Per" ControlToValidate="txtPermission_Name_En" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group col-sm-4 j-unit">
            <label class="j-label">Parent Form</label>
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon3"><i class="icofont icofont-tree"></i></span>
                <asp:DropDownList ID="txtParent" runat="server" class="form-control form-control-primary" DataSourceID="PermissionDataSource" DataTextField="Permission_Name_En" DataValueField="Permission_Id">
                    <asp:ListItem Value="0">Select Parent</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group col-sm-8 j-unit" style="margin-top:-1%">
            <label class="j-label">URL Path</label>
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon4"><i class="icofont icofont-link-alt"></i></span>
                <asp:TextBox ID="txtUrl_Path" runat="server" class="form-control" placeholder="Enter URL Path Ex(Pages/Setting/...)"></asp:TextBox>
            </div>
        </div>
        <div class="form-group col-sm-4 j-unit" style="margin-top: -1%">
            <div class="col-sm-12 col-xl-12 m-b-30">
                <h5 class="sub-title">Main Menu</h5>
                <input runat="server" id="MainMenu" type="checkbox" class="js-info" />
            </div>
        </div>
        
        <div class="form-group col-sm-12" style="text-align:right">
            <asp:Button ID="Save" runat="server" Text="Save" class="btn btn-primary" ValidationGroup="Per" OnClick="Save_Click" />
        </div>
        <div class="form-group col-sm-12 dt-responsive table-responsive">
            <dx:ASPxTreeList ID="PermissionTreeList" Style="width: 100%; text-align: center" runat="server" AutoGenerateColumns="False" DataSourceID="PermissionDataSource" EnableTheming="True" KeyFieldName="Permission_Id" Theme="Mulberry" ParentFieldName="Parent">
                <Columns>
                    <dx:TreeListTextColumn AutoFilterCondition="Default" Caption="Arabic Name" FieldName="Permission_Name" ShowInFilterControl="Default" VisibleIndex="1">
                    </dx:TreeListTextColumn>
                    <dx:TreeListTextColumn AutoFilterCondition="Default" Caption="English Name" FieldName="Permission_Name_En" ShowInFilterControl="Default" VisibleIndex="2">
                    </dx:TreeListTextColumn>
                    <dx:TreeListTextColumn AutoFilterCondition="Default" Caption="Path" FieldName="Url_Path" ShowInFilterControl="Default" VisibleIndex="4">
                    </dx:TreeListTextColumn>
                    <dx:TreeListCommandColumn Caption="Action" VisibleIndex="5">
                        <EditButton Visible="True" Text=" ">
                            <Styles>
                                <Style CssClass=" icofont icofont-ui-edit text-primary h6" VerticalAlign="Middle">
                                </Style>
                            </Styles>
                        </EditButton>
                        <DeleteButton Visible="True"  Text=" ">
                            <Styles> 
                                <Style CssClass="icofont icofont-ui-delete text-danger h6" VerticalAlign="Middle" >
                                </Style>
                            </Styles>
                        </DeleteButton>

                        <UpdateButton Text=" ">
                            <Styles>
                                <Style CssClass="icofont icofont-refresh text-primary h6" VerticalAlign="Middle">
                                </Style>
                            </Styles>
                        </UpdateButton>

                        <CancelButton Text=" ">
                            <Styles>
                                <Style  CssClass="icofont icofont-ui-close text-warning h6" VerticalAlign="Middle">
                                </Style>
                            </Styles>
                        </CancelButton>

                    </dx:TreeListCommandColumn>
                </Columns>
                <SettingsBehavior AllowAutoFilter="True" AutoExpandAllNodes="True"></SettingsBehavior>

                <SettingsPager Mode="ShowPager">
                </SettingsPager>

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
        </div>
    </div>
</asp:Content>
