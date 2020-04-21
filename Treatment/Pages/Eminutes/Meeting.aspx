<%@ Page Title="" Language="C#" MasterPageFile="~/EminutesMaster.Master" AutoEventWireup="true" CodeBehind="Meeting.aspx.cs" Inherits="Treatment.Pages.Eminutes.Meeting" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("Meeting-Title", "Eminutes - Meetings") %></title>
     <script>
         setTimeout(function () { document.getElementById("header_page_name").innerHTML = "Meeting Name "; }, 1);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_PlaceHolder" runat="server">

    <div class="row">
        <div class="col-xl-4 col-lg-12 push-xl-8 task-detail-right">

            <!-- Location -->
            <div class="col-md-12">
                <div class="card user-activity-card feed-card">
                    <div class="card-header">
                        <h5>Meeting Location</h5>
                    </div>
                    <div class="card-block">
                        <div class="row m-b-25">
                            <div class="col-auto p-r-0">
                                <i class="feather icon-map-pin bg-simple-c-green feed-icon"></i>
                            </div>
                            <div class="col">
                                <h6 class="m-b-5">Saudi Araiba , Riyadh</h6>
                                <p class="text-muted m-b-0">Alnamuzajea branch, floor two, quality department.</p>
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
                    <div class="card-header">
                        <h5 class="card-header-text"><i class="icofont icofont-ui-note m-r-10"></i>Meeting Properties</h5>
                    </div>
                    <div class="card-block task-details">
                        <table class="table table-border table-xs">
                            <tbody>
                                <tr>
                                    <td><i class="icofont icofont-contrast"></i>English Name:</td>
                                    <td class="text-right f-left"><span class="f-right"><a href="#">Meeting Name</a></span></td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-meeting-add"></i>Arabic Name:</td>
                                    <td class="text-right f-left">اسم الاجتماع</td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-id-card"></i>Meeting Date:</td>
                                    <td class="text-right f-left">25 Feb, 2015</td>
                                </tr>
                                <tr>
                                    <td><i class="icofont icofont-spinner-alt-5"></i>Status:</td>
                                    <td class="text-right f-left">New</td>
                                </tr>
                            </tbody>
                        </table>
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
                        <h5>Meeting Members :</h5>
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
                        <div class="col">
                            <p class="text-muted m-b-10">SuperVisor</p>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <tr>
                                        <td class="b-none">
                                            <a href="#!" class="align-middle">
                                                <img src="..\..\..\Theme\files\assets\images\avatar-2.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                <div class="d-inline-block">
                                                    <h6>Jeny William</h6>
                                                    <p class="text-muted m-b-0">Graphic Designer</p>
                                                </div>
                                            </a>

                                        </td>
                                        <td style="border: 0px">
                                            <input type="checkbox" class="js-small f-right" checked="" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <p class="text-muted m-b-10">Secretarial</p>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <tr>
                                        <td class="b-none">
                                            <a href="#!" class="align-middle">
                                                <img src="..\..\..\Theme\files\assets\images\avatar-2.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                <div class="d-inline-block">
                                                    <h6>Jeny William</h6>
                                                    <p class="text-muted m-b-0">Graphic Designer</p>
                                                </div>
                                            </a>
                                        </td>
                                        <td style="border: 0px">
                                            <input type="checkbox" class="js-small f-right" checked="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="b-none">
                                            <a href="#!" class="align-middle">
                                                <img src="..\..\..\Theme\files\assets\images\avatar-1.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                <div class="d-inline-block">
                                                    <h6>John Deo</h6>
                                                    <p class="text-muted m-b-0">Web Designer</p>
                                                </div>
                                            </a>
                                        </td>
                                        <td style="border: 0px">
                                            <input type="checkbox" class="js-small f-right" checked="" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <p class="text-muted m-b-10">Members</p>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <tr>
                                        <td class="b-none">
                                            <a href="#!" class="align-middle">
                                                <img src="..\..\..\Theme\files\assets\images\avatar-2.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                <div class="d-inline-block">
                                                    <h6>Jeny William</h6>
                                                    <p class="text-muted m-b-0">Graphic Designer</p>
                                                </div>
                                            </a>
                                        </td>
                                        <td style="border: 0px">
                                            <input type="checkbox" class="js-small f-right" checked="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="b-none">
                                            <a href="#!" class="align-middle">
                                                <img src="..\..\..\Theme\files\assets\images\avatar-1.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                <div class="d-inline-block">
                                                    <h6>John Deo</h6>
                                                    <p class="text-muted m-b-0">Web Designer</p>
                                                </div>
                                            </a>
                                        </td>
                                        <td style="border: 0px">
                                            <input type="checkbox" class="js-small f-right" checked="" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="col-md-12 text-right">
                            <button type="button" class="btn btn-primary waves-effect waves-light p-l-40 p-r-40">Save</button>
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
                        <h5>Subjects</h5>
                        <div class="card-header-right">
                            <i class="icofont icofont-spinner-alt-5"></i>
                        </div>
                    </div>
                    <div class="card-block">
                        <div class="table-responsive">
                            <table id="issue-list-table" class="table dt-responsive width-100">
                                <thead class="text-left">
                                    <tr>
                                        <th>Extend</th>
                                        <th>ID</th>
                                        <th>Subject Title</th>
                                        <th>DateTime</th>
                                        <th>Status</th>
                                        <th>Description</th>
                                        <th>Recommendation</th>
                                        <th>Recommendation document</th>
                                        <th>The RelevantJurisdictio</th>
                                    </tr>
                                </thead>
                                <tbody class="text-left">
                                    <tr>
                                        <td class="txt-primary">Extend</td>
                                        <td>PI:198756541080</td>
                                        <td>Establish a system E-minutes</td>
                                        <td>2020/5/10</td>
                                        <td><span class="label label-danger">Close</span></td>
                                        <td>Systems development is systematic process which includes phases such as planning
                                            <br />
                                            , analysis, design, deployment, and maintenance.</td>
                                        <td>System analysis is conducted for the purpose of studying a system or its parts
                                            <br />
                                            in order to identify its objectives.</td>
                                        <td>The word System is derived from Greek word Systema, which means an organized 
                                            <br />
                                            relationship between any set of components to achieve some common cause or objective.</td>
                                        <td>For example, traffic management system</td>
                                    </tr>
                                    <tr>
                                        <td class="txt-primary">Extend</td>
                                        <td>PI:198756541080</td>
                                        <td>Establish a system E-minutes</td>
                                        <td>2020/5/10</td>
                                        <td><span class="label label-primary">Open</span></td>
                                        <td>Systems development is systematic process which includes phases such as planning
                                            <br />
                                            , analysis, design, deployment, and maintenance.</td>
                                        <td>System analysis is conducted for the purpose of studying a system or its parts
                                            <br />
                                            in order to identify its objectives.</td>
                                        <td>The word System is derived from Greek word Systema, which means an organized 
                                            <br />
                                            relationship between any set of components to achieve some common cause or objective.</td>
                                        <td>For example, traffic management system</td>
                                    </tr>
                                    <tr>
                                        <td class="txt-primary">Extend</td>
                                        <td>PI:198756541080</td>
                                        <td>Establish a system E-minutes</td>
                                        <td>2020/5/10</td>
                                        <td><span class="label label-danger">Close</span></td>
                                        <td>Systems development is systematic process which includes phases such as planning
                                            <br />
                                            , analysis, design, deployment, and maintenance.</td>
                                        <td>System analysis is conducted for the purpose of studying a system or its parts
                                            <br />
                                            in order to identify its objectives.</td>
                                        <td>The word System is derived from Greek word Systema, which means an organized 
                                            <br />
                                            relationship between any set of components to achieve some common cause or objective.</td>
                                        <td>For example, traffic management system</td>
                                    </tr>
                                    <tr>
                                        <td class="txt-primary">Extend</td>
                                        <td>PI:198756541080</td>
                                        <td>Establish a system E-minutes</td>
                                        <td>2020/5/10</td>
                                        <td><span class="label label-primary">Open</span></td>
                                        <td>Systems development is systematic process which includes phases such as planning
                                            <br />
                                            , analysis, design, deployment, and maintenance.</td>
                                        <td>System analysis is conducted for the purpose of studying a system or its parts
                                            <br />
                                            in order to identify its objectives.</td>
                                        <td>The word System is derived from Greek word Systema, which means an organized 
                                            <br />
                                            relationship between any set of components to achieve some common cause or objective.</td>
                                        <td>For example, traffic management system</td>
                                    </tr>
                                    <tr>
                                        <td class="txt-primary">Extend</td>
                                        <td>PI:198756541080</td>
                                        <td>Establish a system E-minutes</td>
                                        <td>2020/5/10</td>
                                        <td><span class="label label-danger">Close</span></td>
                                        <td>Systems development is systematic process which includes phases such as planning
                                            <br />
                                            , analysis, design, deployment, and maintenance.</td>
                                        <td>System analysis is conducted for the purpose of studying a system or its parts
                                            <br />
                                            in order to identify its objectives.</td>
                                        <td>The word System is derived from Greek word Systema, which means an organized 
                                            <br />
                                            relationship between any set of components to achieve some common cause or objective.</td>
                                        <td>For example, traffic management system</td>
                                    </tr>
                                    <tr>
                                        <td class="txt-primary">Extend</td>
                                        <td>PI:198756541080</td>
                                        <td>Establish a system E-minutes</td>
                                        <td>2020/5/10</td>
                                        <td><span class="label label-danger">Close</span></td>
                                        <td>Systems development is systematic process which includes phases such as planning
                                            <br />
                                            , analysis, design, deployment, and maintenance.</td>
                                        <td>System analysis is conducted for the purpose of studying a system or its parts
                                            <br />
                                            in order to identify its objectives.</td>
                                        <td>The word System is derived from Greek word Systema, which means an organized 
                                            <br />
                                            relationship between any set of components to achieve some common cause or objective.</td>
                                        <td>For example, traffic management system</td>
                                    </tr>
                                    <tr>
                                        <td class="txt-primary">Extend</td>
                                        <td>PI:198756541080</td>
                                        <td>Establish a system E-minutes</td>
                                        <td>2020/5/10</td>
                                        <td><span class="label label-danger">Close</span></td>
                                        <td>Systems development is systematic process which includes phases such as planning
                                            <br />
                                            , analysis, design, deployment, and maintenance.</td>
                                        <td>System analysis is conducted for the purpose of studying a system or its parts
                                            <br />
                                            in order to identify its objectives.</td>
                                        <td>The word System is derived from Greek word Systema, which means an organized 
                                            <br />
                                            relationship between any set of components to achieve some common cause or objective.</td>
                                        <td>For example, traffic management system</td>
                                    </tr>
                                    <tr>
                                        <td class="txt-primary">Extend</td>
                                        <td>PI:198756541080</td>
                                        <td>Establish a system E-minutes</td>
                                        <td>2020/5/10</td>
                                        <td><span class="label label-primary">Open</span></td>
                                        <td>Systems development is systematic process which includes phases such as planning
                                            <br />
                                            , analysis, design, deployment, and maintenance.</td>
                                        <td>System analysis is conducted for the purpose of studying a system or its parts
                                            <br />
                                            in order to identify its objectives.</td>
                                        <td>The word System is derived from Greek word Systema, which means an organized 
                                            <br />
                                            relationship between any set of components to achieve some common cause or objective.</td>
                                        <td>For example, traffic management system</td>
                                    </tr>
                                    <tr>
                                        <td class="txt-primary">Extend</td>
                                        <td>PI:198756541080</td>
                                        <td>Establish a system E-minutes</td>
                                        <td>2020/5/10</td>
                                        <td><span class="label label-danger">Close</span></td>
                                        <td>Systems development is systematic process which includes phases such as planning
                                            <br />
                                            , analysis, design, deployment, and maintenance.</td>
                                        <td>System analysis is conducted for the purpose of studying a system or its parts
                                            <br />
                                            in order to identify its objectives.</td>
                                        <td>The word System is derived from Greek word Systema, which means an organized 
                                            <br />
                                            relationship between any set of components to achieve some common cause or objective.</td>
                                        <td>For example, traffic management system</td>
                                    </tr>
                                    <tr>
                                        <td class="txt-primary">Extend</td>
                                        <td>PI:198756541080</td>
                                        <td>Establish a system E-minutes</td>
                                        <td>2020/5/10</td>
                                        <td><span class="label label-danger">Close</span></td>
                                        <td>Systems development is systematic process which includes phases such as planning
                                            <br />
                                            , analysis, design, deployment, and maintenance.</td>
                                        <td>System analysis is conducted for the purpose of studying a system or its parts
                                            <br />
                                            in order to identify its objectives.</td>
                                        <td>The word System is derived from Greek word Systema, which means an organized 
                                            <br />
                                            relationship between any set of components to achieve some common cause or objective.</td>
                                        <td>For example, traffic management system</td>
                                    </tr>
                                    <tr>
                                        <td class="txt-primary">Extend</td>
                                        <td>PI:198756541080</td>
                                        <td>Establish a system E-minutes</td>
                                        <td>2020/5/10</td>
                                        <td><span class="label label-danger">Close</span></td>
                                        <td>Systems development is systematic process which includes phases such as planning
                                            <br />
                                            , analysis, design, deployment, and maintenance.</td>
                                        <td>System analysis is conducted for the purpose of studying a system or its parts
                                            <br />
                                            in order to identify its objectives.</td>
                                        <td>The word System is derived from Greek word Systema, which means an organized 
                                            <br />
                                            relationship between any set of components to achieve some common cause or objective.</td>
                                        <td>For example, traffic management system</td>
                                    </tr>
                                    <tr>
                                        <td class="txt-primary">Extend</td>
                                        <td>PI:198756541080</td>
                                        <td>Establish a system E-minutes</td>
                                        <td>2020/5/10</td>
                                        <td><span class="label label-danger">Close</span></td>
                                        <td>Systems development is systematic process which includes phases such as planning
                                            <br />
                                            , analysis, design, deployment, and maintenance.</td>
                                        <td>System analysis is conducted for the purpose of studying a system or its parts
                                            <br />
                                            in order to identify its objectives.</td>
                                        <td>The word System is derived from Greek word Systema, which means an organized 
                                            <br />
                                            relationship between any set of components to achieve some common cause or objective.</td>
                                        <td>For example, traffic management system</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- end of table -->
                    </div>
                </div>
            </div>
            <!--End Subjects-->

            <!--Meeting Branch-->
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5>Votes</h5>
                        <div class="card-header-right">
                            <i class="icofont icofont-spinner-alt-5"></i>
                        </div>
                    </div>
                    <div class="card-block">
                        <div class="row">
                            <div class="col-md-12">
                                <textarea rows="5" cols="5" class="form-control" placeholder="What do you think..."></textarea>
                            </div>
                        </div>
                        <div class="col-md-12" style="text-align:center">
                            <br />
                                <button type="button" class="btn btn-success waves-effect waves-light p-l-40 p-r-40">Approve</button>
                                <button type="button" class="btn btn-danger waves-effect waves-light p-l-40 p-r-40">Not Approve</button>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
            
            <!--End Meeting Branch-->

        </div>

</asp:Content>
