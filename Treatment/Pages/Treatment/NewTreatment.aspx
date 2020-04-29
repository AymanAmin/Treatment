<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="NewTreatment.aspx.cs" Inherits="Treatment.Pages.Treatment.NewTreatment" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title><% = Treatment.Classes.FieldNames.getFieldName("Treatment-Title", "REU - Create Treatment") %></title>
    <script type="text/javascript">
    function getEmployee(x) {            $.ajax({
                url: "NewTreatment.aspx/getEmployeeTable",
                type: "POST",
                data: "{ Employee_Id:" + x.id + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (resultData) {
                    notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight', '  Save Status : ', '  The new Employee was Sucessfully saved in system ! ');
                    window.location = window.location;
                }
            });
        }
    </script>
    <!-- ckeditor.css-->
    <link rel="stylesheet" href="~/Theme\files\bower_components\ckeditor\samples\css\samples.css" />
    <link rel="stylesheet" href="~/Theme\files\bower_components\ckeditor\samples\toolbarconfigurator/lib/codemirror/neo.css" />
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
                <!-- Start Treatment Form-->
                <div class="row">
                    <div class="form-group col-sm-3">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("Treatment-Date", "Treatment Date") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-calendar"></i></span>
                            <asp:TextBox ID="treatmentDate" runat="server" class="form-control" placeholder="Enter Treatment Date" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="valTreatmentDate" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Treatment Date" ValidationGroup="valFormGroup" ControlToValidate="treatmentDate" Display="Dynamic" CssClass="col-form-label"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-3">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("Treatment-StandardProcedure", "Standard Procedure") %></label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-edit-alt"></i></span>
                            <asp:DropDownList ID="standardProcedure" CssClass="js-example-basic-single form-control" runat="server" DataSourceID="EntityDataSourceTreatmentProcedure" DataTextField="Treatment_Procedure_Name_En" DataValueField="Treatment_Procedure_Id">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group col-sm-3">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("Treatment-PreparedManagement", "Prepared Management") %></label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-stamp"></i></span>
                            <asp:DropDownList ID="preparedManagement" CssClass="js-example-basic-single col-sm-12" runat="server" DataSourceID="EntityDataSourceStructure" DataTextField="Structure_Name_En" DataValueField="Structure_Id">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group col-sm-3">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("Treatment-ClassificationSubject", "Classification Subject") %></label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-tack-pin"></i></span>
                            <asp:DropDownList ID="classificationSubject" CssClass="js-example-basic-single col-sm-12" runat="server" DataSourceID="EntityDataSourceTreatmentClass" DataTextField="Treatment_Class_Name_En" DataValueField="Treatment_Class_Id">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-12">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("Treatment-SendTo", "Send To") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon" data-toggle="modal" data-target="#tabbed-form"><i class="icofont icofont-paper-plane"></i></span>
                            <asp:ListBox ID="treatmentTo" runat="server" CssClass="js-example-placeholder-multiple col-sm-12" data-placeholder="Choose Send To" SelectionMode="Multiple"></asp:ListBox>
                        </div>
                        <asp:RequiredFieldValidator ID="valTreatmentTo" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Send To" ValidationGroup="valFormGroup" ControlToValidate="treatmentTo" Display="Dynamic" CssClass="col-form-label"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-12">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("Treatment-CopyTo", "Copy To") %></label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-ui-copy"></i></span>
                            <asp:ListBox ID="treatmentCopyTo" CssClass="js-example-placeholder-multiple col-sm-12" data-placeholder="Choose Copy To" runat="server" DataSourceID="EntityDataSourceEmployee" DataTextField="Employee_Name_En" DataValueField="Employee_Id" SelectionMode="Multiple"></asp:ListBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-3">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("Treatment-RequiredReply", "Required Reply") %></label>
                        <div class="input-group">
                            <label class="j-checkbox-toggle">
                                <asp:TextBox ID="requiredReply" runat="server" class="js-single" type="checkbox"></asp:TextBox>
                            </label>
                        </div>
                    </div>
                    <div class="form-group col-sm-4">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("Treatment-ReplyDate", "Reply Date") %></label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-calendar"></i></span>
                            <asp:TextBox ID="replyDate" runat="server" class="form-control" placeholder="Enter Treatment Date" TextMode="SingleLine"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-12">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("Treatment-Subject", "Subject") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-presentation-alt "></i></span>
                            <asp:TextBox ID="subjectTreatement" runat="server" placeholder="Enter Subject" TextMode="MultiLine" Rows="3" class="form-control"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="valSubjectTreatement" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Subject" ValidationGroup="valFormGroup" ControlToValidate="subjectTreatement" Display="Dynamic" CssClass="col-form-label"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-3">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("Treatment-TypeTreatment", "Type Treatment") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-ui-tag"></i></span>
                            <asp:DropDownList ID="typeTreatment" CssClass="js-example-basic-single col-sm-12" runat="server" DataSourceID="EntityDataSourceTreatmentType" DataTextField="Treatment_Type_Name_En" DataValueField="Treatment_Type_Id">
                            </asp:DropDownList>
                        </div>
                        <asp:RequiredFieldValidator ID="valTypeTreatment" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Type Treatment" ValidationGroup="valFormGroup" ControlToValidate="typeTreatment" Display="Dynamic" CssClass="col-form-label"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-3">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("Treatment-SecretLevel", "Secret Level") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-safety"></i></span>
                            <asp:DropDownList ID="secretLevel" CssClass="js-example-basic-single col-sm-12" runat="server" DataSourceID="EntityDataSourceTreatmentConfidentiality" DataTextField="Treatment_Confidentiality_Name_En" DataValueField="Treatment_Confidentiality_Id">
                            </asp:DropDownList>
                        </div>
                        <asp:RequiredFieldValidator ID="valSecretLevel" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Secret Level" ValidationGroup="valFormGroup" ControlToValidate="secretLevel" Display="Dynamic" CssClass="col-form-label"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-3">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("Treatment-PriorityLevel", "Priority Level") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-certificate-alt-2"></i></span>
                            <asp:DropDownList ID="priorityLevel" CssClass="js-example-basic-single col-sm-12" runat="server" DataSourceID="EntityDataSourceTreatmentPriority" DataTextField="Treatment_Priority_Name_En" DataValueField="Treatment_Priority_Id">
                            </asp:DropDownList>
                        </div>
                        <asp:RequiredFieldValidator ID="valPriorityLevel" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Priority Level" ValidationGroup="valFormGroup" ControlToValidate="priorityLevel" Display="Dynamic" CssClass="col-form-label"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-3">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("Treatment-SpeedUp", "Speed Up") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-speed-meter"></i></span>
                            <asp:DropDownList ID="speedUp" CssClass="js-example-basic-single col-sm-12" runat="server" DataSourceID="EntityDataSourceTreatmentDelivery" DataTextField="Treatment_Delivery_Name_En" DataValueField="Treatment_Delivery_Id">
                            </asp:DropDownList>
                        </div>
                        <asp:RequiredFieldValidator ID="valSpeedUp" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Speed Up" ValidationGroup="valFormGroup" ControlToValidate="speedUp" Display="Dynamic" CssClass="col-form-label"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-12">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("Treatment-Speech", "Speech") %></label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-clip-board"></i></span>
                            <asp:TextBox ID="speech" runat="server" TextMode="MultiLine" Rows="3" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <!-- File upload card start -->
                <div class="row">
                    <div class="form-group col-sm-12">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("Treatment-AddAttachments", "Add Attachments") %></label>
                        <asp:FileUpload ID="addAttachments1111" runat="server" class="form-control" AllowMultiple="True" />
                    </div>
                </div>
                <!-- File upload card end -->

                <div class="form-group col-sm-12 text-right">
                    <asp:Button ID="SaveTreatment" runat="server" Text="Save" CssClass="btn btn-primary" ValidationGroup="valFormGroup" OnClick="SaveTreatment_Click" />
                </div>
                <!-- End Treatment Form-->
            </div>
            <!-- Article Editor card end -->

            <!-- tabbed form modal start -->
            <div id="tabbed-form" class="modal fade mixed-form" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="text-center m-b-10">
                        <img src="..\..\..\..\Theme\files\assets\images\auth\logo.png" alt="logo.png" />
                    </div>
                    <!-- Modal content-->
                    <div class="modal-content card">
                        <div class="modal-body card-block">
                            <div class="login-card-modal">
                                <div class="tabbed-modal">
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs nav-justified" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-toggle="tab" href="#sign_in" role="tab">
                                                <h6><strong>Structure</strong></h6>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="tab" href="#regi" role="tab">
                                                <h6><strong>Employees</strong></h6>
                                            </a>
                                        </li>
                                    </ul>
                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="sign_in" role="tabpanel">
                                            <div class="auth-box m-t-15">
                                                <dx:ASPxTreeList ID="ASPxTreeList1" runat="server" AutoGenerateColumns="False"  EnableTheming="True" Theme="Moderno" Width="100%" KeyFieldName="Structure_Id" ParentFieldName="Structure_Parent" PreviewFieldName="Structure_Name_En">
                                                    <Columns>
                                                        <dx:TreeListTextColumn AutoFilterCondition="Default" FieldName="Structure_Name_En" ShowInFilterControl="Default" VisibleIndex="1" Caption="Structure Name">
                                                        </dx:TreeListTextColumn>
                                                    </Columns>
                                                    <SettingsBehavior AllowAutoFilter="True" AutoExpandAllNodes="True"></SettingsBehavior>

                                                    <SettingsCustomizationWindow PopupHorizontalAlign="RightSides" PopupVerticalAlign="BottomSides"></SettingsCustomizationWindow>

                                                    <SettingsSelection Enabled="True" />

                                                    <SettingsPopupEditForm VerticalOffset="-1"></SettingsPopupEditForm>

                                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />

                                                    <SettingsPopup>
                                                        <EditForm VerticalOffset="-1"></EditForm>
                                                    </SettingsPopup>
                                                </dx:ASPxTreeList>
                                                <div class="form-group col-sm-2 text-right m-t-15 f-right">
                                                    <asp:Button ID="Button2" runat="server" Text="OK" CssClass="btn btn-primary btn-md btn-block waves-effect text-center"  AutoPostback = "false"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="regi" role="tabpanel">
                                            <div class="auth-box">
                                                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"  EnableTheming="True" Theme="Moderno" Width="100%" KeyFieldName="ddlKey">
                                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                    <SettingsSearchPanel Visible="True" />
                                                    <Columns>
                                                        <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowSelectCheckbox="True" VisibleIndex="0" Name="checkboxEmpID">
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn Caption="Employee Name" FieldName="employeeName" Name="Employee_Name_En" VisibleIndex="1">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Job Title" FieldName="jobTitle" Name="jobTitle" VisibleIndex="2">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:ASPxGridView>
                                                <div class="form-group col-sm-2 text-right m-t-15 f-right">
                                                    <asp:Button ID="Button1" runat="server" Text="OK" CssClass="btn btn-primary btn-md btn-block waves-effect text-center"  AutoPostback = "false"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- tabbed form modal end -->
        </div>
    </div>
    <!-- Page-body end -->
    <!-- Start Treatment Data Source-->
    <asp:EntityDataSource ID="EntityDataSourceStandardProcedure" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntitySetName="Permissions"></asp:EntityDataSource>
    <asp:EntityDataSource ID="OwnerShipDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Owner_Relationship" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EnableFlattening="False" EnableViewState="False"></asp:EntityDataSource>
    <asp:EntityDataSource ID="EntityDataSourceAssignmentStatus" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Assignment_Status" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
    <asp:EntityDataSource ID="EntityDataSourcePreparedAdministration" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Prepared_Administration" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
    <asp:EntityDataSource ID="EntityDataSourceTreatmentClass" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Treatment_Class" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
    <asp:EntityDataSource ID="EntityDataSourceTreatmentConfidentiality" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Treatment_Confidentiality" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
    <asp:EntityDataSource ID="EntityDataSourceTreatmentDelivery" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Treatment_Delivery" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
    <asp:EntityDataSource ID="EntityDataSourceTreatmentPriority" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Treatment_Priority" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
    <asp:EntityDataSource ID="EntityDataSourceTreatmentProcedure" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Treatment_Procedure" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
    <asp:EntityDataSource ID="EntityDataSourceTreatmentStatus" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Treatment_Status" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
    <asp:EntityDataSource ID="EntityDataSourceTreatmentType" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Treatment_Type" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
    <asp:EntityDataSource ID="EntityDataSourceEmployee" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Employees" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
    <asp:EntityDataSource ID="EntityDataSourceStructure" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Structures" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
    <!-- End Treatment Data Source-->

    <!-- ckeditor.css-->
    <script src="..\..\..\..\Theme\files\bower_components\ckeditor\ckeditor.js"></script>
    <script src="..\..\..\..\Theme\files\bower_components\ckeditor\samples\js\sample.js"></script>
</asp:Content>


