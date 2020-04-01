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
        int treatmentId = 5, treatmentDetialId = 5;
        string messageReplyForm = "";
        int currentStructureUserId = 1;
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (loadTreatment())
            {

            }
            else
            {

            }
        }

        private bool loadTreatment()
        {
            var showTreatment = db.Treatments.First(x => x.Treatment_Id == treatmentId);
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
    }
}