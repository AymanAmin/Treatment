using DevExpress.Web;
using DevExpress.Web.ASPxTreeList;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
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
        int currentUserId = 0, currentStructureUserId = 0; 
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                checkLogin();
                currentUserId = SessionWrapper.LoggedUser.Employee_Id;
                currentStructureUserId = getStructure(currentUserId);
                treatmentDate.Text = DateTime.Now.Date.ToShortDateString();
                fillAllStructure();
            }
            else
            {
                getEmployeeTable();
                getEmployeeTree();
                //fillAllStructure();
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

        private List<Employee_Structure> loadSendEmployeeStructure()
        {
            List<Employee_Structure> ListEmployeeStructure = new List<Employee_Structure>();
            Employee_Structure addEmployeeStructure;
            Employee_Structure oneEmployeeStructure;
            using (ECMSEntities dbEcms = new ECMSEntities())
            {
                ////////////////////////////////////////////////// Start get same level structure/////////////////////////////////////////
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
                        if (parentCurrentJobTitle != 0)
                        {
                            int strurId = 0;
                            bool flayAdd = false;
                            int parentCurrent = -1;
                            if ((bool)oneEmployeeStructure.Structure.Is_Manager)
                            {
                                Structure oneStructure = dbEcms.Structures.First(x => x.Structure_Id == parentCurrentJobTitle);
                                parentCurrent = (int)oneStructure.Structure_Parent;
                            }
                            List<Structure> ListGetSameLevel = dbEcms.Structures.Where(x => (x.Structure_Parent == parentCurrent && x.Structure_Id != parentCurrentJobTitle) || (x.Structure_Parent == parentCurrentJobTitle && x.Structure_Id != structureIdCurrent)).ToList<Structure>();
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
                                    addEmployeeStructure.Structure = oneEmployeeStructure.Structure;
                                    addEmployeeStructure.Employee = oneEmployeeStructure.Employee;
                                    addEmployeeStructure.Employee_Structure_Id = oneEmployeeStructure.Employee_Structure_Id;
                                    addEmployeeStructure.Employee_Id = oneEmployeeStructure.Employee_Id;
                                    addEmployeeStructure.Structure_Id = oneEmployeeStructure.Structure_Id;
                                    ListEmployeeStructure.Add(addEmployeeStructure);
                                }
                                flayAdd = false;
                            }
                        }
                    }
                }
                catch(Exception eees){}
                ////////////////////////////////////////////////// End get same level structure/////////////////////////////////////////


            }
            return ListEmployeeStructure;
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
                                ListStructure = dbEcms.Structures.Where(x => x.Is_Job_Title == false && (x.Structure_Parent == getIdStructure || x.Structure_Parent == getParentStructure)).ToList<Structure>();
                            }
                        }
                    }
                }
                catch (Exception eees) { }
            }
            return ListStructure;
        }

        private void fillAllStructure()
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

            ////////////////////////////////////////////////////////////////////////////////////////////////
            List<Structure> ListStructure = new List<Structure>();
            ListStructure = loadTreeStructure();
            var dc2 = from c in ListStructure
                      select new
                      {
                          c.Structure_Id,
                          c.Structure_Name_Ar,
                          c.Structure_Name_En,
                          c.Structure_Parent
                      };
            ASPxTreeList1.DataSource = ListStructure;

            ASPxTreeList1.DataBind();
        }

        public void getEmployeeTable()
        {

            for (int i = 0; i < ASPxGridView1.VisibleRowCount; i++)
            {
                if (ASPxGridView1.Selection.IsRowSelected(i))
                {
                    string keyValueGrid = ASPxGridView1.GetRowValues(i, "ddlKey").ToString();
                    treatmentTo.Items.FindByValue(keyValueGrid).Selected = true;
                }
            }
        }

        public void getEmployeeTree()
        {
            var listSelectedNodes = ASPxTreeList1.GetAllNodes();
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
                    db.Configuration.LazyLoadingEnabled = false;
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
                Employee_Structure employeeStructure = db.Employee_Structure.First(x => x.Employee_Id == employeeId & x.Default_Structure == true);
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

        protected void Button1_Click(object sender, EventArgs e)
        {

        }


    }
    
}