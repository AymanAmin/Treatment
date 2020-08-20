using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI;
using System.Web.UI.WebControls;
using Website.Classes;
using Treatment.Entity;

namespace Treatment.Pages.Eminutes.Reports
{
    public partial class R_Minutes : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Setting/Auth/Login.aspx");

            List<Employee_Structure> stList = db.Employee_Structure.Where(x => x.Employee_Id == SessionWrapper.LoggedUser.Employee_Id).ToList();
            try
            {
                int Meeting_Id = 0;
                if (int.TryParse(Request["Meeting_Id"], out Meeting_Id) && Meeting_Id > 0)
                {
                    
                   
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                    {
                        Minutes_Ar report = new Minutes_Ar();
                        report.RequestParameters = false;
                        report.Parameters["Meeting_Id"].Value = Meeting_Id;
                        MinutesWebDocumentViewer.Report = report;
                    }
                    else
                    {
                        Minutes report = new Minutes();
                        report.RequestParameters = false;
                        report.Parameters["Meeting_Id"].Value = Meeting_Id;
                        MinutesWebDocumentViewer.Report = report;
                    }
                    
                }
            }
            catch { }
        }
    }
}