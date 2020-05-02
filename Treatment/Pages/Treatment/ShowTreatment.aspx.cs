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
        int treatmentId = 0, recoverParentid = 0, treatmentDetialId = 0, tabId = 0, notificationMasterId = 0, attachmentMasterId = 0;
        string messageForm = "", messageReplyForm = "", messageAssignmentForm = "", yourHTMLStringTrack = "", detialAssingmentNote = "", _fileExt = "";
        int currentStructureUserId = 0, currentUserId = 0, marginTreeTrack = 0 ;
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        List<Treatment_Detial> treeTreatmentDetial;
        List<Treatment_Detial> doneTreatmentDetial;
        Treatment_Detial oneTreatmentDetial;
        Treatment_Detial recoverTreatmentDetial;
        Treatment_Detial isTreatmentDetialParent;
        bool isSecert = false, isPath = false, flayRequiredReply = false;
        List<Attachment> listAttachmentTrack;
        string treatmentDetialDate = "";
            
        List<Structure> ListStructure = new List<Structure>();
        protected void Page_Load(object sender, EventArgs e)
        {
            reloadPage();
        }

        private void reloadPage()
        {
            checkLogin();
            db = new ECMSEntities();
            treatmentId = 0; recoverParentid = 0; treatmentDetialId = 0; tabId = 0; notificationMasterId = 0;
            isSecert = false; isPath = false;
            currentUserId = SessionWrapper.LoggedUser.Employee_Id;
            currentStructureUserId = getStructure(currentUserId);
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
                        if (tabId == 1 || tabId == 3)
                        {
                            if (int.TryParse(Request["getTreatmentDetialId"], out treatmentDetialId) && treatmentDetialId > 0)
                            {
                                Treatment_Detial isTreatmentDetial = db.Treatment_Detial.First(x => x.To_Employee_Structure_Id == currentStructureUserId && x.Treatment_Detial_Id == treatmentDetialId);

                                Treatment_Master isTreatmentMasterDetial = db.Treatment_Master.FirstOrDefault(x => x.From_Employee_Structure_Id == currentStructureUserId && x.Treatment_Id == treatmentId);
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
                            else Response.Redirect("~/Pages/Treatment/Inbox.aspx");
                        }
                        else if(tabId == 2)
                        {
                            if (isTreatment.From_Employee_Structure_Id == currentStructureUserId)
                            {
                                treatmentDetialId = 0;
                                actionReply.Style["display"] = "none";
                                return;
                            }
                            else Response.Redirect("~/Pages/Treatment/Inbox.aspx");
                        }
                        else if (tabId == 4 && treatmentDetialId == 0)
                        {
                            if (int.TryParse(Request["getNotificationId"], out notificationMasterId) && notificationMasterId > 0)
                            {
                                actionReply.Style["display"] = "none";
                                updatetReadNotification(notificationMasterId);
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
                treatmentSecret.InnerHtml = "<label class='" + showTreatment.Treatment_Confidentiality.Css_Class + "'>" + showTreatment.Treatment_Confidentiality.Treatment_Confidentiality_Name_En + "</label>";
                treatmentPriority.InnerHtml = "<a href='#!' data-toggle='tooltip' data-placement='top' data-trigger='hover' title='" + showTreatment.Treatment_Priority.Treatment_Priority_Name_En + "'>" +
                                                     "<i class='" + showTreatment.Treatment_Priority.Css_Class + "'></i>" +
                                                "</a>&nbsp;" + showTreatment.Treatment_Priority.Treatment_Priority_Name_En;
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
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  Your Reply was Sucessfully saved in system');", true);
                clearReplyTreatment();
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
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
                    string linkNotif = "../../../../Pages/Treatment/ShowTreatment.aspx?getTreatmentId=" + treatmentId + "&getTabId=4&getTreatmentDetialId=" + newReplyTreatment.Parent + "&getNotificationId=";
                    int notifSendTo = (int)newReplyTreatment.Treatment_Master.From_Employee_Structure_Id;
                    if (insertNotification(replyTreatement.Text, replyTreatement.Text, newReplyTreatment.Treatment_Master.Treatment_Id, linkNotif, notifSendTo,2))
                    {

                    }
                    else
                    {

                    }
                    db.Configuration.LazyLoadingEnabled = false;
                    LogData = "data:" + JsonConvert.SerializeObject(newReplyTreatment, logFileModule.settings);
                    logFileModule.logfile(1009, "إضافة رد علي معاملة", "add Reply Treatment", LogData);
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
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
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
                    db.Configuration.LazyLoadingEnabled = false;
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
                        newAssignmentTreatment.Required_Reply_Date = DateTime.Parse(replyDate10.Text);
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

                    LogData = "data:" + JsonConvert.SerializeObject(newAssignmentTreatment, logFileModule.settings);
                    logFileModule.logfile(1009, "إضافة إحالة", "add Assignment", LogData);
                    if (!flayRequiredReply)
                    {
                        if (!closeAssignmentTreatment(false))
                        {
                            messageAssignmentForm = "Erorr to save Close Assignment data in system";
                            return false;
                        }
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
            if (closeAssignmentTreatment(true))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  Your Close Treatment was Sucessfully saved in system');", true);
                actionReply.Style["display"] = "none";
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','" + messageReplyForm + "');", true);
            }
        }

        private bool closeAssignmentTreatment(bool flayInsertNotification)
        {
            try
            {
                var closeAssignment = db.Treatment_Detial.First(x => x.Treatment_Detial_Id == treatmentDetialId);
                closeAssignment.Treatment_Detial_Date = DateTime.Now;
                closeAssignment.Assignment_Status_Id = 3;
                closeAssignment.Note = "Done Close Treatment";
                db.Entry(closeAssignment).State = EntityState.Modified;
                db.SaveChanges();
                db.Configuration.LazyLoadingEnabled = false;
                LogData = "data:" + JsonConvert.SerializeObject(closeAssignment, logFileModule.settings);
                logFileModule.logfile(1009, " اغلاق المعاملة", "Close Treatment", LogData);
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
                    yourHTMLStringTrack = "<div class='sortable-moves col-xs-12' style='margin-left: " + marginTreeTrack + "%;'>" +
                                            "<img class='img-fluid p-absolute' src='../../../../media/Profile/" + oneTreatmentDetial.Employee_Structure.Employee.Employee_Profile + "' alt=''>" +
                                            "<h6 class='d-inline-block'>" + oneTreatmentDetial.Employee_Structure.Employee.Employee_Name_En + "</h6>" +
                                            "<span class='label label-default f-right'>" + treatmentDetialDate + "</span>" +
                                            "<div class='f-13 text-muted'>" + oneTreatmentDetial.Employee_Structure.Structure.Structure_Name_En + "</div>" +
                                            "<h6 class='d-inline-block'> From: " + oneTreatmentDetial.Treatment_Master.Employee_Structure.Employee.Employee_Name_En + "</h6></br>" +
                                            "<h6 class='d-inline-block'> Procedure: " + oneTreatmentDetial.Treatment_Master.Treatment_Procedure.Treatment_Procedure_Name_En + "</h6>";
                    if(innerIsPath || !innerIsSecert)
                        yourHTMLStringTrack += "<p>" + detialAssingmentNote + "</p>";
                    if (isTreatmentDetialParent != null)
                    {
                        attachmentMasterId = (int)isTreatmentDetialParent.Treatment_Id;
                        listAttachmentTrack = new List<Attachment>();
                        listAttachmentTrack = db.Attachments.Where(x => x.Attachment_Type == 2 && x.Treatment_Id == attachmentMasterId).ToList<Attachment>();
                        if (listAttachmentTrack.Count > 0)
                        {
                            yourHTMLStringTrack += "<div class='row' style='margin-right: 0%;'>";
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
                        detialAssingmentNote = "Reply: " + assDetial.Note;
                }
                else
                {
                    detialAssingmentNote = "New: " + assDetialParent.Treatment_Master.Treatment_Subject;
                    var assDetial1 = db.Treatment_Detial.FirstOrDefault(x => x.Treatment_Detial_Id == tdid);
                    if (assDetial1.Note != null)
                    {
                        detialAssingmentNote += "</br>" + "Reply: " + assDetial1.Note;
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

                            linkNotif = "../../../../Pages/Treatment/ShowTreatment.aspx?getTreatmentId=" + treatmentIdNotf + "&getTabId=4&getTreatmentDetialId=" + listTreatmentDetialNotf[i].Treatment_Detial_Id + "&getNotificationId=";
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

        private bool fillAllStructure()
        {
            try
            {
                List<Employee_Structure> ListEmployeeStructure10 = new List<Employee_Structure>();
                ListEmployeeStructure10 = loadSendEmployeeStructure();
                var dc = from c in ListEmployeeStructure10
                         where c.Employee_Id != currentUserId
                         select new
                         {
                             ddlKey = c.Employee_Structure_Id,
                             ddlValue = c.Employee.Employee_Name_En + " '" + c.Structure.Structure_Name_En + "'",
                         };

                ddlFiller.dropDDLBox(treatmentTo, "ddlKey", "ddlValue", dc.ToList());
                ddlFiller.dropDDLBox(treatmentCopyTo, "ddlKey", "ddlValue", dc.ToList());
                ////////////////////////////////////////////////////////////////////////////////////////////////

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
                }
            }
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
                }
            }
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
    }
}