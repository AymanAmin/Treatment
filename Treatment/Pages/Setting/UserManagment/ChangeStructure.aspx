<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="ChangeStructure.aspx.cs" Inherits="Treatment.Pages.Setting.UserManagment.ChangeStructure" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("ChangeStructure-Title", "ECMS - Change Structure") %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="page-body">
        <!-- Article Editor card start -->
        <div class="card">
            <div class="card-header">
                <div class="card-header-right">
                    <ul class="list-unstyled card-option">
                        <li><i class="feather icon-maximize full-card"></i></li>
                    </ul>
                </div>
            </div>
            <div class="card-block">
                <!-- Start Change Sturcture Form-->
                <div class="row">
                    <div class="form-group col-sm-12">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("ChangeSturcture-EmployeeSturctureFrom", "Employee Sturcture From") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-user-suited"></i></span>
                            <asp:DropDownList ID="employeeSturctureFrom" CssClass="js-example-basic-single col-sm-12" runat="server" >
                            </asp:DropDownList>
                        </div>
                        <asp:RequiredFieldValidator ID="valEmployeeSturctureFrom" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Employee Sturcture From" ValidationGroup="valFormGroup" ControlToValidate="employeeSturctureFrom" Display="Dynamic" CssClass="col-form-label"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-sm-12">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("ChangeSturcture-EmployeeTo", "Employee To") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-user-suited"></i></span>
                            <asp:DropDownList ID="employeeTo" CssClass="js-example-basic-single col-sm-12" runat="server" >
                            </asp:DropDownList>
                        </div>
                        <asp:RequiredFieldValidator ID="valEmployeeTo" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Employee To" ValidationGroup="valFormGroup" ControlToValidate="employeeTo" Display="Dynamic" CssClass="col-form-label"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-right">
                    <asp:Button ID="SaveChangeEmployee" runat="server" Text="Save" CssClass="btn btn-primary" ValidationGroup="valFormGroup" OnClick="SaveChangeEmployee_Click"  />
                </div>
                <!-- End Change Sturcture Form-->
            </div>
            <!-- Article Editor card end -->
        </div>
    </div>
</asp:Content>
