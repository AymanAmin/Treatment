<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="Language.aspx.cs" Inherits="Treatment.Pages.Admin.Language" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Import Namespace="Treatment.Classes" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>ECMS - Language</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="row text-center">
        <% = Treatment.Classes.FieldNames.getFieldName("ProfilePic", "Default Name") %>
    </div>

    <div class="row">
        <dx:ASPxGridView Style="width: 100%" ID="LanguageGridView" runat="server" AutoGenerateColumns="False" DataSourceID="LanguageDataSource" EnableTheming="True" KeyFieldName="Language_Detial_ID" Theme="MetropolisBlue">
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
            <SettingsSearchPanel Visible="True" />
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
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="4" Caption="Action">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Language_Detial_ID" ReadOnly="True" VisibleIndex="0" Caption="ID">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Language_Detial_FieldName" VisibleIndex="2" Caption="Field Name">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Language_Detial_Value" VisibleIndex="3" Caption="Value">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Language Name" FieldName="Language_Master_ID" VisibleIndex="1">
                    <PropertiesComboBox DataSourceID="LanguageMasterDataSource" TextField="Language_Name" ValueField="ID">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <asp:EntityDataSource ID="LanguageDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Lanuage_Detials" EntityTypeFilter="Lanuage_Detials">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="LanguageMasterDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="LanguageMasters" EntityTypeFilter="LanguageMaster">
    </asp:EntityDataSource>
</asp:Content>
