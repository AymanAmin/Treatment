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
                        <h5 class="card-header-text"><span> 
                             <asp:Literal ID="txtEditBoard" runat="server"></asp:Literal> Board Properties </span></h5>
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
                             <asp:Literal ID="txtMeetingMembers" runat="server"></asp:Literal> Meeting Members </span></h5>
                        <div class="card-header-right">
                            <ul class="list-unstyled card-option">
                                <li><i class="feather full-card icon-maximize"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-block">
                        <div class="col">
                            <p id="Div_SuperVisor" runat="server" class="text-muted m-b-10">SuperVisor</p>
                            <div id="Div_SuperVisor_Table" runat="server" class="table-responsive">
                                <table class="table table-hover">
                                    <asp:Literal ID="txtSuperVisor" runat="server"></asp:Literal>
                                </table>
                            </div>
                            <p id="Div_Secretarial" runat="server" class="text-muted m-b-10">Secretarial</p>
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
                             <asp:Literal ID="txtEditLocations" runat="server"></asp:Literal> Locations </span></h5>
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
                <div class="card table-card">
                    <div class="card-header">
                        <h5>Board Meeting</h5>
                        <div class="card-header-right">
                            <ul class="list-unstyled card-option">
                                <li><i class="feather full-card icon-maximize"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
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
                                <li><i class="feather full-card icon-maximize"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
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
            <asp:Literal ID="SubBoard" runat="server"></asp:Literal>
            <!--End Board Branch-->

        </div>
    </div>
</asp:Content>
