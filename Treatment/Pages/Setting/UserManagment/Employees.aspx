<<<<<<< Updated upstream
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="Treatment.Pages.Treatment.Employees" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Employee</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="page-body">
        <!-- Modal Employee start -->
        <div id="sign-in-social" class="modal fade" role="dialog">
            <div class="modal-dialog" style="max-width: 700px">
                <div class="login-card card-block login-card-modal">
                    <div class="text-center">
                        <img src="..\..\..\..\Theme\files\assets\images\auth\logo.png" alt="logo.png">
                    </div>

                    <div class="card m-t-16">
                        <div class="auth-box card-block">
                            <div class="row m-b-0">
                                <div class="col-md-12">
                                    <h3 class="text-center txt-primary">Employee</h3>
                                </div>
                            </div>
                            <!-- Start Employee Form-->
                            <div class="row users-card">
                                <div class="col-lg-6 col-xl-4 col-md-6">
                                    <div class="card rounded-card user-card">
                                        <div class="card-block">
                                            <div class="img-hover">
                                                <img class="img-fluid img-radius" src="..\..\..\..\Theme\files\assets\images\user-card\img-round4.jpg" alt="img-round4.jpg">
                                                <div class="img-overlay img-radius">
                                                    <span>
                                                        <a href="#"  class="btn btn-sm btn-primary" data-popup="lightbox"><i class="icofont icofont-plus" ></i></a>
                                                        <a href="" class="btn btn-sm btn-primary"><i class="icofont icofont-link-alt"></i></a>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                  <div class="col-lg-6 col-xl-4 col-md-6">
                                  </div>
                                  <div class="col-lg-6 col-xl-4 col-md-6">
                                    <div class="card rounded-card user-card">
                                        <div class="card-block">
                                            <div class="img-hover">
                                                <img class="img-fluid img-radius" src="..\..\..\..\Theme\files\assets\images\user-card\m.jpg" alt="m.jpg">
                                                <div class="img-overlay img-radius">
                                                    <span>
                                                        <a href="#" class="btn btn-sm btn-primary" data-popup="lightbox"><i class="icofont icofont-plus"></i></a>
                                                        <a href="" class="btn btn-sm btn-primary"><i class="icofont icofont-link-alt"></i></a>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                               
                            </div>


                            <div class="row">
                                <div class="col-sm-6">
                                    <label class="j-label">Arabic Name</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                        <asp:TextBox ID="Employee_Name_Ar" runat="server" class="form-control" placeholder="Enter Arabic Name" TextMode="SingleLine"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-12" >
                                        <asp:RequiredFieldValidator ID="RFVtxtEmployee_Name_Ar" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Arabic Name" ValidationGroup="Per" ControlToValidate="Employee_Name_Ar" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <label class="j-label">English Name</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                        <asp:TextBox ID="Employee_Name_En" runat="server" class="form-control" placeholder="Enter English Name" TextMode="SingleLine"></asp:TextBox>
                                    </div>
                                     <div class="col-sm-12" >
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter English Name" ValidationGroup="Per" ControlToValidate="Employee_Name_En" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6">
                                    <label class="j-label">Email</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-email"></i></span>
                                        <asp:TextBox ID="Employee_Email" runat="server" class="form-control" placeholder="Enter Employee Email" TextMode="SingleLine"></asp:TextBox>
                                    </div>
                                     <div class="col-sm-12" >
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Email" ValidationGroup="Per" ControlToValidate="Employee_Email" Display="Dynamic" SetFocusOnError="True">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                 <div class="col-sm-6">
                                    <label class="j-label">password</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-ui-password"></i></span>
                                        <asp:TextBox ID="Employee_Password" type="password" runat="server" class="form-control" placeholder="Enter Employee password" TextMode="SingleLine"></asp:TextBox>
                                    </div>
                                     <div class="col-sm-12" >
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Employee Password" ValidationGroup="Per" ControlToValidate="Employee_Password" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                               
                            </div>
                            <div class="row">
                                 <div class="col-sm-6">
                                    <label class="j-label">Phone</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-ui-call"></i></span>
                                        <asp:TextBox ID="Employee_Phone" runat="server" class="form-control" placeholder="Enter Employee Phone" TextMode="SingleLine"></asp:TextBox>
                                    </div>
                                      <div class="col-sm-12" >
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Employee Phone" ValidationGroup="Per" ControlToValidate="Employee_Phone" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <label>Active</label>
                                    <div class="input-group">
                                        <input id="Active" runat="server" type="checkbox" class="js-single" />
                                    </div>
                                </div>
                            
                            </div>
                            <div class="row">
                               
                                   <div class="col-sm-6">
                                    <label>Structure</label>
                                   <div class="input-group">
                                    <span class="input-group-addon"><i class="icofont icofont-chart-flow-alt-1"></i></span>
                                    <asp:ListBox ID="ListBox1" runat="server" CssClass="js-example-basic-multiple col-sm-12 select2-hidden-accessible" data-placeholder="Enter Employee Structure" multiple="multiple" DataSourceID="StructureDataSource" DataTextField="Structure_Name_Ar" DataValueField="Structure_Id"></asp:ListBox>
                                    <asp:EntityDataSource ID="StructureDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableFlattening="False" EntitySetName="Structures">
                                    </asp:EntityDataSource>
                                  </div>
                                </div>

                                <div class="col-sm-6">
                                    <label class="j-label">Group</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-group"></i></span>
                                        <asp:DropDownList ID="Groups" runat="server" class="form-control" DataTextField="Group_Name_Ar" DataValueField="Group_Id" DataSourceID="GroupDataSource"></asp:DropDownList>
                                       
                                        <asp:EntityDataSource ID="GroupDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableFlattening="False" EntitySetName="Groups">
                                        </asp:EntityDataSource>
                                       
                                    </div>
                                </div>
                            </div>
                          
                            <div class="row">
                                <div class="col-sm-6">
                                    </div>
                                <div class="col-sm-6">
                                    <div class="col-md-12">
                                      <asp:Button ID="Save" runat="server" Text="Save" class="btn btn-primary" ValidationGroup="Per" OnClick="Save_Click" />
                                    </div>
                                </div>
                            </div>
                            <!-- end of form -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Employee end-->
        <!-- End Employee Form-->

        <!-- Start Grid-->
        <div class="table-responsive">
            <!-- Social Sign in card start -->
            <div class="form-group col-sm-12" style="text-align: right;">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#sign-in-social">Add Employees</button>
            </div>
            <!-- Social Sign in card end -->
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="EmployeeDataSource" KeyFieldName="Employee_Id" Theme="Moderno" RightToLeft="False" EnablePagingCallbackAnimation="True" AutoGenerateColumns="False">

                <SettingsCommandButton>
                    <NewButton Text=" " Styles-Style-Font-Underline="false">
                        <Styles>
                            <Style CssClass="icofont icofont-plus text-primary h5">
                        </Style>
                        </Styles>
                    </NewButton>
                    <UpdateButton Text=" " Styles-Style-Font-Underline="false">
                        <Styles>
                            <Style CssClass="icofont icofont-refresh text-primary h5">
                        </Style>
                        </Styles>
                    </UpdateButton>
                    <CancelButton Text="  " Styles-Style-Font-Underline="false">
                        <Styles>
                            <Style CssClass="icofont icofont-ui-close text-warning h5">
                        </Style>
                        </Styles>
                    </CancelButton>
                    <EditButton Text=" " Styles-Style-Font-Underline="false">
                        <Styles>
                            <Style CssClass="icofont icofont-ui-edit text-info h5">
                        </Style>
                        </Styles>
                    </EditButton>
                    <DeleteButton Text=" " Styles-Style-Font-Underline="false">
                        <Styles>
                            <Style CssClass="icofont icofont-ui-delete text-danger h5">
                        </Style>
                        </Styles>
                    </DeleteButton>
                </SettingsCommandButton>
                <SettingsSearchPanel Visible="True" />
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="Employee_Name_Ar" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Employee Name Arabic">
                        <PropertiesTextEdit>
                            <ValidationSettings SetFocusOnError="True">
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Employee_Email" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Employee Email">
                        <PropertiesTextEdit>
                            <ValidationSettings CausesValidation="True" EnableCustomValidation="True" SetFocusOnError="True">
                                <RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Employee_Phone" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Employee Phone">
                        <PropertiesTextEdit>
                            <ValidationSettings SetFocusOnError="True">
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="9">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn Caption="Employee Name English" FieldName="Employee_Name_En" VisibleIndex="1">
                        <PropertiesTextEdit>
                            <ValidationSettings CausesValidation="True" SetFocusOnError="True">
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Employee Profile" FieldName="Employee_Profile" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Employee Signature" FieldName="Employee_Signature" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Employee Password" FieldName="Employee_Password" VisibleIndex="3">
                        <PropertiesTextEdit Password="True">
                            <ValidationSettings SetFocusOnError="True">
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn Caption="Employee Active" FieldName="Employee_Active" VisibleIndex="5">
                        <PropertiesCheckEdit>
                            <Style CssClass="js-single">
                            </Style>
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:EntityDataSource ID="EmployeeDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Employees" EntityTypeFilter="Employee" AutoGenerateOrderByClause="False" AutoGenerateWhereClause="False" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
            </asp:EntityDataSource>
        </div>
        <!-- End Grid-->

    </div>

</asp:Content>
=======
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="Treatment.Pages.Treatment.Employees" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Employee</title>
    <script type="text/javascript">

        function showmodel(x) {           // debugger;            if (!isNaN(x.id)){            $.ajax({
                url: "Employees.aspx/ViewUserCard",
                type: "POST",
                data: "{ Employee_Id:"+x.id+"}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (resultData) {
                    var Emp = JSON.parse(resultData.d);
                    $('#Body_Holder_EmpID').val(Emp.Employee_Id);
                    $('#Body_Holder_Employee_Name_Ar').val(Emp.Employee_Name_Ar);
                    $('#Body_Holder_Employee_Name_En').val(Emp.Employee_Name_En);
                    $('#Body_Holder_Employee_Email').val(Emp.Employee_Email);
                    $('#Body_Holder_Employee_Phone').val(Emp.Employee_Phone);
                    $('#select2-Body_Holder_Groups-container').val(Emp.Group_Id);
                    $('#Body_Holder_Active').val(Emp.Employee_Active);
                    var Struc = Emp.Structures;
                    $('#Body_Holder_Emp_Structure').val(Struc).trigger('change');
                    debugger;
                    if (Emp.Employee_Profile == "" || Emp.Employee_Profile == null) {
                        var Profile = "..\/..\/..\/..\/media\/Profile\/Profile.jpg";
                    } else {
                        var Profile = "..\/..\/..\/..\/media\/Profile\/" + Emp.Employee_Profile;
                    }

                    if (Emp.Employee_Signature == "" || Emp.Employee_Signature == null ) {
                        var Signature = "..\/..\/..\/..\/media\/Signature\/Signature.jpg";
                    } else {
                        var Signature = "..\/..\/..\/..\/media\/Signature\/"+Emp.Employee_Signature;
                    }

                    $('#Body_Holder_Emp_Profile').attr('src', Profile);
                    $('#Body_Holder_Emp_Signature').attr('src', Signature);
                    }
                });
            } else {
                $('#Body_Holder_EmpID').val(0);
                $('#Body_Holder_Employee_Name_Ar').val('');
                $('#Body_Holder_Employee_Name_En').val('');
                $('#Body_Holder_Employee_Email').val('');
                $('#Body_Holder_Employee_Phone').val('');
                $('#select2-Body_Holder_Groups-container').val(0);
                $('#Body_Holder_Active').val(false);
                $('#Body_Holder_Emp_Structure').val('').trigger('change');
            }

            document.getElementById("AddEmp_show").click(); 
           // GetServiceInformation(x.id)
        }

        function DeleteEmplooye(x) {            $.ajax({
                url: "Employees.aspx/DeleteEmplooye",
                type: "POST",
                data: "{ Employee_Id:" + x.id + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (resultData) {
                    notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight', '  Save Status : ', '  The new Employee was Sucessfully saved in system ! ');
                   // location.reload();
                    window.location = window.location;
                }
            });
            
            //document.getElementById("AddEmp_show").click();
            // GetServiceInformation(x.id)
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="page-body">
         <!-- Article Editor card start -->
        <div class="card"  runat="server">
            <div class="card-header">
                <div class="card-header-right">
                    <ul class="list-unstyled card-option">
                        <li><i class="feather icon-maximize full-card"></i></li>
                    </ul>
                </div>
            </div>
            <div class="card-block">
        <!-- Modal Employee start -->
        <div id="sign-in-social" class="modal fade" role="dialog">
            <div class="modal-dialog" style="max-width: 700px">
                <div class="login-card card-block login-card-modal">
                    <div class="text-center">
                        <img src="..\..\..\..\Theme\files\assets\images\auth\logo.png" alt="logo.png">
                    </div>

                    <div class="card m-t-16">
                        <div class="auth-box card-block">
                            <div class="row m-b-0">
                                <div class="col-md-12">
                                    <h3 class="text-center txt-primary">Employee</h3>
                                </div>
                            </div>
                            <!-- Start Employee Form-->
                            <div class="row users-card">
                                <div class="col-lg-6 col-xl-4 col-md-6">
                                    <div class="card rounded-card user-card">
                                        <div class="card-block">
                                            <div class="img-hover">
                                                <asp:Image ID="Emp_Profile" class="img-fluid img-radius"  runat="server"   alt="Profile.jpg"  ImageUrl="~/media/Profile/Profile.jpg"  />
                                                <div class="img-overlay img-radius">
                                                    <span>
                                                        <asp:FileUpload ID="EmpProfile" runat="server" class="form-control"  />
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-xl-4 col-md-6">
                                </div>
                                <div class="col-lg-6 col-xl-4 col-md-6">
                                    <div class="card rounded-card user-card">
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
                                    </div>
                                </div>

                            </div>


                            <div class="row">
                                <div class="col-sm-6">
                                    <label class="j-label">Arabic Name</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                        <asp:TextBox ID="Employee_Name_Ar" runat="server" class="form-control" placeholder="Enter Arabic Name" TextMode="SingleLine"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-12">
                                        <asp:RequiredFieldValidator ID="RFVtxtEmployee_Name_Ar" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Arabic Name" ValidationGroup="Per" ControlToValidate="Employee_Name_Ar" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <label class="j-label">English Name</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                        <asp:TextBox ID="Employee_Name_En" runat="server" class="form-control" placeholder="Enter English Name" TextMode="SingleLine"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-12">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter English Name" ValidationGroup="Per" ControlToValidate="Employee_Name_En" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6">
                                    <label class="j-label">Email</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-email"></i></span>
                                        <asp:TextBox ID="Employee_Email" runat="server" class="form-control" placeholder="Enter Employee Email" TextMode="SingleLine"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-12">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Email" ValidationGroup="Per" ControlToValidate="Employee_Email" Display="Dynamic" SetFocusOnError="True">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <label class="j-label">Phone</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-ui-call"></i></span>
                                        <asp:TextBox ID="Employee_Phone" runat="server" class="form-control" placeholder="Enter Employee Phone" TextMode="SingleLine"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-12">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Employee Phone" ValidationGroup="Per" ControlToValidate="Employee_Phone" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                            </div>
                            <div class="row">

                                <div class="col-sm-6">
                                    <label>Structure</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-chart-flow-alt-1"></i></span>
                                        <asp:ListBox ID="Emp_Structure" runat="server" CssClass="js-example-placeholder-multiple col-sm-12" data-placeholder="Enter Employee Structure"  DataSourceID="StructureDataSource" DataTextField="Structure_Name_Ar" DataValueField="Structure_Id"  SelectionMode="Multiple"></asp:ListBox>
                                        <asp:EntityDataSource ID="StructureDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableFlattening="False" EntitySetName="Structures">
                                        </asp:EntityDataSource>
                                    </div>
                                     <div class="col-sm-12">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Employee Structure" ValidationGroup="Per" ControlToValidate="Emp_Structure" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <label class="j-label">Group</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-group"></i></span>
                                        <asp:DropDownList ID="Groups" runat="server" class="form-control" DataTextField="Group_Name_Ar" DataValueField="Group_Id" DataSourceID="GroupDataSource" ></asp:DropDownList>

                                        <asp:EntityDataSource ID="GroupDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableFlattening="False" EntitySetName="Groups">
                                        </asp:EntityDataSource>

                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="col-sm-6">
                                        <label>Active</label>
                                        <div class="input-group">
                                            <input id="Active" runat="server" type="checkbox" class="js-single" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <label></label>
                                    <div class="col-md-12">
                                        <asp:HiddenField ID="EmpID" runat="server" />
                                        <asp:Button  ID="Save"  runat="server" Text="Save" class="btn btn-primary" ValidationGroup="Per" OnClick="Save_Click"  />
                                    </div>
                                </div>
                            </div>
                            <!-- end of form -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Employee end-->
        <!-- End Employee Form-->
              <div class="form-group col-sm-12" style="text-align: right;">
                <button runat="server" id="AddEmp" type="button" class="btn btn-primary" data-toggle="modal" data-target="#sign-in-social" OnClick="showmodel(this)">Add Employees</button>
            </div>
             <div class="row users-card" runat="server" id="UCard">
              
            </div>
        
          </div>
            <!-- Article Editor card end -->
        </div>
        <!-- Page-body end -->
    </div>
</asp:Content>
>>>>>>> Stashed changes
