using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;
using Website.Classes;

namespace Treatment.Pages.Treatment
{
    public partial class NewTreatment : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        string messageForm = "";
        int currentUserId = 0; 
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            checkLogin();
            currentUserId = SessionWrapper.LoggedUser.Employee_Id;
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

        protected void SaveTreatment_Click(object sender, EventArgs e)
        {
            if (saveTreatment())
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  Your Treatment was Sucessfully saved in system');", true);
                clearTreatment();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','" + messageForm + "');", true);
            }
        }

        private void clearTreatment()
        {
            treatmentDate.Text = "";
            subjectTreatement.Text = "";
            treatmentTo.ClearSelection();
            treatmentCopyTo.ClearSelection();
            speech.Text = "";
            replyDate.Text = "";
            requiredReply.Text = "";
            standardProcedure.ClearSelection();
            preparedManagement.ClearSelection();
            typeTreatment.ClearSelection();
            classificationSubject.ClearSelection();
            secretLevel.ClearSelection();
            priorityLevel.ClearSelection();
            speedUp.ClearSelection();
        }
        private bool saveTreatment()
        {
            if (validationForm())
            {
                try
                {
                    var newTreatment = db.Treatment_Master.Create();
                    newTreatment.Create_Date = DateTime.Now;
                    newTreatment.Update_Date = DateTime.Now;
                    newTreatment.Treatment_Date = DateTime.Parse(treatmentDate.Text);
                    newTreatment.Treatment_Procedure_Id = int.Parse(standardProcedure.SelectedValue);
                    newTreatment.Treatment_Type_Id = int.Parse(typeTreatment.SelectedValue);
                    newTreatment.Prepared_Administration_Id = int.Parse(preparedManagement.SelectedValue);
                    newTreatment.Treatment_Class_Id = int.Parse(classificationSubject.SelectedValue);
                    newTreatment.Treatment_Subject = subjectTreatement.Text;
                    newTreatment.Treatment_Confidentiality_Id = int.Parse(secretLevel.SelectedValue);
                    newTreatment.Treatment_Priority_id = int.Parse(priorityLevel.SelectedValue);
                    newTreatment.Treatment_Delivery_Id= int.Parse(speedUp.SelectedValue);
                    newTreatment.Treatment_Body = speech.Text;
                    newTreatment.Required_Reply = checkRequiredReply();
                    newTreatment.Treatment_Status_Id = 1;
                    newTreatment.Treatment_Number = getTreatmentNumber();
                    newTreatment.From_Employee_Structure_Id = getStructure(currentUserId);
                    newTreatment.Treatment_Mother = 0;
                    if (checkRequiredReply())
                        newTreatment.Required_Reply_Date = DateTime.Parse(replyDate.Text);
                    /////////////////////////////////////// Start Insert Send To /////////////////////////////////////
                    Treatment_Detial treatmentDetial;
                    for (int i = 0; i < treatmentTo.Items.Count; i++)
                    {
                        if (treatmentTo.Items[i].Selected)
                        {
                            treatmentDetial = new Treatment_Detial();
                            treatmentDetial.To_Employee_Structure_Id = getStructure(int.Parse(treatmentTo.Items[i].Value));
                            treatmentDetial.Parent = 0;
                            treatmentDetial.Assignment_Status_Id = 1;
                            treatmentDetial.Is_Read = false;
                            treatmentDetial.Is_Delete = false;
                            treatmentDetial.Treatment_Copy_To = false;
                            newTreatment.Treatment_Detial.Add(treatmentDetial);
                        }
                    }
                    /////////////////////////////////////// End Insert Send To /////////////////////////////////////

                    /////////////////////////////////////// Start Insert Copy To /////////////////////////////////////
                    for (int i = 0; i < treatmentCopyTo.Items.Count; i++)
                    {
                        if (treatmentCopyTo.Items[i].Selected)
                        {
                            treatmentDetial = new Treatment_Detial();
                            treatmentDetial.To_Employee_Structure_Id = getStructure(int.Parse(treatmentCopyTo.Items[i].Value));
                            treatmentDetial.Parent = 0;
                            treatmentDetial.Assignment_Status_Id = 1;
                            treatmentDetial.Is_Read = false;
                            treatmentDetial.Is_Delete = false;
                            treatmentDetial.Treatment_Copy_To = true;
                            newTreatment.Treatment_Detial.Add(treatmentDetial);
                        }
                    }
                    /////////////////////////////////////// End Insert Copy To /////////////////////////////////////

                    /////////////////////////////////////// Start Add Attachment /////////////////////////////////////
                    foreach (HttpPostedFile postfiles in addAttachments1111.PostedFiles)
                    {
                        if (postfiles.ContentLength > 0 && postfiles.FileName != "")
                        {
                            Attachment addAtachtmentTreatment = new Attachment();
                            addAtachtmentTreatment.Attachment_Path = UploadFile(postfiles);
                            addAtachtmentTreatment.Attachment_Name = postfiles.FileName;
                            newTreatment.Attachments.Add(addAtachtmentTreatment);
                        }
                    }
                    /////////////////////////////////////// End Add Attachment /////////////////////////////////////
                    db.Treatment_Master.Add(newTreatment);
                    db.SaveChanges();
                    if (insertNotification(newTreatment.Treatment_Id)) { }
                    db.Configuration.LazyLoadingEnabled = false;
                    LogData = "data:" + JsonConvert.SerializeObject(newTreatment, logFileModule.settings);
                    logFileModule.logfile(1009, "إضافة معاملة جديدة", "Create New Treatment", LogData);

                }
                catch (Exception exceptionLog) 
                {
                    string exceptionStackTrace = exceptionLog.StackTrace;
                    string exceptionGetType = exceptionLog.GetType().ToString();
                    string exceptionMessage = exceptionLog.Message;
                    logFileModule.logfile(1025, exceptionStackTrace, exceptionGetType, exceptionMessage);
                    messageForm = "Erorr to save data in system";
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
                Employee_Structure employeeStructure = db.Employee_Structure.First(x => x.Employee_Id == employeeId);
                employeeStructureId = (int)employeeStructure.Employee_Structure_Id;
            }
            catch (Exception exceptionLog)
            {
                string exceptionStackTrace = exceptionLog.StackTrace;
                string exceptionGetType = exceptionLog.GetType().ToString();
                string exceptionMessage = exceptionLog.Message;

                logFileModule.logfile(1025, exceptionStackTrace, exceptionGetType, exceptionMessage);
                messageForm = "Erorr to get Data Structure";
            }
            return employeeStructureId;
        }
        private string getTreatmentNumber()
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
        private bool validationForm()
        {
            if (treatmentDate.Text.Trim() == "")
            {
                messageForm = "Pleace Enter Treatment Date";
                return false;
            }
            else if (treatmentTo.SelectedValue == "")
            {
                messageForm = "Pleace Select Send To";
                return false;
            }
            else if (typeTreatment.SelectedValue == "")
            {
                messageForm = "Pleace Select Type Treatment";
                return false;
            }
            else if (subjectTreatement.Text.Trim() == "")
            {
                messageForm = "Pleace Enter Subject";
                return false;
            }
            else if (secretLevel.SelectedValue == "")
            {
                messageForm = "Pleace Select Secret Level";
                return false;
            }
            else if (priorityLevel.SelectedValue == "")
            {
                messageForm = "Pleace Select Priority Level";
                return false;
            }
            else if (speedUp.SelectedValue == "")
            {
                messageForm = "Pleace Select Speed Up";
                return false;
            }
            else if (checkRequiredReply())
            {
                if (replyDate.Text.Trim() == "")
                {
                    messageForm = "Pleace Enter Date Required Reply";
                    return false;
                }
                else return true;
            }
            else return true;
        }
        private bool checkRequiredReply()
        {
            if (requiredReply.Text == "on")
                return true;
            else
                return false;
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
                            notificationMaster.Notification_Description_En = "";
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


    }
    
}