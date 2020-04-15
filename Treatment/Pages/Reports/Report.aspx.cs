using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Treatment.Pages.Reports
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TreatmentReport report = new TreatmentReport();
            report.RequestParameters = false;
            report.Parameters["TreatmentID"].Value = 1007;
            TreatmentASPxDocumentViewer.Report = report;
            
        }
    }
}