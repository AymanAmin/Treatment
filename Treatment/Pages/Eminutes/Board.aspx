<%@ Page Title="" Language="C#" MasterPageFile="~/EminutesMaster.Master" AutoEventWireup="true" CodeBehind="Board.aspx.cs" Inherits="Treatment.Pages.Eminutes.Board" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("Board-Title", "Eminutes - Board") %></title>
    <script data-require="jquery@*" data-semver="2.0.3" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
    <script data-require="bootstrap@*" data-semver="3.1.1" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <script>
        /*setTimeout(function () { document.getElementById("header_page_name").innerHTML = "Council: Department of Software"; }, 1);*/
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">

      <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                   <% =  Treatment.Classes.FieldNames.getFieldName("Board-DeleteHeader", "Delete Metting") %>
                </div>
                <div class="modal-body">
                    <%  = Treatment.Classes.FieldNames.getFieldName("Board-DeleteMessage", "Are you sure you want to delete this Metting?") %>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><%  = Treatment.Classes.FieldNames.getFieldName("Board-Cancel", "Cancel") %></button>
                    <a class="btn btn-danger btn-ok" style="color:white;"><% = Treatment.Classes.FieldNames.getFieldName("Board-Delete", "Delete") %></a>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-xl-4 col-lg-12 push-xl-8 task-detail-right">
            <!-- Board Properties -->
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-header-text"><span>
                            <asp:Literal ID="txtEditBoard" runat="server"></asp:Literal>
                            <% = Treatment.Classes.FieldNames.getFieldName("Board-BoardProperties", "Board Properties") %> </span></h5>
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
                                    <td><i class="icofont icofont-contrast"></i>&nbsp;<% = Treatment.Classes.FieldNames.getFieldName("Board-EnglishName", "English Name") %>:</td>
                                    <td class="text-right f-left"><span class="f-left">
                                        <asp:Literal ID="txtEnglishName" runat="server"></asp:Literal></span></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-meeting-add"></i>&nbsp;<% = Treatment.Classes.FieldNames.getFieldName("Board-ArabicName", "Arabic Name") %>:</td>
                                    <td class="text-right f-left">
                                        <asp:Literal ID="txtArabicName" runat="server"></asp:Literal></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-id-card"></i>&nbsp;<% = Treatment.Classes.FieldNames.getFieldName("Board-CreatedDate", "Created Date") %>:</td>
                                    <td class="text-right f-left">
                                        <asp:Literal ID="txtCreatedDate" runat="server"></asp:Literal></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-spinner-alt-5"></i>&nbsp;<% = Treatment.Classes.FieldNames.getFieldName("Board-Type", "Type") %>:</td>
                                    <td class="text-right f-left">
                                        <asp:Literal ID="txtType" runat="server"></asp:Literal></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-spinner-alt-5"></i>&nbsp;<% = Treatment.Classes.FieldNames.getFieldName("Board-Classification", "Classification") %>:</td>
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
                            <% = Treatment.Classes.FieldNames.getFieldName("Board-MeetingMembers", "Meeting Members") %> </span></h5>
                        <div class="card-header-right">
                            <ul class="list-unstyled card-option">
                                <li><i class="feather full-card icon-maximize"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-block">
                        <div class="col">
                            <p id="Div_HolderOfAuthority" runat="server" class="text-muted m-b-10"><% = Treatment.Classes.FieldNames.getFieldName("Board-HolderofAuthority", "Holder of Authority") %></p>
                            <div id="Div_HolderOfAuthority_Table" runat="server" class="table-responsive">
                                <table class="table table-hover">
                                    <asp:Literal ID="txtHolderOfAuthority" runat="server"></asp:Literal>
                                </table>
                            </div>
                            <p id="Div_SuperVisor" runat="server" class="text-muted m-b-10"><% = Treatment.Classes.FieldNames.getFieldName("Board-Chairman", "Chairman") %></p>
                            <div id="Div_SuperVisor_Table" runat="server" class="table-responsive">
                                <table class="table table-hover">
                                    <asp:Literal ID="txtSuperVisor" runat="server"></asp:Literal>
                                </table>
                            </div>
                            <p id="Div_Secretarial" runat="server" class="text-muted m-b-10"><% = Treatment.Classes.FieldNames.getFieldName("Board-TheSecretary", "The Secretary") %></p>
                            <div id="Div_Secretarial_Table" runat="server" class="table-responsive">
                                <table class="table table-hover">
                                    <asp:Literal ID="txtSecretarial" runat="server"></asp:Literal>
                                </table>
                            </div>
                            <p id="Div_Members" runat="server" class="text-muted m-b-10"><% = Treatment.Classes.FieldNames.getFieldName("Board-Members", "Members") %></p>
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
                            <% = Treatment.Classes.FieldNames.getFieldName("Board-Locations", "Locations") %> </span></h5>
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
                            <% = Treatment.Classes.FieldNames.getFieldName("Board-Meetings", "Meetings") %> </span></h5>
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
                                        <th><% = Treatment.Classes.FieldNames.getFieldName("Board-Expand", "Expand") %></th>
                                        <th><% = Treatment.Classes.FieldNames.getFieldName("Board-Actions", "Actions") %></th>
                                        <th><% = Treatment.Classes.FieldNames.getFieldName("Board-Status", "Status") %></th>
                                        <th><% = Treatment.Classes.FieldNames.getFieldName("Board-EnglishName", "English Name") %></th>
                                        <th><% = Treatment.Classes.FieldNames.getFieldName("Board-ArabicName", "Arabic Name") %></th>
                                        <th><% = Treatment.Classes.FieldNames.getFieldName("Board-Date", "Date") %></th>
                                        <th><% = Treatment.Classes.FieldNames.getFieldName("Board-Time", "Time") %></th>
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
                        <h5><% = Treatment.Classes.FieldNames.getFieldName("Board-LawsRegulations", "Laws Regulations") %></h5>
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

    <script>
        $('#confirm-delete').on('show.bs.modal', function (e) {
            $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
            $('.debug-url').html('Delete URL: <strong>' + $(this).find('.btn-ok').attr('href') + '</strong>');
        });
    </script>
</asp:Content>
