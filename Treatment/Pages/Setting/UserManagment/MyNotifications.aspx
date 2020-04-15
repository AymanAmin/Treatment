<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="MyNotifications.aspx.cs" Inherits="Treatment.Pages.Setting.UserManagment.MyNotifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("MyNotifications-Title", "ECMS - My Notification") %></title>
    <script>setTimeout(function () { document.getElementById("header-div").style.display = "none"; }, 1);</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card latest-update-card ScrollStyle">
                <div class="card-header">
                    <h5><% = Treatment.Classes.FieldNames.getFieldName("MyNotifications-MyNotifications", "My Notifications") %></h5>
                    <div class="card-header-right">
                        <ul class="list-unstyled card-option">
                            <!--<li><i class="fa fa fa-wrench open-card-option"></i></li>-->
                            <li><i class="fa fa-window-maximize full-card"></i></li>
                            <li><i class="fa fa-minus minimize-card"></i></li>
                            <li>
                                <asp:LinkButton ID="Reload" runat="server" OnClick="Reload_Click"><i class="fa fa-refresh reload-card"></i></asp:LinkButton></li>
                            <!--<li><i class="fa fa-trash close-card"></i></li>-->
                        </ul>
                    </div>
                </div>
                <div class="card-block">
                    <div class="latest-update-box">
                        <asp:Literal ID="Notifications" runat="server"></asp:Literal>
                        <!--<div class="row p-b-30">
                        <div class="col-auto text-right update-meta">
                            <p class="text-muted m-b-0 d-inline">1 day ago</p>
                            <i class="feather icon-check bg-simple-c-yellow  update-icon"></i>
                        </div>
                        <div class="col">
                            <h6>Database backup completed!</h6>
                            <p class="text-muted m-b-0">Download the <span class="text-c-blue">latest backup</span>.</p>
                        </div>
                    </div>-->
                    </div>
                    <div class="text-center">
                        <!--<a href="#!" class="b-b-primary text-primary">More</a>-->
                    </div>
                </div>
            </div>
        </div>

        <!-- Activity -->
        <div class="col-md-12">
            <div class="card latest-update-card ScrollStyle">
                <div class="card-header">
                    <h5><% = Treatment.Classes.FieldNames.getFieldName("MyNotifications-MyActivites", "My Activites") %></h5>
                    <div class="card-header-right">
                        <ul class="list-unstyled card-option">
                            <!--<li><i class="fa fa fa-wrench open-card-option"></i></li>-->
                            <li><i class="fa fa-window-maximize full-card"></i></li>
                            <li><i class="fa fa-minus minimize-card"></i></li>
                            <li>
                                <asp:LinkButton ID="Refresh" runat="server" OnClick="Refresh_Click" ><i class="fa fa-refresh reload-card"></i></asp:LinkButton></li>
                            <!--<li><i class="fa fa-trash close-card"></i></li>-->
                        </ul>
                    </div>
                </div>
                <!-- <div class="card-block">
                <div class="latest-update-box">
                    <asp:Literal ID="Activities" runat="server"></asp:Literal>

                    </div>
                <div class="text-center">
                    <a href="#!" class="b-b-primary text-primary">More</a>
                </div>
            </div> -->
                    <div class="card-block user-activity-card feed-card">
                         <asp:Literal ID="Activity" runat="server"></asp:Literal>
                        
                       <!-- <div class="row m-b-30">
                            <div class="col-auto p-r-0">
                                <i class="feather icon-shopping-cart bg-simple-c-pink feed-icon"></i>
                            </div>
                            <div class="col">
                                <h6 class="m-b-5">New order received <span class="text-muted f-right f-13">Just Now</span></h6>
                            </div>
                        </div>
                        <div class="row m-b-30">
                            <div class="col-auto p-r-0">
                                <i class="feather icon-file-text bg-simple-c-green feed-icon"></i>
                            </div>
                            <div class="col">
                                <h6 class="m-b-5">You have 3 pending tasks. <span class="text-muted f-right f-13">Just Now</span></h6>
                            </div>
                        </div>
                        <div class="row m-b-20">
                            <div class="col-auto p-r-0">
                                <i class="feather icon-shopping-cart bg-simple-c-pink feed-icon"></i>
                            </div>
                            <div class="col">
                                <h6 class="m-b-5">New order received <span class="text-muted f-right f-13">Just Now</span></h6>
                            </div>
                        </div>
                        <div class="text-center">
                            <a href="#!" class="b-b-primary text-primary">View all Feeds</a>
                        </div> -->
                    </div>
                </div>
        </div>
    </div>
    
</asp:Content>
