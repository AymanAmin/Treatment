using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Treatment.Pages.Admin
{
    public partial class TestPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridViewFeaturesHelper.SetupGlobalGridViewBehavior(grid);
        }

        protected void chkShowHeaders_CheckedChanged(object sender, EventArgs e)
        {
            grid.Settings.ShowColumnHeaders = chkShowHeaders.Checked;
        }
    }
}