using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Treatment
{
    public partial class Default : System.Web.UI.Page 
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Treatment_Status();
            Charts();
        }
        private void Treatment_Status()
        {
            txtAllTreatment.Text = "742";
            txtNewInboxTreatment.Text = "531";
            txtOutboxTreatment.Text = "211";
            txtComplateTreatment.Text = "676";

            txtLastUpdateOne.Text = "update : " + DateTime.Now.ToShortTimeString();
            txtLastUpdateTwo.Text = "update : " + DateTime.Now.ToShortTimeString();
            txtLastUpdateThree.Text = "update : " + DateTime.Now.ToShortTimeString();
            txtLastUpdateFour.Text = "update : " + DateTime.Now.ToShortTimeString();
            // Ayman
        }
        private void Charts()
        {
            /* Pie Chart */
            string data = "[8, 27, 115, 3]";
            string names = "['New', 'Under Process', 'Finised', 'Deleted']";
            string Pie_Function = "Pie_Chart(" + data + "," + names + ");";
            /*  End of Pie Chart */

            /* Treatment Per mounth Chart */
            string Total = "[44, 55, 57, 56, 61, 58, 63, 60, 66]";
            string Recived = "[76, 85, 101, 98, 87, 105, 91, 114, 94]";
            string Sent = "[35, 41, 36, 26, 45, 48, 52, 53, 41]";
            string categories = "['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep']";
            string Treatment_Per_Mounth_Function = "Pie_ChartColumn(" + Total + "," + Recived + "," + Sent + "," + categories + ");";
            /* End Treatment Per mounth Chart */
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", Pie_Function +"  "+ Treatment_Per_Mounth_Function, true);
        }
    }
}