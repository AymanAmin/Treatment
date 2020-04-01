<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="TestPage.aspx.cs" Inherits="Treatment.Pages.Admin.TestPage" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    
    <div class="row">
        <dx:ASPxGridView ID="ASPxGridView1" runat="server"></dx:ASPxGridView>
    </div>
    
</asp:Content>
