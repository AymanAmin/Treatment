<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="ShowTreatment.aspx.cs" Inherits="Treatment.Pages.Treatment.ShowTreatment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>REU - Show Treatment</title>
    <script>setTimeout(function () { document.getElementById("header-div").style.display = "none"; }, 1);</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <!-- Page-body start -->
    <div class="page-body">
        <div class="row">
            <!-- Task-detail-right start -->
            <div class="col-xl-4 col-lg-12 push-xl-8 task-detail-right">
                <div class="card ScrollStyle" runat="server" id="divRequiredReply">
                    <div class="card-header">
                        <h5><i class="icofont icofont-clock-time"></i></h5>
                        <h5>Required Reply</h5>
                        <span></span>
                        <div class="card-header-right">
                            <ul class="list-unstyled card-option">
                                <li><i class="feather icon-maximize full-card"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
                                <li><i class="feather icon-trash-2 close-card"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-block">
                        <div class="counter">
                            <div class="yourCountdownContainer" runat="server" id="counterDateAgo">
                                
                                <!-- end of row -->
                            </div>
                            <!-- end of yourCountdown -->
                        </div>
                        <!-- end of counter -->
                    </div>
                </div>
                <div class="card ScrollStyle">
                    <div class="card-header">
                        <h5><i class="icofont icofont-ui-note"></i></h5>
                        <h5>Treatment Details</h5>
                        <span></span>
                        <div class="card-header-right">
                            <ul class="list-unstyled card-option">
                                <li><i class="feather icon-maximize full-card"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
                                <li><i class="feather icon-trash-2 close-card"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-block task-details">
                        <table class="table table-border table-xs table-responsive dt-responsive">
                            <tbody>
                                <tr>
                                    <td><i class="icofont icofont-calendar"></i>&nbsp;Date:</td>
                                    <td class="text-left" id="treatmentDate" runat="server"></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-edit-alt"></i>&nbsp;Procedure:</td>
                                    <td class="text-left" id="treatmentProcedure" runat="server"></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-stamp"></i>&nbsp;Management:</td>
                                    <td class="text-left" id="treatmentManagement" runat="server"></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-tack-pin"></i>&nbsp;Classification:</td>
                                    <td class="text-left" id="treatmentClassification" runat="server"></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-ui-tag"></i>&nbsp;Type:</td>
                                    <td class="text-left" id="treatmentType" runat="server"></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-safety"></i>&nbsp;Secret:</td>
                                    <td class="text-left" id="treatmentSecret" runat="server"></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-certificate-alt-2"></i>&nbsp;Priority:</td>
                                    <td class="text-left" id="treatmentPriority" runat="server"></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-speed-meter"></i>&nbsp;Speed Up:</td>
                                    <td class="text-left" id="treatmentSpeedUp" runat="server"></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-ticket"></i>&nbsp;Status:</td>
                                    <td class="text-left" id="treatmentStatus" runat="server"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <div class="card ScrollStyle">
                    <div class="card-header">
                        <h5><i class="icofont icofont-users-alt-4"></i></h5>
                        <h5>Send To</h5>
                        <span></span>
                        <div class="card-header-right">
                            <ul class="list-unstyled card-option">
                                <li><i class="feather icon-maximize full-card"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
                                <li><i class="feather icon-trash-2 close-card"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-block user-box assign-user" id="sendToTreatment" runat="server">
                        
                    </div>
                    <div class="card-header" style="margin-top:-8%">
                        <h5><i class="icofont icofont-users-alt-4"></i></h5>
                        <h5>Copy To</h5>
                        <span></span>
                    </div>
                    <div class="card-block user-box assign-user" id="copyToTreatment" runat="server">
                        
                    </div>
                </div>
               <!-- <div class="card ScrollStyle">
                    <div class="card-header">
                        <h5><i class="icofont icofont-attachment"></i></h5>
                        <h5>Attached Files</h5>
                        <span></span>
                        <div class="card-header-right">
                            <ul class="list-unstyled card-option">
                                <li><i class="feather icon-maximize full-card"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
                                <li><i class="feather icon-trash-2 close-card"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-block task-attachment">
                        <ul class="media-list">
                            <li class="media d-flex m-b-10">
                                <div class="m-r-20 v-middle">
                                    <i class="icofont icofont-file-word f-28 text-muted"></i>
                                </div>
                                <div class="media-body">
                                    <a href="#" class="m-b-5 d-block">Overdrew_scowled.doc</a>
                                    <div class="text-muted">
                                        <span>Size: 1.2Mb</span>
                                        <span>Added by <a href="">Winnie</a>
                                        </span>
                                    </div>
                                </div>
                                <div class="f-right v-middle text-muted">
                                    <i class="icofont icofont-download-alt f-18"></i>
                                </div>
                            </li>
                            <li class="media d-flex m-b-10">
                                <div class="m-r-20 v-middle">
                                    <i class="icofont icofont-file-powerpoint f-28 text-muted"></i>
                                </div>
                                <div class="media-body">
                                    <a href="#" class="m-b-5 d-block">And_less_maternally.pdf</a>
                                    <div class="text-muted">
                                        <span>Size: 0.11Mb</span>
                                        <span>Added by <a href="">Eugene</a>
                                        </span>
                                    </div>
                                </div>
                                <div class="f-right v-middle text-muted">
                                    <i class="icofont icofont-download-alt f-18"></i>
                                </div>
                            </li>
                            <li class="media d-flex m-b-10">
                                <div class="m-r-20 v-middle">
                                    <i class="icofont icofont-file-pdf f-28 text-muted"></i>
                                </div>
                                <div class="media-body">
                                    <a href="#" class="m-b-5 d-block">The_less_overslept.pdf</a>
                                    <div class="text-muted">
                                        <span>Size:5.9Mb</span>
                                        <span>Added by <a href="">Natalie</a>
                                        </span>
                                    </div>
                                </div>
                                <div class="f-right v-middle text-muted">
                                    <i class="icofont icofont-download-alt f-18"></i>
                                </div>
                            </li>
                            <li class="media d-flex m-b-10">
                                <div class="m-r-20 v-middle">
                                    <i class="icofont icofont-file-exe f-28 text-muted"></i>
                                </div>
                                <div class="media-body">
                                    <a href="#" class="m-b-5 d-block">Well_equitably.mov</a>
                                    <div class="text-muted">
                                        <span>Size:20.9Mb</span>
                                        <span>Added by <a href="">Jenny</a>
                                        </span>
                                    </div>
                                </div>
                                <div class="f-right v-middle text-muted">
                                    <i class="icofont icofont-download-alt f-18"></i>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                -->
            </div>
            <!-- Task-detail-right start -->
            <!-- Task-detail-left start -->
            <div class="col-xl-8 col-lg-12 pull-xl-4">
                <div class="card ScrollStyle">
                    <div class="card-header">
                        <h5><i class="icofont icofont-presentation-alt"></i></h5>
                        <h5 id="subject" runat="server"></h5>
                        <span></span>
                        <div class="card-header-right">
                            <ul class="list-unstyled card-option">
                                <li><i class="feather icon-maximize full-card"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
                                <li><i class="feather icon-trash-2 close-card"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-block">
                            <asp:TextBox ID="hiddenTreatmentId" runat="server"></asp:TextBox>

                            <asp:Button ID="Button1" runat="server" Text="Print"  CssClass="btn btn-info m-b-15" PostBackUrl="~/Pages/Reports/Report.aspx" />
                        <div class="">
                            <div class="m-b-20" id="speech" runat="server">
                            </div>
                            <div class="m-t-20 m-b-20">
                                <h6 class="sub-title m-b-15">Uploaded files</h6>
                            </div>
                            <div class="row" id="downloadAttachment" runat="server">

                            </div>
                        </div>
                    </div>
                </div>
                <!-- List view card start -->
                <div class="card ScrollStyle">
                    <div class="card-header">
                        <h5><i class="icofont icofont-golf-cart"></i></h5>
                        <h5>Track</h5>
                        <span class="text-center" id="actionReply" runat="server">
                            <div class="mail-body-header">
                                <button type="button" id="NewAssignment" runat="server" class="btn btn-success btn-xs waves-effect waves-light" data-toggle="modal" data-target="#add-model-assignment">
                                    <i class="icofont icofont-paper-plane"></i>New
                                </button>

                                <button type="button" id="ReplyAssignment" runat="server" class="btn btn-warning btn-xs waves-effect waves-light" data-toggle="modal" data-target="#add-model-reply">
                                    <i class="icofont icofont-reply-all"></i>Reply
                                </button>
                                <asp:LinkButton ID="CloseAssignment" runat="server" OnClick="CloseAssignment_Click"><i class="icofont icofont-close"></i>Close</asp:LinkButton>
                            </div>
                        </span>
                        <div class="card-header-right">
                            <ul class="list-unstyled card-option">
                                <li><i class="feather icon-maximize full-card"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
                                <li><i class="feather icon-trash-2 close-card"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12" id="draggableMultiple">
                            <div class="col-lg-12 col-xl-12" id="trackTreatment" runat="server">
                            </div>
                        </div>
                </div>
                </div>
                <!-- List view card end -->
            </div>
            <!-- Task-detail-left end -->
            <div id="add-model-assignment" class="modal fade" role="dialog">
                <div class="modal-dialog modal-lg m-t-0">
                    <div class="login-card card-block login-card-modal">
                        <div class="text-center">
                            <img src="..\..\..\..\Theme\files\assets\images\auth\logo.png" alt="logo.png" />
                        </div>
                        <div class="card m-t-10">
                            <div class="auth-box card-block">
                                <div class="row m-b-10">
                                    <div class="col-md-12">
                                        <h3 class="text-center txt-primary">Add Assignment</h3>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-sm-6">
                                        <label>Standard Procedure</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-edit-alt"></i></span>
                                            <asp:DropDownList ID="standardProcedure" CssClass="js-example-basic-single form-control" runat="server" DataSourceID="EntityDataSourceTreatmentProcedure" DataTextField="Treatment_Procedure_Name_En" DataValueField="Treatment_Procedure_Id">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label>Secret Level</label><i class="icofont icofont-star-alt-1 text-danger"></i>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-safety"></i></span>
                                            <asp:DropDownList ID="secretLevel" CssClass="js-example-basic-single col-sm-12" runat="server" DataSourceID="EntityDataSourceTreatmentConfidentiality" DataTextField="Treatment_Confidentiality_Name_En" DataValueField="Treatment_Confidentiality_Id">
                                            </asp:DropDownList>
                                        </div>
                                        <asp:RequiredFieldValidator ID="valSecretLevel" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Secret Level" ValidationGroup="valFormAssignment" ControlToValidate="secretLevel" Display="Dynamic" CssClass="col-form-label"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-sm-6">
                                        <label>Send To</label><i class="icofont icofont-star-alt-1 text-danger"></i>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-paper-plane"></i></span>
                                            <asp:ListBox ID="treatmentTo" runat="server" CssClass="js-example-placeholder-multiple col-sm-12" data-placeholder="Choose Send To" DataSourceID="EntityDataSourceEmployee" DataTextField="Employee_Name_En" DataValueField="Employee_Id" SelectionMode="Multiple"></asp:ListBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="valTreatmentTo" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Send To" ValidationGroup="valFormAssignment" ControlToValidate="treatmentTo" Display="Dynamic" CssClass="col-form-label"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label>Copy To</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-ui-copy"></i></span>
                                            <asp:ListBox ID="treatmentCopyTo" CssClass="js-example-placeholder-multiple col-sm-12" data-placeholder="Choose Copy To" runat="server" DataSourceID="EntityDataSourceEmployee" DataTextField="Employee_Name_En" DataValueField="Employee_Id" SelectionMode="Multiple"></asp:ListBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-sm-3">
                                        <label>Required Reply</label>
                                        <div class="input-group">
                                            <label class="j-checkbox-toggle">
                                                <input ID="requiredReply" runat="server" type="checkbox" class="js-single" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label>Reply Date</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-calendar"></i></span>
                                            <asp:TextBox ID="replyDate10" runat="server" class="form-control" data-dd-modal="true" placeholder="Enter Treatment Date" TextMode="SingleLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-sm-12">
                                        <label>Required</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-presentation-alt"></i></span>
                                            <asp:TextBox ID="requiredAssignment" runat="server" placeholder="Enter Required" TextMode="MultiLine" Rows="2" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-sm-12">
                                        <label>Keywork</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-keyboard-alt"></i></span>
                                            <asp:TextBox ID="keyworkAssignment" runat="server" placeholder="Enter Keywork" TextMode="MultiLine" Rows="2" class="form-control"></asp:TextBox>
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
                                    <asp:Button ID="SaveAssignment" runat="server" Text="Save" class="btn btn-primary" ValidationGroup="valFormAssignment" OnClick="SaveAssignment_Click" />
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- end of form -->
                </div>
            </div>
        </div>


        <div id="add-model-reply" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="login-card card-block login-card-modal">

                    <div class="text-center">
                        <img src="..\..\..\..\Theme\files\assets\images\auth\logo.png" alt="logo.png">
                    </div>
                    <div class="card m-t-15">
                        <div class="auth-box card-block">
                            <div class="row m-b-10">
                                <div class="col-md-12 m-t-10">
                                    <h3 class="text-center txt-primary">Reply</h3>
                                </div>
                            </div>
                            <div class="col-sm-12 ">
                                <div class="row">
                                    <div class="form-group col-sm-12">
                                        <label class="j-label">Reply</label><i class="icofont icofont-star-alt-1 text-danger"></i>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-reply-all"></i></span>
                                            <asp:TextBox ID="replyTreatement" runat="server" placeholder="Enter Reply" TextMode="MultiLine" Rows="3" class="form-control"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="valReplyTreatement" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Reply" ValidationGroup="valReplyGroup" ControlToValidate="replyTreatement" Display="Dynamic" CssClass="col-form-label"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-sm-12">
                                        <label class="j-label">Keywork</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-keyboard-alt"></i></span>
                                            <asp:TextBox ID="keyworkTreatment" runat="server" placeholder="Enter Keywork" TextMode="MultiLine" Rows="3" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-12 text-right">
                                    <asp:Button ID="SaveReply" runat="server" Text="Save" class="btn btn-primary" ValidationGroup="valReplyGroup" OnClick="SaveReply_Click" />

                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- end of form -->
                </div>
            </div>
        </div>
    </div>
    <!-- Page-body end -->
    <!-- Start Treatment Data Source-->
    <asp:EntityDataSource ID="EntityDataSourceStandardProcedure" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntitySetName="Permissions"></asp:EntityDataSource>
    <asp:EntityDataSource ID="OwnerShipDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Owner_Relationship" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
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

    <style>
        #draggableMultiple .sortable-moves {
            box-shadow: 0 5px 25px -5px #ccc, 0 1px 5px 0 rgba(0,0,0,0.1), 0 0 0 0 rgba(0,0,0,0);
            cursor: pointer;
        }
        .label-default {
            background: linear-gradient(to right, #e0e0e0, #f6f7fb);
        }
        #dd-w-0 { margin-top:-23% }
        .card-footer {
            padding: 0.25rem 0.25rem;
        }
        .jFiler-icon-file i{
            font-size:230% !important
        }
    </style>
</asp:Content>
