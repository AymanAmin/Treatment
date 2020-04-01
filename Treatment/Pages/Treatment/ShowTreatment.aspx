<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="ShowTreatment.aspx.cs" Inherits="Treatment.Pages.Treatment.ShowTreatment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>REU - Show Treatment</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <!-- Page-body start -->
    <div class="page-body">
        <div class="row">
            <!-- Task-detail-right start -->
            <div class="col-xl-4 col-lg-12 push-xl-8 task-detail-right">
                <div class="card">
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
                            <div class="yourCountdownContainer">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <h2>12&nbsp;&nbsp;&nbsp;</h2>
                                        <p>Days&nbsp;&nbsp;&nbsp;</p>
                                    </div>
                                    <div class="col-xs-3">
                                        <h2>24&nbsp;&nbsp;&nbsp;</h2>
                                        <p>Hours&nbsp;&nbsp;&nbsp;</p>
                                    </div>
                                    <div class="col-xs-3">
                                        <h2>38&nbsp;&nbsp;&nbsp;</h2>
                                        <p>Minutes&nbsp;&nbsp;&nbsp;</p>
                                    </div>
                                    <div class="col-xs-3">
                                        <h2>56&nbsp;&nbsp;&nbsp;</h2>
                                        <p>Seconds&nbsp;&nbsp;&nbsp;</p>
                                    </div>
                                </div>
                                <!-- end of row -->
                            </div>
                            <!-- end of yourCountdown -->
                        </div>
                        <!-- end of counter -->
                    </div>
                </div>
                <div class="card">
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
                                    <td class="text-right" id="treatmentDate" runat="server"></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-edit-alt"></i>&nbsp;Procedure:</td>
                                    <td class="text-right" id="treatmentProcedure" runat="server"></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-stamp"></i>&nbsp;Management:</td>
                                    <td class="text-right" id="treatmentManagement" runat="server"></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-tack-pin"></i>&nbsp;Classification:</td>
                                    <td class="text-right" id="treatmentClassification" runat="server"></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-ui-tag"></i>&nbsp;Type:</td>
                                    <td class="text-right" id="treatmentType" runat="server"></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-safety"></i>&nbsp;Secret:</td>
                                    <td class="text-right" id="treatmentSecret" runat="server"></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-certificate-alt-2"></i>&nbsp;Priority:</td>
                                    <td class="text-right" id="treatmentPriority" runat="server"></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-speed-meter"></i>&nbsp;Speed Up:</td>
                                    <td class="text-right" id="treatmentSpeedUp" runat="server"></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-ticket"></i>&nbsp;Status:</td>
                                    <td class="text-right" id="treatmentStatus" runat="server"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card">
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
                <div class="card">
                    <div class="card-header">
                        <h5><i class="icofont icofont-users-alt-4"></i></h5>
                        <h5>Assigned Users</h5>
                        <span></span>
                        <div class="card-header-right">
                            <ul class="list-unstyled card-option">
                                <li><i class="feather icon-maximize full-card"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
                                <li><i class="feather icon-trash-2 close-card"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-block user-box assign-user">
                        <div class="media">
                            <div class="media-left media-middle photo-table">
                                <a href="#">
                                    <img class="img-radius" src="..\..\..\..\Theme\files\assets\images\avatar-3.jpg" alt="chat-user">
                                </a>
                            </div>
                            <div class="media-body">
                                <h6>Sortino media</h6>
                                <p>Software Engineer</p>
                            </div>
                            <div>
                                <a href="#!" class="text-muted"><i class="icon-options-vertical"></i></a>
                            </div>
                        </div>
                        <div class="media">
                            <div class="media-left media-middle photo-table">
                                <a href="#">
                                    <img class="img-radius" src="..\..\..\..\Theme\files\assets\images\avatar-2.jpg" alt="chat-user">
                                </a>
                            </div>
                            <div class="media-body">
                                <h6>Larry heading </h6>
                                <p>Web Designer</p>
                            </div>
                            <div>
                                <a href="#!" class="text-muted"><i class="icon-options-vertical"></i></a>
                            </div>
                        </div>
                        <div class="media">
                            <div class="media-left media-middle photo-table">
                                <a href="#">
                                    <img class="img-radius" src="..\..\..\..\Theme\files\assets\images\avatar-1.jpg" alt="chat-user">
                                </a>
                            </div>
                            <div class="media-body">
                                <h6>Mark</h6>
                                <p>Chief Financial Officer (CFO)</p>
                            </div>
                            <div>
                                <a href="#!" class="text-muted"><i class="icon-options-vertical"></i></a>
                            </div>
                        </div>
                        <div class="media p-0 d-flex">
                            <div class="media-left media-middle photo-table">
                                <a href="#">
                                    <img class="img-radius" src="..\..\..\..\Theme\files\assets\images\avatar-4.jpg" alt="chat-user">
                                </a>
                            </div>
                            <div class="media-body">
                                <h6>John Doe</h6>
                                <p>Senior Marketing Designer</p>
                            </div>
                            <div>
                                <a href="#!" class="text-muted"><i class="icon-options-vertical"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Task-detail-right start -->
            <!-- Task-detail-left start -->
            <div class="col-xl-8 col-lg-12 pull-xl-4">
                <div class="card">
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
                        <div class="">
                            <div class="m-b-20" id="speech" runat="server">
                            </div>
                            <div class="m-t-20 m-b-20">
                                <h6 class="sub-title m-b-15">Uploaded files</h6>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-xl-3">
                                    <div class="card thumb-block">
                                        <div class="thumb-img">
                                            <img src="..\..\..\..\Theme\files\assets\images\task\task-u1.jpg" class="img-fluid width-100" alt="task-u1.jpg">
                                            <div class="caption-hover">
                                                <span>
                                                    <a href="#" class="btn btn-primary btn-sm"><i class="icofont icofont-ui-zoom-in"></i></a>
                                                    <a href="#" class="btn btn-primary btn-sm"><i class="icofont icofont-download-alt"></i></a>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="card-footer text-center">
                                            <a href="#!">task/task-u1.jpg </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-xl-3">
                                    <div class="card thumb-block">
                                        <div class="thumb-img">
                                            <img src="..\..\..\..\Theme\files\assets\images\task\task-u2.jpg" class="img-fluid width-100" alt="task-u2.jpg">
                                            <div class="caption-hover">
                                                <span>
                                                    <a href="#" class="btn btn-primary btn-sm"><i class="icofont icofont-ui-zoom-in"></i></a>
                                                    <a href="#" class="btn btn-primary btn-sm"><i class="icofont icofont-download-alt"></i></a>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="card-footer text-center">
                                            <a href="#!">task/task-u2.jpg </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-xl-3">
                                    <div class="card thumb-block">
                                        <div class="thumb-img">
                                            <img src="..\..\..\..\Theme\files\assets\images\task\task-u3.jpg" class="img-fluid width-100" alt="task-u3.jpg">
                                            <div class="caption-hover">
                                                <span>
                                                    <a href="#" class="btn btn-primary btn-sm"><i class="icofont icofont-ui-zoom-in"></i></a>
                                                    <a href="#" class="btn btn-primary btn-sm"><i class="icofont icofont-download-alt"></i></a>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="card-footer text-center">
                                            <a href="#!">task/task-u3.jpg </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-xl-3">
                                    <div class="card thumb-block">
                                        <div class="thumb-img">
                                            <img src="..\..\..\..\Theme\files\assets\images\task\task-u4.jpg" class="img-fluid width-100" alt="task-u4.jpg">
                                            <div class="caption-hover">
                                                <span>
                                                    <a href="#" class="btn btn-primary btn-sm"><i class="icofont icofont-ui-zoom-in"></i></a>
                                                    <a href="#" class="btn btn-primary btn-sm"><i class="icofont icofont-download-alt"></i></a>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="card-footer text-center">
                                            <a href="#!">task/task-u4.jpg </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- List view card start -->
                <div class="card">
                    <div class="card-header">
                        <h5><i class="icofont icofont-golf-cart"></i></h5>
                        <h5>Track</h5>
                        <span class="text-center">
                            <div class="mail-body-header">
                                <button type="button" class="btn btn-success btn-xs waves-effect waves-light" data-toggle="modal" data-target="#add-model-assignment">
                                    <i class="icofont icofont-paper-plane"></i>New
                                </button>

                                <button type="button" class="btn btn-warning btn-xs waves-effect waves-light" data-toggle="modal" data-target="#add-model-reply">
                                    <i class="icofont icofont-reply-all"></i>Reply
                                </button>
                                <button type="button" class="btn btn-danger btn-xs waves-effect waves-light">
                                    <i class="icofont icofont-close"></i>Close
                                </button>
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
                    <div class="row card-block">
                        <div class="col-md-12">
                            <ul class="list-view">
                                <li>
                                    <div class="card list-view-media">
                                        <div class="card-block z-depth-0">
                                            <div class="media">
                                                <a class="media-left" href="#">
                                                    <img class="media-object card-list-img" src="..\..\..\..\Theme\files\assets\images\avatar-1.jpg" alt="Generic placeholder image">
                                                </a>
                                                <div class="media-body">

                                                    <div class="col-xs-12">
                                                        <h6 class="d-inline-block">Heading</h6>
                                                        <label class="label label-info">Agent</label>
                                                    </div>
                                                    <div class="f-13 text-muted m-b-15">
                                                        Software Engineer
                                                                               
                                                    </div>
                                                    <p>
                                                        Hi, This is my short intro text.
                                                                                    Lorem ipsum is a dummy content sit
                                                                                    dollar. You can copy and paste this
                                                                                    dummy content from anywhere and to
                                                                                    anywhere. Its all free and must be a
                                                                                    good to folllow in prectice
                                                    </p>
                                                    <div class="m-t-15">
                                                        <button type="button" data-toggle="tooltip" title="Facebook" class="btn btn-facebook btn-mini waves-effect waves-light">
                                                            <span class="icofont icofont-social-facebook"></span>
                                                        </button>
                                                        <button type="button" data-toggle="tooltip" title="Twitter" class="btn btn-twitter btn-mini waves-effect waves-light">
                                                            <span class="icofont icofont-social-twitter"></span>
                                                        </button>
                                                        <button type="button" data-toggle="tooltip" title="Linkedin" class="btn btn-linkedin btn-mini waves-effect waves-light">
                                                            <span class="icofont icofont-brand-linkedin"></span>
                                                        </button>
                                                        <button type="button" data-toggle="tooltip" title="Drible" class="btn btn-dribbble btn-mini waves-effect waves-light">
                                                            <span class="icofont icofont-social-dribble"></span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <ul>
                                        <li>
                                            <div class="card list-view-media">
                                                <div class="card-block z-depth-0">
                                                    <div class="media">
                                                        <a class="media-left" href="#">
                                                            <img class="media-object card-list-img" src="..\..\..\..\Theme\files\assets\images\avatar-2.jpg" alt="Generic placeholder image">
                                                        </a>
                                                        <div class="media-body">
                                                            <div>
                                                                <h6 class="d-inline-block">Heading</h6>
                                                                <label class="label  label-info">Accountant</label>
                                                            </div>
                                                            <div class="f-13 text-muted m-b-15">
                                                                Softwear Engineer
                                                                               
                                                            </div>
                                                            <p>
                                                                Hi, This is my short intro text.
                                                                                    Lorem ipsum is a dummy content sit
                                                                                    dollar. You can copy and paste this
                                                                                    dummy content from anywhere and to
                                                                                    anywhere. Its all free and must be a
                                                                                    good to folllow in prectice
                                                            </p>
                                                            <div class="m-t-15">
                                                                <button type="button" data-toggle="tooltip" title="Facebook" class="btn btn-facebook btn-mini waves-effect waves-light">
                                                                    <span class="icofont icofont-social-facebook"></span>
                                                                </button>
                                                                <button type="button" data-toggle="tooltip" title="Twitter" class="btn btn-twitter btn-mini waves-effect waves-light">
                                                                    <span class="icofont icofont-social-twitter"></span>
                                                                </button>
                                                                <button type="button" data-toggle="tooltip" title="Linkedin" class="btn btn-linkedin btn-mini waves-effect waves-light">
                                                                    <span class="icofont icofont-brand-linkedin"></span>
                                                                </button>
                                                                <button type="button" data-toggle="tooltip" title="Drible" class="btn btn-dribbble btn-mini waves-effect waves-light">
                                                                    <span class="icofont icofont-social-dribble"></span>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="">
                                    <div class="card list-view-media">
                                        <div class="card-block z-depth-0">
                                            <div class="media">
                                                <a class="media-left" href="#">
                                                    <img class="media-object card-list-img" src="..\..\..\..\Theme\files\assets\images\avatar-3.jpg" alt="Generic placeholder image">
                                                </a>
                                                <div class="media-body">
                                                    <div>
                                                        <h6 class="d-inline-block">Heading</h6>
                                                        <label class="label  label-info">Accountant</label>
                                                    </div>
                                                    <div class="f-13 text-muted m-b-15">
                                                        Softwear Engineer
                                                                               
                                                    </div>
                                                    <p>
                                                        Hi, This is my short intro text.
                                                                                    Lorem ipsum is a dummy content sit
                                                                                    dollar. You can copy and paste this
                                                                                    dummy content from anywhere and to
                                                                                    anywhere. Its all free and must be a
                                                                                    good to folllow in prectice
                                                    </p>
                                                    <div class="m-t-15">
                                                        <button type="button" data-toggle="tooltip" title="Facebook" class="btn btn-facebook btn-mini waves-effect waves-light">
                                                            <span class="icofont icofont-social-facebook"></span>
                                                        </button>
                                                        <button type="button" data-toggle="tooltip" title="Twitter" class="btn btn-twitter btn-mini waves-effect waves-light">
                                                            <span class="icofont icofont-social-twitter"></span>
                                                        </button>
                                                        <button type="button" data-toggle="tooltip" title="Linkedin" class="btn btn-linkedin btn-mini waves-effect waves-light">
                                                            <span class="icofont icofont-brand-linkedin"></span>
                                                        </button>
                                                        <button type="button" data-toggle="tooltip" title="Drible" class="btn btn-dribbble btn-mini waves-effect waves-light">
                                                            <span class="icofont icofont-social-dribble"></span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- List view card end -->
            </div>
            <!-- Task-detail-left end -->
            <div id="add-model-assignment" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="login-card card-block login-card-modal">

                        <div class="text-center">
                            <img src="..\..\..\..\Theme\files\assets\images\auth\logo.png" alt="logo.png">
                        </div>
                        <div class="card m-t-15">
                            <div class="auth-box card-block">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <h3 class="text-center txt-primary">Add Assignment</h3>
                                    </div>
                                </div>
                                <div class="col-sm-12 ">
                                    <div class="form-group col-sm-12">
                                        <label>Standard Procedure</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-edit-alt"></i></span>
                                            <asp:DropDownList ID="standardProcedure" CssClass="js-example-basic-single form-control" runat="server" DataSourceID="EntityDataSourceTreatmentProcedure" DataTextField="Treatment_Procedure_Name_En" DataValueField="Treatment_Procedure_Id">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-12 j-unit">
                                        <label class="j-label">English Name</label>
                                        <div class="input-group">
                                            <span class="input-group-addon" id="basic-addon2"><i class="icofont icofont-underline"></i></span>
                                            <asp:TextBox ID="txtGroup_Name_En" runat="server" class="form-control" placeholder="Enter Name in English" TextMode="SingleLine"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-12" style="">
                                            <asp:RequiredFieldValidator ID="RFVtxtGroup_Name_En" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter English Name" ValidationGroup="Group" ControlToValidate="txtGroup_Name_En" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-12" style="text-align: right; margin-top: -2%">
                                        <asp:Button ID="Save" runat="server" Text="Save" class="btn btn-primary" ValidationGroup="Group" />

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
    <script>
        $(document).ready(function() {

            $('#myModal').on('show.bs.modal', function() {
                $('#select2-sample').select2();
            })
  
            $('#myModal').on('hidden.bs.modal', function() {
                $('#select2-sample').select2('destroy');
            })
        });
        </script>
</asp:Content>
