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
        protected void Page_Load(object sender, EventArgs e)
        {
            OwnerShipDataSource = new EntityDataSource();
        }

        protected void SaveTreatment_Click(object sender, EventArgs e)
        {
            if (saveTreatment())
            {

            }
            else
            {

            }
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
                    if (checkRequiredReply())
                        newTreatment.Required_Reply_Date = DateTime.Parse(replyDate.Text);

                    db.Treatments.Add(newTreatment);
                    db.SaveChanges();

                }
                catch { return false; }
                return true;
            }
            else
            {
                return false;
            }
        }

        private bool validationForm()
        {
            bool flayVal = false;
            String omer = treatmentTo.Items.ToString();
            String omer1 = treatmentCopyTo.Items.ToString();
            if (treatmentDate.Text.Trim() == "")
            {
                messageForm = "Pleace Enter Treatment Date";
                return false;
            }
            else if (standardProcedure.SelectedValue == "")
            {
                messageForm = "Pleace Select Standard Procedure";
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
            else if (speech.Text.Trim() == "")
            {
                messageForm = "Pleace Enter Speech";
                return false;
            }
            else flayVal = true;
            return flayVal;
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