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

                    var Emp = (from M in db.M_Meeting join MB in db.M_Board_Member on M.Board_Id equals MB.Board_Id join Em in db.Employees on MB.Employee_Id equals Em.Employee_Id where MB.Member_Type_Id == 3 && M.Meeting_Id == Meeting_Id  select new { Em }).ToList() ;
                    if (Request["Lang"] == "Ar")
                    {
                        Minutes_Ar report = new Minutes_Ar();
                        report.RequestParameters = false;
                        report.Parameters["Meeting_Id"].Value = Meeting_Id;
                        report.Parameters["ESignature"].Value = Emp[0].Em.Employee_Signature;
                        MinutesWebDocumentViewer.Report = report;
                    }
                    else
                    {
                        Minutes report = new Minutes();
                        report.RequestParameters = false;
                        report.Parameters["Meeting_Id"].Value = Meeting_Id;
                        report.Parameters["ESignature"].Value = Emp[0].Em.Employee_Signature;
                        MinutesWebDocumentViewer.Report = report;
                    }
                    
                }
            }
            catch { }
        }
    }
}