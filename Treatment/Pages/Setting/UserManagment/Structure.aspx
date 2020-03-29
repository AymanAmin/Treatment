<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="Structure.aspx.cs" Inherits="Treatment.Pages.Treatment.Tree" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Structure </title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="page-body">
        <!-- Modal Employee start -->
        <div id="sign-in-social" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="login-card card-block login-card-modal">
                    <div class="text-center">
                        <img src="..\..\..\..\Theme\files\assets\images\auth\logo.png" alt="logo.png">
                    </div>
                    <div class="card m-t-16">
                        <div class="auth-box card-block">
                            <div class="row m-b-0">
                                <div class="col-md-12">
                                    <h3 class="text-center txt-primary">Structure</h3>
                                </div>
                            </div>

                            <!-- Article Editor card start -->
                            <!-- Tree Form -->
                            <div class="row">
                                <div class="col-sm-12">
                                    <label class="j-label">Name Arabic</label>
                                    <div class="input-group">
                                        <span class="input-group-addon" id="basic-addon1"><i class="icofont icofont-underline"></i></span>
                                        <asp:TextBox ID="Name_Ar" runat="server" class="form-control" placeholder="Enter Name in Arabic" TextMode="SingleLine"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-12">
                                        <asp:RequiredFieldValidator ID="RFVtxtPermission_Name" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Arabic Name" ValidationGroup="Per" ControlToValidate="Name_Ar"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-sm-12">
                                    <label class="j-label">Name English</label>
                                    <div class="input-group">
                                        <span class="input-group-addon" id="basic-addon2"><i class="icofont icofont-underline"></i></span>
                                        <asp:TextBox ID="Name_En" runat="server" class="form-control" placeholder="Enter Name in English"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-12">
                                        <asp:RequiredFieldValidator ID="RFVtxtPermission_Name_En" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter English Name" ValidationGroup="Per" ControlToValidate="Name_En"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <label class="j-label">Parent Form</label>
                                    <div class="input-group">
                                        <span class="input-group-addon" id="basic-addon3"><i class="icofont icofont-tree"></i></span>
                                        <asp:DropDownList ID="Parent" runat="server" class="form-control form-control-primary" DataSourceID="TreeDataSourceView" DataTextField="Structure_Name_Ar" DataValueField="Structure_Id"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-sm-12" style="text-align: center;">
                                    <asp:Button ID="Save" runat="server" Text="Save" class="btn btn-primary"  ValidationGroup="Per" OnClick="Save_Click" />
                                </div>
                            </div>
                            <!-- Tree Form End-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Social Sign in card start -->
        <div class="form-group col-sm-12" style="text-align: right;">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#sign-in-social">Add Structure</button>
        </div>
        <!-- Structure Tree -->
        <dx:ASPxTreeList ID="ASPxTreeList1" runat="server" AutoGenerateColumns="False" DataSourceID="TreeDataSourceView" EnableTheming="True" KeyFieldName="Structure_Id" ParentFieldName="Structure_Parent" PreviewFieldName="Structure_Name" Theme="Mulberry" OnNodeDeleting="ASPxTreeList1_NodeDeleting" OnNodeDeleted="ASPxTreeList1_NodeDeleted">
            <Columns>
                <dx:TreeListTextColumn Caption="Arabic Name" FieldName="Structure_Name_Ar" VisibleIndex="0">

                    <PropertiesTextEdit>
                        <ValidationSettings SetFocusOnError="True">
                            <ErrorFrameStyle Font-Bold="True" Font-Italic="True" Font-Strikeout="True" Font-Underline="True" CssClass="j-input j-error-view">
                            </ErrorFrameStyle>
                            <RequiredField ErrorText="places Enter Arabic Name" IsRequired="True" />
                        </ValidationSettings>
                        <Style CssClass="input-group">
                                        </Style>
                    </PropertiesTextEdit>
                </dx:TreeListTextColumn>
                <dx:TreeListCommandColumn VisibleIndex="2">
                    <EditButton Visible="True" Text=" ">
                        <Styles>
                            <Style CssClass=" icofont icofont-ui-edit text-info h6" VerticalAlign="Middle" Font-Underline="false">
                                </Style>
                        </Styles>
                    </EditButton>
                    <NewButton Visible="True" Text=" ">
                        <Styles>

                            <Style CssClass="icofont icofont-plus text-primary h6" VerticalAlign="Middle" Font-Underline="false">
                                    
                                         </Style>
                        </Styles>
                    </NewButton>
                    <DeleteButton Visible="True" Text=" ">
                        <Styles>

                            <Style CssClass="icofont icofont-ui-delete text-danger h6" VerticalAlign="Middle" Font-Underline="false">
                                    
                                </Style>
                        </Styles>
                    </DeleteButton>
                    <UpdateButton Text=" ">
                        <Styles>
                            <Style CssClass="icofont icofont-refresh text-primary h6" VerticalAlign="Middle" Font-Underline="false">
                                            </Style>
                        </Styles>
                    </UpdateButton>
                    <CancelButton Text=" ">
                        <Styles>
                            <Style CssClass="icofont icofont-ui-close text-warning h6">
                                            </Style>
                        </Styles>
                    </CancelButton>
                </dx:TreeListCommandColumn>
                <dx:TreeListTextColumn AutoFilterCondition="Default" FieldName="Structure_Name_En" ShowInFilterControl="Default" VisibleIndex="1" Caption="English Name">
                    <PropertiesTextEdit>
                        <ValidationSettings SetFocusOnError="True">
                            <ErrorFrameStyle CssClass="j-input j-error-view">
                            </ErrorFrameStyle>
                            <RequiredField ErrorText="places Enter English Name" IsRequired="True" />
                        </ValidationSettings>
                        <Style CssClass="input-group">
                                        </Style>
                    </PropertiesTextEdit>
                </dx:TreeListTextColumn>
            </Columns>
            <SettingsBehavior AutoExpandAllNodes="True" />
            <SettingsPager Mode="ShowPager">
            </SettingsPager>

            <SettingsCustomizationWindow PopupHorizontalAlign="RightSides" PopupVerticalAlign="BottomSides"></SettingsCustomizationWindow>

            <SettingsEditing AllowNodeDragDrop="True" />

            <SettingsPopupEditForm VerticalOffset="-1"></SettingsPopupEditForm>

            <SettingsPopup>
                <EditForm VerticalOffset="-1"></EditForm>
            </SettingsPopup>
        </dx:ASPxTreeList>
        <asp:EntityDataSource ID="TreeDataSourceView" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Structures" EntityTypeFilter="Structure">
        </asp:EntityDataSource>
        <!-- Structure Tree End -->
        <!-- Article Editor card end -->
    </div>

</asp:Content>
