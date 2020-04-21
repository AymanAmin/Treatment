<%@ Page Title="" Language="C#" MasterPageFile="~/EminutesMaster.Master" AutoEventWireup="true" CodeBehind="ScheduleOfWork.aspx.cs" Inherits="Treatment.Pages.Eminutes.ScheduleOfWork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">   
    <title><% = Treatment.Classes.FieldNames.getFieldName("ScheduleOfWork-Title", "Eminutes - Schedule of Work") %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_PlaceHolder" runat="server">
    <div class="page-wrapper full-calender">
        <!-- Page-header end -->
        <div class="page-body">
            <div class="card" style="overflow-y:auto;overflow-x:hidden">
                <div class="card-header">
                    <h5>Full Calender</h5>
                    <div class="card-header-right">
                        <ul class="list-unstyled card-option">
                            <li><i class="feather icon-maximize full-card"></i></li>
                            <li><i class="feather icon-minus minimize-card"></i></li>
                        </ul>
                    </div>
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-md-12">
                            <div id='calendar'></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-error">
            <div class="card text-center">
                <div class="card-block">
                    <div class="m-t-10">
                        <i class="icofont icofont-warning text-white bg-c-yellow"></i>
                        <h4 class="f-w-600 m-t-25">Not supported</h4>
                        <p class="text-muted m-b-0">Full Calender not supported in this device</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
