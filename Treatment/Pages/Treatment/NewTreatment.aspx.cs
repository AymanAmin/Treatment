using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;

namespace Treatment.Pages.Treatment
{
    public partial class NewTreatment : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        string messageForm = "";
        int currentStructureUserId = 15; 
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        protected void Page_Load(object sender, EventArgs e)
        {
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
                    var newTreatment = db.Treatments.Create();
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
                    newTreatment.From_Employee_Structure_Id = currentStructureUserId;
                    if (checkRequiredReply())
                        newTreatment.Required_Reply_Date = DateTime.Parse(replyDate.Text);

                    /////////////////////////////////////// Start Insert To /////////////////////////////////////
                    Treatment_Detial treatmentDetial;
                    for (int i = 0; i < treatmentTo.Items.Count; i++)
                    {
                        if (treatmentTo.Items[i].Selected)
                        {
                            treatmentDetial = new Treatment_Detial();
                            treatmentDetial.To_Employee_Structure_Id = int.Parse(treatmentTo.Items[i].Value);
                            treatmentDetial.Parent = 0;
                            treatmentDetial.Assignment_Status_Id = 1;
                            treatmentDetial.Is_Read = false;
                            treatmentDetial.Is_Delete = false;
                            treatmentDetial.Treatment_Copy_To = false;
                            newTreatment.Treatment_Detial.Add(treatmentDetial);
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
                            treatmentDetial.Parent = 0;
                            treatmentDetial.Assignment_Status_Id = 1;
                            treatmentDetial.Is_Read = false;
                            treatmentDetial.Is_Delete = false;
                            treatmentDetial.Treatment_Copy_To = true;
                            newTreatment.Treatment_Detial.Add(treatmentDetial);
                        }
                    }
                    /////////////////////////////////////// End Insert Copy To /////////////////////////////////////

                    db.Treatments.Add(newTreatment);
                    db.SaveChanges();
                    LogData = "data:" + JsonConvert.SerializeObject(newTreatment, logFileModule.settings);
                    logFileModule.logfile(4, "إضافة معاملة", "", LogData);
                }
                catch { messageForm = "Erorr to save data in system";  return false; }
                return true;
            }
            else
            {
                return false;
            }
        }

        private string getTreatmentNumber()
        {
            string treatmentNumber = "";
            using (var db1 = new ECMSEntities())
            {
                try
                {
                    Int64 dc = db.Treatments.ToList().Max(e => Convert.ToInt64(e.Treatment_Id));
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
            /*else if (speech.Text.Trim() == "")
            {
                messageForm = "Pleace Enter Speech";
                return false;
            }*/
            else return true;
        }
        private bool checkRequiredReply()
        {
            if (requiredReply.Text == "on")
                return true;
            else
                return false;
        }
    }
    
}