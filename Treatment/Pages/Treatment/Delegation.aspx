<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="Delegation.aspx.cs" Inherits="Treatment.Pages.Treatment.Delegation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("Delegation-Title", "ECMS - Delegation") %></title>
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
                <!-- Start Delegation Form-->
                <div class="row">
                    <div class="form-group col-sm-12">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("Delegation-EmployeeDelegation", "Employee Delegation") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-user-suited"></i></span>
                            <asp:DropDownList ID="employeeDelegation" CssClass="js-example-basic-single col-sm-12" runat="server" >
                            </asp:DropDownList>
                        </div>
                        <asp:RequiredFieldValidator ID="valEmployeeDelegation" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Employee Delegation" ValidationGroup="valFormGroup" ControlToValidate="employeeDelegation" Display="Dynamic" CssClass="col-form-label"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-right">
                    <asp:Button ID="SaveDelegation" runat="server" Text="Save" CssClass="btn btn-primary" ValidationGroup="valFormGroup" OnClick="SaveDelegation_Click"  />
                </div>
                <div class="form-group col-sm-12 text-right">
                    <asp:Button ID="removeDelegation" runat="server" Text="Remove" CssClass="btn btn-warning" OnClick="removeDelegation_Click"  />
                </div>
                <!-- End Delegation Form-->
            </div>
            <!-- Article Editor card end -->
        </div>
    </div>
</asp:Content>
