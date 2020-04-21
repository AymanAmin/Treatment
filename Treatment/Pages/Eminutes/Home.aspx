<%@ Page Title="" Language="C#" MasterPageFile="~/EminutesMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Treatment.Pages.Eminutes.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("Home-Title", "Eminutes - Main Screen") %></title>
    <script>
        setTimeout(function () { document.getElementById("header_page").style.display = "none"; }, 1);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_PlaceHolder" runat="server">
    <div class="row">
        <div class="col-sm-6">
            <div class="card card-border-info">
                <div class="card-header">
                    <a href="#" class="card-title"><strong>Council: Department of Software</strong> </a>
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
        <div class="col-sm-6">
            <div class="card card-border-info">
                <div class="card-header">
                    <a href="#" class="card-title"><strong>Council: Department of Software</strong> </a>
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
                            <button class="btn btn-primary btn-mini dropdown-toggle waves-effect waves-light" type="button" id="dropdown4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Normal</button>
                            <div class="dropdown-menu" aria-labelledby="dropdown4" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                                <a class="dropdown-item waves-light waves-effect" href="#!"><span class="point-marker bg-danger"></span>Highest priority</a>
                                <a class="dropdown-item waves-light waves-effect" href="#!"><span class="point-marker bg-warning"></span>High priority</a>
                                <a class="dropdown-item waves-light waves-effect active" href="#!"><span class="point-marker bg-success"></span>Normal priority</a>
                                <a class="dropdown-item waves-light waves-effect" href="#!"><span class="point-marker bg-info"></span>Low priority</a>
                            </div>
                            <!-- end of dropdown menu -->
                        </div>
                        <div class="dropdown-secondary dropdown">
                            <button class="btn btn-default btn-mini dropdown-toggle waves-light b-none txt-muted" type="button" id="dropdown5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Open</button>
                            <div class="dropdown-menu" aria-labelledby="dropdown5" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
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
                            <button class="btn btn-default btn-mini dropdown-toggle waves-light b-none txt-muted" type="button" id="dropdown6" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icofont icofont-navigation-menu"></i></button>
                            <div class="dropdown-menu" aria-labelledby="dropdown6" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
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
        <div class="col-sm-6">
            <div class="card card-border-success">
                <div class="card-header">
                    <a href="#" class="card-title"><strong>Council: Department of Software</strong> </a>
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
                            <button class="btn btn-primary btn-mini dropdown-toggle waves-effect waves-light" type="button" id="dropdown7" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Normal</button>
                            <div class="dropdown-menu" aria-labelledby="dropdown7" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                                <a class="dropdown-item waves-light waves-effect" href="#!"><span class="point-marker bg-danger"></span>Highest priority</a>
                                <a class="dropdown-item waves-light waves-effect" href="#!"><span class="point-marker bg-warning"></span>High priority</a>
                                <a class="dropdown-item waves-light waves-effect active" href="#!"><span class="point-marker bg-success"></span>Normal priority</a>
                                <a class="dropdown-item waves-light waves-effect" href="#!"><span class="point-marker bg-info"></span>Low priority</a>
                            </div>
                            <!-- end of dropdown menu -->
                        </div>
                        <div class="dropdown-secondary dropdown">
                            <button class="btn btn-default btn-mini dropdown-toggle waves-light b-none txt-muted" type="button" id="dropdown8" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Open</button>
                            <div class="dropdown-menu" aria-labelledby="dropdown8" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
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
                            <button class="btn btn-default btn-mini dropdown-toggle waves-light b-none txt-muted" type="button" id="dropdown9" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icofont icofont-navigation-menu"></i></button>
                            <div class="dropdown-menu" aria-labelledby="dropdown9" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
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
        <div class="col-sm-6">
            <div class="card card-border-info">
                <div class="card-header">
                    <a href="#" class="card-title"><strong>Council: Department of Software</strong> </a>
                    <span class="label label-default f-right" style="background: linear-gradient(to right, #452a74, #fafafa)">28 January, 2015 </span>
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12">
                            <p class="task-detail">A collection of textile samples lay spread out on the table One morning, when Gregor Samsa woke from troubled.</p>
                            <!--<p class="task-due"><strong>Next Meeting : </strong><strong class="label label-info">28 January, 2015</strong></p>-->
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
                            <button class="btn btn-primary btn-mini dropdown-toggle waves-effect waves-light" type="button" id="dropdown10" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Normal</button>
                            <div class="dropdown-menu" aria-labelledby="dropdown10" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                                <a class="dropdown-item waves-light waves-effect" href="#!"><span class="point-marker bg-danger"></span>Highest priority</a>
                                <a class="dropdown-item waves-light waves-effect" href="#!"><span class="point-marker bg-warning"></span>High priority</a>
                                <a class="dropdown-item waves-light waves-effect active" href="#!"><span class="point-marker bg-success"></span>Normal priority</a>
                                <a class="dropdown-item waves-light waves-effect" href="#!"><span class="point-marker bg-info"></span>Low priority</a>
                            </div>
                            <!-- end of dropdown menu -->
                        </div>
                        <div class="dropdown-secondary dropdown">
                            <button class="btn btn-default btn-mini dropdown-toggle waves-light b-none txt-muted" type="button" id="dropdown11" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Open</button>
                            <div class="dropdown-menu" aria-labelledby="dropdown11" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
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
                            <button class="btn btn-default btn-mini dropdown-toggle waves-light b-none txt-muted" type="button" id="dropdown12" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icofont icofont-navigation-menu"></i></button>
                            <div class="dropdown-menu" aria-labelledby="dropdown12" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
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
    </div>
</asp:Content>
