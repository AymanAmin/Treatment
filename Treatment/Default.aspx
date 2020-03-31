<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Treatment.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>ECMS - DashBoard</title>
    <script>
        setTimeout(function () { document.getElementById("header-div").style.display = "none"; }, 10);
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="row">
        <!-- task, page, download counter  start -->
        <div class="col-xl-3 col-md-6">
            <div class="card bg-c-yellow update-card">
                <div class="card-block">
                    <div class="row align-items-end">
                        <div class="col-8">
                            <h4 class="text-white">
                                <asp:Literal ID="txtAllTreatment" Text ="0" runat="server"></asp:Literal></h4>
                            <h6 class="text-white m-b-0">All Treatment</h6>
                        </div>
                        <div class="col-4 text-right">
                            <canvas id="update-chart-1" height="50"></canvas>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <p class="text-white m-b-0">
                        <i class="feather icon-clock text-white f-14 m-r-10"></i>
                        <asp:Literal ID="txtLastUpdateOne" Text="update : 2:15 am" runat="server"></asp:Literal>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card bg-c-green update-card">
                <div class="card-block">
                    <div class="row align-items-end">
                        <div class="col-8">
                            <h4 class="text-white">
                                <asp:Literal ID="txtNewInboxTreatment" Text ="0" runat="server"></asp:Literal>
                            </h4>
                            <h6 class="text-white m-b-0">New Inbox</h6>
                        </div>
                        <div class="col-4 text-right">
                            <canvas id="update-chart-2" height="50"></canvas>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <p class="text-white m-b-0">
                        <i class="feather icon-clock text-white f-14 m-r-10"></i>
                        <asp:Literal ID="txtLastUpdateTwo" Text="update : 2:15 am" runat="server"></asp:Literal>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card bg-c-pink update-card">
                <div class="card-block">
                    <div class="row align-items-end">
                        <div class="col-8">
                            <h4 class="text-white">
                                <asp:Literal ID="txtOutboxTreatment" Text ="0" runat="server"></asp:Literal>
                            </h4>
                            <h6 class="text-white m-b-0">Outbox Treatment</h6>
                        </div>
                        <div class="col-4 text-right">
                            <canvas id="update-chart-3" height="50"></canvas>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <p class="text-white m-b-0">
                        <i class="feather icon-clock text-white f-14 m-r-10"></i>
                        <asp:Literal ID="txtLastUpdateThree" Text="update : 2:15 am" runat="server"></asp:Literal>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card bg-c-lite-green update-card">
                <div class="card-block">
                    <div class="row align-items-end">
                        <div class="col-8">
                            <h4 class="text-white">
                                <asp:Literal ID="txtComplateTreatment" Text ="0" runat="server"></asp:Literal>
                            </h4>
                            <h6 class="text-white m-b-0">Finish Treatment</h6>
                        </div>
                        <div class="col-4 text-right">
                            <canvas id="update-chart-4" height="50"></canvas>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <p class="text-white m-b-0">
                        <i class="feather icon-clock text-white f-14 m-r-10"></i>
                        <asp:Literal ID="txtLastUpdateFour" Text="update : 2:15 am" runat="server"></asp:Literal>
                    </p>
                </div>
            </div>
        </div>
        <!-- task, page, download counter  end -->
    </div>
    
</asp:Content>
