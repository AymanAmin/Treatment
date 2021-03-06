﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;
using Website.Classes;

namespace Treatment.Pages.Treatment
{
    public partial class ShowTreatment : System.Web.UI.Page
    {
        ECMSEntities db;
        int treatmentId = 0, recoverParentid = 0, treatmentDetialId = 0, treatmentDetialParentBorderId = 0, tabId = 0, notificationMasterId = 0, attachmentMasterId = 0;
        string messageForm = "", messageReplyForm = "", messageAssignmentForm = "", yourHTMLStringTrack = "", detialAssingmentNote = "", _fileExt = "";
        int currentStructureUserId = 0, currentUserId = 0, marginTreeTrack = 0, DelegationStructureUserId = 0;
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        List<Treatment_Detial> treeTreatmentDetial;
        List<Treatment_Detial> doneTreatmentDetial;
        Treatment_Detial oneTreatmentDetial;
        Treatment_Detial recoverTreatmentDetial;
        Treatment_Detial isTreatmentDetialParent;
        bool isSecert = false, isPath = false, flayRequiredReply = false, flayBorder = false, isDelegation = false;
        List<Attachment> listAttachmentTrack;
        string treatmentDetialDate = "", isTrackBorder = "", langDir = "left", langMarg = "right";
        List<Employee_Structure> ListDelegationEmpStru = new List<Employee_Structure>();
        List<Structure> ListStructure = new List<Structure>();
        string langEmployeeName = "", langStructureName = "", langEmployeeNameMaster = "", langTreatmentProcedureName = "", langFrom = "", langProcedure = "", langWidth = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            reloadPage();
            if (IsPostBack)
            {
                if (Session["newTreatmentAss"] != null)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "newTreatmentAss();", true);
                Session["newTreatmentAss"] = null;
            }
            translateArabic();
        }

        private void reloadPage()
        {
            checkLogin();
            db = new ECMSEntities();
            treatmentId = 0; recoverParentid = 0; treatmentDetialId = 0; tabId = 0; notificationMasterId = 0;
            isSecert = false; isPath = false;
            currentUserId = SessionWrapper.LoggedUser.Employee_Id;
            currentStructureUserId = SessionWrapper.EmpStructure;
            if (SessionWrapper.LoggedUser.Language_id == 1) { langDir = "right"; langMarg = "left"; }
            else { langDir = "left"; langMarg = "right"; }
            isDelegation = getIsDelegation();
            ListDelegationEmpStru = getAllEmployeeStructure();
            if (int.TryParse(Request["getTreatmentId"], out treatmentId) && treatmentId > 0)
            {
                //treatmentDetialId = getTreatmentDetialId();
                //hiddenTreatmentId.Style["display"] = "none";
                //hiddenTreatmentId.Text = treatmentId.ToString();
                beforLoadTreatment();
                doneTreatmentDetial = new List<Treatment_Detial>();
                if (loadTreatment())
                {

                }
                else
                {

                }
                if (showTrackTreatment())
                {

                }
                else
                {

                }
                if (!IsPostBack)
                    fillDropDownListBox();
                if (fillAllStructure())
                {
                    getEmployeeTable();
                    getEmployeeTableCopy();
                    getEmployeeTree();
                    getEmployeeTreeCopy();
                }
                else
                {

                }
            }
            else
            {

            }
        }

        private void checkLogin()
        {
            if (SessionWrapper.LoggedUser != null)
            {
                if (SessionWrapper.IsLocked)
                    Response.Redirect("~/Pages/Setting/admin/LockScreen.aspx");
            }
            else
            {
                Response.Redirect("~/Pages/Setting/Auth/Login.aspx");
            }
        }

        private bool getIsDelegation()
        {
            bool flayDele = false;
            try
            {
                flayDele = (bool)db.Employee_Structure.First(x => x.Employee_Structure_Id == currentStructureUserId).Type_Delegation;
                return flayDele;
            }
            catch { return flayDele; }
        }

        private List<Employee_Structure> getAllEmployeeStructure()
        {
            List<Employee_Structure> listEpSt = new List<Employee_Structure>();
            List<Employee_Structure> listEpStRetrun = new List<Employee_Structure>();
            List<Employee_Structure> listEpSt1;
            try
            {
                listEpSt = db.Employee_Structure.Where(x => x.Employee_Delegation == currentStructureUserId).ToList<Employee_Structure>();
                listEpStRetrun.AddRange(listEpSt);
                int delgaEpStId = 0;
                for (int i = 0; i < listEpSt.Count; i++)
                {
                    if ((bool)listEpSt[i].Status_Structure && !(bool)listEpSt[i].Type_Delegation)
                    {
                        delgaEpStId = listEpSt[i].Employee_Structure_Id;
                        listEpSt1 = new List<Employee_Structure>();
                        listEpSt1 = db.Employee_Structure.Where(x => x.Employee_Delegation == delgaEpStId).ToList<Employee_Structure>();
                        listEpStRetrun.AddRange(listEpSt1);
                    }
                }
            }
            catch (Exception ee) { }
            return listEpStRetrun;
        }

        private int getIsDelegationDetailId()
        {
            Treatment_Detial treatmentDetialDel = new Treatment_Detial();
            //int delegationCurrent = 0;
            try
            {
                treatmentDetialDel = db.Treatment_Detial.FirstOrDefault(x => x.To_Employee_Structure_Id == currentStructureUserId && x.Treatment_Detial_Id == treatmentDetialId);
                if (treatmentDetialDel != null)
                    return currentStructureUserId;
                int delgEmpStrId = 0;
                for (int i = 0; i < ListDelegationEmpStru.Count; i++)
                {
                    treatmentDetialDel = new Treatment_Detial();
                    delgEmpStrId = ListDelegationEmpStru[i].Employee_Structure_Id;
                    treatmentDetialDel = db.Treatment_Detial.FirstOrDefault(x => x.To_Employee_Structure_Id == delgEmpStrId && x.Treatment_Detial_Id == treatmentDetialId);
                    if (treatmentDetialDel != null)
                        return delgEmpStrId;
                }
            }
            catch (Exception eexs) { }

            return 0;
        }

        private int getIsDelegationMasterId()
        {
            Treatment_Master TreatmentMasterDel = new Treatment_Master();
            //int delegationCurrent = 0;
            try
            {
                TreatmentMasterDel = db.Treatment_Master.FirstOrDefault(x => x.From_Employee_Structure_Id == currentStructureUserId && x.Treatment_Id == treatmentId);
                if (TreatmentMasterDel != null)
                    return currentStructureUserId;
                if (!isDelegation)
                {
                    int delgEmpStrId = 0;
                    for (int i = 0; i < ListDelegationEmpStru.Count; i++)
                    {
                        TreatmentMasterDel = new Treatment_Master();
                        delgEmpStrId = ListDelegationEmpStru[i].Employee_Structure_Id;
                        TreatmentMasterDel = db.Treatment_Master.FirstOrDefault(x => x.From_Employee_Structure_Id == delgEmpStrId && x.Treatment_Id == treatmentId);
                        if (TreatmentMasterDel != null)
                            return delgEmpStrId;
                    }
                }
            }
            catch (Exception eexs) { }

            return 0;
        }

        private void beforLoadTreatment()
        {
            if (treatmentId == 0)
            {
                Response.Redirect("~/Pages/Treatment/Inbox.aspx");
            }
            else
            {
                Treatment_Master isTreatment;
                try
                {
                    isTreatment = db.Treatment_Master.First(x => x.Treatment_Id == treatmentId);
                    if (int.TryParse(Request["getTabId"], out tabId) && tabId > 0)
                    {
                        if (tabId == 1 || tabId == 3 || tabId == 4)
                        {
                            if (int.TryParse(Request["getTreatmentDetialId"], out treatmentDetialId) && treatmentDetialId > 0)
                            {
                                DelegationStructureUserId = getIsDelegationDetailId();
                                if(DelegationStructureUserId == 0)
                                    Response.Redirect("~/Pages/Treatment/Inbox.aspx");

                                Treatment_Detial isTreatmentDetial = db.Treatment_Detial.First(x => x.To_Employee_Structure_Id == DelegationStructureUserId && x.Treatment_Detial_Id == treatmentDetialId);
                                treatmentDetialParentBorderId = (int)isTreatmentDetial.Parent;
                                Treatment_Master isTreatmentMasterDetial = db.Treatment_Master.FirstOrDefault(x => x.From_Employee_Structure_Id == DelegationStructureUserId && x.Treatment_Id == treatmentId);
                                if (isTreatmentMasterDetial != null)
                                    tabId = 2;
                                int sercuid = getSecretLevel();
                                if (sercuid == 1)
                                {
                                    secretLevel.SelectedValue = sercuid.ToString();
                                    secretLevel.Enabled = true;
                                }
                                else if (sercuid == 2 || sercuid == 3)
                                {
                                    secretLevel.SelectedValue = sercuid.ToString();
                                    secretLevel.Enabled = false;
                                }
                                //else Response.Redirect("~/Pages/Treatment/Inbox.aspx");

                                flayRequiredReply = false;
                                bool.TryParse(isTreatmentDetial.Treatment_Master.Required_Reply.ToString(), out flayRequiredReply);
                                if (flayRequiredReply)
                                {
                                    CloseAssignment.Enabled = false;
                                    CloseAssignment.CssClass = "btn btn-disabled btn-xs waves-effect waves-light";
                                    requiredReply.Attributes["readonly"] = "readonly";
                                    requiredReply.Attributes["disabled"] = "disabled";
                                    requiredReply.Checked = true;
                                }
                                else 
                                {
                                    CloseAssignment.Enabled = true;
                                    CloseAssignment.CssClass = "btn btn-danger btn-xs waves-effect waves-light";

                                    requiredReply.Checked = false;
                                }

                                if (int.TryParse(Request["getNotificationId"], out notificationMasterId) && notificationMasterId > 0)
                                {
                                    //actionReply.Style["display"] = "none";
                                    updatetReadNotification(notificationMasterId);
                                }

                                if (isTreatmentDetial.Treatment_Copy_To == true)
                                {
                                    //if(isTreatmentDetial.Assignment_Status_Id == 3)
                                    closeAssignmentTreatment(false);
                                    actionReply.Style["display"] = "none";
                                }

                                if (isTreatmentDetial.Assignment_Status_Id == 1)
                                {
                                    return;
                                }
                                else if (isTreatmentDetial.Assignment_Status_Id == 2)
                                {
                                    return;
                                }
                                else if (isTreatmentDetial.Assignment_Status_Id == 3)
                                {
                                    actionReply.Style["display"] = "none";
                                }

                                
                            }
                            else if (tabId == 4 && treatmentDetialId == 0)
                            {
                                DelegationStructureUserId = getIsDelegationMasterId();
                                if (DelegationStructureUserId == 0)
                                    Response.Redirect("~/Pages/Treatment/Inbox.aspx");
                                if (isTreatment.From_Employee_Structure_Id == DelegationStructureUserId)
                                {
                                    if (int.TryParse(Request["getNotificationId"], out notificationMasterId) && notificationMasterId > 0)
                                    {
                                        actionReply.Style["display"] = "none";
                                        updatetReadNotification(notificationMasterId);
                                        return;
                                    }
                                    else Response.Redirect("~/Pages/Treatment/Inbox.aspx");
                                }
                                else Response.Redirect("~/Pages/Treatment/Inbox.aspx");
                            }
                            else Response.Redirect("~/Pages/Treatment/Inbox.aspx");
                        }
                        else if(tabId == 2)
                        {
                            DelegationStructureUserId = getIsDelegationMasterId();
                            if (DelegationStructureUserId == 0)
                                Response.Redirect("~/Pages/Treatment/Inbox.aspx");
                            if (isTreatment.From_Employee_Structure_Id == DelegationStructureUserId)
                            {
                                treatmentDetialId = 0;
                                actionReply.Style["display"] = "none";
                                return;
                            }
                            else Response.Redirect("~/Pages/Treatment/Inbox.aspx");
                        }
                        
                    }
                    else Response.Redirect("~/Pages/Treatment/Inbox.aspx");

                }
                catch (Exception)
                {
                    Response.Redirect("~/Pages/Treatment/Inbox.aspx");
                }
            }
        }

        private int getSecretLevel()
        {
            int getSecretLevelId = 0;
            try
            {
                getSecretLevelId = (int)db.Treatment_Detial.First(x => x.Treatment_Detial_Id == treatmentDetialId).Treatment_Master.Treatment_Confidentiality_Id;
            }
            catch (Exception)
            {
            }
            return getSecretLevelId;
        }

        private bool loadTreatment()
        {
            try
            {
                var showTreatment = db.Treatment_Master.First(x => x.Treatment_Id == treatmentId);
                if (SessionWrapper.LoggedUser.Language_id == 1)
                {
                    speech.InnerHtml = showTreatment.Treatment_Body;
                    subject.InnerText = showTreatment.Treatment_Subject;
                    treatmentDate.InnerText = showTreatment.Create_Date.ToString();
                    treatmentProcedure.InnerText = showTreatment.Treatment_Procedure.Treatment_Procedure_Name_Ar;
                    treatmentManagement.InnerText = showTreatment.Structure.Structure_Name_Ar;
                    treatmentClassification.InnerText = showTreatment.Treatment_Class.Treatment_Class_Name_Ar;
                    treatmentType.InnerText = showTreatment.Treatment_Type.Treatment_Type_Name_Ar;
                    treatmentSecret.InnerHtml = "<label class='" + showTreatment.Treatment_Confidentiality.Css_Class + "'>" + showTreatment.Treatment_Confidentiality.Treatment_Confidentiality_Name_Ar + "</label>";
                    treatmentPriority.InnerHtml = "<a href='#!' data-toggle='tooltip' data-placement='top' data-trigger='hover' title='" + showTreatment.Treatment_Priority.Treatment_Priority_Name_Ar + "'>" +
                                                         "<i class='" + showTreatment.Treatment_Priority.Css_Class + "'></i>" +
                                                    "</a>&nbsp;" + showTreatment.Treatment_Priority.Treatment_Priority_Name_Ar;
                    treatmentSpeedUp.InnerText = showTreatment.Treatment_Delivery.Treatment_Delivery_Name_Ar;
                   // treatmentStatus.InnerText = showTreatment.Treatment_Status.Treatment_Status_Name_Ar;
                    if ((bool)showTreatment.Required_Reply)
                    {
                        DateTime yourDate = (DateTime)showTreatment.Required_Reply_Date;
                        var ts = new TimeSpan(yourDate.Ticks - DateTime.Now.Ticks);
                        string requiredReplyDate = "";
                        if (ts.Hours > 0)
                            requiredReplyDate = "<div class='row m-l-20'>" +
                                                        "<div class='col-xs-12'>" +
                                                            "<h2>" + ts.Days + "&nbsp;&nbsp;&nbsp;</h2>" +
                                                            "<p>ايام&nbsp;&nbsp;&nbsp;&nbsp;</p>" +
                                                        "</div>" +
                                                        "<div class='col-xs-12'>" +
                                                            "<h2>" + ts.Hours + "&nbsp;&nbsp;&nbsp;</h2>" +
                                                            "<p>ساعات&nbsp;&nbsp;&nbsp;&nbsp;</p>" +
                                                        "</div>" +
                                                    "</div>";
                        else
                            requiredReplyDate = "<div class='row m-l-20'>" +
                                                    "<div class='col-xs-12'>" +
                                                        "<h2>" + yourDate.ToShortDateString().ToString() + "&nbsp;&nbsp;&nbsp;</h2>" +
                                                    "</div>" +
                                                "</div>";

                        counterDateAgo.InnerHtml = requiredReplyDate;
                    }
                    else
                    {
                        //hide div
                        divRequiredReply.Style["display"] = "none";
                    }
                }
                else
                {
                    speech.InnerHtml = showTreatment.Treatment_Body;
                    subject.InnerText = showTreatment.Treatment_Subject;
                    treatmentDate.InnerText = showTreatment.Create_Date.ToString();
                    treatmentProcedure.InnerText = showTreatment.Treatment_Procedure.Treatment_Procedure_Name_En;
                    treatmentManagement.InnerText = showTreatment.Structure.Structure_Name_En;
                    treatmentClassification.InnerText = showTreatment.Treatment_Class.Treatment_Class_Name_En;
                    treatmentType.InnerText = showTreatment.Treatment_Type.Treatment_Type_Name_En;
                    treatmentSecret.InnerHtml = "<label class='" + showTreatment.Treatment_Confidentiality.Css_Class + "'>" + showTreatment.Treatment_Confidentiality.Treatment_Confidentiality_Name_En + "</label>";
                    treatmentPriority.InnerHtml = "<a href='#!' data-toggle='tooltip' data-placement='top' data-trigger='hover' title='" + showTreatment.Treatment_Priority.Treatment_Priority_Name_En + "'>" +
                                                         "<i class='" + showTreatment.Treatment_Priority.Css_Class + "'></i>" +
                                                    "</a>&nbsp;" + showTreatment.Treatment_Priority.Treatment_Priority_Name_En;
                    treatmentSpeedUp.InnerText = showTreatment.Treatment_Delivery.Treatment_Delivery_Name_En;
                    //treatmentStatus.InnerText = showTreatment.Treatment_Status.Treatment_Status_Name_En;
                    if ((bool)showTreatment.Required_Reply)
                    {
                        DateTime yourDate = (DateTime)showTreatment.Required_Reply_Date;
                        var ts = new TimeSpan(yourDate.Ticks - DateTime.Now.Ticks);
                        string requiredReplyDate = "";
                        if (ts.Hours > 0)
                            requiredReplyDate = "<div class='row m-l-20'>" +
                                                        "<div class='col-xs-3'>" +
                                                            "<h2>" + ts.Days + "&nbsp;&nbsp;&nbsp;</h2>" +
                                                            "<p>Days&nbsp;&nbsp;&nbsp;&nbsp;</p>" +
                                                        "</div>" +
                                                        "<div class='col-xs-3'>" +
                                                            "<h2>" + ts.Hours + "&nbsp;&nbsp;&nbsp;</h2>" +
                                                            "<p>Hours&nbsp;&nbsp;&nbsp;&nbsp;</p>" +
                                                        "</div>" +
                                                    "</div>";
                        else
                            requiredReplyDate = "<div class='row m-l-20'>" +
                                                    "<div class='col-xs-3'>" +
                                                        "<h2>" + yourDate.ToShortDateString().ToString() + "&nbsp;&nbsp;&nbsp;</h2>" +
                                                    "</div>" +
                                                "</div>";

                        counterDateAgo.InnerHtml = requiredReplyDate;
                    }
                    else
                    {
                        //hide div
                        divRequiredReply.Style["display"] = "none";
                    }
                }
                if (loadSendToCopyTo())
                {

                }
                else
                {

                }
                if (loadDownloadAttachment())
                {

                }
                else
                {

                }
                if (changeReadAndStatus())
                {

                }
                else
                {

                }
                return true;
            }
            catch (Exception eee) { return false; }
        }

        private bool loadSendToCopyTo()
        {
            using (ECMSEntities db = new ECMSEntities())
            {
                try
                {
                    string yourHTMLstring = "";
                    List<Treatment_Detial> treatmentDetial = new List<Treatment_Detial>();
                    treatmentDetial = db.Treatment_Detial.Where(x => x.Treatment_Id == treatmentId).ToList<Treatment_Detial>();
                    string langEmployeeName = "", langStructureName = "";
                    for (int i = 0; i < treatmentDetial.Count; i++)
                    {
                        if (SessionWrapper.LoggedUser.Language_id == 1)
                        {
                            langEmployeeName = treatmentDetial[i].Employee_Structure.Employee.Employee_Name_Ar;
                            langStructureName = treatmentDetial[i].Employee_Structure.Structure.Structure_Name_Ar;
                        }
                        else
                        {
                            langEmployeeName = treatmentDetial[i].Employee_Structure.Employee.Employee_Name_En;
                            langStructureName = treatmentDetial[i].Employee_Structure.Structure.Structure_Name_En;
                        }
                        yourHTMLstring = "<div class='media'>" +
                                            "<div class='media-left media-middle photo-table'>" +
                                               "<a href='#'>" +
                                                    "<img class='img-radius' src='../../../../media/Profile/" + treatmentDetial[i].Employee_Structure.Employee.Employee_Profile + "' alt='employee'>" +
                                                "</a>" +
                                            "</div>" +
                                            "<div class='media-body col-xs-12'>" +
                                                "<h6 class='d-inline-block'>" + langEmployeeName + getWorkDelegation((bool)treatmentDetial[i].Employee_Structure.Type_Delegation) + "</h6>" +
                                                "<div class='f-13 text-muted m-b-10'>" + langStructureName + "</div>" +
                                            "</div>" +
                                        "</div>";
                        if ((bool)treatmentDetial[i].Treatment_Copy_To)
                            copyToTreatment.Controls.Add(new LiteralControl(yourHTMLstring));
                        else
                            sendToTreatment.Controls.Add(new LiteralControl(yourHTMLstring));
                    }
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                    {
                        langEmployeeName = treatmentDetial[0].Treatment_Master.Employee_Structure.Employee.Employee_Name_Ar;
                        langStructureName = treatmentDetial[0].Treatment_Master.Employee_Structure.Structure.Structure_Name_Ar;
                    }
                    else
                    {
                        langEmployeeName = treatmentDetial[0].Treatment_Master.Employee_Structure.Employee.Employee_Name_En;
                        langStructureName = treatmentDetial[0].Treatment_Master.Employee_Structure.Structure.Structure_Name_En;
                    }
                    yourHTMLstring = "<div class='media'>" +
                                            "<div class='media-left media-middle photo-table'>" +
                                               "<a href='#'>" +
                                                    "<img class='img-radius' src='../../../../media/Profile/" + treatmentDetial[0].Treatment_Master.Employee_Structure.Employee.Employee_Profile + "' alt='employee'>" +
                                                "</a>" +
                                            "</div>" +
                                            "<div class='media-body col-xs-12'>" +
                                                "<h6 class='d-inline-block'>" + langEmployeeName + getWorkDelegation((bool)treatmentDetial[0].Treatment_Master.Employee_Structure.Type_Delegation) + "</h6>" +
                                                "<div class='f-13 text-muted m-b-10'>" + langStructureName + "</div>" +
                                            "</div>" +
                                        "</div>";
                    createByTreatment.Controls.Add(new LiteralControl(yourHTMLstring));
                    return true;
                }
                catch (Exception eee) { return false; }
            }
        }

        private string getWorkDelegation(bool flayDelegation)
        {
            string workDelegation = "";
            if (flayDelegation)
            {
                if(SessionWrapper.LoggedUser.Language_id == 1)
                    workDelegation = " <label class='badge badge-inverse-danger'> مفوض </label> ";
                else workDelegation = " <label class='badge badge-inverse-danger'> Delegation </label> ";
            }
            return workDelegation;
        }
        private bool changeReadAndStatus()
        {
            try
            {
                var changeTreatmentDetial = db.Treatment_Detial.First(x => x.Treatment_Detial_Id == treatmentDetialId);
                if (!(bool)changeTreatmentDetial.Is_Read)
                {
                    changeTreatmentDetial.Read_Date = DateTime.Now;
                    changeTreatmentDetial.Is_Read = true;
                    changeTreatmentDetial.Assignment_Status_Id = 2;
                    db.Entry(changeTreatmentDetial).State = EntityState.Modified;
                    db.SaveChanges();
                    //LogData = "data:" + JsonConvert.SerializeObject(newReplyTreatment, logFileModule.settings);
                    //logFileModule.logfile(5, "إضافة رد علي معاملة", "", LogData);
                }
            }
            catch { messageForm = "Erorr to save data in system"; return false; }
            return true;
        }

        private bool loadDownloadAttachment()
        {
            try
            {
                string yourHTMLstring = "";
                List<Attachment> treatmentAttachment = new List<Attachment>();
                treatmentAttachment = db.Attachments.Where(x => x.Treatment_Id == treatmentId).ToList<Attachment>();
                for (int i = 0; i < treatmentAttachment.Count; i++)
                {
                    _fileExt = System.IO.Path.GetExtension(treatmentAttachment[i].Attachment_Name);
                    yourHTMLstring = "<div class='col-md-6 col-xl-3'>" +
                                        "<div class='card thumb-block'>" +
                                            "<a href='../../../../media/Treatment/" + treatmentAttachment[i].Attachment_Path + "' target='_blank'>" +
                                                getFileImages(_fileExt) +
                                            "</a>"+
                                            "<div class='card-footer text-center'>"+
                                                "<a href='../../../../media/Treatment/" + treatmentAttachment[i].Attachment_Path + "' target='_blank'>" + treatmentAttachment[i].Attachment_Name + "</a>" +
                                            "</div>"+
                                        "</div>"+
                                    "</div>";

                    downloadAttachment.Controls.Add(new LiteralControl(yourHTMLstring));
                }
                
            }
            catch { messageForm = "Erorr to save data in system"; return false; }
            return true;
        }

        private string getFileImages(string fileExtention)
        {
            string getImageExtention = "";
            if (fileExtention == ".pdf")
                getImageExtention = "<span class='jFiler-icon-file f-file f-image'><i class='icofont icofont-file-pdf'></i></span>";
            else if (fileExtention == ".png" || fileExtention == ".jpeg" || fileExtention == ".jpg" || fileExtention == ".jpe")
                getImageExtention = "<span class='jFiler-icon-file f-file f-image' style='background-color: rgb(18, 132, 161);'><i class='icofont icofont-ui-image'></i></span>";
            else if (fileExtention == ".doc" || fileExtention == ".docx")
                getImageExtention = "<span class='jFiler-icon-file f-file f-video'><i class='icofont icofont-file-word'></i></span>";
            else if (fileExtention == ".ppt" || fileExtention == ".pptx")
                getImageExtention = "<span class='jFiler-icon-file f-file f-image' style='background-color: #ffc107;'><i class='icofont icofont-file-powerpoint'></i></span>";
            else if (fileExtention == ".xls" || fileExtention == ".xlsx")
                getImageExtention = "<span class='jFiler-icon-file f-file f-image' style='background-color: rgb(33, 200, 114);'><i class='icofont icofont-file-excel'></i></span>";
            else if (fileExtention == ".txt")
                getImageExtention = "<span class='jFiler-icon-file f-file f-image' style='background-color: rgb(191, 47, 139);'><i class='icofont icofont-file-text'></i></span>";
            else
                getImageExtention = "<span class='jFiler-icon-file f-file f-file-ext-doc' style='background-color: rgb(56, 78, 83);'>"+fileExtention+"</span>";
           
            return getImageExtention;
        }
        protected void SaveReply_Click(object sender, EventArgs e)
        {
            if (saveReplyTreatment())
            {
                if(SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'left', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  حالة الحفظ : ','  تم حفظ الرد بنجاح في النظام');", true);
                else Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  Your Reply was Sucessfully saved in system');", true);
                clearReplyTreatment();
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
            else
            {
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'left', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  حالة الحفظ : ','" + messageReplyForm + "');", true);
                else Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','" + messageReplyForm + "');", true);
            }
        }

        private bool saveReplyTreatment()
        {
            if (validationReplyForm())
            {
                try
                {
                    //db.Configuration.LazyLoadingEnabled = false;
                    var newReplyTreatment = db.Treatment_Detial.First(x => x.Treatment_Detial_Id == treatmentDetialId);
                    newReplyTreatment.Treatment_Detial_Date = DateTime.Now;
                    newReplyTreatment.Note = replyTreatement.Text;
                    newReplyTreatment.Key_Word = keyworkTreatment.Text;
                    newReplyTreatment.Assignment_Status_Id = 3;
                    newReplyTreatment.To_Employee_Structure_Id = currentStructureUserId;
                    db.Entry(newReplyTreatment).State = EntityState.Modified;
                    db.SaveChanges();
                    string linkNotif = "../../../../Pages/Treatment/ShowTreatment.aspx?getTreatmentId=" + treatmentId + "&getTabId=4&getTreatmentDetialId=" + newReplyTreatment.Parent + "&getNotificationId=";
                    int notifSendTo = (int)newReplyTreatment.Treatment_Master.From_Employee_Structure_Id;
                    if (insertNotification(replyTreatement.Text, replyTreatement.Text, newReplyTreatment.Treatment_Master.Treatment_Id, linkNotif, notifSendTo,2))
                    {

                    }
                    else
                    {

                    }
                    
                    //LogData = "data:" + JsonConvert.SerializeObject(newReplyTreatment, logFileModule.settings);
                    //logFileModule.logfile(1009, "إضافة رد علي معاملة", "add Reply Treatment", LogData);
                }
                catch {
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        messageReplyForm = "حدث خطأ في حفظ البيانات";
                    else messageReplyForm = "Erorr to save data in system";  
                    
                    return false; 
                
                }
                return true;
            }
            else
            {
                return false;
            }
        }

        private bool validationReplyForm()
        {
            if (replyTreatement.Text.Trim() == "")
            {
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    messageReplyForm = "الرجاء إدخال الرد";
                else messageReplyForm = "Pleace Enter Reply";
                return false;
            }
            return true;
        }

        private void clearReplyTreatment()
        {
            replyTreatement.Text = "";
            keyworkTreatment.Text = "";
            actionReply.Style["display"] = "none";
        }

        protected void SaveAssignment_Click(object sender, EventArgs e)
        {
            if (saveAssignmentTreatment())
            {
                if(SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'left', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  حالة الحفظ : ','  تم حفظ الإحالة بنجاح في النظام');", true);
                else Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  Your Assignment was Sucessfully saved in system');", true);
                clearAssignmentTreatment();
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
            else
            {
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'left', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  حالة الحفظ : ','" + messageAssignmentForm + "');", true);
                else Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','" + messageAssignmentForm + "');", true);
            }
        }

        private void clearAssignmentTreatment()
        {
            requiredAssignment.Text = "";
            treatmentTo.ClearSelection();
            treatmentCopyTo.ClearSelection();
            keyworkAssignment.Text = "";
            standardProcedure.ClearSelection();
            secretLevel.ClearSelection();
            actionReply.Style["display"] = "none";
        }

        private bool saveAssignmentTreatment()
        {
            if (validationAssignmentForm())
            {
                try
                {
                    //db.Configuration.LazyLoadingEnabled = false;
                    var newAssignmentTreatment = db.Treatment_Master.Create();
                    newAssignmentTreatment.Create_Date = DateTime.Now;
                    newAssignmentTreatment.Update_Date = DateTime.Now;
                    newAssignmentTreatment.Treatment_Date = DateTime.Now;
                    newAssignmentTreatment.Treatment_Procedure_Id = int.Parse(standardProcedure.SelectedValue);
                    newAssignmentTreatment.Treatment_Confidentiality_Id = int.Parse(secretLevel.SelectedValue);
                    newAssignmentTreatment.Treatment_Keywork = keyworkAssignment.Text;
                    newAssignmentTreatment.Treatment_Subject = requiredAssignment.Text;
                    newAssignmentTreatment.Treatment_Status_Id = 2;
                    newAssignmentTreatment.Treatment_Priority_id = db.Treatment_Master.FirstOrDefault(x => x.Treatment_Id == treatmentId).Treatment_Priority_id;
                    newAssignmentTreatment.Treatment_Mother = treatmentId;
                    newAssignmentTreatment.Treatment_Number = getAssignmentNumber();
                    newAssignmentTreatment.From_Employee_Structure_Id = currentStructureUserId;
                    newAssignmentTreatment.Required_Reply = requiredReply.Checked;
                    if(requiredReply.Checked)
                        newAssignmentTreatment.Required_Reply_Date = DateTime.Parse(replyDate10.Value);
                    /////////////////////////////////////// Start Insert Send To /////////////////////////////////////
                    Treatment_Detial treatmentDetial;
                    var selectedItemsTreatmentTo = from li in treatmentTo.Items.Cast<ListItem>()
                                                   where li.Selected == true
                                                   select li;
                    foreach (var itemTreatmentTo in selectedItemsTreatmentTo)
                    {
                        treatmentDetial = new Treatment_Detial();
                        treatmentDetial.To_Employee_Structure_Id = int.Parse(itemTreatmentTo.Value);
                        treatmentDetial.Parent = treatmentDetialId;
                        treatmentDetial.Assignment_Status_Id = 1;
                        treatmentDetial.Is_Read = false;
                        treatmentDetial.Is_Delete = false;
                        treatmentDetial.Treatment_Copy_To = false;
                        newAssignmentTreatment.Treatment_Detial.Add(treatmentDetial);

                    }
                    /////////////////////////////////////// End Insert Send To /////////////////////////////////////

                    /////////////////////////////////////// Start Insert Copy To /////////////////////////////////////
                    var selectedItemsTreatmentCopyTo = from li in treatmentCopyTo.Items.Cast<ListItem>()
                                                       where li.Selected == true
                                                       select li;
                    foreach (var itemTreatmentCopyTo in selectedItemsTreatmentCopyTo)
                    {
                        treatmentDetial = new Treatment_Detial();
                        treatmentDetial.To_Employee_Structure_Id = int.Parse(itemTreatmentCopyTo.Value);
                        treatmentDetial.Parent = treatmentDetialId;
                        treatmentDetial.Assignment_Status_Id = 1;
                        treatmentDetial.Is_Read = false;
                        treatmentDetial.Is_Delete = false;
                        treatmentDetial.Treatment_Copy_To = true;
                        newAssignmentTreatment.Treatment_Detial.Add(treatmentDetial);
                    }
                    /////////////////////////////////////// End Insert Copy To /////////////////////////////////////


                    db.Treatment_Master.Add(newAssignmentTreatment);
                    db.SaveChanges();

                    /////////////////////////////////////// Start Add Attachment /////////////////////////////////////
                    Attachment addAtachtmentTreatment;
                    foreach (HttpPostedFile postfiles in addAttachments1111.PostedFiles)
                    {
                        if (postfiles.ContentLength > 0 && postfiles.FileName != "")
                        {
                            addAtachtmentTreatment = new Attachment();
                            addAtachtmentTreatment.Attachment_Path = UploadFile(postfiles);
                            addAtachtmentTreatment.Attachment_Name = postfiles.FileName;
                            addAtachtmentTreatment.Treatment_Id = newAssignmentTreatment.Treatment_Id;
                            addAtachtmentTreatment.Attachment_Type = 2;
                            db.Attachments.Add(addAtachtmentTreatment);
                            db.SaveChanges();
                        }
                    }
                    /////////////////////////////////////// End Add Attachment /////////////////////////////////////
                    if (insertNotification(newAssignmentTreatment.Treatment_Id)) { }

                    //LogData = "data:" + JsonConvert.SerializeObject(newAssignmentTreatment, logFileModule.settings);
                    //logFileModule.logfile(1009, "إضافة إحالة", "add Assignment", LogData);
                    if (!flayRequiredReply)
                    {
                        if (!closeAssignmentTreatment(false))
                        {
                            if(SessionWrapper.LoggedUser.Language_id == 1)
                                messageAssignmentForm = "حدث خطأ أثناء إغلاق الإحالة";
                            else messageAssignmentForm = "Error to save Close Assignment data in system"; 
                            return false;
                        }
                    }
                    else
                    {
                        var closeAssignment = db.Treatment_Detial.FirstOrDefault(x => x.Treatment_Detial_Id == treatmentDetialId);
                        if (closeAssignment != null)
                        {
                            closeAssignment.To_Employee_Structure_Id = currentStructureUserId;
                            db.Entry(closeAssignment).State = EntityState.Modified;
                            db.SaveChanges();
                        }
                    }
                }
                catch {
                    if (SessionWrapper.LoggedUser.Language_id == 1)  
                        messageAssignmentForm = "حدث خطأ في حفظ البيانات في النظام";
                    else messageAssignmentForm = "Error to save data in system";
                    return false;
                }
                return true;
            }
            else
            {
                return false;
            }
        }

        private int getStructure(int employeeId)
        {
            int employeeStructureId = 0;
            try
            {
                Employee_Structure employeeStructure = db.Employee_Structure.First(x => x.Employee_Id == employeeId & x.Default_Structure == true);
                employeeStructureId = (int)employeeStructure.Employee_Structure_Id;
            }
            catch (Exception)
            {
            }
            return employeeStructureId;
        }

        private string getAssignmentNumber()
        {
            string treatmentNumber = "";
            using (var db1 = new ECMSEntities())
            {
                try
                {
                    Int64 dc = db.Treatment_Master.ToList().Max(e => Convert.ToInt64(e.Treatment_Id));
                    treatmentNumber = DateTime.Now.Year + "" + (dc + 1).ToString("D5");
                }
                catch (Exception ree)
                {
                    treatmentNumber = DateTime.Now.Year + "" + 1.ToString("D5");
                }
                return treatmentNumber;
            }
        }
        private bool validationAssignmentForm()
        {
            if (treatmentTo.GetSelectedIndices().Count() == 0)
            {
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    messageAssignmentForm = "الرجاء إختيار إرسال إلي";
                else messageAssignmentForm = "Pleace Select Send To";
                return false;
            }
            else if (secretLevel.SelectedValue == "")
            {
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    messageAssignmentForm = "الرجاء إختيار درجة السرية";
                else messageAssignmentForm = "Pleace Select Secret Level";
                return false;
            }
            else if (requiredReply.Checked)
            {
                if (replyDate10.Value.Trim() == "")
                {
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        messageForm = "الرجاء إدخال تاريخ الرد";
                    else messageForm = "Pleace Enter Date Reply";
                    return false;
                }
                else return true;
            }
            else return true;
        }

        protected void CloseAssignment_Click(object sender, EventArgs e)
        {
            if (closeAssignmentTreatment(true))
            {
                if(SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'left', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  حالة الحفظ : ','  تم إغلاق المعاملة بنجاح في النظام');", true);
                else Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  Your Close Treatment was Sucessfully saved in system');", true);
                actionReply.Style["display"] = "none";
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
            else
            {
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'left', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  حالة الحفظ : ','" + messageReplyForm + "');", true);
                else Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','" + messageReplyForm + "');", true);
            }
        }

        private bool closeAssignmentTreatment(bool flayInsertNotification)
        {
            try
            {
                //db.Configuration.LazyLoadingEnabled = false;
                var closeAssignment = db.Treatment_Detial.First(x => x.Treatment_Detial_Id == treatmentDetialId);
                if (closeAssignment.Assignment_Status_Id != 3)
                {
                    closeAssignment.Treatment_Detial_Date = DateTime.Now;
                    closeAssignment.Assignment_Status_Id = 3;
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                    {
                        if ((bool)closeAssignment.Treatment_Copy_To)
                            closeAssignment.Note = "تم الاطلاع علي المعاملة";
                        else
                            closeAssignment.Note = "تم إغلاق المعاملة";
                    }
                    else
                    {
                        if ((bool)closeAssignment.Treatment_Copy_To)
                            closeAssignment.Note = "The Correspondence has been viewed";
                        else
                            closeAssignment.Note = "Done Close Correspondence";
                    }

                    closeAssignment.To_Employee_Structure_Id = currentStructureUserId;
                    db.Entry(closeAssignment).State = EntityState.Modified;
                    db.SaveChanges();
                    //LogData = "data:" + JsonConvert.SerializeObject(closeAssignment, logFileModule.settings);
                    //logFileModule.logfile(1009, " اغلاق المعاملة", "Close Treatment", LogData);
                    if (flayInsertNotification)
                    {
                        string linkNotif = "../../../../Pages/Treatment/ShowTreatment.aspx?getTreatmentId=" + treatmentId + "&getTabId=4&getTreatmentDetialId=" + closeAssignment.Parent + "&getNotificationId=";
                        int notifSendTo = (int)closeAssignment.Treatment_Master.From_Employee_Structure_Id;
                        if (insertNotification("تم إغلاق المعاملة", "Done Close Treatment", closeAssignment.Treatment_Master.Treatment_Id, linkNotif, notifSendTo, 3))
                        {

                        }
                        else
                        {

                        }
                    }
                }
            }
            catch { 
                if(SessionWrapper.LoggedUser.Language_id == 1) messageReplyForm = "حدث خطأ في حفظ البيانات";
                else messageReplyForm = "Erorr to save data in system"; 
                return false;
            }
            return true;
        }

        private bool showTrackTreatment()
        {
            using (ECMSEntities dbTrack = new ECMSEntities())
            {
                try
                {
                    List<Treatment_Detial> treatmentDetial = new List<Treatment_Detial>();
                    List<Treatment_Master> treatmentMaser = new List<Treatment_Master>();
                    treatmentDetial = dbTrack.Treatment_Detial.Where(x => x.Treatment_Id == treatmentId && (x.Assignment_Status_Id == 3 || (x.Assignment_Status_Id == 2 && x.Treatment_Master.Required_Reply == true))).ToList<Treatment_Detial>();
                    for (int i = 0; i < treatmentDetial.Count; i++)
                    {
                        marginTreeTrack = 0;
                        isPath = getIsPath(treatmentDetial[i].Treatment_Detial_Id);
                        if (treatmentDetial[i].Treatment_Master.Treatment_Confidentiality_Id == 1)
                            isSecert = false;
                        else isSecert = true;
                        if (tabId == 2) isSecert = false;
                        treeTrackTreatment(treatmentDetial[i].Treatment_Detial_Id, isSecert, isPath);
                    }
                    return true;
                }
                catch { messageReplyForm = "Erorr to Show Data"; return false; }
            }
        }

        private bool getIsPath(int rootTreatmentDetialId)
        {
            try
            {
                List<Treatment_Detial> treatmentDetial = new List<Treatment_Detial>();
                List<Treatment_Master> treatmentMaser = new List<Treatment_Master>();
                Treatment_Detial pathTreatmentDetial;
                treatmentMaser = db.Treatment_Master.Where(x => x.Treatment_Mother == treatmentId || x.Treatment_Id == treatmentId).ToList<Treatment_Master>();
                int parentDeId = treatmentDetialId;
                for (int i = 0; i < treatmentMaser.Count+10; i++)
                {
                    pathTreatmentDetial = new Treatment_Detial();
                    pathTreatmentDetial = db.Treatment_Detial.FirstOrDefault(x => x.Treatment_Detial_Id == parentDeId);
                    parentDeId = (int)pathTreatmentDetial.Parent;
                    if (pathTreatmentDetial.Treatment_Detial_Id == rootTreatmentDetialId)
                        return true;
                    else if (parentDeId == 0)
                        return false;
                }
                return false;
            }
            catch { messageReplyForm = "Erorr to Show Data"; return false; }
        }

        private void treeTrackTreatment(int trackTreatmentDetialId, bool innerIsSecert, bool innerIsPath)
        {
            try
            {
                oneTreatmentDetial = new Treatment_Detial();
                oneTreatmentDetial = db.Treatment_Detial.FirstOrDefault(x => x.Treatment_Detial_Id == trackTreatmentDetialId && (x.Assignment_Status_Id == 3 || (x.Assignment_Status_Id == 2 && x.Treatment_Master.Required_Reply == true)));
                isTreatmentDetialParent = new Treatment_Detial();
                isTreatmentDetialParent = db.Treatment_Detial.FirstOrDefault(x => x.Parent == trackTreatmentDetialId);
                if (isTreatmentDetialParent == null)
                {
                    treatmentDetialDate = oneTreatmentDetial.Treatment_Detial_Date.ToString();
                }
                else
                {
                    treatmentDetialDate = isTreatmentDetialParent.Treatment_Master.Create_Date.ToString();
                }
                if (!doneTreatmentDetial.Exists(x => x.Treatment_Detial_Id == oneTreatmentDetial.Treatment_Detial_Id) && oneTreatmentDetial != null)
                {
                    doneTreatmentDetial.Add(oneTreatmentDetial);
                    detialAssingmentNote = getNoteAssignment(oneTreatmentDetial.Treatment_Detial_Id);
                    //////////////////// color border///////////////
                    if (treatmentDetialId == oneTreatmentDetial.Treatment_Detial_Id)
                    {
                        isTrackBorder = "3px solid #0ac282";
                        flayBorder = true;
                    }
                    else
                        isTrackBorder = "0px solid #0ac282";
                    if (treatmentDetialParentBorderId == oneTreatmentDetial.Treatment_Detial_Id && treatmentDetialParentBorderId != 0)
                        isTrackBorder = "3px solid #fe9365";
                    else if(!flayBorder)
                        isTrackBorder = "0px solid #fe9365";
                    flayBorder = false;
                    ///////////////////// color border/////////////////
                    langEmployeeName = ""; langStructureName = ""; langEmployeeNameMaster = ""; langTreatmentProcedureName = ""; langFrom = ""; langProcedure = ""; langWidth = "";
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                    {
                        langEmployeeName = oneTreatmentDetial.Employee_Structure.Employee.Employee_Name_Ar;
                        langStructureName = oneTreatmentDetial.Employee_Structure.Structure.Structure_Name_Ar;
                        langEmployeeNameMaster = oneTreatmentDetial.Treatment_Master.Employee_Structure.Employee.Employee_Name_Ar;
                        langTreatmentProcedureName = oneTreatmentDetial.Treatment_Master.Treatment_Procedure.Treatment_Procedure_Name_Ar;
                        langFrom = "من";
                        langProcedure = "الإجراء";
                        langWidth = "width:" + (100 - marginTreeTrack).ToString() + "%";
                    }
                    else
                    {
                        langEmployeeName = oneTreatmentDetial.Employee_Structure.Employee.Employee_Name_En;
                        langStructureName = oneTreatmentDetial.Employee_Structure.Structure.Structure_Name_En;
                        langEmployeeNameMaster = oneTreatmentDetial.Treatment_Master.Employee_Structure.Employee.Employee_Name_En;
                        langTreatmentProcedureName = oneTreatmentDetial.Treatment_Master.Treatment_Procedure.Treatment_Procedure_Name_En;
                        langFrom = "From";
                        langProcedure = "Procedure ";
                    }
                    yourHTMLStringTrack = "<div class='sortable-moves col-xs-12' style='margin-" + langDir + ": " + marginTreeTrack + "%;border-" + langDir + ":" + isTrackBorder + ";" + langWidth + "'>" +
                                            "<img class='img-fluid p-absolute' src='../../../../media/Profile/" + oneTreatmentDetial.Employee_Structure.Employee.Employee_Profile + "' alt=''>" +
                                            "<h6 class='d-inline-block'>" + langEmployeeName + getWorkDelegation((bool)oneTreatmentDetial.Employee_Structure.Type_Delegation) + "</h6>" +
                                            "<span class='label label-default f-" + langMarg + "' style='background: linear-gradient(to " + langMarg + ", #452a74, #f6f7fb);'>" + treatmentDetialDate + "</span>" +
                                            "<div class='f-13 text-muted'>" + langStructureName + "</div>" +
                                            "<h6 class='d-inline-block'> " + langFrom + ": " + langEmployeeNameMaster + "</h6></br>" +
                                            "<h6 class='d-inline-block'> " + langProcedure + ": " + langTreatmentProcedureName + "</h6>";
                    if(innerIsPath || !innerIsSecert)
                        yourHTMLStringTrack += "<p>" + detialAssingmentNote + "</p>";
                    if (isTreatmentDetialParent != null)
                    {
                        attachmentMasterId = (int)isTreatmentDetialParent.Treatment_Id;
                        listAttachmentTrack = new List<Attachment>();
                        listAttachmentTrack = db.Attachments.Where(x => x.Attachment_Type == 2 && x.Treatment_Id == attachmentMasterId).ToList<Attachment>();
                        if (listAttachmentTrack.Count > 0)
                        {
                            yourHTMLStringTrack += "<div class='row' style='margin-" + langMarg + ": 0%;'>";
                            for (int i = 0; i < listAttachmentTrack.Count; i++)
                            {
                                _fileExt = System.IO.Path.GetExtension(listAttachmentTrack[i].Attachment_Name);
                                yourHTMLStringTrack += "<div class='col-md-6 col-xl-3'>" +
                                                    "<div class='card thumb-block'>" +
                                                        "<a href='../../../../media/Treatment/" + listAttachmentTrack[i].Attachment_Path + "' target='_blank'>" +
                                                            getFileImages(_fileExt) +
                                                        "</a>" +
                                                        "<div class='card-footer text-center'>" +
                                                            "<a href='../../../../media/Treatment/" + listAttachmentTrack[i].Attachment_Path + "' target='_blank'>" + listAttachmentTrack[i].Attachment_Name + "</a>" +
                                                        "</div>" +
                                                    "</div>" +
                                                "</div>";
                            }
                            yourHTMLStringTrack += "</div>";
                        }
                    }
                    yourHTMLStringTrack += "</div>";
                    trackTreatment.Controls.Add(new LiteralControl(yourHTMLStringTrack));
                }
                else marginTreeTrack -= 5;

                if (oneTreatmentDetial == null)
                {
                    oneTreatmentDetial = new Treatment_Detial();
                    oneTreatmentDetial = db.Treatment_Detial.FirstOrDefault(x => x.Treatment_Detial_Id == trackTreatmentDetialId);
                }

                treeTreatmentDetial = new List<Treatment_Detial>();
                treeTreatmentDetial = db.Treatment_Detial.Where(x => x.Parent == trackTreatmentDetialId).ToList().Except(doneTreatmentDetial).ToList<Treatment_Detial>();
                if (treeTreatmentDetial.Count == 0)
                {
                    recoverParentid = (int)oneTreatmentDetial.Parent;
                    if (recoverParentid != 0)
                    {
                        treeTreatmentDetial = db.Treatment_Detial.Where(x => x.Parent == recoverParentid).ToList().Except(doneTreatmentDetial).ToList<Treatment_Detial>();
                        if (treeTreatmentDetial.Count == 0)
                        {
                            recoverTreatmentDetial = new Treatment_Detial();
                            recoverTreatmentDetial = db.Treatment_Detial.FirstOrDefault(x => x.Treatment_Detial_Id == recoverParentid);
                            if (recoverTreatmentDetial != null)
                            {
                                marginTreeTrack -= 5;
                                if (recoverTreatmentDetial.Treatment_Master.Treatment_Confidentiality_Id == 1)
                                    isSecert = false;
                                else isSecert = true;
                                if (tabId == 2) isSecert = false;
                                treeTrackTreatment((int)recoverTreatmentDetial.Parent, isSecert, isPath);
                            }
                        }
                        marginTreeTrack -= 5;
                    }
                }
                //for (int i = 0; i < treeTreatmentDetial.Count; i++)
                //{
                marginTreeTrack += 5;
                if (treeTreatmentDetial[0].Treatment_Master.Treatment_Confidentiality_Id == 1)
                    isSecert = false;
                else isSecert = true;
                if (tabId == 2) isSecert = false;
                treeTrackTreatment(treeTreatmentDetial[0].Treatment_Detial_Id, isSecert, isPath);
                // }   

            }
            catch { messageReplyForm = "Erorr to Show Data"; }
        }

        private string getNoteAssignment(int tdid)
        {
            detialAssingmentNote = "";
            try
            {
                var assDetialParent = db.Treatment_Detial.FirstOrDefault(x => x.Parent == tdid);
                if (assDetialParent == null)
                {
                    var assDetial = db.Treatment_Detial.FirstOrDefault(x => x.Treatment_Detial_Id == tdid);
                    if (assDetial == null)
                        detialAssingmentNote = "";
                    else
                    {
                        if(SessionWrapper.LoggedUser.Language_id == 1)
                            detialAssingmentNote = "الرد: " + assDetial.Note;
                        else detialAssingmentNote = "Reply: " + assDetial.Note;
                    }
                }
                else
                {
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        detialAssingmentNote = "الإحالة: " + assDetialParent.Treatment_Master.Treatment_Subject;
                    else detialAssingmentNote = "New: " + assDetialParent.Treatment_Master.Treatment_Subject;
                    var assDetial1 = db.Treatment_Detial.FirstOrDefault(x => x.Treatment_Detial_Id == tdid);
                    if (assDetial1.Note != null)
                    {
                        if (SessionWrapper.LoggedUser.Language_id == 1)
                            detialAssingmentNote += "</br>" + "الرد: " + assDetial1.Note;
                        else detialAssingmentNote += "</br>" + "Reply: " + assDetial1.Note;
                    }
                }
            }
            catch { detialAssingmentNote = ""; }
            return detialAssingmentNote;
        }

        private bool insertNotification(string notificationDescriptionAr, string notificationDescriptionEn, int notificationMasterId, string notificationLink, int notificationSendTo, int notificationShowId)
        {
            try
            {
                using (ECMSEntities dbEcms = new ECMSEntities())
                {
                    Notification_Master notificationMaster = new Notification_Master();
                    notificationMaster = dbEcms.Notification_Master.Create();
                    notificationMaster.Notification_Date = DateTime.Now;
                    notificationMaster.Is_Read = false;
                    notificationMaster.From_Employee_Structure_Id = currentStructureUserId;
                    notificationMaster.To_Employee_Structure_Id = notificationSendTo;
                    notificationMaster.Master_Id = notificationMasterId;
                    notificationMaster.Notification_Description_Ar = notificationDescriptionAr;
                    notificationMaster.Notification_Description_En = notificationDescriptionEn;
                    notificationMaster.Notification_Link = notificationLink;

                    notificationMaster.Is_Show_Reply = false;
                    notificationMaster.Notification_Show_Id = notificationShowId;

                    dbEcms.Notification_Master.Add(notificationMaster);
                    dbEcms.SaveChanges();
                }
                return true; 
            }
            catch { return false; }
        }

        private bool insertNotification(int treatmentIdNotf)
        {
            try
            {
                using (ECMSEntities dbEcms = new ECMSEntities())
                {
                    Treatment_Master treatmentMasterNotf = new Treatment_Master();
                    treatmentMasterNotf = dbEcms.Treatment_Master.FirstOrDefault(x => x.Treatment_Id == treatmentIdNotf && x.Required_Reply == true);
                    
                    if (treatmentMasterNotf != null)
                    {
                        List<Treatment_Detial> listTreatmentDetialNotf = new List<Treatment_Detial>();
                        listTreatmentDetialNotf = treatmentMasterNotf.Treatment_Detial.Where(x => x.Treatment_Copy_To == false).ToList<Treatment_Detial>();
                        string linkNotif = "";
                        for (int i = 0; i < listTreatmentDetialNotf.Count; i++)
                        {

                            linkNotif = "../../../../Pages/Treatment/ShowTreatment.aspx?getTreatmentId=" + treatmentId + "&getTabId=4&getTreatmentDetialId=" + listTreatmentDetialNotf[i].Treatment_Detial_Id + "&getNotificationId=";
                            Notification_Master notificationMaster = new Notification_Master();
                            notificationMaster = dbEcms.Notification_Master.Create();
                            notificationMaster.Notification_Date = DateTime.Now;
                            notificationMaster.Is_Read = false;
                            notificationMaster.From_Employee_Structure_Id = listTreatmentDetialNotf[i].To_Employee_Structure_Id;
                            notificationMaster.To_Employee_Structure_Id = getStructure(currentUserId);
                            notificationMaster.Master_Id = treatmentIdNotf;
                            notificationMaster.Notification_Description_Ar = "لم يتم الرد علي المعاملة";
                            notificationMaster.Notification_Description_En = "The transaction was not answered";
                            notificationMaster.Notification_Link = linkNotif;

                            notificationMaster.Is_Show_Reply = true;
                            notificationMaster.Date_Show_Reply = treatmentMasterNotf.Required_Reply_Date;
                            notificationMaster.Notification_Show_Id = 4;

                            dbEcms.Notification_Master.Add(notificationMaster);
                            dbEcms.SaveChanges();
                        }
                    }
                }
                return true;
            }
            catch { return false; }
        }


        private bool updatetReadNotification(int notificationId)
        {
            try
            {
                using (ECMSEntities dbEcms = new ECMSEntities())
                {
                    Notification_Master notificationMaster = new Notification_Master();
                    notificationMaster = dbEcms.Notification_Master.First(x => x.Notification_Id == notificationId);
                    notificationMaster.Date_Read = DateTime.Now;
                    notificationMaster.Is_Read = true;
                    dbEcms.Entry(notificationMaster).State = EntityState.Modified;
                    dbEcms.SaveChanges();
                }
                return true;
            }
            catch { return false; }
        }

        public string UploadFile(HttpPostedFile fileAttach)
        {
            string Imagepath = " ";
            if (this.Page.IsValid)
            {
                if (!UtilityClass.UploadFileIsValid(ref fileAttach, UtilityClass.ValidFileExtentions))
                {
                    //ltrMessage.Text = "<div class='alert alert-danger fade in'><strong>Images only allowed !</strong></div>";
                    Imagepath = "false";
                }
                Imagepath = string.Empty;

                Imagepath = UtilityClass.UploadFilePostedFile(ref fileAttach, Server.MapPath(@"~\media\Treatment\"));
            }
            return Imagepath;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string linkTreatment = "~/Pages/Reports/Report.aspx?getTreatmentId=" + treatmentId;
            Response.Redirect(linkTreatment);
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            string linkTreatment = "~/Pages/Reports/ReportAr.aspx?getTreatmentId=" + treatmentId;
            Response.Redirect(linkTreatment);
        }

        private List<Employee_Structure> loadSendEmployeeStructure()
        {
            List<Employee_Structure> ListEmployeeStructure = new List<Employee_Structure>();
            Employee_Structure addEmployeeStructure;
            Employee_Structure oneEmployeeStructure;
            using (ECMSEntities dbEcms = new ECMSEntities())
            {
                try
                {
                    oneEmployeeStructure = new Employee_Structure();
                    oneEmployeeStructure = dbEcms.Employee_Structure.FirstOrDefault(x => x.Employee_Structure_Id == currentStructureUserId && x.Structure.Is_Job_Title == true);
                    if (oneEmployeeStructure != null)
                    {
                        bool flayIsManager = false;
                        int parentCurrentJobTitle = (int)oneEmployeeStructure.Structure.Structure_Parent;
                        int structureIdCurrent = (int)oneEmployeeStructure.Structure.Structure_Id;
                        flayIsManager = (bool)oneEmployeeStructure.Structure.Is_Manager;
                        int strurId = 0;
                        bool flayAdd = false;
                        int parentCurrent = -1;
                        if ((bool)oneEmployeeStructure.Structure.Is_Manager)
                        {
                            Structure oneStructure = dbEcms.Structures.FirstOrDefault(x => x.Structure_Id == parentCurrentJobTitle);
                            if (oneStructure != null)
                                parentCurrent = (int)oneStructure.Structure_Parent;
                        }
                        List<Structure> ListGetSameLevel = dbEcms.Structures.Where(x => (x.Structure_Id == parentCurrent) || (((x.Structure_Parent == parentCurrent && x.Is_Job_Title == false) || x.Structure_Parent == parentCurrentJobTitle) && x.Structure_Id != structureIdCurrent)).ToList<Structure>();
                        for (int i = 0; i < ListGetSameLevel.Count; i++)
                        {
                            strurId = ListGetSameLevel[i].Structure_Id;
                            oneEmployeeStructure = new Employee_Structure();
                            addEmployeeStructure = new Employee_Structure();
                            oneEmployeeStructure = dbEcms.Employee_Structure.FirstOrDefault(x => x.Structure.Structure_Parent == strurId && x.Structure.Is_Job_Title == true && x.Structure.Is_Manager == true);
                            if (oneEmployeeStructure != null && flayIsManager)
                            {
                                flayAdd = true;
                            }
                            else
                            {
                                oneEmployeeStructure = new Employee_Structure();
                                oneEmployeeStructure = dbEcms.Employee_Structure.FirstOrDefault(x => x.Structure.Structure_Id == strurId && x.Structure.Is_Job_Title == true && x.Structure.Is_Manager == false);
                                if (oneEmployeeStructure != null)
                                    flayAdd = true;
                            }
                            if (flayAdd)
                            {
                                if (oneEmployeeStructure.Structure_Id != structureIdCurrent)
                                {
                                    addEmployeeStructure.Structure = oneEmployeeStructure.Structure;
                                    addEmployeeStructure.Employee = oneEmployeeStructure.Employee;
                                    addEmployeeStructure.Employee_Structure_Id = oneEmployeeStructure.Employee_Structure_Id;
                                    addEmployeeStructure.Employee_Id = oneEmployeeStructure.Employee_Id;
                                    addEmployeeStructure.Structure_Id = oneEmployeeStructure.Structure_Id;
                                    ListEmployeeStructure.Add(addEmployeeStructure);
                                }
                            }
                            flayAdd = false;
                        }
                    }
                }
                catch (Exception eees) { }
            }
            return ListEmployeeStructure;
        }

        private void fillDropDownListBox()
        {
            List<Employee_Structure> ListEmployeeStructure10 = new List<Employee_Structure>();
            ListEmployeeStructure10 = loadSendEmployeeStructure();
            if (SessionWrapper.LoggedUser.Language_id == 1)
            {
                var dc = from c in ListEmployeeStructure10
                         where c.Employee_Id != currentUserId
                         select new
                         {
                             ddlKey = c.Employee_Structure_Id,
                             ddlValue = c.Employee.Employee_Name_Ar + " '" + c.Structure.Structure_Name_Ar + "'",
                         };

                ddlFiller.dropDDLBox(treatmentTo, "ddlKey", "ddlValue", dc.ToList());
                ddlFiller.dropDDLBox(treatmentCopyTo, "ddlKey", "ddlValue", dc.ToList());
            }
            else
            {
                var dc = from c in ListEmployeeStructure10
                         where c.Employee_Id != currentUserId
                         select new
                         {
                             ddlKey = c.Employee_Structure_Id,
                             ddlValue = c.Employee.Employee_Name_En + " '" + c.Structure.Structure_Name_En + "'",
                         };
                ddlFiller.dropDDLBox(treatmentTo, "ddlKey", "ddlValue", dc.ToList());
                ddlFiller.dropDDLBox(treatmentCopyTo, "ddlKey", "ddlValue", dc.ToList());
            }
        }

        private bool fillAllStructure()
        {
            try
            {
                List<Employee_Structure> ListEmployeeStructure10 = new List<Employee_Structure>();
                ListEmployeeStructure10 = loadSendEmployeeStructure();

                if (SessionWrapper.LoggedUser.Language_id == 1)
                {
                    var dc1 = from c in ListEmployeeStructure10
                              where c.Employee_Id != currentUserId
                              select new
                              {
                                  ddlKey = c.Employee_Structure_Id,
                                  employeeName = c.Employee.Employee_Name_Ar,
                                  jobTitle = c.Structure.Structure_Name_Ar
                              };

                    ASPxGridView1.DataSource = dc1.ToList();
                    ASPxGridView1.DataBind();

                    ASPxGridView2.DataSource = dc1.ToList();
                    ASPxGridView2.DataBind();
                }
                else
                {
                    var dc1 = from c in ListEmployeeStructure10
                              where c.Employee_Id != currentUserId
                              select new
                              {
                                  ddlKey = c.Employee_Structure_Id,
                                  employeeName = c.Employee.Employee_Name_En,
                                  jobTitle = c.Structure.Structure_Name_En
                              };

                    ASPxGridView1.DataSource = dc1.ToList();
                    ASPxGridView1.DataBind();

                    ASPxGridView2.DataSource = dc1.ToList();
                    ASPxGridView2.DataBind();
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////
                ListStructure = loadTreeStructure();
                ASPxTreeList1.DataSource = ListStructure;
                ASPxTreeList1.KeyFieldName = "Structure_Id";
                ASPxTreeList1.ParentFieldName = "Structure_Parent";
                ASPxTreeList1.PreviewFieldName = "Structure_Name_En";
                ASPxTreeList1.DataBind();

                ASPxTreeList2.DataSource = ListStructure;
                ASPxTreeList2.KeyFieldName = "Structure_Id";
                ASPxTreeList2.ParentFieldName = "Structure_Parent";
                ASPxTreeList2.PreviewFieldName = "Structure_Name_En";
                ASPxTreeList2.DataBind();
                return true;
            }
            catch (Exception eees) { return false; }
        }

        public void getEmployeeTable()
        {
            string keyValueGrid = "";
            for (int i = 0; i < ASPxGridView1.VisibleRowCount; i++)
            {
                if (ASPxGridView1.Selection.IsRowSelected(i))
                {
                    keyValueGrid = ASPxGridView1.GetRowValues(i, "ddlKey").ToString();
                    treatmentTo.Items.FindByValue(keyValueGrid).Selected = true;
                    
                     Session["newTreatmentAss"] = true;
                }
            }
            //if(ASPxGridView1.VisibleRowCount > 0)
        }

        public void getEmployeeTableCopy()
        {
            string keyValueGrid = "";
            for (int i = 0; i < ASPxGridView2.VisibleRowCount; i++)
            {
                if (ASPxGridView2.Selection.IsRowSelected(i))
                {
                    keyValueGrid = ASPxGridView2.GetRowValues(i, "ddlKey").ToString();
                    treatmentCopyTo.Items.FindByValue(keyValueGrid).Selected = true;
                    Session["newTreatmentAss"] = true;
                }
            }
            //if (ASPxGridView2.VisibleRowCount > 0)
        }

        public void getEmployeeTree()
        {
            int keyValueTree = 0;
            string keySelectTree = "";
            var listSelectedNodes = ASPxTreeList1.GetSelectedNodes();
            Structure oneStructure;
            Employee_Structure oneEmpStru;
            foreach (var oneSelectNode in listSelectedNodes)
            {
                oneStructure = new Structure();
                oneEmpStru = new Employee_Structure();
                keyValueTree = int.Parse(oneSelectNode.Key);
                oneStructure = db.Structures.FirstOrDefault(x => x.Structure_Parent == keyValueTree && x.Is_Job_Title == true && x.Is_Manager == true);
                if (oneStructure != null)
                {
                    keyValueTree = oneStructure.Structure_Id;
                    oneEmpStru = db.Employee_Structure.FirstOrDefault(x => x.Structure_Id == keyValueTree && x.Status_Structure == true);
                    if (oneEmpStru != null)
                    {
                        if (currentStructureUserId != oneEmpStru.Employee_Structure_Id)
                        {
                            keySelectTree = oneEmpStru.Employee_Structure_Id.ToString();
                            treatmentTo.Items.FindByValue(keySelectTree).Selected = true;
                            Session["newTreatmentAss"] = true;
                        }
                    }
                }
            }
        }

        public void getEmployeeTreeCopy()
        {
            int keyValueTree = 0;
            string keySelectTree = "";
            var listSelectedNodes = ASPxTreeList2.GetSelectedNodes();
            Structure oneStructure;
            Employee_Structure oneEmpStru;
            foreach (var oneSelectNode in listSelectedNodes)
            {
                oneStructure = new Structure();
                oneEmpStru = new Employee_Structure();
                keyValueTree = int.Parse(oneSelectNode.Key);
                oneStructure = db.Structures.FirstOrDefault(x => x.Structure_Parent == keyValueTree && x.Is_Job_Title == true && x.Is_Manager == true);
                if (oneStructure != null)
                {
                    keyValueTree = oneStructure.Structure_Id;
                    oneEmpStru = db.Employee_Structure.FirstOrDefault(x => x.Structure_Id == keyValueTree && x.Status_Structure == true);
                    if (oneEmpStru != null)
                    {
                        if (currentStructureUserId != oneEmpStru.Employee_Structure_Id)
                        {
                            keySelectTree = oneEmpStru.Employee_Structure_Id.ToString();
                            treatmentCopyTo.Items.FindByValue(keySelectTree).Selected = true;
                            Session["newTreatmentAss"] = true;
                        }
                    }
                }
            }
        }

        private List<Structure> loadTreeStructure()
        {
            List<Structure> ListStructure = new List<Structure>();
            Structure getStructure;
            Structure oneStructure;
            Employee_Structure oneEmployeeStructure;
            using (ECMSEntities dbEcms = new ECMSEntities())
            {
                try
                {
                    oneEmployeeStructure = new Employee_Structure();
                    oneEmployeeStructure = dbEcms.Employee_Structure.FirstOrDefault(x => x.Employee_Structure_Id == currentStructureUserId && x.Structure.Is_Job_Title == true && x.Structure.Is_Manager == true);
                    if (oneEmployeeStructure != null)
                    {
                        int structureIdCurrent = (int)oneEmployeeStructure.Structure_Id;
                        getStructure = new Structure();
                        getStructure = dbEcms.Structures.FirstOrDefault(x => x.Structure_Id == structureIdCurrent);
                        if (getStructure != null)
                        {
                            int getIdStructure = (int)getStructure.Structure_Parent;
                            oneStructure = new Structure();
                            oneStructure = dbEcms.Structures.FirstOrDefault(x => x.Structure_Id == getIdStructure);
                            if (oneStructure != null)
                            {
                                int getParentStructure = (int)oneStructure.Structure_Parent;
                                ListStructure = dbEcms.Structures.Where(x => x.Is_Job_Title == false && (x.Structure_Parent == getIdStructure || x.Structure_Parent == getParentStructure || x.Structure_Id == getParentStructure)).ToList<Structure>();
                            }
                        }
                    }
                }
                catch (Exception eees) { }
            }
            return ListStructure;
        }

        private void translateArabic()
        {
            if (SessionWrapper.LoggedUser.Language_id != null)
            {
                if (SessionWrapper.LoggedUser.Language_id == 1)
                {
                    standardProcedure.DataTextField = "Treatment_Procedure_Name_Ar";
                    secretLevel.DataTextField = "Treatment_Confidentiality_Name_Ar";
                    

                    replyTreatement.Attributes["placeholder"] = "الرد";
                    valReplyTreatement.Text = "أدخل الرد";
                    keyworkTreatment.Attributes["placeholder"] = "كلمات مفتاحية";
                    SaveReply.Text = "حفظ";

                    treatmentTo.Attributes["data-placeholder"] = "إرسال إلي";
                    valTreatmentTo.Text = "إختيار إرسال إلي";
                    treatmentCopyTo.Attributes["data-placeholder"] = "نسخة إلي";
                    replyDate10.Attributes["placeholder"] = "تاريخ الرد";
                    requiredAssignment.Attributes["placeholder"] = "المطلوب";
                    keyworkAssignment.Attributes["placeholder"] = "كلمات مفتاحية";
                    SaveAssignment.Text = "حفظ";

                    ASPxGridView1.Columns[1].Caption = "إسم الموظف";
                    ASPxGridView1.Columns[2].Caption = "المسمي الوظيفي";
                    ASPxGridView2.Columns[1].Caption = "إسم الموظف";
                    ASPxGridView2.Columns[2].Caption = "المسمي الوظيفي";
                    ASPxTreeList1.Columns[0].Caption = "إسم الإدارة أو الوحدة";
                    ASPxTreeList2.Columns[0].Caption = "إسم الإدارة أو الوحدة";
                }

                else
                {

                }
            }
        }

    }
}