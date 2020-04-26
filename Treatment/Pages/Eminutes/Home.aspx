<%@ Page Title="" Language="C#" MasterPageFile="~/EminutesMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Treatment.Pages.Eminutes.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("Home-Title", "Eminutes - Main Screen") %></title>
    <script>
        setTimeout(function () { document.getElementById("header_page").style.display = "none"; }, 1);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_PlaceHolder" runat="server">
    <div class="row">
        <asp:Literal ID="txtBoard" runat="server"></asp:Literal>
    </div>
</asp:Content>
