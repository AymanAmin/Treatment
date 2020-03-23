<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="Permissions.aspx.cs" Inherits="Treatment.Pages.Setting.UserManagment.Permissions" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>User Management - Permission</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="row col-sm-12">
        <div class="form-group col-sm-4 j-unit">
            <label class="j-label">Name Arabic</label>
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon1"><i class="icofont icofont-underline"></i></span>
                <asp:TextBox ID="txtPermission_Name1" runat="server" class="form-control" placeholder="Enter Name in Arabic" TextMode="SingleLine" MaxLength="10"></asp:TextBox>
            </div>
            <div class="col-sm-12" style="margin-top:-5%">
                <asp:RequiredFieldValidator ID="RFVtxtPermission_Name1" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Arabic Name" ValidationGroup="Per" ControlToValidate="txtPermission_Name1" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="\d*" ValidationGroup="Per" ControlToValidate="txtPermission_Name1" Text="Enter Number" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group col-sm-4 j-unit" >
            <label class="j-label">Name English</label>
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon2"><i class="icofont icofont-underline"></i></span>
                <asp:TextBox ID="txtPermission_Name_En1" runat="server" class="form-control" placeholder="Enter Name in English"></asp:TextBox>
            </div>
            <div class="col-sm-12" style="margin-top:-5%">
                <asp:RequiredFieldValidator ID="RFVtxtPermission_Name_En1" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter English Name" ValidationGroup="Per" ControlToValidate="txtPermission_Name_En1" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group col-sm-8 j-unit" style="margin-top:-1%">
            <label class="j-label">URL Path</label>
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon4"><i class="icofont icofont-link-alt"></i></span>
                <asp:TextBox ID="txtUrl_Path1" runat="server" class="form-control" placeholder="Enter URL Path Ex(Pages/Setting/...)"></asp:TextBox>
            </div>
        </div>
        
        <div class="form-group col-sm-12" style="text-align:right">
            <asp:Button ID="Save1" runat="server" Text="Save" class="btn btn-primary" ValidationGroup="Per" OnClick="Save_Click" />
        </div>
    </div>
</asp:Content>
