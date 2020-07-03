<%@ Page Title="" Language="C#" MasterPageFile="~/EminutesMaster.Master" AutoEventWireup="true" CodeBehind="ScheduleOfWork.aspx.cs" Inherits="Treatment.Pages.Eminutes.ScheduleOfWork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("ScheduleOfWork-Title", "Eminutes - Schedule of Work") %></title>
    <script>

        function loadData(data,Default_Date) {
            setTimeout(function () {
                //alert(Default_Date);
                /* $('#external-events .fc-event').each(function () {

                // store data so the calendar knows to render an event upon drop
                $(this).data('event', {
                    title: $.trim($(this).text()), // use the element's text as the event title
                    stick: true // maintain when user navigates (see docs on the renderEvent method)
                });

                // make the event draggable using jQuery UI
                $(this).draggable({
                    zIndex: 999,
                    revert: true, // will cause the event to go back to its
                    revertDuration: 0 //  original position after the drag
                });

            });*/

                /*{
                    title: 'Test Event',
                    start: '2016-09-03T13:00:00',
                    constraint: 'businessHours',
                    borderColor: '#FC6180',
                    backgroundColor: '#FC6180',
                    textColor: '#fff'
                }, {
                    title: 'Meeting',
                    start: '2016-09-13T11:00:00',
                    constraint: 'availableForMeeting',
                    editable: true,
                    borderColor: '#4680ff',
                    backgroundColor: '#4680ff',
                    textColor: '#fff'
                }, {
                    title: 'Conference',
                    start: '2016-09-18',
                    end: '2016-09-20',
                    borderColor: '#93BE52',
                    backgroundColor: '#93BE52',
                    textColor: '#fff'
                }, {
                    title: 'Party',
                    start: '2016-09-29T20:00:00',
                    borderColor: '#FFB64D',
                    backgroundColor: '#FFB64D',
                    textColor: '#fff'
                },*/
            $('#calendar').fullCalendar({
                header: {
                    left: '<% = Treatment.Classes.FieldNames.getFieldName("ScheduleOfWork-prev", "prev") %>,<% = Treatment.Classes.FieldNames.getFieldName("ScheduleOfWork-next", "next") %> <% = Treatment.Classes.FieldNames.getFieldName("ScheduleOfWork-today", "today") %>',
                    center: '<% = Treatment.Classes.FieldNames.getFieldName("ScheduleOfWork-C-title", "C-title") %>',
                    right: '<% = Treatment.Classes.FieldNames.getFieldName("ScheduleOfWork-month", "month") %>,<% = Treatment.Classes.FieldNames.getFieldName("ScheduleOfWork-agendaWeek", "agendaWeek") %>,<% = Treatment.Classes.FieldNames.getFieldName("ScheduleOfWork-agendaDay", "agendaDay") %>,<% = Treatment.Classes.FieldNames.getFieldName("ScheduleOfWork-listMonth", "listMonth") %>'
                },
                defaultDate: Default_Date,
                navLinks: true, // can click day/week names to navigate views
                businessHours: true, // display business hours
                editable: true,
                droppable: true, // this allows things to be dropped onto the calendar
                drop: function () {

                    // is the "remove after drop" checkbox checked?
                    if ($('#checkbox2').is(':checked')) {
                        // if so, remove the element from the "Draggable Events" list
                        $(this).remove();
                    }
                },
                events: data

                    // areas where "Meeting" must be dropped
                    
                
            });
            }, 1000);
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="page-wrapper full-calender" onload="loadData()  ">
        <!-- Page-header end -->
        <div class="page-body">
            <div class="card" style="overflow-y: auto; overflow-x: hidden">
                <div class="card-header">
                    <h5><% = Treatment.Classes.FieldNames.getFieldName("ScheduleOfWork-FullCalender", "Full Calender") %></h5>
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
                        <h4 class="f-w-600 m-t-25"><% = Treatment.Classes.FieldNames.getFieldName("ScheduleOfWork-Notsupported", "Not supported") %></h4>
                        <p class="text-muted"><% = Treatment.Classes.FieldNames.getFieldName("ScheduleOfWork-FullCalendernotsupportedinthisdevice", "Full Calender not supported in this device") %></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
