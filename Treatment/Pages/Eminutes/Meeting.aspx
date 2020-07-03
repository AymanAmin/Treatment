<%@ Page Title="" Language="C#" MasterPageFile="~/EminutesMaster.Master" AutoEventWireup="true" CodeBehind="Meeting.aspx.cs" Inherits="Treatment.Pages.Eminutes.Meeting" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("Meeting-Title", "Eminutes - Meetings") %></title>
     <script>
         setTimeout(function () { document.getElementById("header_page_name").innerHTML = "Meeting Name "; }, 1);
    </script>
      <script type="text/javascript">
          function Attendees(x) {
              var IsFound = 0;
              if (document.getElementById(x.id).checked) IsFound = 1;
              $.ajax({
                  url: "Meeting.aspx/Attendees",
                  type: "POST",
                  data: "{ Employee_Id:" + x.id + ", Attendess_Status:" + IsFound + "}",
                  contentType: "application/json; charset=utf-8",
                  dataType: "json",
                  success: function (resultData) {
                      // notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight', '  Save Status : ', '  The new Employee was Sucessfully saved in system ! ');
                      // window.location = window.location;
                  }
              });
          }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">

    <div class="row">
        <div class="col-xl-4 col-lg-12 push-xl-8 task-detail-right">

            <!-- Location -->
            <div class="col-md-12">
                <div class="card user-activity-card feed-card" >
                    <div class="card-header">
                        <div class="col-auto">
                                <asp:Literal runat="server" ID="LocationTitel"></asp:Literal>
                                <h5 class='card -header-text'><% = Treatment.Classes.FieldNames.getFieldName("Meeting-MeetingLocation", " Meeting Location ") %></h5>
                          </div>  
                        <div class="card-header-right">
                        <ul class="list-unstyled card-option">
                                <li><i class="feather full-card icon-maximize"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-block">
                        <div class="row m-b-25">
                              <div class='col-auto'>
                                <i class='feather icon-map-pin bg-simple-c-green feed-icon'></i>
                             </div>                         
                            <div class="col" runat="server" id="Location">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Locations -->

            <!-- Meeting Properties -->
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header" >
                        <asp:Literal runat="server" ID="MeetingInfTitel"></asp:Literal>
                        <h5 class='card -header-text'><% = Treatment.Classes.FieldNames.getFieldName("Meeting-MeetingProperties", " Meeting Properties") %></h5>
                        <div class="card-header-right">
                        <ul class="list-unstyled card-option">
                                <li><i class="feather full-card icon-maximize"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-block task-details" runat="server" id="MeetingInf">
                        
                        <table class='table table-border table-xs'>
                                <tbody>
                                    <tr>
                                        <td><i class='icofont icofont-users-social primary'></i><% = Treatment.Classes.FieldNames.getFieldName("Meeting-BoardName", " Board Name :") %></td> 
                                        <td class='text-right f-left'><label runat="server" id="BoardName" ></label></td>
                                    </tr>
                                    <tr>
                                        <td><i class="icofont icofont-underline primary"></i><% = Treatment.Classes.FieldNames.getFieldName("Meeting-EnglishName", " English Name :") %> </td>
                                        <td class='text-right f-left'><label  runat="server" id="EnglishName"></label></td>
                                    </tr>
                                    <tr>
                                        <td><i class='icofont icofont-underline primary'></i><% = Treatment.Classes.FieldNames.getFieldName("Meeting-ArabicName", " Arabic Name :") %></td>
                                        <td class='text-right f-left'><label  runat="server" id="ArabicName"></label></td>
                                    </tr>
                                    <tr>
                                        <td><i class='icofont icofont-calendar primary'></i> <% = Treatment.Classes.FieldNames.getFieldName("Meeting-MeetingDate", " Meeting Date :") %></td>
                                        <td class='text-right f-left'><label  runat="server" id="MeetingDateInfo"></label></td>
                                    </tr>
                                    <tr>
                                        <td><i class='icofont icofont-calendar primary'></i><% = Treatment.Classes.FieldNames.getFieldName("Meeting-TimeOfMeeting", " Time Of Meeting :") %></td>
                                        <td class='text-right f-left'><label  runat="server" id="TimeOfMeeting"></label></td>
                                    </tr>
                                    <tr>
                                        <td><i class='icofont icofont-label primary'></i><% = Treatment.Classes.FieldNames.getFieldName("Meeting-Status", " Status :") %></td>
                                        <td class='text-right f-left'><label  runat="server" id="Status"></label></td>
                                    </tr>
                               </tbody>
                            </table>
                    </div>
                  
                </div>
            </div>
            <!-- End Meeting Properties -->

            <!-- Meeting Members -->
            <div class="col-md-12">
                <div class="card table-card">
                    <div class="card-header">
                        <h5><% = Treatment.Classes.FieldNames.getFieldName("Meeting-MeetingMembers", "Meeting Members :") %></h5>
                        <div class="card-header-right">
                        <ul class="list-unstyled card-option">
                                <li><i class="feather full-card icon-maximize"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
                            </ul>
                        </div>
                      
                    </div>
                    <div class="card-block">
                        <div class="col" runat="server" id="MeetingMembers">
                          
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Meeting Members -->

        </div>

  

        <div class="col-xl-8 col-lg-12 pull-xl-4">
            <!--Subjects-->
                <div class='card'>
                    <div class='card-header'>
                        <h5><% = Treatment.Classes.FieldNames.getFieldName("Meeting-Subjects", " Subjects ") %></h5>
                        <div class='card-header-right' runat="server" id="AddTopic">
                        </div>
                    </div>
                <div class='card-block'>
                    <div class='table-responsive'>
                        <table id ='issue-list-table' class='table dt-responsive width-100'>
                         <thead class='text-left'>
                            <tr>
                                <th> <% = Treatment.Classes.FieldNames.getFieldName("Meeting-Extend", "Extend") %> </th>
                                <th> <% = Treatment.Classes.FieldNames.getFieldName("Meeting-SubjectTitle", "Subject Title") %> </th>
                                <th> <% = Treatment.Classes.FieldNames.getFieldName("Meeting-Status", "Status") %> </th>
                                <th> <% = Treatment.Classes.FieldNames.getFieldName("Meeting-Action", "Action") %> </th>
                                <th> <% = Treatment.Classes.FieldNames.getFieldName("Meeting-Description", "Description")%> </th>
                                <th> <% = Treatment.Classes.FieldNames.getFieldName("Meeting-Recommendation", "Recommendation") %> </th>
                                <th> <% = Treatment.Classes.FieldNames.getFieldName("Meeting-Recommendationdocument", "Recommendationdocument") %> </th>
                                <th> <% = Treatment.Classes.FieldNames.getFieldName("Meeting-Structure", "Structure") %></th>
                            </tr>
                        </thead>
                        <tbody class='text-left'>
                            <asp:Literal ID="Topics" runat="server"></asp:Literal>
                        </tbody>
                       </table>
                </div>
               </div>              
            </div>
            <!--End Subjects-->

            <!--Start Uploadedfiles-->
              <div class="col-md-12" runat="server" visible="false" id="AttachmentFile">
                <div class="card table-card">
                    <div class="card-header">
                         <h5><% = Treatment.Classes.FieldNames.getFieldName("ShowTreatment-Uploadedfiles", "Uploaded files") %></h5>
                        <div class="card-header-right">
                            <ul class="list-unstyled card-option">
                                <li><i class="feather full-card icon-maximize"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="row card-block" style="padding-right: 3%; padding-left: 3%;" id="downloadAttachment" runat="server">
                    </div>
              </div>
           </div>
            <!--End Uploadedfiles-->

          

            <!--Meeting Branch-->
            <div class="col-md-12"  runat="server" visible="false" id="ShowRecommendation">
                <div class="card ScrollStyle" style="overflow-x: hidden">
                      <div class="card-header">
                    <h5><% = Treatment.Classes.FieldNames.getFieldName("Meeting-ShowRecommendation", "Show Recommendation") %></h5>
                    <div class="card-header-right">
                        <ul class="list-unstyled card-option">
                                <li><i class="feather full-card icon-maximize"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
                            </ul>
                        </div>
                   </div>
                        <div class="card-block">
                           <div class="col-md-12" id="draggableMultiple">
                                <div class="col-lg-12 col-xl-12" id="trackVotes" runat="server">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <!--End Meeting Branch-->

           <!--start Recommendation-->
            <div class="col-md-12" runat="server" visible="false" id="AddRecommendation">
                <div class="card">
                    <div class="card-header">
                        <h5><% = Treatment.Classes.FieldNames.getFieldName("Meeting-Recommendation", "Recommendation") %></h5>
                          <div class="card-header-right">
                             <ul class="list-unstyled card-option">
                                <li><i class="feather full-card icon-maximize"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
                            </ul>
                        </div>
                    </div>

                    <div class="card-block">
                        <div class="row">
                            <div class="col-md-12">
                                <textarea rows="5" cols="5" class="form-control" runat="server" id="RecommendationValue"></textarea>
                            </div>
                        </div>
                        <div class="col-md-12" style="text-align:center">
                            <br />
                                 <asp:Button ID="Button1" class="btn btn-success waves-effect waves-light p-l-40 p-r-40"  runat="server" Text="Approve" OnClick="Button1_Click" />
                                 <asp:Button ID="Button3" runat="server" Text="Discreet" class="btn btn-warning  waves-effect waves-light p-l-40 p-r-40" OnClick="Button3_Click"/>
                                 <asp:Button ID="Button2" runat="server" Text="Not Approve" class="btn btn-danger waves-effect waves-light p-l-40 p-r-40" OnClick="Button2_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
                <!--End Recommendation-->


            
                     <!--start Approval Recommendation-->
               <div class="col-md-12" runat="server" visible="false" id="ApprovalRecommendation">
                <div class="card">
                    <div class="card-header">
                        <h5><% = Treatment.Classes.FieldNames.getFieldName("Meeting-Approval Recommendation", "Approval Recommendation") %></h5>
                          <div class="card-header-right">
                             <ul class="list-unstyled card-option">
                                <li><i class="feather full-card icon-maximize"></i></li>
                                <li><i class="feather icon-minus minimize-card"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-block">
                        <div class="row">
                            <div class="col-md-12">
                                <textarea rows="5" cols="5" class="form-control" runat="server" id="ApprovalR"></textarea>
                            </div>
                        </div>
                        <div class="col-md-12" style="text-align:center">
                            <br />
                                 <asp:Button ID="Approval" class="btn btn-success waves-effect waves-light p-l-40 p-r-40"  runat="server" Text="Approvel" OnClick="Approval_Click"  />
                                 <asp:Button ID="NotApproval" runat="server" Text="Not Approvel" class="btn btn-danger waves-effect waves-light p-l-40 p-r-40" OnClick="NotApproval_Click"/>
                            </div>
                            
                        </div>
                   </div>
                  </div>
                <!--End Approval Recommendation-->
            </div>
          </div>
</asp:Content>
