<%@ Page Title="" Language="C#" MasterPageFile="~/EminutesMaster.Master" AutoEventWireup="true" CodeBehind="BoardInfo.aspx.cs" Inherits="Treatment.Pages.Eminutes.BoardManagment.BoardInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("BoardInfo-Title", "Board Screen") %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_PlaceHolder" runat="server">

    <div class="row">
        <div class="col-sm-12">
            <!-- Basic Form Inputs card start -->
            <div class="card">
                <div class="card-header">
                    <!--<h5>Basic Form Inputs</h5>
                    <span>Here you can create or update information about Board</span>-->

                    <div class="card-header-right">
                        <i class="icofont icofont-spinner-alt-5"></i>
                    </div>
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-6 mobile-inputs">
                            <h4 class="sub-title">Basic Info</h4>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Arabic Name</label>
                                <div class="col-sm-9 input-group">
                                <span class="input-group-addon changeIconColor"><i class="icofont icofont-ui-volume primary"></i></span>
                                    <asp:TextBox ID="txtArabicName" runat="server" class="form-control form-txt-primary " placeholder=""></asp:TextBox>
                                    </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">English Name</label>
                                <div class="col-sm-9 input-group">
                                <span class="input-group-addon changeIconColor"><i class="icofont icofont-ui-volume primary"></i></span>
                                <asp:TextBox ID="txtEnglishName" runat="server" class="form-control form-txt-primary " placeholder=""></asp:TextBox>
                                    </div>
                            </div>
                            <div class="form-group row">
                                
                                <label class="col-sm-3 col-form-label">Status of Board</label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-ui-volume primary"></i></span>
                                    <asp:DropDownList ID="txtStatusofBoard" runat="server" class="form-control form-txt-primary "></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Start Date</label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-ui-volume primary"></i></span>
                                <asp:TextBox ID="txtStartDate" runat="server" class="form-control form-txt-primary " placeholder=""></asp:TextBox>
                                    </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">End Date</label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-ui-volume primary"></i></span>
                                <asp:TextBox ID="txtEndDate" runat="server" class="form-control form-txt-primary " placeholder=""></asp:TextBox>
                                    </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Type of Board</label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-ui-volume primary"></i></span>
                                    <asp:DropDownList ID="txtTypeofBoard" runat="server" class="form-control form-txt-primary ">
                                        <asp:ListItem Value="0">Select Type</asp:ListItem>
                                        <asp:ListItem Value="1">Type 1</asp:ListItem>
                                        <asp:ListItem Value="2">Type 2</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                           
                        </div>
                        <div class="col-sm-6 mobile-inputs">
                            <h4 class="sub-title">Addition Info</h4>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Classification</label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-ui-volume primary"></i></span>
                                    <asp:DropDownList ID="txtClassification" runat="server" class="form-control form-txt-primary "></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Arabic Description</label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-ui-volume primary"></i></span>
                                    <asp:TextBox ID="txtArabicDescription" runat="server" class="form-control form-txt-primary " placeholder="" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">English Description</label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-ui-volume primary"></i></span>
                                    <asp:TextBox ID="txtEnglishDescription" runat="server" class="form-control form-txt-primary " placeholder="" Rows="5" TextMode="MultiLine"></asp:TextBox>
                                    
                                </div>
                            </div>
                        </div>

                        <!-- button save , Update , Delete -->
                        <div class="col-sm-12 mobile-inputs" style="text-align:center">
                            <asp:Button ID="Save" runat="server" Text="Save" class="btn btn-success btn-round col-sm-1"/>
                            <asp:Button ID="Cancel" runat="server" Text="Cancel" class="btn btn-warning btn-round col-sm-1"/>
                        </div>
                    </div>
                </div>

            </div>

            <!-- Basic Form Inputs card end -->
        </div>
    </div>

</asp:Content>
