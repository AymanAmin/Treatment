<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="AdvancedSearch.aspx.cs" Inherits="Treatment.Pages.Treatment.AdvancedSearch" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("AdvancedSearch-Title", "ECMS - Advanced Search") %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <!-- Page-body start -->
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
                <!-- Start Search Form-->

                <div class="row">
                    <div class="form-group col-sm-3">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("AdvancedSearch-After", "After") %></label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-ui-calendar"></i></span>
                            <input id="StartTreatmentDate" runat="server" class="form-control" type="date"/>
                        </div>
                    </div>
                    <div class="form-group col-sm-3">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("AdvancedSearch-Before", "Before") %></label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-ui-calendar"></i></span>
                            <input id="EndTreatmentDate" runat="server" class="form-control" type="date"/>
                        </div>
                    </div>
                    <div class="form-group col-sm-3">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("AdvancedSearch-StandardProcedure", "Standard Procedure") %></label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-edit-alt"></i></span>
                            <asp:DropDownList ID="standardProcedure" CssClass="js-example-basic-single form-control" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group col-sm-3">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("AdvancedSearch-PreparedManagement", "Prepared Management") %></label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-stamp"></i></span>
                            <asp:DropDownList ID="preparedManagement" CssClass="js-example-basic-single col-sm-12" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-sm-3">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("AdvancedSearch-ClassificationSubject", "Classification Subject") %></label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-tack-pin"></i></span>
                            <asp:DropDownList ID="classificationSubject" CssClass="js-example-basic-single col-sm-12" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group col-sm-3">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("AdvancedSearch-TypeTreatment", "Type Treatment") %></label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-ui-tag"></i></span>
                            <asp:DropDownList ID="typeTreatment" CssClass="js-example-basic-single col-sm-12" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group col-sm-3">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("AdvancedSearch-SecretLevel", "Secret Level") %></label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-safety"></i></span>
                            <asp:DropDownList ID="secretLevel" CssClass="js-example-basic-single col-sm-12" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group col-sm-3">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("AdvancedSearch-PriorityLevel", "Priority Level") %></label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-certificate-alt-2"></i></span>
                            <asp:DropDownList ID="priorityLevel" CssClass="js-example-basic-single col-sm-12" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div>
                    
                    <!--<div class="form-group col-sm-3">
                        <label><% = Treatment.Classes.FieldNames.getFieldName("AdvancedSearch-SpeedUp", "Speed Up") %></label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-speed-meter"></i></span>
                            <asp:DropDownList ID="speedUp" CssClass="js-example-basic-single col-sm-12" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div>-->
                </div>
                <hr />
                <div class="row">
                    <div class="form-group col-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-search"></i></span>
                            <asp:TextBox ID="Keyword" runat="server" class="form-control" placeholder="Subject or Body..." TextMode="SingleLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group col-sm-2 text-right">
                        <asp:Button ID="btnSearch" runat="server" AutoPostback = "false" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                    </div>
                </div>

                <!-- End Search Form -->
            </div>
            <!-- Article Editor card end -->
        </div>

        <!-- Start Result Data -->

        <div class="card">
            <div class="card-header">
                <h5><% = Treatment.Classes.FieldNames.getFieldName("AdvancedSearch-Total", "Total") %> : (<asp:Literal ID="Total" runat="server"></asp:Literal>)</h5>
                <span class="text-muted">
                    <asp:Literal ID="FilterUsed" runat="server"></asp:Literal></span>
                <div class="card-header-right">
                    <ul class="list-unstyled card-option">
                        <li><i class="feather icon-maximize full-card"></i></li>
                    </ul>
                </div>
            </div>
            <div class="card-block">
                <div class="table-responsive">
                    <table class="table table-hover table-borderless">
                        <thead>
                            <tr>
                                <th style="text-align: center">#</th>
                                <th><% = Treatment.Classes.FieldNames.getFieldName("AdvancedSearch-Mail", "Mail") %></th>
                                <th><% = Treatment.Classes.FieldNames.getFieldName("AdvancedSearch-Subject", "Subject") %></th>
                                <th style="text-align: center"><% = Treatment.Classes.FieldNames.getFieldName("AdvancedSearch-Managment", "Managment") %></th>
                                <th style="text-align: center"><% = Treatment.Classes.FieldNames.getFieldName("AdvancedSearch-PreparedBy", "Prepared By") %></th>
                                <th><% = Treatment.Classes.FieldNames.getFieldName("AdvancedSearch-Date", "Date") %></th>
                                <th style="text-align: center"><% = Treatment.Classes.FieldNames.getFieldName("AdvancedSearch-SecritLevel", "Secrit Level") %></th>
                                <th style="text-align: center"><% = Treatment.Classes.FieldNames.getFieldName("AdvancedSearch-View", "View") %> </th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Literal ID="txtData" runat="server"></asp:Literal>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- End Result Data -->
    </div>
    <!-- Page-body end -->
</asp:Content>
