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
                TreatmentReport report = new TreatmentReport();
                report.RequestParameters = false;
                report.Parameters["TreatmentID"].Value = Request.Form[3];
                report.Parameters["CurrentUser"].Value = SessionWrapper.LoggedUser.Employee_Name_En;
                try { report.Parameters["CurrentManagment"].Value = stList[0].Structure.Structure_Name_En; } catch { }
                TreatmentASPxDocumentViewer.Report = report;
            }
            catch { }
            
        }
    }
}