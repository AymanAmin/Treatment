<%@ Page Title="" Language="C#" MasterPageFile="~/EminutesMaster.Master" AutoEventWireup="true" CodeBehind="R_Minutes.aspx.cs" Inherits="Treatment.Pages.Eminutes.Reports.R_Minutes" %>

<%@ Register Assembly="DevExpress.XtraReports.v17.2.Web, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <title><% = Treatment.Classes.FieldNames.getFieldName("Report-Title", "ECMS - Report") %></title>
    <script>
        setTimeout(function () {
            document.getElementById("header-div").style.display = "none";
            document.getElementById("Body_Holder_TreatmentASPxDocumentViewer_Splitter_1").style.width = "100%";
            document.getElementById("Body_Holder_TreatmentASPxDocumentViewer_Splitter_1_CC").style.width = "100%";
            document.getElementById("Body_Holder_TreatmentASPxDocumentViewer_Splitter_1_T").style.width = "100%";
            document.getElementById("Body_Holder_TreatmentASPxDocumentViewer_Splitter_1i0").style.width = "100%";
            document.getElementById("Body_Holder_TreatmentASPxDocumentViewer_Splitter_1i0_CC").style.width = "100%";
        }, 1);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card user-activity-card feed-card">
                <div class="card-block" style="width: 100%">
                    <div class="row table-responsive" style="width:100%">
                        <dx:ASPxDocumentViewer ID="MinutesWebDocumentViewer" runat="server" Height="1150px" Theme="Material" >
                        </dx:ASPxDocumentViewer>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
