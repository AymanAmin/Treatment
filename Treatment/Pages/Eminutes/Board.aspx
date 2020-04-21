<%@ Page Title="" Language="C#" MasterPageFile="~/EminutesMaster.Master" AutoEventWireup="true" CodeBehind="Board.aspx.cs" Inherits="Treatment.Pages.Eminutes.Board" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("Board-Title", "Eminutes - Board") %></title>
    <script>
         setTimeout(function () { document.getElementById("header_page_name").innerHTML = "Council: Department of Software"; }, 1);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_PlaceHolder" runat="server">
    <div class="row">
        <div class="col-xl-4 col-lg-12 push-xl-8 task-detail-right">
            <!-- Board Properties -->
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-header-text"><i class="icofont icofont-ui-note m-r-10"></i>Board Properties</h5>
                    </div>
                    <div class="card-block task-details">
                        <table class="table table-border table-xs">
                            <tbody>
                                <tr>
                                    <td><i class="icofont icofont-contrast"></i>English Name:</td>
                                    <td class="text-right f-left"><span class="f-left"><a href="#">Council: Department of Software</a></span></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-meeting-add"></i>Arabic Name:</td>
                                    <td class="text-right f-left">مجلس: هندسة البرمجيات</td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-id-card"></i>Created:</td>
                                    <td class="text-right f-left">25 Feb, 2015</td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-spinner-alt-5"></i>Type:</td>
                                    <td class="text-right f-left">Permanent</td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-spinner-alt-5"></i>Classification:</td>
                                    <td class="text-right f-left">Academic</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer">
                        <div>
                            <span>
                                <a href="#!" class="text-muted m-r-10 f-16"><i class="icofont icofont-random"></i></a>
                            </span>
                            <span class="m-r-10">
                                <a href="#!" class="text-muted f-16"><i class="icofont icofont-options"></i></a>
                            </span>

                        </div>
                    </div>
                </div>
            </div>
            <!-- End Board Properties -->

            <!-- Meeting Members -->
            <div class="col-md-12">
                <div class="card table-card">
                    <div class="card-header">
                        <h5>Meeting Members :</h5>
                        <div class="card-header-right">
                            <ul class="list-unstyled card-option">
                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                <li><i class="fa fa-minus minimize-card"></i></li>
                                <li><i class="fa fa-refresh reload-card"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-block">
                        <div class="col">
                            <p class="text-muted m-b-10">SuperVisor</p>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <tr>
                                        <td class="b-none">
                                            <a href="#!" class="align-middle">
                                                <img src="..\..\..\Theme\files\assets\images\avatar-2.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                <div class="d-inline-block">
                                                    <h6>Jeny William</h6>
                                                    <p class="text-muted m-b-0">Graphic Designer</p>
                                                </div>
                                            </a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <p class="text-muted m-b-10">Secretarial</p>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <tr>
                                        <td class="b-none">
                                            <a href="#!" class="align-middle">
                                                <img src="..\..\..\Theme\files\assets\images\avatar-2.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                <div class="d-inline-block">
                                                    <h6>Jeny William</h6>
                                                    <p class="text-muted m-b-0">Graphic Designer</p>
                                                </div>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="b-none">
                                            <a href="#!" class="align-middle">
                                                <img src="..\..\..\Theme\files\assets\images\avatar-1.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                <div class="d-inline-block">
                                                    <h6>John Deo</h6>
                                                    <p class="text-muted m-b-0">Web Designer</p>
                                                </div>
                                            </a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <p class="text-muted m-b-10">Members</p>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <tr>
                                        <td class="b-none">
                                            <a href="#!" class="align-middle">
                                                <img src="..\..\..\Theme\files\assets\images\avatar-2.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                <div class="d-inline-block">
                                                    <h6>Jeny William</h6>
                                                    <p class="text-muted m-b-0">Graphic Designer</p>
                                                </div>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="b-none">
                                            <a href="#!" class="align-middle">
                                                <img src="..\..\..\Theme\files\assets\images\avatar-1.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                <div class="d-inline-block">
                                                    <h6>John Deo</h6>
                                                    <p class="text-muted m-b-0">Web Designer</p>
                                                </div>
                                            </a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Meeting Members -->

            <!-- Locations -->
            <div class="col-md-12">
                <div class="card user-activity-card feed-card">
                    <div class="card-header">
                        <h5>Locations</h5>
                    </div>
                    <div class="card-block">

                        <div class="row m-b-25">
                            <div class="col-auto p-r-0">
                                <i class="feather icon-map-pin bg-simple-c-green feed-icon"></i>
                            </div>
                            <div class="col">
                                <h6 class="m-b-5">Saudi Araiba , Riyadh</h6>
                                <p class="text-muted m-b-0">Alnamuzajea branch, floor two, quality department.</p>
                                <!--<p class="text-muted m-b-0"><i class="feather icon-clock m-r-10"></i>2 min ago</p>-->
                            </div>
                        </div>

                        <div class="row m-b-25">
                            <div class="col-auto p-r-0">
                                <i class="feather icon-map-pin bg-simple-c-green feed-icon"></i>
                            </div>
                            <div class="col">
                                <h6 class="m-b-5">Saudi Araiba , Riyadh 2</h6>
                                <p class="text-muted m-b-0">Alnamuzajea branch, floor two, quality department.</p>
                                <!--<p class="text-muted m-b-0"><i class="feather icon-clock m-r-10"></i>2 min ago</p>-->
                            </div>
                        </div>

                        <div class="row m-b-25">
                            <div class="col-auto p-r-0">
                                <i class="feather icon-map-pin bg-simple-c-green feed-icon"></i>
                            </div>
                            <div class="col">
                                <h6 class="m-b-5">Saudi Araiba , Riyadh 3</h6>
                                <p class="text-muted m-b-0">Alnamuzajea branch, floor two, quality department.</p>
                                <!--<p class="text-muted m-b-0"><i class="feather icon-clock m-r-10"></i>2 min ago</p>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Locations -->
        </div>

        <div class="col-xl-8 col-lg-12 pull-xl-4">
            <!--Meeting-->
            <div class="col-md-12">
                <div class="card table-card">
                    <div class="card-header">
                        <h5>Board Meeting</h5>
                        <div class="card-header-right">
                            <ul class="list-unstyled card-option">
                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                <li><i class="fa fa-minus minimize-card"></i></li>
                                <li><i class="fa fa-refresh reload-card"></i></li>
                                <li><i class="fa fa-trash close-card"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-block">
                        <div class="table-responsive">
                            <table class="table table-hover table-borderless">
                                <thead>
                                    <tr>
                                        <th>Status</th>
                                        <th>Name</th>
                                        <th>Location</th>
                                        <th>Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <label class="label label-success">open</label></td>
                                        <td>Website down for one week</td>
                                        <td>Saudi Arabia, Riyadh</td>
                                        <td>Today 2:00</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="label label-primary">progress</label></td>
                                        <td>Loosing control on server</td>
                                        <td>Saudi Arabia, Riyadh</td>
                                        <td>Yesterday</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="label label-danger">closed</label></td>
                                        <td>Authorizations keys</td>
                                        <td>Saudi Arabia, Riyadh</td>
                                        <td>27, Aug</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="label label-success">open</label></td>
                                        <td>Restoring default settings</td>
                                        <td>Saudi Arabia, Riyadh</td>
                                        <td>Today 9:00</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="label label-primary">progress</label></td>
                                        <td>Loosing control on server</td>
                                        <td>Saudi Arabia, Riyadh</td>
                                        <td>Yesterday</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="label label-success">open</label></td>
                                        <td>Restoring default settings</td>
                                        <td>Saudi Arabia, Riyadh</td>
                                        <td>Today 9:00</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="label label-danger">closed</label></td>
                                        <td>Authorizations keys</td>
                                        <td>Saudi Arabia, Riyadh</td>
                                        <td>27, Aug</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="label label-success">open</label></td>
                                        <td>Restoring default settings</td>
                                        <td>Saudi Arabia, Riyadh</td>
                                        <td>Today 9:00</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="label label-primary">progress</label></td>
                                        <td>Loosing control on server</td>
                                        <td>Saudi Arabia, Riyadh</td>
                                        <td>Yesterday</td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="text-right m-r-20">
                                <a href="#!" class=" b-b-primary text-primary">View all Projects</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--End Meeting-->

            <!--Laws regulations-->
            <div class="col-md-12">
                <div class="card table-card">
                    <div class="card-header">
                        <h5>Laws Regulations</h5>
                        <div class="card-header-right">
                            <ul class="list-unstyled card-option">
                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                <li><i class="fa fa-minus minimize-card"></i></li>
                                <li><i class="fa fa-refresh reload-card"></i></li>
                                <li><i class="fa fa-trash close-card"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="row card-block" style="padding-right: 3%; padding-left: 3%;">
                        <div class="col-md-3">
                            <div class="card thumb-block">
                                <a href="../../../../media/Treatment/7c5933cd-0567-4e92-a143-227c4d6b890f.png" target="_blank"><span class="jFiler-icon-file f-file f-image" style="background-color: rgb(18, 132, 161);"><i class="icofont icofont-ui-image"></i></span></a>
                                <div class="card-footer text-center"><a href="../../../../media/Treatment/7c5933cd-0567-4e92-a143-227c4d6b890f.png" target="_blank">profile-image.png</a></div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card thumb-block">
                                <a href="../../../../media/Treatment/45a01576-ae85-416f-abdd-cdb9bf0daa5f.png" target="_blank"><span class="jFiler-icon-file f-file f-image" style="background-color: rgb(18, 132, 161);"><i class="icofont icofont-ui-image"></i></span></a>
                                <div class="card-footer text-center"><a href="../../../../media/Treatment/45a01576-ae85-416f-abdd-cdb9bf0daa5f.png" target="_blank">logo1(4).png</a></div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card thumb-block">
                                <a href="../../../../media/Treatment/152b4593-eae7-4fb9-8ac3-a80e69893bc9.pdf" target="_blank"><span class="jFiler-icon-file f-file f-image"><i class="icofont icofont-file-pdf"></i></span></a>
                                <div class="card-footer text-center"><a href="../../../../media/Treatment/152b4593-eae7-4fb9-8ac3-a80e69893bc9.pdf" target="_blank">TreatmentReport.pdf</a></div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card thumb-block">
                                <a href="../../../../media/Treatment/ba725354-f4cb-4193-bb13-667ed01eabee.docx" target="_blank"><span class="jFiler-icon-file f-file f-video"><i class="icofont icofont-file-word"></i></span></a>
                                <div class="card-footer text-center"><a href="../../../../media/Treatment/ba725354-f4cb-4193-bb13-667ed01eabee.docx" target="_blank">نموذج ـ اوراق الجامعة.docx</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--End Laws regulations-->

            <!--Board Branch-->
            <div class="col-md-12">
                <div class="card card-border-default">
                    <div class="card-header">
                        <a href="#" class="card-title"><strong>Branch 1 Council: Department of Software</strong> </a>
                        <span class="label label-default f-right" style="background: linear-gradient(to right, #452a74, #fafafa)">28 January, 2015 </span>
                    </div>
                    <div class="card-block">
                        <div class="row">
                            <div class="col-sm-12">
                                <p class="task-detail">A collection of textile samples lay spread out on the table One morning, when Gregor Samsa woke from troubled.</p>
                                <p class="task-due"><strong>Next Meeting : </strong><strong class="label label-info">28 January, 2015</strong></p>
                            </div>
                            <!-- end of col-sm-8 -->
                        </div>
                        <!-- end of row -->
                    </div>
                    <div class="card-footer">
                        <div class="task-list-table">
                            <a href="#!">
                                <img class="img-fluid img-radius" src="..\..\..\..\Theme\files\assets\images\avatar-1.jpg" alt="1"></a>
                            <a href="#!">
                                <img class="img-fluid img-radius" src="..\..\..\..\Theme\files\assets\images\avatar-2.jpg" alt="1"></a>
                            <a href="#!"><i class="icofont icofont-plus"></i></a>
                        </div>
                        <div class="task-board">
                            <div class="dropdown-secondary dropdown">
                                <button class="btn btn-primary btn-mini dropdown-toggle waves-effect waves-light" type="button" id="dropdown1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Normal</button>
                                <div class="dropdown-menu" aria-labelledby="dropdown1" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                                    <a class="dropdown-item waves-light waves-effect" href="#!"><span class="point-marker bg-danger"></span>Highest priority</a>
                                    <a class="dropdown-item waves-light waves-effect" href="#!"><span class="point-marker bg-warning"></span>High priority</a>
                                    <a class="dropdown-item waves-light waves-effect active" href="#!"><span class="point-marker bg-success"></span>Normal priority</a>
                                    <a class="dropdown-item waves-light waves-effect" href="#!"><span class="point-marker bg-info"></span>Low priority</a>
                                </div>
                                <!-- end of dropdown menu -->
                            </div>
                            <div class="dropdown-secondary dropdown">
                                <button class="btn btn-default btn-mini dropdown-toggle waves-light b-none txt-muted" type="button" id="dropdown2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Open</button>
                                <div class="dropdown-menu" aria-labelledby="dropdown2" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                                    <a class="dropdown-item waves-light waves-effect active" href="#!">Open</a>
                                    <a class="dropdown-item waves-light waves-effect" href="#!">On hold</a>
                                    <a class="dropdown-item waves-light waves-effect" href="#!">Resolved</a>
                                    <a class="dropdown-item waves-light waves-effect" href="#!">Closed</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item waves-light waves-effect" href="#!">Dublicate</a>
                                    <a class="dropdown-item waves-light waves-effect" href="#!">Invalid</a>
                                    <a class="dropdown-item waves-light waves-effect" href="#!">Wontfix</a>
                                </div>
                                <!-- end of dropdown menu -->
                            </div>
                            <!-- end of dropdown-secondary -->
                            <div class="dropdown-secondary dropdown">
                                <button class="btn btn-default btn-mini dropdown-toggle waves-light b-none txt-muted" type="button" id="dropdown3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icofont icofont-navigation-menu"></i></button>
                                <div class="dropdown-menu" aria-labelledby="dropdown3" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                                    <a class="dropdown-item waves-light waves-effect" href="#!"><i class="icofont icofont-ui-alarm"></i>Check in</a>
                                    <a class="dropdown-item waves-light waves-effect" href="#!"><i class="icofont icofont-attachment"></i>Attach screenshot</a>
                                    <a class="dropdown-item waves-light waves-effect" href="#!"><i class="icofont icofont-spinner-alt-5"></i>Reassign</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item waves-light waves-effect" href="#!"><i class="icofont icofont-ui-edit"></i>Edit task</a>
                                    <a class="dropdown-item waves-light waves-effect" href="#!"><i class="icofont icofont-close-line"></i>Remove</a>
                                </div>
                                <!-- end of dropdown menu -->
                            </div>
                            <!-- end of seconadary -->
                        </div>
                        <!-- end of pull-right class -->
                    </div>
                    <!-- end of card-footer -->
                </div>
            </div>

            <div class="col-md-12">
                <div class="card card-border-default">
                    <div class="card-header">
                        <a href="#" class="card-title"><strong>Branch 2 Council: Department of Software</strong> </a>
                        <span class="label label-default f-right" style="background: linear-gradient(to right, #452a74, #fafafa)">28 January, 2015 </span>
                    </div>
                    <div class="card-block">
                        <div class="row">
                            <div class="col-sm-12">
                                <p class="task-detail">A collection of textile samples lay spread out on the table One morning, when Gregor Samsa woke from troubled.</p>
                                <p class="task-due"><strong>Next Meeting : </strong><strong class="label label-info">28 January, 2015</strong></p>
                            </div>
                            <!-- end of col-sm-8 -->
                        </div>
                        <!-- end of row -->
                    </div>
                    <div class="card-footer">
                        <div class="task-list-table">
                            <a href="#!">
                                <img class="img-fluid img-radius" src="..\..\..\..\Theme\files\assets\images\avatar-1.jpg" alt="1"></a>
                            <a href="#!">
                                <img class="img-fluid img-radius" src="..\..\..\..\Theme\files\assets\images\avatar-2.jpg" alt="1"></a>
                            <a href="#!"><i class="icofont icofont-plus"></i></a>
                        </div>
                        <div class="task-board">
                            <div class="dropdown-secondary dropdown">
                                <button class="btn btn-primary btn-mini dropdown-toggle waves-effect waves-light" type="button" id="dropdown1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Normal</button>
                                <div class="dropdown-menu" aria-labelledby="dropdown1" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                                    <a class="dropdown-item waves-light waves-effect" href="#!"><span class="point-marker bg-danger"></span>Highest priority</a>
                                    <a class="dropdown-item waves-light waves-effect" href="#!"><span class="point-marker bg-warning"></span>High priority</a>
                                    <a class="dropdown-item waves-light waves-effect active" href="#!"><span class="point-marker bg-success"></span>Normal priority</a>
                                    <a class="dropdown-item waves-light waves-effect" href="#!"><span class="point-marker bg-info"></span>Low priority</a>
                                </div>
                                <!-- end of dropdown menu -->
                            </div>
                            <div class="dropdown-secondary dropdown">
                                <button class="btn btn-default btn-mini dropdown-toggle waves-light b-none txt-muted" type="button" id="dropdown2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Open</button>
                                <div class="dropdown-menu" aria-labelledby="dropdown2" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                                    <a class="dropdown-item waves-light waves-effect active" href="#!">Open</a>
                                    <a class="dropdown-item waves-light waves-effect" href="#!">On hold</a>
                                    <a class="dropdown-item waves-light waves-effect" href="#!">Resolved</a>
                                    <a class="dropdown-item waves-light waves-effect" href="#!">Closed</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item waves-light waves-effect" href="#!">Dublicate</a>
                                    <a class="dropdown-item waves-light waves-effect" href="#!">Invalid</a>
                                    <a class="dropdown-item waves-light waves-effect" href="#!">Wontfix</a>
                                </div>
                                <!-- end of dropdown menu -->
                            </div>
                            <!-- end of dropdown-secondary -->
                            <div class="dropdown-secondary dropdown">
                                <button class="btn btn-default btn-mini dropdown-toggle waves-light b-none txt-muted" type="button" id="dropdown3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icofont icofont-navigation-menu"></i></button>
                                <div class="dropdown-menu" aria-labelledby="dropdown3" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                                    <a class="dropdown-item waves-light waves-effect" href="#!"><i class="icofont icofont-ui-alarm"></i>Check in</a>
                                    <a class="dropdown-item waves-light waves-effect" href="#!"><i class="icofont icofont-attachment"></i>Attach screenshot</a>
                                    <a class="dropdown-item waves-light waves-effect" href="#!"><i class="icofont icofont-spinner-alt-5"></i>Reassign</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item waves-light waves-effect" href="#!"><i class="icofont icofont-ui-edit"></i>Edit task</a>
                                    <a class="dropdown-item waves-light waves-effect" href="#!"><i class="icofont icofont-close-line"></i>Remove</a>
                                </div>
                                <!-- end of dropdown menu -->
                            </div>
                            <!-- end of seconadary -->
                        </div>
                        <!-- end of pull-right class -->
                    </div>
                    <!-- end of card-footer -->
                </div>
            </div>
            <!--End Board Branch-->

        </div>
    </div>
</asp:Content>
