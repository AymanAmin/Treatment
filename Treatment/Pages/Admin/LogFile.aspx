<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="LogFile.aspx.cs" Inherits="Treatment.Pages.Admin.LogFile" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>ECMS - LogFile</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="row table-responsive">
        <div class="options">
            <div class="options-item">
                <dx:ASPxCheckBox ID="chkSingleExpanded" runat="server" Text="Keep a single expanded row at a time"
                    AutoPostBack="true" OnCheckedChanged="chkSingleExpanded_CheckedChanged" Theme="DevEx" />
            </div>
        </div>
        <dx:ASPxGridView Style="width: 100%" ID="LogFileGridView" runat="server" DataSourceID="LogFileDataSource" EnableTheming="True" Theme="MetropolisBlue" AutoGenerateColumns="False" KeyFieldName="Log_Id">
            <SettingsDetail ShowDetailRow="True" />
            <SettingsAdaptivity>
                <AdaptiveDetailLayoutProperties>
                    <Items>
                        <dx:GridViewColumnLayoutItem>
                        </dx:GridViewColumnLayoutItem>
                    </Items>
                </AdaptiveDetailLayoutProperties>
            </SettingsAdaptivity>
            <SettingsPager PageSize="50">
            </SettingsPager>
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
            <SettingsSearchPanel Visible="True" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Log_Id" ReadOnly="True" VisibleIndex="0" Caption="ID">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Log_Date" VisibleIndex="3" Caption="Date">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Log_Name" VisibleIndex="4" Caption="Log Name">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Main Page" FieldName="Form_Id" VisibleIndex="1">
                    <PropertiesComboBox DataSourceID="PermissionDataSource" TextField="Permission_Name_En" ValueField="Permission_Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Login_Id" VisibleIndex="2" Caption="Employee">
                    <PropertiesComboBox DataSourceID="EmployeeDataSource" TextField="Employee_Name_En" ValueField="Employee_Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="Description" FieldName="Log_Description" ShowInCustomizationForm="True" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Templates>
                <DetailRow>
                    <dx:ASPxGridView ID="detailGrid" runat="server" EnableTheming="True" Theme="MetropolisBlue" DataSourceID="LogFileDataSourceDetails" KeyFieldName="Log_Id"
                        Width="100%" EnablePagingGestures="False" OnBeforePerformDataSelect="detailGrid_DataSelect" OnCustomUnboundColumnData="detailGrid_CustomUnboundColumnData">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Note" FieldName="Log_Note" VisibleIndex="1">
                                <PropertiesTextEdit>
                                    <Style Wrap="True"></Style>
                                </PropertiesTextEdit>
                                <CellStyle Wrap="True">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowFooter="False" />
                        <SettingsPager EnableAdaptivity="true" />
                        <Styles Header-Wrap="True" />

                    </dx:ASPxGridView>
                </DetailRow>
            </Templates>
            <SettingsDetail ShowDetailRow="true" />
        </dx:ASPxGridView>
        <asp:EntityDataSource ID="LogFileDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableFlattening="False" EntitySetName="Log_File" EntityTypeFilter="Log_File">
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="LogFileDataSourceDetails" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableFlattening="False" EntitySetName="Log_File" EntityTypeFilter="Log_File"  Select="" Where="it.Log_Id = @Log_ID_value" >
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Log_ID_value" SessionField="LogID" Type="Int32" />
            </WhereParameters>
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="EmployeeDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Employees" EntityTypeFilter="Employee" AutoGenerateOrderByClause="False" AutoGenerateWhereClause="False" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="PermissionDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Permissions">
        </asp:EntityDataSource>
    </div>
    
</asp:Content>
