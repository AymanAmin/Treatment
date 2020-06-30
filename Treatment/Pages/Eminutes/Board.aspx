<%@ Page Title="" Language="C#" MasterPageFile="~/EminutesMaster.Master" AutoEventWireup="true" CodeBehind="Board.aspx.cs" Inherits="Treatment.Pages.Eminutes.Board" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("Board-Title", "Eminutes - Board") %></title>
    <script>
        setTimeout(function () { document.getElementById("header_page_name").innerHTML = "Council: Department of Software"; }, 1);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="row">
        <div class="col-xl-4 col-lg-12 push-xl-8 task-detail-right">
            <!-- Board Properties -->
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-header-text"><span>
                            <asp:Literal ID="txtEditBoard" runat="server"></asp:Literal>
                            Board Properties </span></h5>
                        <div class="card-header-right">
                            <ul class="list-unstyled card-option">
                                <li><i class="feather full-card icon-maximize"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
                            </ul>
                        </div>
                    </div>

                    <div class="card-block task-details">
                        <table class="table table-border table-xs">
                            <tbody>
                                <tr>
                                    <td><i class="icofont icofont-contrast"></i>&nbsp;English Name:</td>
                                    <td class="text-right f-left"><span class="f-left">
                                        <asp:Literal ID="txtEnglishName" runat="server"></asp:Literal></span></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-meeting-add"></i>&nbsp;Arabic Name:</td>
                                    <td class="text-right f-left">
                                        <asp:Literal ID="txtArabicName" runat="server"></asp:Literal></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-id-card"></i>&nbsp;Created Date:</td>
                                    <td class="text-right f-left">
                                        <asp:Literal ID="txtCreatedDate" runat="server"></asp:Literal></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-spinner-alt-5"></i>&nbsp;Type:</td>
                                    <td class="text-right f-left">
                                        <asp:Literal ID="txtType" runat="server"></asp:Literal></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-spinner-alt-5"></i>&nbsp;Classification:</td>
                                    <td class="text-right f-left">
                                        <asp:Literal ID="txtClassification" runat="server"></asp:Literal></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--<div class="card-footer">
                    </div>-->
                </div>
            </div>
            <!-- End Board Properties -->

            <!-- Meeting Members -->
            <div class="col-md-12">
                <div class="card table-card">
                    <div class="card-header">
                        <h5><span>
                            <asp:Literal ID="txtMeetingMembers" runat="server"></asp:Literal>
                            Meeting Members </span></h5>
                        <div class="card-header-right">
                            <ul class="list-unstyled card-option">
                                <li><i class="feather full-card icon-maximize"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-block">
                        <div class="col">
                            <p id="Div_HolderOfAuthority" runat="server" class="text-muted m-b-10">Holder of authority</p>
                            <div id="Div_HolderOfAuthority_Table" runat="server" class="table-responsive">
                                <table class="table table-hover">
                                    <asp:Literal ID="txtHolderOfAuthority" runat="server"></asp:Literal>
                                </table>
                            </div>
                            <p id="Div_SuperVisor" runat="server" class="text-muted m-b-10">Chairman</p>
                            <div id="Div_SuperVisor_Table" runat="server" class="table-responsive">
                                <table class="table table-hover">
                                    <asp:Literal ID="txtSuperVisor" runat="server"></asp:Literal>
                                </table>
                            </div>
                            <p id="Div_Secretarial" runat="server" class="text-muted m-b-10">The Secretary</p>
                            <div id="Div_Secretarial_Table" runat="server" class="table-responsive">
                                <table class="table table-hover">
                                    <asp:Literal ID="txtSecretarial" runat="server"></asp:Literal>
                                </table>
                            </div>
                            <p id="Div_Members" runat="server" class="text-muted m-b-10">Members</p>
                            <div id="Div_Members_Table" runat="server" class="table-responsive">
                                <table class="table table-hover">
                                    <asp:Literal ID="txtMembers" runat="server"></asp:Literal>
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
                        <h5><span>
                            <asp:Literal ID="txtEditLocations" runat="server"></asp:Literal>
                            Locations </span></h5>
                        <div class="card-header-right">
                            <ul class="list-unstyled card-option">
                                <li><i class="feather full-card icon-maximize"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
                            </ul>
                        </div>
                    </div>

                    <div class="card-block">

                        <asp:Literal ID="txtLocations" runat="server"></asp:Literal>

                    </div>
                </div>
            </div>
            <!-- End Locations -->
        </div>

        <div class="col-xl-8 col-lg-12 pull-xl-4">
            <!--Meeting-->
            <div class="col-md-12">
                <div class="card user-activity-card feed-card">
                    <div class="card-header">
                        <h5><span>
                            <asp:Literal ID="txtAddMeeting" runat="server"></asp:Literal>
                            Meetings </span></h5>
                        <div class="card-header-right">
                            <ul class="list-unstyled card-option">
                                <li><i class="feather full-card icon-maximize"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
                            </ul>

                        </div>
                    </div>

                    <div class="card-block">
                        <!-- start of table -->
                        <div class="table-responsive">
                            <table id="issue-list-table" class="table dt-responsive width-100">
                                <thead class="text-left">
                                    <tr>
                                        <th>Expand</th>
                                        <th>Actions</th>
                                        <th>Status</th>
                                        <th>English Name</th>
                                        <th>Arabic Name</th>
                                        <th>Date</th>
                                        <th>Time</th>
                                    </tr>
                                </thead>
                                <tbody class="text-left">
                                    <asp:Literal ID="txtMeetings" runat="server"></asp:Literal>
                                </tbody>
                            </table>
                        </div>
                        <!-- end of table -->
                    </div>
                    <!--End Meeting-->
                </div>
            </div>


            <!--Laws regulations-->
            <div class="col-md-12" runat="server" visible="false" id="AttachmentFile">
                <div class="card table-card">
                    <div class="card-header">
                        <h5>Laws Regulations</h5>
                        <div class="card-header-right">
                            <ul class="list-unstyled card-option">
                                <li><i class="feather full-card icon-maximize"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
                            </ul>
                        </div>
                    </div>
                    <!--Start Uploadedfiles-->

                            <div class="row card-block" style="padding-right: 3%; padding-left: 3%;" id="downloadAttachment" runat="server">
                            </div>

                    <!--End Uploadedfiles-->
                </div>
            </div>
            <!--End Laws regulations-->

            <!--Board Branch-->
            <asp:Literal ID="SubBoard" runat="server"></asp:Literal>
            <!--End Board Branch-->

        </div>
    </div>
</asp:Content>
