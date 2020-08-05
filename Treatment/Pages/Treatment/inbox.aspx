<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="inbox.aspx.cs" Inherits="Treatment.Pages.Treatment.inbox" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("inbox-Title", "ECMS - Inbox") %></title>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <!-- Page-body start -->
    <div class="page-body">
        <!-- Nav Filter tab start 
        <div class="col-lg-12 filter-bar">
            <nav class="navbar navbar-light bg-faded m-b-30 p-10">
                <ul class="nav navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="#!">Filter: <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#!" id="bydate" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icofont icofont-clock-time"></i> By Date</a>
                        <div class="dropdown-menu" aria-labelledby="bydate">
                            <a class="dropdown-item" href="#!">Show all</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#!">Today</a>
                            <a class="dropdown-item" href="#!">Yesterday</a>
                            <a class="dropdown-item" href="#!">This week</a>
                            <a class="dropdown-item" href="#!">This month</a>
                            <a class="dropdown-item" href="#!">This year</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#!" id="bystatus" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icofont icofont-chart-histogram-alt"></i> By Status</a>
                        <div class="dropdown-menu" aria-labelledby="bystatus">
                            <a class="dropdown-item" href="#!">Show all</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#!">Open</a>
                            <a class="dropdown-item" href="#!">On hold</a>
                            <a class="dropdown-item" href="#!">Resolved</a>
                            <a class="dropdown-item" href="#!">Closed</a>
                            <a class="dropdown-item" href="#!">Dublicate</a>
                            <a class="dropdown-item" href="#!">Wontfix</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#!" id="bypriority" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icofont icofont-sub-listing"></i> By Priority</a>
                        <div class="dropdown-menu" aria-labelledby="bypriority">
                            <a class="dropdown-item" href="#!">Show all</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#!">Highest</a>
                            <a class="dropdown-item" href="#!">High</a>
                            <a class="dropdown-item" href="#!">Normal</a>
                            <a class="dropdown-item" href="#!">Low</a>
                        </div>
                    </li>
                </ul>
                <div class="nav-item nav-grid">
                    <span class="m-r-15">View Mode </span>
                    <button type="button" id="listViewId" class="btn btn-sm btn-primary waves-effect waves-light m-r-10" data-toggle="tooltip" data-placement="top" title="List View">
                        <i class="icofont icofont-listine-dots"></i>
                    </button>
                    <button type="button" id="gridViewId" class="btn btn-sm btn-primary waves-effect waves-light" data-toggle="tooltip" data-placement="top" title="Grid View">
                        <i class="icofont icofont-table"></i>
                    </button>
                </div>
                <div class="nav-item nav-grid">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search here..." />
                        <span class="input-group-addon" id="basic-addon1"><i class="icofont icofont-search"></i></span>
                    </div>
                </div>

            </nav>
        </div>
       -->

        <!-- Start View Inbox list  -->
        <div class="card" id="listViewTreatment">
            <div class="email-card">
                <!-- Left-side section start -->
                <div class="row">
                    <div class="col-lg-12 col-xl-2">
                        <div class="user-body">
                            <div class="p-20 text-center">
                                <a href="NewTreatment.aspx" class="btn btn-danger btn-round btn-block"><i class="icofont icofont-plus"></i> <% = Treatment.Classes.FieldNames.getFieldName("inbox-CreateNew", "Create New") %></a>
                            </div>
                            <ul class="page-list nav nav-tabs flex-column" id="pills-tab" role="tablist">
                                <li class="nav-item mail-section">
                                    <a class="nav-link active" data-toggle="pill" role="tab" style="font-size: 120%; color: #ccd0d5" id="inboxClick">
                                        <i class="icofont icofont-inbox"></i><% = Treatment.Classes.FieldNames.getFieldName("inbox-Inbox", "Inbox") %>
                                        <span class="label label-danger <%= Treatment.Classes.FieldNames.getLangHome() %>" id="addNfNumTreatment" runat="server"></span>
                                    </a>
                                </li>
                                <li class="nav-item mail-section">
                                    <a class="nav-link" data-toggle="pill" role="tab" style="font-size: 120%; color: #ccd0d5" id="starredClick">
                                        <i class="icofont icofont-paper-plane"></i><% = Treatment.Classes.FieldNames.getFieldName("inbox-Sent", "Sent") %>
                                    </a>
                                </li>
                                <li class="nav-item mail-section">
                                    <a class="nav-link" data-toggle="pill" role="tab" style="font-size: 120%; color: #ccd0d5" id="draftsClick">
                                        <i class="icofont icofont-license"></i><% = Treatment.Classes.FieldNames.getFieldName("inbox-Completed", "Completed") %>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- Left-side section end -->
                    <!-- Right-side section start -->
                    <div class="col-lg-12 col-xl-10">
                        <div class="tab-content" id="pills-tabContent">

                            <!-- Start Inbox Treatment-->
                            <div class="tab-pane fade show active" id="e-inbox" role="tabpanel">
                                <div class="mail-body">
                                    <div class="mail-body-content">
                                        <div class="table-responsive" runat="server" id="inboxTreatment">
                                            <!-- Create Table Send Treatment in Code behind Function loadListViewTreatment()-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Inbox Treatment -->

                            <!-- Start Send Treatment-->
                            <div class="tab-pane fade show active" id="e-starred" role="tabpanel">
                                <div class="mail-body">
                                    <div class="mail-body-content">
                                        <div class="table-responsive" runat="server" id="sendTreatment">
                                            <!-- Create Table Send Treatment in Code behind Function loadListViewTreatment()-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Send Treatment -->

                            <!-- Start Complete Treatment  -->
                            <div class="tab-pane fade show active" id="e-drafts" role="tabpanel">
                                <div class="mail-body">
                                    <div class="mail-body-content">
                                        <div class="table-responsive" runat="server" id="completeTreatment">
                                            <!-- Create Table Complete Treatment in Code behind Function loadListViewTreatment()-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Complete Treatment -->
                        </div>
                    </div>
                    <!-- Right-side section End -->

                </div>
            </div>
        </div>
        <!-- End View Inbox list  -->
    </div>
    <style>
        .email-card .user-body .page-list {
            border: 1px solid #efefef;
        }

        .email-card .mail-body-content tr:hover {
            box-shadow: inset 1px 0 0 #dadce0, inset -1px 0 0 #dadce0, 0 1px 2px 0 rgba(60,64,67,.3), 0 1px 3px 1px rgba(60,64,67,.15);
            background-color: #faf9f98a;
        }
        .card:hover {
            -webkit-box-shadow: 0 0 25px -5px #9e9c9e;
            box-shadow: 0 0 25px -5px #9e9c9e;
            cursor: pointer;
        }
        .label-default {
            background: linear-gradient(to right, #e0e0e0, #f6f7fb);
        }
        .read-email-tr {
    box-shadow: inset 1px 0 0 #dadce0, inset -1px 0 0 #dadce0, 0 1px 2px 0 rgba(60,64,67,.3), 0 1px 3px 1px rgba(60,64,67,.15);
    background-color: #f6f7fb;
}
        .btn-danger {
            background-color: rgb(255, 252, 252);
    box-shadow: 0 3px 6px rgba(0, 0, 0, .16), 0 1px 2px rgba(0, 0, 0, .23);
    color: #452a74;
    border-color: rgb(255, 252, 252);

        }
        .email-card .user-body .page-list li.mail-section a.active, .email-card .user-body .page-list li.mail-section a:hover {
    color: #452a74 !important;
}
    </style>
    <script>
        function hidePcoded() {
            document.getElementById("pcoded").setAttribute("vertical-nav-type", "offcanvas");
        }

        
    </script>
</asp:Content>
