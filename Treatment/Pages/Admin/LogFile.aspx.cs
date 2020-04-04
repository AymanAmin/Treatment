using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;

namespace Treatment.Pages.Admin
{
    public partial class LogFile : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                /*LogFileGridView.DataBind();
                LogFileGridView.DetailRows.ExpandRow(0);*/
            }

        }

        protected void detailGrid_DataSelect(object sender, EventArgs e)
        {
            
            Int32 id = (Int32)(sender as ASPxGridView).GetMasterRowKeyValue();
            Session["LogID"] = id;
        }

        protected void detailGrid_CustomUnboundColumnData(object sender, ASPxGridViewColumnDataEventArgs e)
        {
            
        }

        protected void chkSingleExpanded_CheckedChanged(object sender, EventArgs e)
        {
            LogFileGridView.SettingsDetail.AllowOnlyOneMasterRowExpanded = chkSingleExpanded.Checked;
            if (LogFileGridView.SettingsDetail.AllowOnlyOneMasterRowExpanded)
            {
                LogFileGridView.DetailRows.CollapseAllRows();
            }
        }
    }
}