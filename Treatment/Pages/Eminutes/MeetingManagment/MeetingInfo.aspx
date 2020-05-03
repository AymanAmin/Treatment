<%@ Page Title="" Language="C#" MasterPageFile="~/EminutesMaster.Master" AutoEventWireup="true" CodeBehind="MeetingInfo.aspx.cs" Inherits="Treatment.Pages.Eminutes.MeetingManagment.MeetingInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("MeetingInfo-Title", "Meeting Screen") %></title>
      <!-- ckeditor.css-->
    <link rel="stylesheet" href="~\Theme\files\bower_components\ckeditor\samples\css\samples.css" />
    <link rel="stylesheet" href="~\Theme\files\bower_components\ckeditor\samples\toolbarconfigurator\lib\codemirror\neo.css" />
     <!-- Date-time picker css -->
    <link rel="stylesheet" type="text/css" href="~\Theme\files\assets\pages\advance-elements\css\bootstrap-datetimepicker.css"/>
    <!-- Date-range picker css  -->
    <link rel="stylesheet" type="text/css" href="~\Theme\files\bower_components\bootstrap-daterangepicker\css\daterangepicker.css"/>
    <!-- Date-Dropper css -->
    <link rel="stylesheet" type="text/css" href="~\Theme\files\bower_components\datedropper\css\datedropper.min.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_PlaceHolder" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <!-- Basic Form Inputs card start -->
            <div class="card">
                <div class="card-header">
                    <!--<h5>Basic Form Inputs</h5>
                    <span>Here you can create or update information about Meeting</span>-->

                    <div class="card-header-right">
                        <i class="icofont icofont-spinner-alt-5"></i>
                    </div>
                </div>
                <div class="card-block">
                    <div class="row">
                        <h4 class="sub-title"><% = Treatment.Classes.FieldNames.getFieldName("MeetingInfo-MeetingInfo", "Meeting Informtion") %></h4>
                        <div class="col-sm-12">
                            <asp:Literal ID="LtrMessage" runat="server"></asp:Literal>
                        </div>
                        <div class="col-sm-6 mobile-inputs">
                             <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("MeetingInfo-CreateDate", "Create Date") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-calendar primary"></i></span>
                                     <asp:TextBox ID="CDate" runat="server" class="form-control form-txt-primary " placeholder="" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                         
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("MeetingInfo-EnglishName", "English Name") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-underline primary"></i></span>
                                    <asp:TextBox ID="EnglishName" runat="server" class="form-control form-txt-primary " placeholder=""></asp:TextBox>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9">
                                    <asp:RequiredFieldValidator ID="RFVtxtEnglishName" runat="server" ErrorMessage="Please enter English Name" style="color:red" ControlToValidate="EnglishName" ValidationGroup="Meeting" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                             <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("MeetingInfo-MeetingTime", "Meeting Time") %></label>
                                <div class="col-sm-9 input-group">
                                <div class='input-group date' id='datetimepicker3'>
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-ui-calendar primary"></i></span>
                                     <asp:TextBox ID="timepicker" runat="server" class="form-control form-txt-primary " placeholder=""></asp:TextBox>
                                </div>
                            </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter Meeting Time" style="color:red" ControlToValidate="timepicker" ValidationGroup="Meeting" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                          
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("MeetingInfo-MeetingStatus", "Meeting Status") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-label primary"></i></span>
                                    <asp:DropDownList ID="MeetingStatus" runat="server" class="form-control form-txt-primary " DataSourceID="MeetingStatusDataSource" DataTextField="Meeting_Status__Name_En" DataValueField="Meeting_Status_Id"></asp:DropDownList>
                                    <asp:EntityDataSource ID="MeetingStatusDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableFlattening="False" EntitySetName="M_Meeting_Status">
                                    </asp:EntityDataSource>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9">
                                    <asp:RequiredFieldValidator ID="RFVtxtStatusofMeeting" runat="server" ErrorMessage="Please select status" style="color:red" ControlToValidate="MeetingStatus" ValidationGroup="Meeting" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                        </div>
                        <div class="col-sm-6 mobile-inputs">
                                <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("MeetingInfo-BoardName", "Board Name") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-underline primary"></i></span>
                                    <asp:TextBox ID="BoardName" runat="server" class="form-control form-txt-primary " placeholder="" readonly="true"></asp:TextBox>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter Board Name" style="color:red" ControlToValidate="BoardName" ValidationGroup="Meeting" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                               <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("MeetingInfo-ArabicName", "Arabic Name") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-underline primary"></i></span>
                                    <asp:TextBox ID="ArabicName" runat="server" class="form-control form-txt-primary " placeholder=""></asp:TextBox>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9">
                                    <asp:RequiredFieldValidator ID="RFVtxtArabicName" runat="server" ErrorMessage="Please enter arabic name" style="color:red" ControlToValidate="ArabicName" ValidationGroup="Meeting" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                         
                             <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("MeetingInfo-MeetingDate", "Meeting Date") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-calendar primary"></i></span>
                                    <input id="MeetingDate" type="date" runat="server" class="form-control form-txt-primary "/>
                                </div>
                                      <div class="col-sm-3"></div>
                                <div class="col-sm-9">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter Meeting Date" style="color:red" ControlToValidate="MeetingDate" ValidationGroup="Meeting" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("MeetingInfo-MeetingLocation", "Meeting Location") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-location-pin primary"></i></span>
                                    <asp:DropDownList ID="MeetingLocation" runat="server" class="form-control form-txt-primary " ></asp:DropDownList>
                                    <asp:EntityDataSource ID="LocationDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableFlattening="False" EntitySetName="M_Board_Location">
                                    </asp:EntityDataSource>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9">
                                    <asp:RequiredFieldValidator ID="RFVtxtClassification" runat="server" ErrorMessage="Please select classification" style="color:red" ControlToValidate="MeetingLocation" ValidationGroup="Meeting" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                       </div>

                           <div class="row">
                               <div class="form-group col-sm-16">
                                <label><% = Treatment.Classes.FieldNames.getFieldName("MeetingInfo-MeetingMinutes", "Meeting Minutes") %></label>
                                 <div class="input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-clip-board primary"></i></span>
                                    <asp:TextBox ID="Minutes" runat="server" TextMode="MultiLine" Rows="3" class="form-control"></asp:TextBox>
                                </div>
                               </div>
                            </div>

                        <!-- button save , Update , Delete -->
                        <div class="col-sm-12 mobile-inputs" style="text-align: center">
                            <asp:Button ID="Save" runat="server" Text="Save" class="btn btn-success btn-round col-sm-1"  ValidationGroup="Meeting" OnClick="Save_Click" />
                            <asp:Button ID="Cancel" runat="server" Text="Cancel" class="btn btn-warning btn-round col-sm-1" />
                        </div>
                    </div>
                </div>

            </div>

            <!-- Basic Form Inputs card end -->
        </div>
<!-- ckeditor.css-->
    <script src="..\..\..\..\Theme\files\bower_components\ckeditor\ckeditor.js"></script>
    <script src="..\..\..\..\Theme\files\bower_components\ckeditor\samples\js\sample.js"></script>

    
</asp:Content>

