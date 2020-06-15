<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="LogFile.aspx.cs" Inherits="Treatment.Pages.Admin.LogFile" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("LogFile-Title", "ECMS - Log File") %></title>
    <script>
        /* var str = 'data:{"Employees":[],"Permission_Group":[],"Group_Id":40,"Group_Name_Ar":"5","Group_Name_En":"5"}';
         var json = "["+str.slice(5)+"]";
         //alert(json);
 
         var col = [];
         for (var i = 0; i < json.length; i++) {
             for (var key in json[i]) {
                 if (col.indexOf(key) === -1) {
                     col.push(key);
                 }
             }
         }
         
         // CREATE DYNAMIC TABLE.
         var table = document.createElement("table");
         var tables = "<table><tr>";
         // CREATE HTML TABLE HEADER ROW USING THE EXTRACTED HEADERS ABOVE.
 
         var tr = table.insertRow(-1);                   // TABLE ROW.
 
         for (var i = 0; i < col.length; i++) {
             var th = document.createElement("th");      // TABLE HEADER.
             th.innerHTML = col[i];
             tr.appendChild(th);
             tables += "<th>" + col[i] + "</th>";
         }
         tables += "</tr><tr>";
         // ADD JSON DATA TO THE TABLE AS ROWS.
         for (var i = 0; i < json.length; i++) {
 
             tr = table.insertRow(-1);
 
             for (var j = 0; j < col.length; j++) {
                 var tabCell = tr.insertCell(-1);
                 tabCell.innerHTML = json[i][col[j]];
                 tables += "<td>" + json[i][col[j]] + "</td>";
             }
         }
         tables += "</tr></table>";
         //alert(tables);
         // FINALLY ADD THE NEWLY CREATED TABLE WITH JSON DATA TO A CONTAINER.
        /* var divContainer = document.getElementById("showData");
         divContainer.innerHTML = "";
         divContainer.appendChild(table);*/


        //setTimeout(function () { document.getElementById("header-div").style.display = "none"; }, 1);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="page-body">
        <!-- Article Editor card start -->
        <div class="card ScrollStyle ">
            <div class="card-header">
                <div class="card-header-right">
                    <ul class="list-unstyled card-option">
                        <li><i class="feather icon-maximize full-card"></i></li>
                    </ul>
                </div>
            </div>
            <div class="card-block">

                <div class="table-responsive">
                    <div class="options">
                        <div class="options-item">
                            <dx:ASPxCheckBox ID="chkSingleExpanded" runat="server" Text="Keep a single expanded row at a time"
                                AutoPostBack="true" OnCheckedChanged="chkSingleExpanded_CheckedChanged" Theme="DevEx" Checked="True" CheckState="Checked" />
                        </div>
                    </div>
                    <dx:ASPxGridView Style="width: 100%" ID="LogFileGridView" runat="server" DataSourceID="LogFileDataSource" EnableTheming="True" Theme="MetropolisBlue" AutoGenerateColumns="False" KeyFieldName="Log_Id" OnHtmlDataCellPrepared="LogFileGridView_HtmlDataCellPrepared">
                        <ClientSideEvents EndCallback="function(s, e) {
var div_target = document.getElementsByClassName(&quot;dx-wrap dxgv&quot;)[0];
	var str = div_target.innerHTML;
var obj= &quot;[&quot;+str.slice(5)+&quot;]&quot;;
var json= JSON.parse(obj);
        var col = [];
        for (var i = 0; i &lt; json.length; i++) {
            for (var key in json[i]) {
                if (col.indexOf(key) === -1) {
                    col.push(key);
                }
            }
        }
        
        // CREATE DYNAMIC TABLE.
        var table = document.createElement(&quot;table&quot;);
        var tables = &quot;&lt;div = class= 'dt-responsive table-responsive'&gt;&lt;table class='table table-striped table-bordered nowrap dataTable'&gt;&lt;thead&gt;&lt;tr&gt;&quot;;
        // CREATE HTML TABLE HEADER ROW USING THE EXTRACTED HEADERS ABOVE.

        var tr = table.insertRow(-1);                   // TABLE ROW.

        for (var i = 0; i &lt; col.length; i++) {
            var th = document.createElement(&quot;th&quot;);      // TABLE HEADER.
            th.innerHTML = col[i];
            tr.appendChild(th);
            tables += &quot;&lt;th&gt;&quot; + col[i] + &quot;&lt;/th&gt;&quot;;
        }
        tables += &quot;&lt;/tr&gt;&lt;/thead&gt;&lt;tbody&gt;&lt;tr class='even' style='background-color:white'&gt;&quot;;
        // ADD JSON DATA TO THE TABLE AS ROWS.
        for (var i = 0; i &lt; json.length; i++) {

            tr = table.insertRow(-1);

            for (var j = 0; j &lt; col.length; j++) {
                var tabCell = tr.insertCell(-1);
                tabCell.innerHTML = json[i][col[j]];
if ( json[i][col[j]] === &quot;&quot;) {
    tables += &quot;&lt;td&gt; Empty &lt;/td&gt;&quot;;

}else{
                tables += &quot;&lt;td&gt;&quot; + json[i][col[j]] + &quot;&lt;/td&gt;&quot;;
}
            }
        }
        tables += &quot;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/div&gt;&quot;;
document.getElementsByClassName(&quot;dx-wrap dxgv&quot;)[0].innerHTML = tables ;
&nbsp;&nbsp;&nbsp; }" />
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
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="Log_Date" VisibleIndex="3" Caption="Date" PropertiesDateEdit-EditFormat="DateTime" PropertiesDateEdit-DisplayFormatInEditMode="True" SortIndex="0" SortOrder="Descending">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                                <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy h:mm tt">
                                </PropertiesDateEdit>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="Log_Name" VisibleIndex="4" Caption="Log Name">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Main Page" FieldName="Form_Id" VisibleIndex="1">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                                <PropertiesComboBox DataSourceID="PermissionDataSource" TextField="Permission_Name_En" ValueField="Permission_Id">
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="Login_Id" VisibleIndex="2" Caption="Employee">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                                <PropertiesComboBox DataSourceID="EmployeeDataSource" TextField="Employee_Name_En" ValueField="Employee_Id">
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataTextColumn Caption="Description" FieldName="Log_Description" ShowInCustomizationForm="True" VisibleIndex="5">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
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
                    <asp:EntityDataSource ID="LogFileDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableFlattening="False" EntitySetName="Log_File" EntityTypeFilter="Log_File" Select="">
                    </asp:EntityDataSource>
                    <asp:EntityDataSource ID="LogFileDataSourceDetails" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableFlattening="False" EntitySetName="Log_File" EntityTypeFilter="Log_File" Select="" Where="it.Log_Id = @Log_ID_value">
                        <WhereParameters>
                            <asp:SessionParameter DefaultValue="0" Name="Log_ID_value" SessionField="LogID" Type="Int32" />
                        </WhereParameters>
                    </asp:EntityDataSource>
                    <asp:EntityDataSource ID="EmployeeDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EntitySetName="Employees" EntityTypeFilter="Employee" AutoGenerateOrderByClause="False" AutoGenerateWhereClause="False" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
                    </asp:EntityDataSource>
                    <asp:EntityDataSource ID="PermissionDataSource" runat="server" ConnectionString="name=ECMSEntities" DefaultContainerName="ECMSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Permissions">
                    </asp:EntityDataSource>
                </div>

            </div>
        </div>
    </div>


</asp:Content>
