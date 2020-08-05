<%@ Page Title="" Language="C#" MasterPageFile="~/EminutesMaster.Master" AutoEventWireup="true" CodeBehind="TopicInfo.aspx.cs" Inherits="Treatment.Pages.Eminutes.TopicManagment.TopicInfo" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("TopicInfo-Title", "Topic Screen") %></title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header">
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
                            <h4 class="sub-title"><% = Treatment.Classes.FieldNames.getFieldName("TopicInfo-BasicInfo", "Basic Info") %></h4>
                             <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("TopicInfo-MeetingName", "Meeting Name") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-underline primary"></i></span>
                                    <asp:TextBox ID="MeetingName" runat="server" class="form-control form-txt-primary " placeholder="" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9">
                                    <asp:RequiredFieldValidator ID="MeetingNameValidator" runat="server" ErrorMessage="Please enter Meeting Name" style="color:red" ControlToValidate="MeetingName" ValidationGroup="Topic" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("TopicInfo-ArabicName", "Arabic Name") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-underline primary"></i></span>
                                    <asp:TextBox ID="ArabicName" runat="server" class="form-control form-txt-primary" placeholder="Please enter arabic name"></asp:TextBox>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9">
                                    <asp:RequiredFieldValidator ID="ArabicNameValidator" runat="server" ErrorMessage="Please enter arabic name" style="color:red" ControlToValidate="ArabicName" ValidationGroup="Topic" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("TopicInfo-EnglishName", "English Name") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-underline primary"></i></span>
                                    <asp:TextBox ID="EnglishName" runat="server" class="form-control form-txt-primary " placeholder="Please enter english name"></asp:TextBox>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9">
                                    <asp:RequiredFieldValidator ID="EnglishNameValidator" runat="server" ErrorMessage="Please enter english name" style="color:red" ControlToValidate="EnglishName" ValidationGroup="Topic" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("TopicInfo-TopicStatus", "Topic Status") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-toggle-off primary"></i></span>
                                    <asp:DropDownList ID="TopicStatus" runat="server" class="form-control form-txt-primary "  DataTextField="M_Topic_Status_Name_En" DataValueField="M_Topic_Status_Id" DataSourceID="TopicStatusDataSource"></asp:DropDownList>
                                    <asp:EntityDataSource ID="TopicStatusDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableFlattening="False" EntitySetName="M_Topic_Status">
                                    </asp:EntityDataSource>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9">
                                    <asp:RequiredFieldValidator ID="StatusofTopicValidator" runat="server" ErrorMessage="Please select status" style="color:red" ControlToValidate="TopicStatus" ValidationGroup="Topic" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("TopicInfo-Structure", "Structure") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-toggle-off primary"></i></span>
                                    <asp:DropDownList ID="Structure" runat="server" class="form-control form-txt-primary "></asp:DropDownList>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("TopicInfo-ArabicDescription", "Arabic Description") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-clip-board primary"></i></span>
                                    <asp:TextBox ID="ArabicDescription" runat="server" class="form-control form-txt-primary " placeholder="Please enter arabic description" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9">
                                    <asp:RequiredFieldValidator ID="ArabicDescriptionValidator" runat="server" ErrorMessage="Please enter arabic description" style="color:red" ControlToValidate="ArabicDescription" ValidationGroup="Topic" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("TopicInfo-EnglishDescription", "English Description") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-clip-board primary"></i></span>
                                    <asp:TextBox ID="EnglishDescription" runat="server" class="form-control form-txt-primary" placeholder="Please enter english description" Rows="5" TextMode="MultiLine"></asp:TextBox>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9">
                                    <asp:RequiredFieldValidator ID="EnglishDescriptionValidator" runat="server" ErrorMessage="Please enter english description" style="color:red" ControlToValidate="EnglishDescription" ValidationGroup="Topic" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                        </div>
                        <div class="col-sm-6 mobile-inputs">
                            <h4 class="sub-title"><% = Treatment.Classes.FieldNames.getFieldName("TopicInfo-AdditionInfo", "Addition Info") %></h4>
                           
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("TopicInfo-ArabicRecommendation", "Arabic Recommendation") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-clip-board primary"></i></span>
                                    <asp:TextBox ID="ArabicRecommendation" runat="server" class="form-control form-txt-primary " placeholder="" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                </div>
                           
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("TopicInfo-EnglishRecommendation", "English Recommendation") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-clip-board primary"></i></span>
                                    <asp:TextBox ID="EnglishRecommendation" runat="server" class="form-control form-txt-primary " placeholder="" Rows="5" TextMode="MultiLine"></asp:TextBox>
                                </div>
                               
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("TopicInfo-ArabicRecommendationDocument", "Arabic Recommendation Document") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-clip-board primary"></i></span>
                                    <asp:TextBox ID="ArabicRecommendationDoc" runat="server" class="form-control form-txt-primary " placeholder="" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                </div>
                             
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label"><% = Treatment.Classes.FieldNames.getFieldName("TopicInfo-EnglishRecommendationDocument", "English Recommendation Document") %></label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-clip-board primary"></i></span>
                                    <asp:TextBox ID="EnglishRecommendationDoc" runat="server" class="form-control form-txt-primary " placeholder="" Rows="5" TextMode="MultiLine"></asp:TextBox>
                                </div>
                                
                            </div>
                        </div>

                        <div class="col-sm-12 mobile-inputs" style="text-align: center;margin-right: 47%;">
                            <asp:Button ID="Save" runat="server" Text="Save" class="btn btn-success btn-round col-sm-1"  ValidationGroup="Topic" OnClick="Save_Click" />
                            <asp:Button ID="Cancel" runat="server" Text="Cancel" class="btn btn-warning btn-round col-sm-1" style="margin-right: 0.5%;" />
                        </div>
                    </div>
                </div>

            </div>

            <!-- Basic Form Inputs card end -->
        </div>
    </div>
</asp:Content>
