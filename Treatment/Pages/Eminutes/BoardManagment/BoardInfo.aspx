<%@ Page Title="" Language="C#" MasterPageFile="~/EminutesMaster.Master" AutoEventWireup="true" CodeBehind="BoardInfo.aspx.cs" Inherits="Treatment.Pages.Eminutes.BoardManagment.BoardInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = Treatment.Classes.FieldNames.getFieldName("BoardInfo-Title", "Board Screen") %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_PlaceHolder" runat="server">

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
                        <div class="col-sm-6 mobile-inputs">
                            <h4 class="sub-title">Basic Info</h4>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Arabic Name</label>
                                <div class="col-sm-9 input-group">
                                <span class="input-group-addon changeIconColor"><i class="icofont icofont-ui-volume"></i></span>
                                <input type="text" class="form-control form-txt-primary " placeholder=""/>
                                    </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">English Name</label>
                                <div class="col-sm-9 input-group">
                                <span class="input-group-addon changeIconColor"><i class="icofont icofont-ui-volume"></i></span>
                                <input type="text" class="form-control form-txt-primary " placeholder=""/>
                                    </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Status of Board</label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-ui-volume"></i></span>
                                    <select name="select" class="form-control form-txt-primary ">
                                        <option value="opt1">Select Status</option>
                                        <option value="opt2">Status 1</option>
                                        <option value="opt3">Status 2</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Start Date</label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-ui-volume"></i></span>
                                <input type="date" class="form-control form-txt-primary "/>
                                    </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">End Date</label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-ui-volume"></i></span>
                                <input type="date" class="form-control form-txt-primary "/>
                                    </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Type of Board</label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-ui-volume"></i></span>
                                    <select name="select" class="form-control form-txt-primary ">
                                        <option value="opt1">Select Type</option>
                                        <option value="opt2">Type 2</option>
                                        <option value="opt3">Type 3</option>
                                    </select>
                                </div>
                            </div>
                           
                        </div>
                        <div class="col-sm-6 mobile-inputs">
                            <h4 class="sub-title">Addition Info</h4>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Classification</label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-ui-volume"></i></span>
                                    <select name="select" class="form-control form-txt-primary ">
                                        <option value="opt1">Select Classification</option>
                                        <option value="opt2">Class 1</option>
                                        <option value="opt3">Class 2</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Arabic Description</label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-ui-volume"></i></span>
                                    <textarea rows="5" cols="5" class="form-control form-txt-primary " placeholder=""></textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">English Description</label>
                                <div class="col-sm-9 input-group">
                                    <span class="input-group-addon changeIconColor"><i class="icofont icofont-ui-volume"></i></span>
                                    <textarea rows="5" cols="5" class="form-control form-txt-primary " placeholder=""></textarea>
                                </div>
                            </div>
                        </div>

                        <!-- button save , Update , Delete -->
                        <div class="col-sm-12 mobile-inputs" style="text-align:center">
                            <button class="btn btn-success btn-round col-sm-1">Save</button>
                            <button class="btn btn-warning btn-round col-sm-1">Cancel</button>
                        </div>
                    </div>
                </div>

            </div>

            <!-- Basic Form Inputs card end -->
        </div>
    </div>

</asp:Content>
