<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="inbox.aspx.cs" Inherits="Treatment.Pages.Treatment.inbox" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>REU - Inbox</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="email-card">
        <!-- Left-side section start -->
        <div class="row">
            <div class="col-lg-12 col-xl-2">
                <div class="user-body">
                    <div class="p-20 text-center">
                        <a href="NewTreatment.aspx" class="btn btn-danger">Create New</a>
                    </div>
                    <ul class="page-list nav nav-tabs flex-column" id="pills-tab" role="tablist">
                        <li class="nav-item mail-section">
                            <a class="nav-link" data-toggle="pill" href="#e-sent" role="tab" style="font-size: 120%;color:#ccd0d5">
                                <i class="icofont icofont-inbox"></i>Inbox
                                                                    </a>
                        </li>
                        <li class="nav-item mail-section">
                            <a class="nav-link active" data-toggle="pill" href="#e-inbox" role="tab" style="font-size: 120%;">
                                <i class="icofont icofont-paper-plane"></i>Send
                            </a>
                        </li>
                        <li class="nav-item mail-section">
                            <a class="nav-link" data-toggle="pill" href="#e-trash" role="tab" style="font-size: 120%;color:#ccd0d5">
                                <i class="icofont icofont-license"></i>Completed
                                                                    </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- Left-side section end -->
            <!-- Right-side section start -->
            <div class="col-lg-12 col-xl-10">
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active" id="e-inbox" role="tabpanel">

                        <div class="mail-body">
                            <!--<div class="mail-body-header">
                                <button type="button" class="btn btn-primary btn-xs waves-effect waves-light">
                                    <i class="icofont icofont-ui-reply"></i>
                                </button>
                                <button type="button" class="btn btn-success btn-xs waves-effect waves-light">
                                    <i class="icofont icofont-plus-circle"></i>
                                </button>
                                <button type="button" class="btn btn-danger btn-xs waves-effect waves-light">
                                    <i class="icofont icofont-close-squared-alt"></i>
                                </button>
                            </div>-->
                            <div class="">
                                <div class="table-responsive">
                                    <dx:ASPxGridView ID="TreatmentInbox" runat="server" DataSourceID="EntityDataSourceTreatment" KeyFieldName="Treatment_Id" Width="100%" AutoGenerateColumns="False" EnableTheming="True" Theme="Material">
                                        <Settings ShowColumnHeaders="False" />
                                        <SettingsSearchPanel Visible="True" />
                                        <SettingsText SearchPanelEditorNullText="Search Treatment ..." />
                                        <Columns>
                                            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowSelectCheckbox="True" VisibleIndex="0" Width="5%">
                                                <CellStyle Border-BorderWidth="0px"></CellStyle>
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn Caption="Subject" FieldName="Treatment_Subject" VisibleIndex="2" Width="65%">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Date" FieldName="Create_Date" VisibleIndex="3" Width="10%">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="From" FieldName="Employee_Name_En" VisibleIndex="1" Width="20%" AllowTextTruncationInAdaptiveMode="True">
                                                <EditFormSettings Caption="Employee_Structure.Employee_Id" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <Styles>
                                            <Table>
                                                <BorderLeft BorderWidth="0px" />
                                                <BorderTop BorderStyle="Solid" BorderWidth="1px" />
                                                <BorderRight BorderWidth="0px" />
                                            </Table>
                                            <Cell Border-BorderWidth="0px">
                                            </Cell>
                                        </Styles>
                                    </dx:ASPxGridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Right-side section End -->

        </div>
    </div>
    <!-- Start Treatment Data Source-->
    <asp:EntityDataSource ID="EntityDataSourceTreatment" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntitySetName="Treatment_View"></asp:EntityDataSource>
     <!-- End Treatment Data Source-->
<style>
        .email-card {
     padding: 0 0px; 
}
        .card-header{
            display:none;
        }
        .dxgvControl_Material{
            -webkit-font-smoothing: antialiased;
    font-family: Roboto,RobotoDraft,Helvetica,Arial,sans-serif;
    font-size: 0.975rem;
    letter-spacing: .2px;
    white-space: pre;
        }
        .dxgvDataRow_Material{
            background: rgba(242,245,245,0.8);
        }
        .dxgvDataRow_Material:hover{
                box-shadow: inset 1px 0 0 #dadce0, inset -1px 0 0 #dadce0, 0 1px 2px 0 rgba(60,64,67,.3), 0 1px 3px 1px rgba(60,64,67,.15);
                    z-index: 1;
        }
        .email-card .user-body .page-list {
    border: 1px solid #efefef;
}
        </style>
</asp:Content>
