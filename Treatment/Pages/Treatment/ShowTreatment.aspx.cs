using Newtonsoft.Json;
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
        int treatmentId = 0, recoverParentid = 0, treatmentDetialId = 0, tabId = 0;
        string messageForm = "", messageReplyForm = "", messageAssignmentForm = "", yourHTMLStringTrack = "", detialAssingmentNote = "";
        int currentStructureUserId = 0, currentUserId = 0, marginTreeTrack = 0;
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        List<Treatment_Detial> treeTreatmentDetial;
        List<Treatment_Detial> doneTreatmentDetial;
        Treatment_Detial oneTreatmentDetial;
        Treatment_Detial recoverTreatmentDetial;
        bool isSecert = false, isPath = false, flayCopyTo = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            checkLogin();
            db = new ECMSEntities();
            treatmentId = 0; recoverParentid = 0; treatmentDetialId = 0; tabId = 0;
            isSecert = false; isPath = false;
            currentUserId = SessionWrapper.LoggedUser.Employee_Id;
            currentStructureUserId = getStructure(currentUserId);
            if (int.TryParse(Request["getTreatmentId"], out treatmentId) && treatmentId > 0)
            {
                //treatmentDetialId = getTreatmentDetialId();
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
                        ////////// not inbox ////////////
                        if (tabId != 2)
                        {
                            if (int.TryParse(Request["getTreatmentDetialId"], out treatmentDetialId) && treatmentDetialId > 0)
                            {
                                Treatment_Detial isTreatmentDetial = db.Treatment_Detial.First(x => x.To_Employee_Structure_Id == currentStructureUserId && x.Treatment_Detial_Id == treatmentDetialId);

                                ///////////////////////////////// start is user create Treatment show all secert//////////////////////////////////
                                Treatment_Master isTreatmentMasterDetial = db.Treatment_Master.FirstOrDefault(x => x.From_Employee_Structure_Id == currentStructureUserId && x.Treatment_Id == treatmentId);
                                if (isTreatmentMasterDetial != null)
                                    tabId = 2;
                                ///////////////////////////////// end is user create Treatment show all secert//////////////////////////////////
                                ///////////////////////////////// start not downgred secert levet//////////////////////////////////

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
                                ///////////////////////////////// end not downgred secert levet//////////////////////////////////

                                //else Response.Redirect("~/Pages/Treatment/Inbox.aspx");
                                ///////////////////////////////// start show hide required Reply//////////////////////////////////
                                bool flayRequiredReply = false;
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
                                ///////////////////////////////// end show hide required reply//////////////////////////////////
                                ///////////////////////////////// start show hide copy to//////////////////////////////////
                                flayCopyTo = false;
                                bool.TryParse(isTreatmentDetial.Treatment_Copy_To.ToString(), out flayCopyTo);
                                if (flayCopyTo)
                                {
                                    actionReply.Style["display"] = "none";
                                }
                                ///////////////////////////////// end show hide copy to//////////////////////////////////
                                ///////////////////////////////// end show hide treatment Status//////////////////////////////////
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
                                ///////////////////////////////// end show hide treatment status //////////////////////////////////
                            }
                            else Response.Redirect("~/Pages/Treatment/Inbox.aspx");
                        }
                        else
                        {
                            if (isTreatment.From_Employee_Structure_Id == currentStructureUserId)
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
                speech.InnerHtml = showTreatment.Treatment_Body;
                subject.InnerText = showTreatment.Treatment_Subject;
                treatmentDate.InnerText = showTreatment.Create_Date.ToString();
                treatmentProcedure.InnerText = showTreatment.Treatment_Procedure.Treatment_Procedure_Name_En;
                treatmentManagement.InnerText = showTreatment.Structure.Structure_Name_En;
                treatmentClassification.InnerText = showTreatment.Treatment_Class.Treatment_Class_Name_En;
                treatmentType.InnerText = showTreatment.Treatment_Type.Treatment_Type_Name_En;
                treatmentSecret.InnerText = showTreatment.Treatment_Confidentiality.Treatment_Confidentiality_Name_En;
                treatmentPriority.InnerText = showTreatment.Treatment_Priority.Treatment_Priority_Name_En;
                treatmentSpeedUp.InnerText = showTreatment.Treatment_Delivery.Treatment_Delivery_Name_En;
                treatmentStatus.InnerText = showTreatment.Treatment_Status.Treatment_Status_Name_En;
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
                                                    "<p>Date&nbsp;&nbsp;&nbsp;&nbsp;</p>" +
                                                "</div>" +
                                            "</div>";

                    counterDateAgo.InnerHtml = requiredReplyDate;
                }
                else
                {
                    //hide div
                    divRequiredReply.Style["display"] = "none";
                }
                if (loadSendToCopyTo())
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
                    for (int i = 0; i < treatmentDetial.Count; i++)
                    {
                        yourHTMLstring = "<div class='media'>" +
                                            "<div class='media-left media-middle photo-table'>" +
                                               "<a href='#'>" +
                                                    "<img class='img-radius' src='../../../../media/Profile/" + treatmentDetial[i].Employee_Structure.Employee.Employee_Profile + "' alt='employee'>" +
                                                "</a>" +
                                            "</div>" +
                                            "<div class='media-body col-xs-12'>" +
                                                "<h6 class='d-inline-block'>" + treatmentDetial[i].Employee_Structure.Employee.Employee_Name_En + "</h6>" +
                                                "<div class='f-13 text-muted m-b-10'>" + treatmentDetial[i].Employee_Structure.Structure.Structure_Name_En + "</div>" +
                                            "</div>" +
                                        "</div>";
                        if ((bool)treatmentDetial[i].Treatment_Copy_To)
                            copyToTreatment.Controls.Add(new LiteralControl(yourHTMLstring));
                        else
                            sendToTreatment.Controls.Add(new LiteralControl(yourHTMLstring));
                    }
                    return true;
                }
                catch (Exception eee) { return false; }
            }
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
                    if(flayCopyTo)
                        changeTreatmentDetial.Assignment_Status_Id = 3;
                    else
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

        protected void SaveReply_Click(object sender, EventArgs e)
        {
            if (saveReplyTreatment())
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  Your Reply was Sucessfully saved in system');", true);
                clearReplyTreatment();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','" + messageReplyForm + "');", true);
            }
        }

        private bool saveReplyTreatment()
        {
            if (validationReplyForm())
            {
                try
                {
                    var newReplyTreatment = db.Treatment_Detial.First(x => x.Treatment_Detial_Id == treatmentDetialId);
                    newReplyTreatment.Treatment_Detial_Date = DateTime.Now;
                    newReplyTreatment.Note = replyTreatement.Text;
                    newReplyTreatment.Key_Word = keyworkTreatment.Text;
                    newReplyTreatment.Assignment_Status_Id = 3;

                    db.Entry(newReplyTreatment).State = EntityState.Modified;
                    db.SaveChanges();
                    //LogData = "data:" + JsonConvert.SerializeObject(newReplyTreatment, logFileModule.settings);
                    //logFileModule.logfile(5, "إضافة رد علي معاملة", "", LogData);
                }
                catch { messageReplyForm = "Erorr to save data in system"; return false; }
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
                messageReplyForm = "Pleace Enter Reply";
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
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  Your Assignment was Sucessfully saved in system');", true);
                clearAssignmentTreatment();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','" + messageAssignmentForm + "');", true);
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
                        newAssignmentTreatment.Required_Reply_Date = DateTime.Parse(replyDate.Text);
                    /////////////////////////////////////// Start Insert To /////////////////////////////////////
                    Treatment_Detial treatmentDetial;
                    for (int i = 0; i < treatmentTo.Items.Count; i++)
                    {
                        if (treatmentTo.Items[i].Selected)
                        {
                            treatmentDetial = new Treatment_Detial();
                            treatmentDetial.To_Employee_Structure_Id = getStructure(int.Parse(treatmentTo.Items[i].Value));
                            treatmentDetial.Parent = treatmentDetialId;
                            treatmentDetial.Assignment_Status_Id = 1;
                            treatmentDetial.Is_Read = false;
                            treatmentDetial.Is_Delete = false;
                            treatmentDetial.Treatment_Copy_To = false;
                            newAssignmentTreatment.Treatment_Detial.Add(treatmentDetial);
                        }
                    }
                    /////////////////////////////////////// End Insert To /////////////////////////////////////

                    /////////////////////////////////////// Start Insert Copy To /////////////////////////////////////
                    for (int i = 0; i < treatmentCopyTo.Items.Count; i++)
                    {
                        if (treatmentCopyTo.Items[i].Selected)
                        {
                            treatmentDetial = new Treatment_Detial();
                            treatmentDetial.To_Employee_Structure_Id = getStructure(int.Parse(treatmentCopyTo.Items[i].Value));
                            treatmentDetial.Parent = treatmentDetialId;
                            treatmentDetial.Assignment_Status_Id = 1;
                            treatmentDetial.Is_Read = false;
                            treatmentDetial.Is_Delete = false;
                            treatmentDetial.Treatment_Copy_To = true;
                            newAssignmentTreatment.Treatment_Detial.Add(treatmentDetial);
                        }
                    }
                    /////////////////////////////////////// End Insert Copy To /////////////////////////////////////

                    db.Treatment_Master.Add(newAssignmentTreatment);
                    db.SaveChanges();
                    //LogData = "data:" + JsonConvert.SerializeObject(newTreatment, logFileModule.settings);
                    //logFileModule.logfile(4, "إضافة معاملة", "", LogData);
                    if (!closeAssignmentTreatment())
                    {
                        messageAssignmentForm = "Erorr to save Close Assignment data in system";
                        return false;
                    }
                }
                catch { messageAssignmentForm = "Erorr to save data in system"; return false; }
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
                Employee_Structure employeeStructure = db.Employee_Structure.First(x => x.Employee_Id == employeeId);
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
            if (treatmentTo.SelectedValue == "")
            {
                messageAssignmentForm = "Pleace Select Send To";
                return false;
            }
            else if (secretLevel.SelectedValue == "")
            {
                messageAssignmentForm = "Pleace Select Secret Level";
                return false;
            }
            else return true;
        }

        protected void CloseAssignment_Click(object sender, EventArgs e)
        {
            if (closeAssignmentTreatment())
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  Your Close Treatment was Sucessfully saved in system');", true);
                actionReply.Style["display"] = "none";
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','" + messageReplyForm + "');", true);
            }
        }

        private bool closeAssignmentTreatment()
        {
            try
            {
                var closeAssignment = db.Treatment_Detial.First(x => x.Treatment_Detial_Id == treatmentDetialId);
                closeAssignment.Treatment_Detial_Date = DateTime.Now;
                closeAssignment.Assignment_Status_Id = 3;
                db.Entry(closeAssignment).State = EntityState.Modified;
                db.SaveChanges();
                //LogData = "data:" + JsonConvert.SerializeObject(newReplyTreatment, logFileModule.settings);
                //logFileModule.logfile(5, "إضافة رد علي معاملة", "", LogData);
            }
            catch { messageReplyForm = "Erorr to save data in system"; return false; }
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
                    treatmentDetial = dbTrack.Treatment_Detial.Where(x => x.Treatment_Id == treatmentId && x.Assignment_Status_Id == 3).ToList<Treatment_Detial>();
                    for (int i = 0; i < treatmentDetial.Count; i++)
                    {
                        marginTreeTrack = 0;
                        isPath = getIsPath(treatmentDetial[i].Treatment_Detial_Id);
                        if (treatmentDetial[i].Treatment_Master.Treatment_Confidentiality_Id == 1)
                            isSecert = false;
                        else isSecert = true;
                        if (tabId == 2) isSecert = true;
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
                oneTreatmentDetial = db.Treatment_Detial.FirstOrDefault(x => x.Treatment_Detial_Id == trackTreatmentDetialId && x.Assignment_Status_Id == 3);
                if (!doneTreatmentDetial.Exists(x => x.Treatment_Detial_Id == oneTreatmentDetial.Treatment_Detial_Id) && oneTreatmentDetial != null)
                {
                    doneTreatmentDetial.Add(oneTreatmentDetial);
                    detialAssingmentNote = getNoteAssignment(oneTreatmentDetial.Treatment_Detial_Id);
                    yourHTMLStringTrack = "<div class='sortable-moves col-xs-12' style='margin-left: " + marginTreeTrack + "%;'>" +
                                            "<img class='img-fluid p-absolute' src='../../../../media/Profile/" + oneTreatmentDetial.Employee_Structure.Employee.Employee_Profile + "' alt=''>" +
                                            "<h6 class='d-inline-block'>" + oneTreatmentDetial.Employee_Structure.Employee.Employee_Name_En + "</h6>" +
                                            "<span class='label label-default f-right'>" + oneTreatmentDetial.Treatment_Detial_Date + "</span>" +
                                            "<div class='f-13 text-muted'>" + oneTreatmentDetial.Employee_Structure.Structure.Structure_Name_En + "</div>" +
                                            "<h6 class='d-inline-block'> From: " + oneTreatmentDetial.Treatment_Master.Employee_Structure.Employee.Employee_Name_En + "</h6></br>" +
                                            "<h6 class='d-inline-block'> Procedure: " + oneTreatmentDetial.Treatment_Master.Treatment_Procedure.Treatment_Procedure_Name_En + "</h6>";
                    if(innerIsPath || !innerIsSecert)
                        yourHTMLStringTrack += "<p>" + detialAssingmentNote + "</p>";
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
                                if (tabId == 2) isSecert = true;
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
                if (tabId == 2) isSecert = true;
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
                        detialAssingmentNote = assDetial.Note;
                }
                else
                {
                    detialAssingmentNote = assDetialParent.Treatment_Master.Treatment_Subject;
                }
            }
            catch { detialAssingmentNote = ""; }
            return detialAssingmentNote;
        }

    }
}