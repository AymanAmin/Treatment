<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="TreatmentManagement.aspx.cs" Inherits="Treatment.Pages.Setting.TreatmentManagement.TreatmentManagement" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("TreatmentManagement-Title", "ECMS - Treatment Management") %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="box-list" style="background-color: white;">
        <div class="row">

            <div class="col-lg-12">
                <div class="p-20 z-depth-bottom-0 waves-effect dt-responsive table-responsive" data-placement="top" title="Treatment Priority">
                    <h4 class="sub-title"><% = Treatment.Classes.FieldNames.getFieldName("TreatmentManagement-TreatmentPriority", "Treatment Priority") %></h4>
                    <p class="text-sm-left"><span>In Class Css use <code>icofont icofont-star text-success</code> And change <code>success</code> Based on color.</span>
                    <br />
                    <span>In Class Card use <code>card card-border-success</code> And change <code>success</code> Based on color.</span><br />
                    <br /></p><dx:ASPxGridView ID="PriorityGridView" runat="server" AutoGenerateColumns="False" Style="width: 100%" DataSourceID="PriorityDataSource" EnableTheming="True" KeyFieldName="Treatment_Priority_Id" Theme="Mulberry" OnRowDeleted="PriorityGridView_RowDeleted" OnRowInserted="PriorityGridView_RowInserted" OnRowUpdated="PriorityGridView_RowUpdated">
                        <SettingsCommandButton>
                            <NewButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-ui-add text-primary h6" VerticalAlign="Middle">
                                </Style>
                                </Styles>
                            </NewButton>
                            <EditButton Text=" ">
                                <Styles>
                                    <Style CssClass=" icofont icofont-ui-edit text-primary h6">
                                </Style>
                                </Styles>
                            </EditButton>
                            <DeleteButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-ui-delete text-danger h6">
                                </Style>
                                </Styles>
                            </DeleteButton>
                            <UpdateButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-save text-primary h6" VerticalAlign="Middle">
                                </Style>
                                </Styles>
                            </UpdateButton>

                            <CancelButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-ui-close text-warning h6" VerticalAlign="Middle">
                                </Style>
                                </Styles>
                            </CancelButton>
                        </SettingsCommandButton>
                        <Columns>
                            <dx:GridViewCommandColumn ButtonRenderMode="Link" ButtonType="Link" Caption="Action" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="5">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn Caption="Arabic Name" FieldName="Treatment_Priority_Name_Ar" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="English Name" FieldName="Treatment_Priority_Name_En" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Card Class" FieldName="Card_Class" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="CSS Class" FieldName="Css_Class" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="ID" FieldName="Treatment_Priority_Id" VisibleIndex="0" Width="10%">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:EntityDataSource ID="PriorityDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Treatment_Priority" EntityTypeFilter="Treatment_Priority">
                    </asp:EntityDataSource>
                </div>
            </div>

            <div class="col-lg-12">
                <div class="p-20 z-depth-bottom-0 waves-effect dt-responsive table-responsive" data-placement="top" title="Treatment Confidentiality">
                    <h4 class="sub-title"><% = Treatment.Classes.FieldNames.getFieldName("TreatmentManagement-TreatmentConfidentiality", "Treatment Confidentiality") %></h4>
                    <p class="text-sm-left"><span>In Class Css use <code>label label-success</code> And change <code>success</code> Based on color.</span></p><br />
                    <dx:ASPxGridView ID="ConfidentialityGridView" runat="server" AutoGenerateColumns="False" Style="width: 100%" DataSourceID="ConfidentialityDataSource" EnableTheming="True" KeyFieldName="Treatment_Confidentiality_Id" Theme="Mulberry" OnRowDeleted="ConfidentialityGridView_RowDeleted" OnRowInserted="ConfidentialityGridView_RowInserted" OnRowUpdated="ConfidentialityGridView_RowUpdated">
                        <SettingsBehavior ConfirmDelete="True" />
                        <SettingsCommandButton>
                            <NewButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-ui-add text-primary h6" VerticalAlign="Middle">
                                </Style>
                                </Styles>
                            </NewButton>
                            <EditButton Text=" ">
                                <Styles>
                                    <Style CssClass=" icofont icofont-ui-edit text-primary h6">
                                </Style>
                                </Styles>
                            </EditButton>
                            <DeleteButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-ui-delete text-danger h6">
                                </Style>
                                </Styles>
                            </DeleteButton>
                            <UpdateButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-save text-primary h6" VerticalAlign="Middle">
                                </Style>
                                </Styles>
                            </UpdateButton>

                            <CancelButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-ui-close text-warning h6" VerticalAlign="Middle">
                                </Style>
                                </Styles>
                            </CancelButton>
                        </SettingsCommandButton>
                        <Columns>
                            <dx:GridViewCommandColumn ButtonRenderMode="Link" ButtonType="Link" Caption="Action" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="4">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn Caption="Arabic Name" FieldName="Treatment_Confidentiality_Name_Ar" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="English Name" FieldName="Treatment_Confidentiality_Name_En" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="CSS Class" FieldName="Css_Class" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="ID" FieldName="Treatment_Confidentiality_Id" VisibleIndex="0">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:EntityDataSource ID="ConfidentialityDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Treatment_Confidentiality" EntityTypeFilter="Treatment_Confidentiality">
                    </asp:EntityDataSource>
                </div>
            </div>

            <div class="col-lg-12">
                <div class="p-20 z-depth-bottom-0 waves-effect dt-responsive table-responsive" data-placement="top" title="Treatment Type">
                    <h4 class="sub-title"><% = Treatment.Classes.FieldNames.getFieldName("TreatmentManagement-TreatmentType", "Treatment Type") %></h4>
                    <dx:ASPxGridView ID="TypeGridView" runat="server" AutoGenerateColumns="False" Style="width: 100%" DataSourceID="TypeDataSource" EnableTheming="True" KeyFieldName="Treatment_Type_Id" Theme="Mulberry" OnRowDeleted="TypeGridView_RowDeleted" OnRowInserted="TypeGridView_RowInserted" OnRowUpdated="TypeGridView_RowUpdated">
                        <SettingsEditing UseFormLayout="False">
                        </SettingsEditing>
                        <SettingsBehavior ConfirmDelete="True" />
                        <SettingsCommandButton>
                            <NewButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-ui-add text-primary h6" VerticalAlign="Middle">
                                </Style>
                                </Styles>
                            </NewButton>
                            <EditButton Text=" ">
                                <Styles>
                                    <Style CssClass=" icofont icofont-ui-edit text-primary h6">
                                </Style>
                                </Styles>
                            </EditButton>
                            <DeleteButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-ui-delete text-danger h6">
                                </Style>
                                </Styles>
                            </DeleteButton>
                            <UpdateButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-save text-primary h6" VerticalAlign="Middle">
                                </Style>
                                </Styles>
                            </UpdateButton>

                            <CancelButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-ui-close text-warning h6" VerticalAlign="Middle">
                                </Style>
                                </Styles>
                            </CancelButton>
                        </SettingsCommandButton>
                        <SettingsPopup>
                            <EditForm AllowResize="True" Modal="True" ShowPinButton="True" ShowShadow="True" VerticalAlign="WindowCenter">
                                <SettingsAdaptivity VerticalAlign="WindowCenter" />
                            </EditForm>
                        </SettingsPopup>
                        <StylesPopup>
                            <EditForm>
                                <Content CssClass="modal-body text-center">
                                </Content>
                                <Header CssClass="modal-title">
                                </Header>
                            </EditForm>
                        </StylesPopup>
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Arabic Name" FieldName="Treatment_Type_Name_Ar" VisibleIndex="1">
                                <PropertiesTextEdit Width="100%">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="English Name" FieldName="Treatment_Type_Name_En" VisibleIndex="2">
                                <PropertiesTextEdit Width="100%">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewCommandColumn ButtonRenderMode="Link" ButtonType="Link" Caption="Actions" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="3">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="Treatment_Type_Id" VisibleIndex="0" Caption="ID">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:EntityDataSource ID="TypeDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Treatment_Type" EntityTypeFilter="Treatment_Type">
                    </asp:EntityDataSource>
                </div>
            </div>

            <div class="col-lg-12">
                <div class="p-20 z-depth-bottom-0 waves-effect dt-responsive table-responsive" data-placement="top" title="Treatment Status">

                    <h4 class="sub-title"><% = Treatment.Classes.FieldNames.getFieldName("TreatmentManagement-TreatmentStatus", "Treatment Status") %> </h4>
                    <dx:ASPxGridView ID="StatusGridView" runat="server" AutoGenerateColumns="False" Style="width: 100%" DataSourceID="StatusDataSource" EnableTheming="True" KeyFieldName="Treatment_Status_Id" Theme="Mulberry" OnRowDeleted="StatusGridView_RowDeleted" OnRowInserted="StatusGridView_RowInserted" OnRowUpdated="StatusGridView_RowUpdated">
                        <SettingsCommandButton>
                            <NewButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-ui-add text-primary h6" VerticalAlign="Middle">
                                </Style>
                                </Styles>
                            </NewButton>
                            <EditButton Text=" ">
                                <Styles>
                                    <Style CssClass=" icofont icofont-ui-edit text-primary h6">
                                </Style>
                                </Styles>
                            </EditButton>
                            <DeleteButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-ui-delete text-danger h6">
                                </Style>
                                </Styles>
                            </DeleteButton>
                            <UpdateButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-save text-primary h6" VerticalAlign="Middle">
                                </Style>
                                </Styles>
                            </UpdateButton>

                            <CancelButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-ui-close text-warning h6" VerticalAlign="Middle">
                                </Style>
                                </Styles>
                            </CancelButton>
                        </SettingsCommandButton>
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Arabic Name" FieldName="Treatment_Status_Name_Ar" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="English Name" FieldName="Treatment_Status_Name_En" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewCommandColumn ButtonRenderMode="Link" ButtonType="Link" Caption="Action" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="3">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn Caption="ID" FieldName="Treatment_Status_Id" VisibleIndex="0">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:EntityDataSource ID="StatusDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Treatment_Status" EntityTypeFilter="Treatment_Status">
                    </asp:EntityDataSource>
                </div>
            </div>

            <div class="col-lg-12">
                <div class="p-20 z-depth-bottom-0 waves-effect dt-responsive table-responsive" data-placement="top" title="Treatment Procedure">
                    <h4 class="sub-title"><% = Treatment.Classes.FieldNames.getFieldName("TreatmentManagement-TreatmentProcedure", "Treatment Procedure") %> </h4>
                    <dx:ASPxGridView ID="ProcedureGridView" runat="server" AutoGenerateColumns="False" Style="width: 100%" DataSourceID="ProcedureDataSource" EnableTheming="True" KeyFieldName="Treatment_Procedure_Id" Theme="Mulberry" OnRowDeleted="ProcedureGridView_RowDeleted" OnRowInserted="ProcedureGridView_RowInserted" OnRowUpdated="ProcedureGridView_RowUpdated">
                        <SettingsCommandButton>
                            <NewButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-ui-add text-primary h6" VerticalAlign="Middle">
                                </Style>
                                </Styles>
                            </NewButton>
                            <EditButton Text=" ">
                                <Styles>
                                    <Style CssClass=" icofont icofont-ui-edit text-primary h6">
                                </Style>
                                </Styles>
                            </EditButton>
                            <DeleteButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-ui-delete text-danger h6">
                                </Style>
                                </Styles>
                            </DeleteButton>
                            <UpdateButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-save text-primary h6" VerticalAlign="Middle">
                                </Style>
                                </Styles>
                            </UpdateButton>

                            <CancelButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-ui-close text-warning h6" VerticalAlign="Middle">
                                </Style>
                                </Styles>
                            </CancelButton>
                        </SettingsCommandButton>
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Arabic Name" FieldName="Treatment_Procedure_Name_Ar" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="English Name" FieldName="Treatment_Procedure_Name_En" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewCommandColumn ButtonRenderMode="Link" ButtonType="Link" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="3">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="Treatment_Procedure_Id" VisibleIndex="0" Caption="ID">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:EntityDataSource ID="ProcedureDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Treatment_Procedure" EntityTypeFilter="Treatment_Procedure">
                    </asp:EntityDataSource>
                </div>
            </div>

            <div class="col-lg-12">
                <div class="p-20 z-depth-bottom-0 waves-effect dt-responsive table-responsive" data-placement="top" title="Treatment Delivery">
                    <h4 class="sub-title"><% = Treatment.Classes.FieldNames.getFieldName("TreatmentManagement-TreatmentDelivery", "Treatment Delivery") %></h4>
                    <dx:ASPxGridView ID="DeliveryGridView" runat="server" AutoGenerateColumns="False" Style="width: 100%" DataSourceID="DeliveryDataSource" EnableTheming="True" KeyFieldName="Treatment_Delivery_Id" Theme="Mulberry" OnRowDeleted="DeliveryGridView_RowDeleted" OnRowInserted="DeliveryGridView_RowInserted" OnRowUpdated="DeliveryGridView_RowUpdated">
                        <SettingsCommandButton>
                            <NewButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-ui-add text-primary h6" VerticalAlign="Middle">
                                </Style>
                                </Styles>
                            </NewButton>
                            <EditButton Text=" ">
                                <Styles>
                                    <Style CssClass=" icofont icofont-ui-edit text-primary h6">
                                </Style>
                                </Styles>
                            </EditButton>
                            <DeleteButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-ui-delete text-danger h6">
                                </Style>
                                </Styles>
                            </DeleteButton>
                            <UpdateButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-save text-primary h6" VerticalAlign="Middle">
                                </Style>
                                </Styles>
                            </UpdateButton>

                            <CancelButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-ui-close text-warning h6" VerticalAlign="Middle">
                                </Style>
                                </Styles>
                            </CancelButton>
                        </SettingsCommandButton>
                        <Columns>
                            <dx:GridViewCommandColumn ButtonRenderMode="Link" ButtonType="Link" Caption="Action" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="3">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn Caption="Arabic Name" FieldName="Treatment_Delivery_Name_Ar" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="English Name" FieldName="Treatment_Delivery_Name_En" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="ID" FieldName="Treatment_Delivery_Id" VisibleIndex="0">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:EntityDataSource ID="DeliveryDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Treatment_Delivery" EntityTypeFilter="Treatment_Delivery">
                    </asp:EntityDataSource>
                </div>
            </div>

            <div class="col-lg-12">
                <div class="p-20 z-depth-bottom-0 waves-effect dt-responsive table-responsive" data-placement="top" title="Treatment Class">
                    <h4 class="sub-title"><% = Treatment.Classes.FieldNames.getFieldName("TreatmentManagement-TreatmentClass", "Treatment Class") %></h4>
                    <dx:ASPxGridView ID="ClassGridView" runat="server" AutoGenerateColumns="False" Style="width: 100%" DataSourceID="ClassDataSource" EnableTheming="True" KeyFieldName="Treatment_Class_Id" Theme="Mulberry" OnRowDeleted="ClassGridView_RowDeleted" OnRowInserted="ClassGridView_RowInserted" OnRowUpdated="ClassGridView_RowUpdated">
                        <SettingsCommandButton>
                            <NewButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-ui-add text-primary h6" VerticalAlign="Middle">
                                </Style>
                                </Styles>
                            </NewButton>
                            <EditButton Text=" ">
                                <Styles>
                                    <Style CssClass=" icofont icofont-ui-edit text-primary h6">
                                </Style>
                                </Styles>
                            </EditButton>
                            <DeleteButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-ui-delete text-danger h6">
                                </Style>
                                </Styles>
                            </DeleteButton>
                            <UpdateButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-save text-primary h6" VerticalAlign="Middle">
                                </Style>
                                </Styles>
                            </UpdateButton>

                            <CancelButton Text=" ">
                                <Styles>
                                    <Style CssClass="icofont icofont-ui-close text-warning h6" VerticalAlign="Middle">
                                </Style>
                                </Styles>
                            </CancelButton>
                        </SettingsCommandButton>
                        <Columns>
                            <dx:GridViewCommandColumn ButtonRenderMode="Link" ButtonType="Link" Caption="Action" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="3">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn Caption="Arabic Name" FieldName="Treatment_Class_Name_Ar" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="English Name" FieldName="Treatment_Class_Name_En" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="ID" FieldName="Treatment_Class_Id" VisibleIndex="0">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:EntityDataSource ID="ClassDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Treatment_Class" EntityTypeFilter="Treatment_Class">
                    </asp:EntityDataSource>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
