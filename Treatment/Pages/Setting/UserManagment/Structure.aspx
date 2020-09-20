<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="Structure.aspx.cs" Inherits="Treatment.Pages.Treatment.Tree" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("Structure-Title", "User Management - Structure") %></title>
     <script data-require="jquery@*" data-semver="2.0.3" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
    <script data-require="bootstrap@*" data-semver="3.1.1" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body_Holder" runat="server">

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
                                            <label class="j-label"><% = Treatment.Classes.FieldNames.getFieldName("Structure-NameArabic", "Name Arabic") %></label>
                                            <div class="input-group">
                                                <span class="input-group-addon" id="basic-addon1"><i class="icofont icofont-underline"></i></span>
                                                <asp:TextBox ID="Name_Ar" runat="server" class="form-control" placeholder="Enter Name in Arabic" TextMode="SingleLine"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-12">
                                                <asp:RequiredFieldValidator ID="RFVtxtPermission_Name" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Arabic Name" ValidationGroup="Per" ControlToValidate="Name_Ar"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="col-sm-12">
                                            <label class="j-label"><% = Treatment.Classes.FieldNames.getFieldName("Structure-NameEnglish", "Name English") %></label>
                                            <div class="input-group">
                                                <span class="input-group-addon" id="basic-addon2"><i class="icofont icofont-underline"></i></span>
                                                <asp:TextBox ID="Name_En" runat="server" class="form-control" placeholder="Enter Name in English"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-12">
                                                <asp:RequiredFieldValidator ID="RFVtxtPermission_Name_En" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter English Name" ValidationGroup="Per" ControlToValidate="Name_En"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <label class="j-label"><% = Treatment.Classes.FieldNames.getFieldName("Structure-ParentForm", "Parent Form") %></label>
                                            <div class="input-group">
                                                <span class="input-group-addon" id="basic-addon3"><i class="icofont icofont-tree"></i></span>
                                                <asp:DropDownList ID="Parent" runat="server" class="form-control form-control-primary" DataSourceID="TreeDataSourceView" DataTextField="Structure_Name_En" DataValueField="Structure_Id"  ></asp:DropDownList>
                                            </div>
                                        </div>

                                          <div class="col-sm-12">
                                            <label class="j-label"><% = Treatment.Classes.FieldNames.getFieldName("Structure-StructureCode", "Structure Code") %></label>
                                            <div class="input-group">
                                                <span class="input-group-addon" id="basic-addon4"><i class="icofont icofont-underline"></i></span>
                                                <asp:TextBox ID="StructureCode" runat="server" class="form-control" placeholder="Enter Structure Code"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-12">
                                                <asp:RequiredFieldValidator ID="StructureCodeValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Structure Code" ValidationGroup="Per" ControlToValidate="StructureCode"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="col-sm-12">
                                            <label class="j-label"><% = Treatment.Classes.FieldNames.getFieldName("Structure-IsManager", "Is Manager") %></label>
                                            <div class="">
                                                <input id="IsManager" runat="server" type="checkbox"  name="Active" class="js-switch"/> 
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <label class="j-label"><% = Treatment.Classes.FieldNames.getFieldName("Structure-IsJobTitle", "Is Job Title") %></label>
                                            <div class="">
                                                <input id="IsJobTitle" runat="server" type="checkbox"  name="Active" class="js-switch"/> 
                                            </div>
                                        </div>

                                    

                                        <div class="col-sm-12" style="text-align: center;">
                                            <asp:Button ID="Save" runat="server" Text="Save" class="btn btn-primary" ValidationGroup="Per" OnClick="Save_Click" />
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
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#sign-in-social"><% = Treatment.Classes.FieldNames.getFieldName("Structure-AddStructure", "Add Structure") %></button>
                </div>
                <!-- Structure Tree -->
                <div class="row table-responsive" style="padding:1%">
                    <dx:ASPxTreeList ID="ASPxTreeList1" runat="server" AutoGenerateColumns="False" DataSourceID="TreeDataSourceView" EnableTheming="True" KeyFieldName="Structure_Id" ParentFieldName="Structure_Parent" PreviewFieldName="Structure_Name" Theme="MetropolisBlue" OnNodeDeleting="ASPxTreeList1_NodeDeleting" OnNodeDeleted="ASPxTreeList1_NodeDeleted">
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
                            <dx:TreeListCommandColumn VisibleIndex="5">
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
                                        <Style CssClass="icofont icofont-save text-primary h6" VerticalAlign="Middle" Font-Underline="false">
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
                            <dx:TreeListCheckColumn AutoFilterCondition="Default" Caption="Is Job Title" FieldName="Is_Job_Title" ShowInFilterControl="Default" VisibleIndex="3">
                                <PropertiesCheckEdit>
                                    <CheckBoxStyle CssClass="js-single" />
                                    <Style CssClass="js-single">
                                    </Style>
                                </PropertiesCheckEdit>
                            </dx:TreeListCheckColumn>
                            <dx:TreeListCheckColumn AutoFilterCondition="Default" Caption="Is Manager" FieldName="Is_Manager" Name="Is_Manager" ShowInFilterControl="Default" VisibleIndex="4">
                            </dx:TreeListCheckColumn>
                            <dx:TreeListTextColumn AutoFilterCondition="Default" Caption="Structure Code" FieldName="Code" ShowInFilterControl="Default" VisibleIndex="2">
                            </dx:TreeListTextColumn>
                        </Columns>
                        <SettingsBehavior AutoExpandAllNodes="True" AllowFocusedNode="True" />

                        <SettingsCustomizationWindow PopupHorizontalAlign="RightSides" PopupVerticalAlign="BottomSides"></SettingsCustomizationWindow>

                        <SettingsEditing AllowNodeDragDrop="True" Mode="Inline" />

                        <SettingsPopupEditForm VerticalOffset="-1"></SettingsPopupEditForm>
                        <SettingsPopup>
                            <EditForm VerticalOffset="-1"></EditForm>
                        </SettingsPopup>
                    </dx:ASPxTreeList>
                </div>
                <asp:EntityDataSource ID="TreeDataSourceView" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Structures" EntityTypeFilter="Structure">
                </asp:EntityDataSource>
                <!-- Structure Tree End -->
                <!-- Article Editor card end -->
            </div>
        </div>

    </div>

</asp:Content>
