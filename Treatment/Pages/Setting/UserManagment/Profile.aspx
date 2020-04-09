<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Treatment.Pages.Setting.UserManagment.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Profile</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">

    <div class="page-body">
        <!-- Article Editor card start -->
        <div class="card" runat="server">
            <div class="card-header">
                <div class="card-header-right">
                    <ul class="list-unstyled card-option">
                        <li><i class="feather icon-maximize full-card"></i></li>
                    </ul>
                </div>
            </div>
            <div class="card-block">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="cover-profile">
                            <div class="profile-bg-img">
                                <img class="profile-bg-img img-fluid"  src="..\..\..\..\Theme\files\assets\images\user-profile\bg-img1.jpg" alt="bg-img">
                                <div class="card-block user-info">
                                    <div class="col-md-12">
                                        <div class="media-left"  style="max-width:165px;">
                                             <div class="img-hover">
                                                <asp:Image ID="Emp_Profile1" class="img-fluid img-radius"  runat="server"   alt="Profile.jpg"  ImageUrl="~/media/Profile/Profile.jpg"  />
                                                <div class="img-overlay img-radius">
                                                    <span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="media-body row">
                                            <div class="col-lg-12">
                                                <div class="user-title">
                                                    <h2><label id="Name" runat="server" ></label></h2>
                                                    <span class="text-white"><label id="Position" runat="server" ></label></span>
                                                </div>
                                            </div>
                                            <div>
                                                <div class="pull-right cover-btn">
                                                    <a class="btn btn-primary btn-outline-primary btn-icon"><i class="icofont icofont-plus text-info h5"></i></a>
                                                    <a class="btn btn-danger btn-outline-danger btn-icon"><i class="icofont icofont-ui-messaging text-danger h5"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--profile cover end-->
                <div class="row">
                    <div class="col-lg-12">
                        <!-- tab header start -->
                        <div class="tab-header card">
                            <ul class="nav nav-tabs md-tabs tab-timeline" role="tablist" id="mytab">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#personal" role="tab">Personal Info</a>
                                    <div class="slide"></div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#changePassWord" role="tab">change PassWord</a>
                                    <div class="slide"></div>
                                </li>
                               
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- tab header end -->
                <!-- tab header end -->
                <!-- tab content start -->
                <div class="tab-content">
                    <!-- tab panel personal start -->
                    <div class="tab-pane active" id="personal" role="tabpanel">
                        <!-- personal card start -->
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-header-text">About Me</h5>
                                <button id="edit-btn" type="button" class="btn btn-sm btn-primary waves-effect waves-light f-right">
                                    <i class="icofont icofont-edit"></i>
                                </button>
                            </div>
                            <div class="card-block">
                                <div class="view-info">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="general-info">
                                                <div class="row">
                                                    <div class="col-lg-12 col-xl-6">
                                                        <div class="table-responsive">
                                                            <table class="table m-0">
                                                                <tbody>
                                                                    <tr>
                                                                        <th scope="row">Arabic Name</th>
                                                                        <td><label runat="server" id="ArabicName"> </label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th scope="row">Email</th>
                                                                        <td><label runat="server" id="Email"> </label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th scope="row">Structure</th>
                                                                        <td><label runat="server" id="Structure"> </label></td>
                                                                    </tr>
                                                                     <tr>
                                                                        <th scope="row">Language</th>
                                                                        <td><label runat="server" id="EmpLanguage"> </label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th scope="row">Active</th>
                                                                        <td><label runat="server" id="ActiveL"> </label></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <!-- end of table col-lg-6 -->
                                                    <div class="col-lg-12 col-xl-6">
                                                        <div class="table-responsive">
                                                            <table class="table">
                                                                <tbody>
                                                                    <tr>
                                                                        <th scope="row">English Name</th>
                                                                        <td><label runat="server" id="EnglishName"> </label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th scope="row">Phone</th>
                                                                        <td><label runat="server" id="Phone"> </label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th scope="row">Group</th>
                                                                        <td><label runat="server" id="Group"> </label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th scope="row">Type oF Calendar</th>
                                                                        <td><label runat="server" id="CalendarType"> </label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th scope="row"></th>
                                                                        <td></td>
                                                                    </tr>

                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <!-- end of table col-lg-6 -->
                                                </div>
                                                <!-- end of row -->
                                            </div>
                                            <!-- end of general info -->
                                        </div>
                                        <!-- end of col-lg-12 -->
                                    </div>
                                    <!-- end of row -->
                                </div>
                                <!-- end of view-info -->
                                <div class="edit-info">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="general-info">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <table class="table">
                                                            <tbody>
                                                               
                                                                <tr>
                                                                    <td>
                                                                        <label class="j-label">Email</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="icofont icofont-email"></i></span>
                                                                            <asp:TextBox ID="Employee_Email" runat="server" class="form-control" placeholder="Enter Employee Email" TextMode="SingleLine"></asp:TextBox>
                                                                        </div>
                                                                        <div class="col-sm-12">
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Email" ValidationGroup="Per" ControlToValidate="Employee_Email" Display="Dynamic" SetFocusOnError="True">
                                                                            </asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                      <label>Language</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="icofont icofont-chart-flow-alt-1"></i></span>
                                                                             <asp:DropDownList ID="Language" runat="server" class="form-control" DataSourceID="LangDataSource" DataTextField="Language_Name" DataValueField="ID"  ></asp:DropDownList>
                                                                            <asp:EntityDataSource ID="LangDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableFlattening="False" EntitySetName="LanguageMasters" EntityTypeFilter="LanguageMaster">
                                                                            </asp:EntityDataSource>
                                                                        </div>
                                                                         <div class="col-sm-12">
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Language" ValidationGroup="Per" ControlToValidate="Language" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                          </div>
                                                                    </td>
                                                                </tr>
                                                                 <tr>
                                                                    <td>
                                                                        <label>Profile</label>
                                                                        <div class="card-block">
                                                                            <div class="img-hover">
                                                                                <asp:Image ID="Emp_Profile" class="img-fluid img-radius" alt="Signature.jpg" runat="server" ImageUrl="~/media/Signature/Signature.jpg" />
                                                                                <div class="img-overlay img-radius">
                                                                                    <span>
                                                                                        <asp:FileUpload ID="EmpProfile" runat="server" class="form-control" />
                                                                                    </span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <!-- end of table col-lg-6 -->
                                                    <div class="col-lg-6">
                                                        <table class="table">
                                                            <tbody>
                                                             
                                                                <tr>
                                                                    <td>
                                                                        <label >Phone</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="icofont icofont-ui-call"></i></span>
                                                                            <asp:TextBox ID="Employee_Phone" runat="server" class="form-control" placeholder="Enter Employee Phone" TextMode="SingleLine"></asp:TextBox>
                                                                        </div>
                                                                        <div class="col-sm-12">
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Employee Phone" ValidationGroup="Per" ControlToValidate="Employee_Phone" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                              <tr>
                                                                    <td>
                                                                    <label >Type oF Calendar</label>
                                                                    <div class="form-radio">
                                                                        <div class="group-add-on">
                                                                            <div class="radio radiofill radio-inline">
                                                                                <label>
                                                                                    <asp:RadioButton ID="DateofHegira" runat="server" GroupName="Calender" Text="Hegira" Checked="true" /><i class="helper"></i>
                                                                                </label>
                                                                            </div>
                                                                            <div class="radio radiofill radio-inline">
                                                                                <label>
                                                                                    <asp:RadioButton ID="DateofBirth" runat="server" GroupName="Calender"  Text="Birth" /><i class="helper"></i>
                                                                            </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    </td>
                                                                </tr>
                                                               <tr>
                                                                    <td>
                                                                        <label >Signature</label>
                                                                        <div class="card-block">
                                                                            <div class="img-hover">
                                                                                <asp:Image ID="Emp_Signature" class="img-fluid img-radius" alt="Signature.jpg" runat="server" ImageUrl="~/media/Signature/Signature.jpg" />
                                                                                <div class="img-overlay img-radius">
                                                                                    <span>
                                                                                        <asp:FileUpload ID="EmpSignature" runat="server" class="form-control" />
                                                                                    </span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <!-- end of table col-lg-6 -->
                                                </div>
                                                <!-- end of row -->
                                                <div class="text-center">
                                                    <asp:Button  ID="EmpUpdate"  runat="server" Text="Save" class="btn btn-primary waves-effect waves-light m-r-20" ValidationGroup="Per" OnClick="EmpUpdate_Click"  />
                                                    <a href="#!" id="edit-cancel" class="btn btn-default waves-effect btn-outline-danger">Cancel</a>
                                                </div>
                                            </div>
                                            <!-- end of edit info -->
                                        </div>
                                        <!-- end of col-lg-12 -->
                                    </div>
                                    <!-- end of row -->
                                </div>
                                <!-- end of edit-info -->
                            </div>
                            <!-- end of card-block -->
                        </div>
                        <!-- personal card end-->
                    </div>
                    <!-- tab pane personal end -->

                    <div class="tab-pane" id="changePassWord" role="tabpanel">
                        <!-- info card start -->
                         <div class="card">
                            <div class="card-header">
                                <h5 class="card-header-text">Change PassWord</h5>
                            </div>
                                <!-- end of view-info -->
                                <div class="edit-info-11">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="general-info">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <table class="table">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                       <label class="j-label">Old Pass Word</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                                                            <asp:TextBox ID="OldPassWord" runat="server" class="form-control" placeholder="Enter Old Pass Word" TextMode="SingleLine" type="password"></asp:TextBox>
                                                                        </div>
                                                                        <div class="col-sm-12">
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Old Pass Word" ValidationGroup="Per2" ControlToValidate="OldPassWord" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                      <label class="j-label">New PassWord</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                                                            <asp:TextBox ID="NewPassWord" runat="server" class="form-control" placeholder="Enter New PassWord" TextMode="SingleLine" type="password"></asp:TextBox>
                                                                        </div>
                                                                        <div class="col-sm-12">
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter New PassWord" ValidationGroup="Per2" ControlToValidate="NewPassWord" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                              <tr>
                                                                    <td>
                                                                         <label class="j-label">Try New PassWord</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                                                            <asp:TextBox ID="TryNewPassWord" runat="server" class="form-control" placeholder="Try New PassWord" TextMode="SingleLine" type="password"></asp:TextBox>
                                                                        </div>
                                                                        <div class="col-sm-12">
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Try New PassWord" ValidationGroup="Per2" ControlToValidate="TryNewPassWord" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                                <!-- end of row -->
                                                <div class="text-center">
                                                    <asp:Button  ID="ChangeButton"  runat="server" Text="Save" class="btn btn-primary waves-effect waves-light m-r-20" ValidationGroup="Per2" OnClick="ChangeButton_Click"  />
                                                    <a href="#!" id="edit-cancel2" class="btn btn-default waves-effect btn-outline-danger">Cancel</a>
                                                </div>
                                            </div>
                                            <!-- end of edit info -->
                                        </div>
                                        <!-- end of col-lg-12 -->
                                    </div>
                                    <!-- end of row -->
                                </div>
                                <!-- end of edit-info -->
                         </div>
                    </div>
                </div>

            </div>
            <!-- Article Editor card end -->
        </div>
        <!-- Page-body end -->
    </div>
</asp:Content>
