<%@ Page Title="" Language="C#" MasterPageFile="~/EminutesMaster.Master" AutoEventWireup="true" CodeBehind="BoardApprove.aspx.cs" Inherits="Treatment.Pages.Eminutes.BoardManagment.BoardApprove" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("BoardApprove-Title", "Board Approve") %></title>
    <style>
        a.disabled {
  /* Make the disabled links grayish*/
  color: gray !important;
  /* And disable the pointer events */
  pointer-events: none;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="row">
        <!-- Basic Form Inputs card start -->
        <div class="card col-md-12">
            <div class="card-header">
                <!--<h5>Basic Form Inputs</h5>
                    <span>Here you can create or update information about Board</span>-->

                <div class="card-header-right">
                    <i class="icofont icofont-spinner-alt-5"></i>
                </div>
            </div>
            <div class="card-block">
                <div class="col-md-12">
                    <!-- start of table -->
                    <div class="table-responsive">
                        <table id="issue-list-table" class="table dt-responsive width-100">
                            <thead class="text-left">
                                <tr>
                                    <th class="text-left"><% = Treatment.Classes.FieldNames.getFieldName("BoardApprove-Expand", "Expand") %></th>
                                    <th class="text-left"><% = Treatment.Classes.FieldNames.getFieldName("BoardApprove-Actions", "Actions") %></th>
                                    <th class="text-left"><% = Treatment.Classes.FieldNames.getFieldName("BoardApprove-Status", "Status") %></th>
                                    <th class="text-left"><% = Treatment.Classes.FieldNames.getFieldName("BoardApprove-ArabicName", "Arabic Name") %></th>
                                    <th class="text-left"><% = Treatment.Classes.FieldNames.getFieldName("BoardApprove-EnglishName", "English Name") %></th>
                                    <th class="text-left"><% = Treatment.Classes.FieldNames.getFieldName("BoardApprove-ArabicDescription", "Arabic Description") %></th>
                                    <th class="text-left"><% = Treatment.Classes.FieldNames.getFieldName("BoardApprove-EnglishDescription", "English Description") %></th>
                                </tr>
                            </thead>
                            <tbody class="text-left">
                                <asp:Literal ID="txtBoardsTable" runat="server"></asp:Literal>
                            </tbody>
                        </table>
                    </div>
                    <!-- end of table -->
                </div>
            </div>
        </div>
    </div>

</asp:Content>
