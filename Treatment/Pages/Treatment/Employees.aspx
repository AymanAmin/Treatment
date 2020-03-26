<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="Treatment.Pages.Treatment.Employees" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Employee</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="page-body">
               
                <!-- Modal Employee start -->
                <div id="sign-in-social" class="modal fade" role="dialog">
                    <div class="modal-dialog" style="max-width:700px">
                        <div class="login-card card-block login-card-modal">
                            <div class="text-center">
                                <asp:Image ID="Image1" runat="server" src="~\Theme\files\assets\images\auth\logo.png" alt="logo.png" />
                            </div>

                            <div class="card m-t-16">
                                <div class="auth-box card-block">
                                    <div class="row m-b-0">
                                        <div class="col-md-12">
                                            <h3 class="text-center txt-primary">Employee</h3>
                                        </div>
                                    </div>
                                    <!-- Start Employee Form-->
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <label class="j-label">Arabic Name</label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-numbered"></i></span>
                                                <asp:TextBox ID="Employee_Name_Ar" runat="server" class="form-control" placeholder="Enter Arabic Name" TextMode="SingleLine"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <label class="j-label">English Name</label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-numbered"></i></span>
                                                <asp:TextBox ID="Employee_Name_En" runat="server" class="form-control" placeholder="Enter English Name" TextMode="SingleLine"></asp:TextBox>
                                            </div>
                                        </div>
                                   </div> 

                                    <div class="row">
                                     <div class="col-sm-6">
                                        <label class="j-label">Email</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-numbered"></i></span>
                                            <asp:TextBox ID="Employee_Email" runat="server" class="form-control" placeholder="Enter Employee Email" TextMode="SingleLine"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <label class="j-label">Phone</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-numbered"></i></span>
                                            <asp:TextBox ID="Employee_Phone" runat="server" class="form-control" placeholder="Enter Employee Phone" TextMode="SingleLine"></asp:TextBox>
                                        </div>
                                    </div>
                                   </div>
                                    <div class="row">
                                     <div class="col-sm-6">
                                        <label class="j-label">Profile</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-numbered"></i></span>
                                            <asp:TextBox ID="Employee_Profile" runat="server" class="form-control" placeholder="Enter Employee Profile" TextMode="SingleLine"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <label class="j-label">Signature</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-numbered"></i></span>
                                            <asp:TextBox ID="Employee_Signature" runat="server" class="form-control" placeholder="Enter Employee Signature" TextMode="SingleLine"></asp:TextBox>
                                        </div>
                                    </div>
                                    </div>
                                    <div class="row">
                                    <div class="col-sm-6">
                                        <label class="j-label">password</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-numbered"></i></span>
                                            <asp:TextBox ID="Employee_Password" type="password"  runat="server" class="form-control" placeholder="Enter Employee password" TextMode="SingleLine"></asp:TextBox>
                                        </div>
                                    </div>
        
                                    <div class="col-sm-6">
                                        <label class="j-label">Group</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-edit-alt"></i></span>
                                            <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" DataTextField="Structure_Name_Ar" DataValueField="Structure_Name_Ar" DataSourceID="test" AutoPostBack="false"></asp:DropDownList>
                                            <asp:EntityDataSource ID="test" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableFlattening="False" EntitySetName="Structures" Select="it.[Structure_Name_Ar], it.[Structure_Id]">
                                            </asp:EntityDataSource>
                                        </div>
                                    </div>
                                  </div>
                                <div class="row">
                                 <div class="col-sm-6">
                                    <label>Structure</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-location-arrow"></i></span>
                                        <asp:DropDownList ID="treatmentTo" CssClass="js-example-placeholder-multiple col-sm-12" data-placeholder="Choose The Structure" multiple="multiple" runat="server" DataSourceID="EntityDataSourceStandardProcedure" DataTextField="Permission_Name_En" DataValueField="Permission_Id">
                                        </asp:DropDownList>
                                    </div>
                                      <asp:EntityDataSource ID="EntityDataSourceStandardProcedure" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntitySetName="Permissions"></asp:EntityDataSource>
                                </div>
                                 <div class="col-sm-6">
                                    <label>Active</label>
                                    <div class="input-group">
                                        <input id="Checkbox1" runat="server"  type="checkbox" class="js-single"/>
                                     </div>
                                </div>
                               </div>
                                <div class="row">
                                    <div class="row m-t-6">
                                        <div class="col-md-12">
                                            <button type="button" class="btn btn-primary btn-md btn-block waves-effect text-center ">Save</button>
                                        </div>
                                    </div>
                                </div>
                                    <!-- end of form -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal Employee end-->
        <!-- End Employee Form-->

        <!-- Start Grid-->
        <div class="table-responsive">
             <!-- Social Sign in card start -->
                <div class="card-block">
                    <p class="text-center">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#sign-in-social">Add Employees</button>
                    </p>
                </div>
                <!-- Social Sign in card end -->
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="EmployeeDataSource" KeyFieldName="Employee_Id" Theme="Moderno" RightToLeft="False" EnablePagingCallbackAnimation="True" AutoGenerateColumns="False">
           
            <SettingsCommandButton>
                <NewButton Text=" " Styles-Style-Font-Underline="false">
                    <Styles>
                        <Style CssClass="icofont icofont-plus text-primary h5">
                        </Style>
                    </Styles>
                </NewButton>
                <UpdateButton Text=" " Styles-Style-Font-Underline="false">
                    <Styles>
                        <Style CssClass="icofont icofont-refresh text-primary h5">
                        </Style>
                    </Styles>
                </UpdateButton>
                <CancelButton Text="  " Styles-Style-Font-Underline="false">
                    <Styles>
                        <Style CssClass="icofont icofont-ui-close text-warning h5">
                        </Style>
                    </Styles>
                </CancelButton>
                <EditButton Text=" " Styles-Style-Font-Underline="false">
                    <Styles>
                        <Style CssClass="icofont icofont-ui-edit text-info h5">
                        </Style>
                    </Styles>
                </EditButton>
                <DeleteButton Text=" " Styles-Style-Font-Underline="false">
                    <Styles>
                        <Style CssClass="icofont icofont-ui-delete text-danger h5">
                        </Style>
                    </Styles>
                </DeleteButton>
            </SettingsCommandButton>
            <SettingsSearchPanel Visible="True" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Employee_Name_Ar" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Employee Name Arabic">
                    <PropertiesTextEdit>
                        <ValidationSettings SetFocusOnError="True">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Employee_Email" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Employee Email">
                    <PropertiesTextEdit>
                        <ValidationSettings CausesValidation="True" EnableCustomValidation="True" SetFocusOnError="True">
                            <RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Employee_Phone" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Employee Phone">
                    <PropertiesTextEdit>
                        <ValidationSettings SetFocusOnError="True">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="8">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Employee Name English" FieldName="Employee_Name_En" VisibleIndex="1">
                    <PropertiesTextEdit>
                        <ValidationSettings CausesValidation="True" SetFocusOnError="True">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Employee Profile" FieldName="Employee_Profile" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Employee Signature" FieldName="Employee_Signature" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:EntityDataSource ID="EmployeeDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Employees" EntityTypeFilter="Employee" AutoGenerateOrderByClause="False" AutoGenerateWhereClause="False" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
        </asp:EntityDataSource>
        </div>
        <!-- End Grid-->

    </div>

</asp:Content>
