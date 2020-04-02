using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;

namespace Treatment.Pages.Treatment
{
    public partial class ShowTreatment : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        int treatmentId = 2003, treatmentDetialId = 2006;
        string messageReplyForm = "", messageAssignmentForm = "";
        int currentStructureUserId = 1;
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.TryParse(Request["getTreatmentId"], out treatmentId) && treatmentId > 0)
            {
                if (loadTreatment())
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

        private bool loadTreatment()
        {
            var showTreatment = db.Treatment_Master.First(x => x.Treatment_Id == treatmentId);
            speech.InnerHtml = showTreatment.Treatment_Body;
            subject.InnerText = showTreatment.Treatment_Subject;
            treatmentDate.InnerText = showTreatment.Treatment_Date.ToString();
            treatmentProcedure.InnerText = showTreatment.Treatment_Procedure.Treatment_Procedure_Name_En;
            treatmentManagement.InnerText = showTreatment.Structure.Structure_Name_En;
            treatmentClassification.InnerText = showTreatment.Treatment_Class.Treatment_Class_Name_En;
            treatmentType.InnerText = showTreatment.Treatment_Type.Treatment_Type_Name_En;
            treatmentSecret.InnerText = showTreatment.Treatment_Confidentiality.Treatment_Confidentiality_Name_En;
            treatmentPriority.InnerText = showTreatment.Treatment_Priority.Treatment_Priority_Name_En;
            treatmentSpeedUp.InnerText = showTreatment.Treatment_Delivery.Treatment_Delivery_Name_En;
            treatmentStatus.InnerText = showTreatment.Treatment_Status.Treatment_Status_Name_En;
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
        }

        protected void SaveAssignment_Click(object sender, EventArgs e)
        {
            if (saveAssignmentTreatment())
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  Your Treatment was Sucessfully saved in system');", true);
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
                    newAssignmentTreatment.Treatment_Body = requiredAssignment.Text;
                    newAssignmentTreatment.Treatment_Subject = keyworkAssignment.Text;
                    newAssignmentTreatment.Treatment_Status_Id = 2;
                    newAssignmentTreatment.Treatment_Number = getAssignmentNumber();
                    newAssignmentTreatment.From_Employee_Structure_Id = currentStructureUserId;

                    /////////////////////////////////////// Start Insert To /////////////////////////////////////
                    Treatment_Detial treatmentDetial;
                    for (int i = 0; i < treatmentTo.Items.Count; i++)
                    {
                        if (treatmentTo.Items[i].Selected)
                        {
                            treatmentDetial = new Treatment_Detial();
                            treatmentDetial.To_Employee_Structure_Id = int.Parse(treatmentTo.Items[i].Value);
                            treatmentDetial.Parent = treatmentId;
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
                            treatmentDetial.To_Employee_Structure_Id = int.Parse(treatmentCopyTo.Items[i].Value);
                            treatmentDetial.Parent = treatmentId;
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
                }
                catch { messageAssignmentForm = "Erorr to save data in system"; return false; }
                return true;
            }
            else
            {
                return false;
            }
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
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  Your Assignment was Sucessfully saved in system');", true);
                clearReplyTreatment();
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
    }
}