<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="TreatmentPriority.aspx.cs" Inherits="Treatment.Pages.Setting.TreatmentPriority" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Breadcrumb_Holder" runat="server">
    <div class="page-header">
        <div class="row align-items-end">
            <div class="col-lg-8">
                <div class="page-header-title">
                    <div class="d-inline">
                        <h4>Treatment</h4>
                        <span>Treament Priority</span>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="page-header-breadcrumb">
                    <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                            <a href="index.html"><i class="feather icon-home"></i></a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">Treament Priority</a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">Treament Priority</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="page-body">
        <!-- Article Editor card start -->
        <div class="card">
            <div class="card-header">
                <h5>Treament Priority Form</h5>
                <span>Add New </span>
                <div class="card-header-right">
                    <ul class="list-unstyled card-option">
                        <li><i class="feather icon-maximize full-card"></i></li>
                        <li><i class="feather icon-minus minimize-card"></i></li>
                        <li><i class="feather icon-trash-2 close-card"></i></li>
                    </ul>
                </div>
            </div>
            <div class="card-block">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Priority Name</label>
                    <div class="col-sm-5">
                        <asp:TextBox ID="Name" runat="server" class="form-control form-control-round" placeholder="Treatment Name"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-8">
                        <asp:Button ID="Save" runat="server" Text="Add Treatment" class="btn btn-primary btn-round" OnClick="Save_Click" />
                    </div>
                </div>
            </div>
        </div>
        <!-- Article Editor card end -->
    </div>
</asp:Content>
