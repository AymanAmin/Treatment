<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="TreatmentPriority.aspx.cs" Inherits="Treatment.Pages.Setting.TreatmentPriority" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Body_Holder" runat="server">

    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Priority Name</label>
        <div class="col-sm-5">
            <asp:TextBox ID="Name" runat="server" class="form-control form-control-round" placeholder="Treatment Name"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:Button ID="Save" runat="server" Text="Add Treatment" class="btn btn-primary btn-round" OnClick="Save_Click" />
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-4"></div>

    </div>
    <div class="form-group row">
        <div class="col-sm-12">
            <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" Theme="Mulberry" DataSourceID="PriorityDataSource" KeyFieldName="Treatment_Priority_Id" Width="608px">
                <Settings ShowGroupPanel="True" />
                <SettingsBehavior ConfirmDelete="True" />
                <SettingsDataSecurity AllowInsert="False" />
                <SettingsSearchPanel Visible="True" />
                <EditFormLayoutProperties>
                    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" />
                </EditFormLayoutProperties>
                <Columns>
                    <dx:GridViewCommandColumn ButtonType="Button" ShowCancelButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowUpdateButton="True" VisibleIndex="2">
                        <HeaderStyle VerticalAlign="Middle" />
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn Caption="ID" FieldName="Treatment_Priority_Id" ReadOnly="True" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Priority" FieldName="Treatment_Priority_Name" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <Styles AdaptiveDetailButtonWidth="22"></Styles>
            </dx:ASPxGridView>
        </div>
        <div class="col-sm-4">
            <asp:EntityDataSource ID="PriorityDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Treatment_Priority" EntityTypeFilter="Treatment_Priority">
            </asp:EntityDataSource>
        </div>
    </div>

</asp:Content>
