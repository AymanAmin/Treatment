<%@ Page Title="" Language="C#" MasterPageFile="~/EminutesMaster.Master" AutoEventWireup="true" CodeBehind="BoardLocations.aspx.cs" Inherits="Treatment.Pages.Eminutes.BoardManagment.BoardLocations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("BoardLocations-Title", "Board Locations") %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">

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
                        <div class="col-sm-12">
                            <asp:Literal ID="LtrMessage" runat="server"></asp:Literal>
                        </div>
                        <div class="col-sm-6 mobile-inputs">
                            <h4 class="sub-title"><% = Treatment.Classes.FieldNames.getFieldName("BoardLocations-BasicInfo", "Basic Info") %></h4>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("BoardLocations-Board", "Board") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-ui-home primary"></i></span>
                                    <asp:DropDownList ID="txtBoard" runat="server" class="form-control form-txt-primary "></asp:DropDownList>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9">
                                    <asp:RequiredFieldValidator ID="RFVtxtBoard" runat="server" ErrorMessage="Please select board" Style="color: red" ControlToValidate="txtBoard" ValidationGroup="Location" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("BoardLocations-ArabicName", "Arabic Name") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-underline primary"></i></span>
                                    <asp:TextBox ID="txtArabicName" runat="server" class="form-control form-txt-primary " placeholder=""></asp:TextBox>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9">
                                    <asp:RequiredFieldValidator ID="RFVtxtArabicName" runat="server" ErrorMessage="Please enter arabic name" Style="color: red" ControlToValidate="txtArabicName" ValidationGroup="Location" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("BoardLocations-EnglishName", "English Name") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-underline primary"></i></span>
                                    <asp:TextBox ID="txtEnglishName" runat="server" class="form-control form-txt-primary " placeholder=""></asp:TextBox>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9">
                                    <asp:RequiredFieldValidator ID="RFVtxtEnglishName" runat="server" ErrorMessage="Please enter english name" Style="color: red" ControlToValidate="txtEnglishName" ValidationGroup="Location" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("BoardLocations-MapLocation", "Map Location") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-location-pin primary"></i></span>
                                    <asp:TextBox ID="txtMapLocation" runat="server" class="form-control form-txt-primary " placeholder=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("BoardLocations-VideoURL", "Video URL") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-location-pin primary"></i></span>
                                    <asp:TextBox ID="txtVideoURL" runat="server" class="form-control form-txt-primary " placeholder=""></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 mobile-inputs">
                            <h4 class="sub-title"><% = Treatment.Classes.FieldNames.getFieldName("BoardLocations-AdditionInfo", "Addition Info") %></h4>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("BoardLocations-ArabicDescription", "Arabic Description") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-clip-board primary"></i></span>
                                    <asp:TextBox ID="txtArabicDescription" runat="server" class="form-control form-txt-primary " placeholder="" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9">
                                    <asp:RequiredFieldValidator ID="RFVtxtArabicDescription" runat="server" ErrorMessage="Please enter arabic description" Style="color: red" ControlToValidate="txtArabicDescription" ValidationGroup="Location" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("BoardLocations-EnglishDescription", "English Description") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-clip-board primary"></i></span>
                                    <asp:TextBox ID="txtEnglishDescription" runat="server" class="form-control form-txt-primary " placeholder="" Rows="5" TextMode="MultiLine"></asp:TextBox>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9">
                                    <asp:RequiredFieldValidator ID="RFVtxtEnglishDescription" runat="server" ErrorMessage="Please enter english description" Style="color: red" ControlToValidate="txtEnglishDescription" ValidationGroup="Location" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <!-- button save , Update , Delete -->
                        <div class="col-sm-12 mobile-inputs" style="text-align: center;margin-right: 47%;">
                            <asp:Button ID="Save" runat="server" Text="Save" class="btn btn-success btn-round col-sm-1" ValidationGroup="Location" OnClick="Save_Click" />
                            <asp:Button ID="Cancel" runat="server" Text="Cancel" class="btn btn-warning btn-round col-sm-1" style="margin-right: 0.5%;" />
                        </div>
                    </div>

                    <br />
                    <hr />

                    <div class="row col-md-12">
                        <!-- start of table -->
                        <div class="table-responsive">
                            <table id="issue-list-table" class="table dt-responsive width-100">
                                <thead class="text-left">
                                    <tr>
                                        <th><% = Treatment.Classes.FieldNames.getFieldName("BoardLocations-Expand", "Expand") %></th>
                                        <th><% = Treatment.Classes.FieldNames.getFieldName("BoardLocations-Actions", "Actions") %></th>
                                        <th><% = Treatment.Classes.FieldNames.getFieldName("BoardLocations-ArabicName", "Arabic Name") %></th>
                                        <th><% = Treatment.Classes.FieldNames.getFieldName("BoardLocations-EnglishName", "English Name") %></th>
                                        <th><% = Treatment.Classes.FieldNames.getFieldName("BoardLocations-LocationonMap", "Location on Map") %></th>
                                        <th><% = Treatment.Classes.FieldNames.getFieldName("BoardLocations-URLVideo", "URL Video") %></th>
                                        <th><% = Treatment.Classes.FieldNames.getFieldName("BoardLocations-ArabicDescription", "Arabic Description") %></th>
                                        <th><% = Treatment.Classes.FieldNames.getFieldName("BoardLocations-EnglishDescription", "English Description") %></th>
                                        
                                    </tr>
                                </thead>
                                <tbody class="text-left">
                                    <asp:Literal ID="txtLocations" runat="server"></asp:Literal>
                                </tbody>
                            </table>
                        </div>
                        <!-- end of table -->
                    </div>
                </div>

            </div>

            <!-- Basic Form Inputs card end -->
        </div>
    </div>

</asp:Content>
