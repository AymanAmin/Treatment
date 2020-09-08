using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Website.Classes;
using Treatment.Entity;

namespace Treatment.Pages.Reports
{
    public partial class Report : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Setting/Auth/Login.aspx");
           
            List<Employee_Structure> stList = db.Employee_Structure.Where(x => x.Employee_Id == SessionWrapper.LoggedUser.Employee_Id).ToList(); 
            try
            {
                int treatmentId = 0;
                if (int.TryParse(Request["getTreatmentId"], out treatmentId) && treatmentId > 0)
                {
                    Treatment_Master treat_Master = db.Treatment_Master.Find(treatmentId);

                    TreatmentReport report = new TreatmentReport();
                    report.RequestParameters = false;
                    report.Parameters["TreatmentID"].Value = treatmentId;
                    report.Parameters["TreatmentNumber"].Value = treat_Master.Treatment_Number;
                    report.Parameters["PreparedStructure"].Value = treat_Master.Structure.Structure_Name_En;
                    report.Parameters["TreatmentDate"].Value = treat_Master.Create_Date;
                    report.Parameters["TreatmentSubject"].Value = treat_Master.Treatment_Subject; 
                    report.Parameters["body"].Value = "<div style='text-align: left !important;direction: ltr !important;'>" + treat_Master.Treatment_Body + "<div>";
                    report.Parameters["CurrentUser"].Value = SessionWrapper.LoggedUser.Employee_Name_En;
                    try { report.Parameters["CurrentManagment"].Value =  stList[0].Structure.Structure_Name_En; }
                    catch { }
                    TreatmentASPxDocumentViewer.Report = report;
                }
            }
            catch (Exception er){ }
            
        }
    }
}