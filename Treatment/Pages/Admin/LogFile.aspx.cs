using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;
using Website.Classes;

namespace Treatment.Pages.Admin
{
    public partial class LogFile : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        UtilityClass UC = new UtilityClass();

        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["IsECMS"] != null)
                if (!(bool)Session["IsECMS"])
                    this.MasterPageFile = "~/EminutesMaster.Master";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            LogFileGridView.SettingsDetail.AllowOnlyOneMasterRowExpanded = true;
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
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "changeView();", true);
        }

        protected void detailGrid_CustomUnboundColumnData(object sender, ASPxGridViewColumnDataEventArgs e)
        {

        }

        protected void chkSingleExpanded_CheckedChanged(object sender, EventArgs e)
        {
            LogFileGridView.SettingsDetail.AllowOnlyOneMasterRowExpanded = true;// chkSingleExpanded.Checked;
            if (LogFileGridView.SettingsDetail.AllowOnlyOneMasterRowExpanded)
            {
                LogFileGridView.DetailRows.CollapseAllRows();
            }
        }

        protected void LogFileGridView_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            {
                if (SessionWrapper.LoggedUser.Calendar_id != null)
                    if (SessionWrapper.LoggedUser.Calendar_id != 1)// if He select Hijri calender
                        if (e.DataColumn.FieldName != "Log_Date") return;
                        else
                        {
                            DateTime date = DateTime.Parse(e.CellValue.ToString());
                            string Hijri_date = UC.ConvertDateCalendar(date, "Hijri", "ar-SA");
                            //new_date = UC.ConvertDateCalendar(date, "Gregorian", "en-US");
                            int index = Hijri_date.IndexOf(" ");
                            if (index > 0)
                                Hijri_date = Hijri_date.Substring(0, index);
                            e.Cell.Text = Hijri_date + " " + date.ToShortTimeString();
                        }
            }
        }
    }
}