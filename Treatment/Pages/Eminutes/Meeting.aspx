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
                  data: "{ Employee_Id:" + x.id + ", Attendess_Status:"+IsFound+"}",
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
                    <div class="card-header" runat="server" id="LocationTitel">
                    </div>
                    <div class="card-block">
                        <div class="row m-b-25">
                            <div class="col-auto p-r-0">
                                <i class="feather icon-map-pin bg-simple-c-green feed-icon"></i>
                            </div>
                            <div class="col" runat="server" id="Location">
                                
                                <!--<p class="text-muted m-b-0"><i class="feather icon-clock m-r-10"></i>2 min ago</p>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Locations -->

            <!-- Meeting Properties -->
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header" runat="server" id="MeetingInfTitel">
                        
                    </div>
                    <div class="card-block task-details" runat="server" id="MeetingInf">
                        
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
            <!-- End Meeting Properties -->

            <!-- Meeting Members -->
            <div class="col-md-12">
                <div class="card table-card">
                    <div class="card-header">
                        <h5><% = Treatment.Classes.FieldNames.getFieldName("Meeting-MeetingMembers", "Meeting Members :") %></h5>
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
                        <div class="col" runat="server" id="MeetingMembers">
                          
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Meeting Members -->

        </div>

        <div class="col-xl-8 col-lg-12 pull-xl-4">
            <!--Subjects-->
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5><% = Treatment.Classes.FieldNames.getFieldName("Meeting-Subjects", "Subjects") %></h5>
                        <div class="card-header-right">
                            <i class="icofont icofont-spinner-alt-5"></i>
                        </div>
                    </div>
                    <div class="card-block">
                        <div class="table-responsive" runat="server" id="Topics">
                         
                        </div>
                        <!-- end of table -->
                    </div>
                </div>
            </div>
            <!--End Subjects-->

            <!--Meeting Branch-->
            <div class="col-md-12" >
                <div class="card">
                    <div class="card-header">
                        <h5><% = Treatment.Classes.FieldNames.getFieldName("Meeting-ShowRecommendation", "Show Recommendation") %></h5>
                        <div class="card-header-right">
                            <i class="icofont icofont-spinner-alt-5"></i>
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

            <!--Meeting Branch-->
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5><% = Treatment.Classes.FieldNames.getFieldName("Meeting-Recommendation", "Recommendation") %></h5>
                        <div class="card-header-right">
                            <i class="icofont icofont-spinner-alt-5"></i>
                        </div>
                    </div>
                    <div class="card-block">
                        <div class="row">
                            <div class="col-md-12">
                                <textarea rows="5" cols="5" class="form-control" placeholder="What do you think..." runat="server" id="RecommendationValue"></textarea>
                            </div>
                        </div>
                        <div class="col-md-12" style="text-align:center">
                            <br />
                                 <asp:Button ID="Button1" class="btn btn-success waves-effect waves-light p-l-40 p-r-40"  runat="server" Text="Approve" OnClick="Button1_Click" />
                                 <asp:Button ID="Button2" runat="server" Text="Not Approve" class="btn btn-danger waves-effect waves-light p-l-40 p-r-40" OnClick="Button2_Click"/>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
            
            <!--End Meeting Branch-->
            </div>
</asp:Content>
