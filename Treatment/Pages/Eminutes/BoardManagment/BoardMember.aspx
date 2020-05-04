<%@ Page Title="" Language="C#" MasterPageFile="~/EminutesMaster.Master" AutoEventWireup="true" CodeBehind="BoardMember.aspx.cs" Inherits="Treatment.Pages.Eminutes.BoardManagment.BoardMember" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("BoardMember-Title", "E-Minutes - Board Member") %></title>
    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <asp:Literal ID="LtrMessage" runat="server"></asp:Literal>
        </div>
        <div id="add-model" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="login-card card-block login-card-modal">

                    <div class="text-center">
                        <img src="..\..\..\..\Theme\files\assets\images\auth\logo.png" alt="logo.png" data-toggle="tooltip" data-placement="top" title="logo" />
                    </div>
                    <div class="card m-t-15">
                        <div class="auth-box card-block">
                            <div class="row m-b-20">
                                <div class="col-md-12">
                                    <h3 class="text-center txt-primary"><% = Treatment.Classes.FieldNames.getFieldName("BoardMember-AddMember", "Add Member") %></h3>
                                </div>
                            </div>
                            <div class="col-sm-12 ">
                                <div class="form-group col-sm-12 j-unit" style="margin-top: 5%">
                                    <label class="j-label"><% = Treatment.Classes.FieldNames.getFieldName("PermissionGroups-Member", "Member") %></label>
                                    <div class="input-group">
                                        <span class="input-group-addon changeIconColor" id="basic-addon1"><i class="icofont icofont-underline primary"></i></span>
                                        <asp:DropDownList ID="txtEmployees" runat="server" class="form-control form-txt-primary"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-12" style="">
                                        <asp:RequiredFieldValidator ID="RFVtxtEmployees" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Please select member" ValidationGroup="Member" ControlToValidate="txtEmployees" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group col-sm-12 j-unit">
                                    <label class="j-label"><% = Treatment.Classes.FieldNames.getFieldName("PermissionGroups-Type", "Type") %></label>
                                    <div class="input-group">
                                        <span class="input-group-addon changeIconColor" id="basic-addon2"><i class="icofont icofont-underline primary"></i></span>
                                        <asp:DropDownList ID="txtType" runat="server" class="form-control form-txt-primary"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-12" style="">
                                        <asp:RequiredFieldValidator ID="RFVtxtType" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Please select type" ValidationGroup="Member" ControlToValidate="txtType" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group col-sm-12" style="text-align: right; margin-top: -2%">
                                    <asp:Button ID="Save" runat="server" Text="Save" class="btn btn-success" ValidationGroup="Member" OnClick="Save_Click" />

                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- end of form -->
                </div>
            </div>
        </div>
        <div class="col-md-12" style="text-align: right">
            <button class="btn btn-success btn-round" type="button" data-toggle="modal" data-target="#add-model">Add Member</button>
        </div>
        <div class="col-md-12">&nbsp;</div>
    </div>
    <div class="row">
        <!-- user-radial-card  start -->

        <asp:Literal ID="BoardMembers" runat="server"></asp:Literal>

        <!-- user-radial-card  end -->
    </div>
</asp:Content>
