﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="NewTreatment.aspx.cs" Inherits="Treatment.Pages.Treatment.NewTreatment" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>REU - Create Treatment</title>
    <!-- ckeditor.css-->
    <link rel="stylesheet" href="~/Theme\files\bower_components\ckeditor\samples\css\samples.css" />
    <link rel="stylesheet" href="~/Theme\files\bower_components\ckeditor\samples\toolbarconfigurator/lib/codemirror/neo.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <!-- Page-body start -->
    <div class="page-body">
        <!-- Article Editor card start -->
        <div class="card ScrollStyle">
            <div class="card-header">
                <div class="card-header-right">
                    <ul class="list-unstyled card-option">
                        <li><i class="feather icon-maximize full-card"></i></li>
                    </ul>
                </div>
            </div>
            <div class="card-block">
                <!-- Start Treatment Form-->
                <div class="row">
                    <div class="form-group col-sm-3">
                        <label>Treatment Date</label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-calendar"></i></span>
                            <asp:TextBox ID="treatmentDate" runat="server" class="form-control" placeholder="Enter Treatment Date" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="valTreatmentDate" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Treatment Date" ValidationGroup="valFormGroup" ControlToValidate="treatmentDate" Display="Dynamic" CssClass="col-form-label"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-3">
                        <label>Standard Procedure</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-edit-alt"></i></span>
                            <asp:DropDownList ID="standardProcedure" CssClass="js-example-basic-single form-control" runat="server" DataSourceID="EntityDataSourceTreatmentProcedure" DataTextField="Treatment_Procedure_Name_En" DataValueField="Treatment_Procedure_Id">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group col-sm-3">
                        <label>Prepared Management</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-stamp"></i></span>
                            <asp:DropDownList ID="preparedManagement" CssClass="js-example-basic-single col-sm-12" runat="server" DataSourceID="EntityDataSourceStructure" DataTextField="Structure_Name_En" DataValueField="Structure_Id">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group col-sm-3">
                        <label>Classification Subject</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-tack-pin"></i></span>
                            <asp:DropDownList ID="classificationSubject" CssClass="js-example-basic-single col-sm-12" runat="server" DataSourceID="EntityDataSourceTreatmentClass" DataTextField="Treatment_Class_Name_En" DataValueField="Treatment_Class_Id">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-6">
                        <label>Send To</label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-paper-plane"></i></span>
                            <asp:ListBox ID="treatmentTo" runat="server" CssClass="js-example-placeholder-multiple col-sm-12" data-placeholder="Choose Send To" DataSourceID="EntityDataSourceEmployee" DataTextField="Employee_Name_En" DataValueField="Employee_Id" SelectionMode="Multiple"></asp:ListBox>
                        </div>
                        <asp:RequiredFieldValidator ID="valTreatmentTo" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Send To" ValidationGroup="valFormGroup" ControlToValidate="treatmentTo" Display="Dynamic" CssClass="col-form-label"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-6">
                        <label>Copy To</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-ui-copy"></i></span>
                            <asp:ListBox ID="treatmentCopyTo" CssClass="js-example-placeholder-multiple col-sm-12" data-placeholder="Choose Copy To" runat="server" DataSourceID="EntityDataSourceEmployee" DataTextField="Employee_Name_En" DataValueField="Employee_Id" SelectionMode="Multiple"></asp:ListBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-12">
                        <label>Subject</label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-presentation-alt "></i></span>
                            <asp:TextBox ID="subjectTreatement" runat="server" placeholder="Enter Subject" TextMode="MultiLine" Rows="3" class="form-control"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="valSubjectTreatement" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Subject" ValidationGroup="valFormGroup" ControlToValidate="subjectTreatement" Display="Dynamic" CssClass="col-form-label"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-3">
                        <label>Type Treatment</label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-ui-tag"></i></span>
                            <asp:DropDownList ID="typeTreatment" CssClass="js-example-basic-single col-sm-12" runat="server" DataSourceID="EntityDataSourceTreatmentType" DataTextField="Treatment_Type_Name_En" DataValueField="Treatment_Type_Id">
                            </asp:DropDownList>
                        </div>
                        <asp:RequiredFieldValidator ID="valTypeTreatment" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Type Treatment" ValidationGroup="valFormGroup" ControlToValidate="typeTreatment" Display="Dynamic" CssClass="col-form-label"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-3">
                        <label>Secret Level</label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-safety"></i></span>
                            <asp:DropDownList ID="secretLevel" CssClass="js-example-basic-single col-sm-12" runat="server" DataSourceID="EntityDataSourceTreatmentConfidentiality" DataTextField="Treatment_Confidentiality_Name_En" DataValueField="Treatment_Confidentiality_Id">
                            </asp:DropDownList>
                        </div>
                        <asp:RequiredFieldValidator ID="valSecretLevel" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Secret Level" ValidationGroup="valFormGroup" ControlToValidate="secretLevel" Display="Dynamic" CssClass="col-form-label"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-3">
                        <label>Priority Level</label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-certificate-alt-2"></i></span>
                            <asp:DropDownList ID="priorityLevel" CssClass="js-example-basic-single col-sm-12" runat="server" DataSourceID="EntityDataSourceTreatmentPriority" DataTextField="Treatment_Priority_Name_En" DataValueField="Treatment_Priority_Id">
                            </asp:DropDownList>
                        </div>
                        <asp:RequiredFieldValidator ID="valPriorityLevel" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Priority Level" ValidationGroup="valFormGroup" ControlToValidate="priorityLevel" Display="Dynamic" CssClass="col-form-label"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-3">
                        <label>Speed Up</label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-speed-meter"></i></span>
                            <asp:DropDownList ID="speedUp" CssClass="js-example-basic-single col-sm-12" runat="server" DataSourceID="EntityDataSourceTreatmentDelivery" DataTextField="Treatment_Delivery_Name_En" DataValueField="Treatment_Delivery_Id">
                            </asp:DropDownList>
                        </div>
                        <asp:RequiredFieldValidator ID="valSpeedUp" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Speed Up" ValidationGroup="valFormGroup" ControlToValidate="speedUp" Display="Dynamic" CssClass="col-form-label"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-12">
                        <label>Speech</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-clip-board"></i></span>
                            <asp:TextBox ID="speech" runat="server" TextMode="MultiLine" Rows="3" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <!-- File upload card start -->
                <div class="row">
                    <div class="form-group col-sm-12">
                        <label>Add Attachments</label>
                        <asp:FileUpload ID="addAttachments" name="files[]" runat="server" multiple="multiple" class="form-control" />
                    </div>
                </div>
                <!-- File upload card end -->
                <div class="row">
                    <div class="form-group col-sm-3">
                        <label>Required Reply</label>
                        <div class="input-group">
                            <label class="j-checkbox-toggle">
                                <asp:TextBox ID="requiredReply" runat="server" class="js-single" type="checkbox"></asp:TextBox>
                            </label>
                        </div>
                    </div>
                    <div class="form-group col-sm-4">
                        <label>Reply Date</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-calendar"></i></span>
                            <asp:TextBox ID="replyDate" runat="server" class="form-control" placeholder="Enter Treatment Date" TextMode="SingleLine"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <!-- Start Grid View -->
                <div class="row">
                    <div class="form-group col-sm-12 table-responsive dt-responsive">
                        <label>Owner Relationship</label>
                        <dx:ASPxGridView ID="ownerShip" runat="server" DataSourceID="OwnerShipDataSource" Theme="Material" KeyFieldName="Owner_Id" Width="100%">
                            <SettingsCommandButton>
                                <NewButton Text=" ">
                                    <Styles>
                                        <Style CssClass="icofont icofont-plus text-primary h5">
                            </Style>
                                    </Styles>
                                </NewButton>
                                <UpdateButton Text=" ">
                                    <Styles>
                                        <Style CssClass="icofont icofont-save text-primary h5">
                            </Style>
                                    </Styles>
                                </UpdateButton>
                                <CancelButton Text=" ">
                                    <Styles>
                                        <Style CssClass="icofont icofont-ui-close text-warning h5">
                            </Style>
                                    </Styles>
                                </CancelButton>
                                <EditButton Text=" ">
                                    <Styles>
                                        <Style CssClass="icofont icofont-ui-edit text-info h5">
                            </Style>
                                    </Styles>
                                </EditButton>
                                <DeleteButton Text=" ">
                                    <Styles>
                                        <Style CssClass="icofont icofont-ui-delete text-danger h5">
                            </Style>
                                    </Styles>
                                </DeleteButton>
                            </SettingsCommandButton>
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Owner Name" FieldName="Owner_Name" ShowInCustomizationForm="True" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Owner Phone" FieldName="Owner_Phone" ShowInCustomizationForm="True" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Identity Type" FieldName="Identity_Type" ShowInCustomizationForm="True" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Identity Number" FieldName="Identity_Number" ShowInCustomizationForm="True" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="4" ButtonRenderMode="Link" ButtonType="Link">
                                </dx:GridViewCommandColumn>
                            </Columns>
                            <Styles>
                                <Header HorizontalAlign="Center" VerticalAlign="Middle">
                                </Header>
                            </Styles>
                        </dx:ASPxGridView>
                    </div>
                </div>
                <!-- End Grid View -->
                <div class="form-group col-sm-12 text-right">
                    <asp:Button ID="SaveTreatment" runat="server" Text="Save" CssClass="btn btn-primary" ValidationGroup="valFormGroup" OnClick="SaveTreatment_Click" />
                </div>
                <!-- End Treatment Form-->
            </div>
            <!-- Article Editor card end -->
        </div>
        </div>
        <!-- Page-body end -->
        <!-- Start Treatment Data Source-->
        <asp:EntityDataSource ID="EntityDataSourceStandardProcedure" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntitySetName="Permissions"></asp:EntityDataSource>
        <asp:EntityDataSource ID="OwnerShipDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Owner_Relationship" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
        <asp:EntityDataSource ID="EntityDataSourceAssignmentStatus" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Assignment_Status" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
        <asp:EntityDataSource ID="EntityDataSourcePreparedAdministration" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Prepared_Administration" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
        <asp:EntityDataSource ID="EntityDataSourceTreatmentClass" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Treatment_Class" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
        <asp:EntityDataSource ID="EntityDataSourceTreatmentConfidentiality" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Treatment_Confidentiality" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
        <asp:EntityDataSource ID="EntityDataSourceTreatmentDelivery" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Treatment_Delivery" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
        <asp:EntityDataSource ID="EntityDataSourceTreatmentPriority" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Treatment_Priority" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
        <asp:EntityDataSource ID="EntityDataSourceTreatmentProcedure" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Treatment_Procedure" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
        <asp:EntityDataSource ID="EntityDataSourceTreatmentStatus" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Treatment_Status" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
        <asp:EntityDataSource ID="EntityDataSourceTreatmentType" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Treatment_Type" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
        <asp:EntityDataSource ID="EntityDataSourceEmployee" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Employees" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
        <asp:EntityDataSource ID="EntityDataSourceStructure" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Structures" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
        <!-- End Treatment Data Source-->

        <!-- ckeditor.css-->
        <script src="..\..\..\..\Theme\files\bower_components\ckeditor\ckeditor.js"></script>
        <script src="..\..\..\..\Theme\files\bower_components\ckeditor\samples\js\sample.js"></script>
</asp:Content>


