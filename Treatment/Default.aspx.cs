using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Classes;
using Treatment.Entity;
using Website.Classes;

namespace Treatment
{
    public partial class Default : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        List<Treatment_Master> treatmentList = new List<Treatment_Master>();
        List<Treatment_Detial> treatmentDList = new List<Treatment_Detial>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Setting/Auth/Login.aspx");
            int UserID = SessionWrapper.LoggedUser.Employee_Id;
            treatmentList = db.Treatment_Master.Where(x => x.From_Employee_Structure_Id == UserID).ToList();
            treatmentDList = db.Treatment_Detial.Where(x => x.To_Employee_Structure_Id == UserID).ToList();
            Treatment_Status();
            Charts(treatmentList, treatmentDList);
        }
        private void Treatment_Status()
        {
            txtAllTreatment.Text = (treatmentList.Count() + treatmentDList.Count()).ToString();
            txtNewInboxTreatment.Text = treatmentDList.Where(x => x.Assignment_Status_Id != 3).Count().ToString();
            txtOutboxTreatment.Text = treatmentList.Where(x => x.Treatment_Status_Id == 1).Count().ToString();
            txtComplateTreatment.Text = (treatmentDList.Where(x => x.Assignment_Status_Id == 3).Count()).ToString();
            string str = "update : ";
            if (false)
                str = "اخر تحديث :";
            txtLastUpdateOne.Text = str + DateTime.Now.ToShortTimeString();
            txtLastUpdateTwo.Text = str + DateTime.Now.ToShortTimeString();
            txtLastUpdateThree.Text = str + DateTime.Now.ToShortTimeString();
            txtLastUpdateFour.Text = str + DateTime.Now.ToShortTimeString();
        }
        private void Charts(List<Treatment_Master> MasterList, List<Treatment_Detial> DetialList)
        {
            List<Treatment_Master> FullMaster_Treatment = db.Treatment_Master.ToList();
            /* Pie Chart */
            int new_treatment = DetialList.Where(x => x.Assignment_Status_Id == 1 && x.Is_Delete == false).Count();
            int under_process_treatment = DetialList.Where(x => x.Assignment_Status_Id == 2 && x.Is_Delete == false).Count() + MasterList.Where(x => x.Treatment_Status_Id == 1).Count();
            int finished_treatment = DetialList.Where(x => x.Assignment_Status_Id == 3 && x.Is_Delete == false).Count();
            int deleted_treatment = DetialList.Where(x => x.Is_Delete == true).Count() * 0;

            string New = FieldNames.getFieldName("Default-New", "New");
            string Under_Process = FieldNames.getFieldName("Default-UnderProcess", "Under Process");
            string Finised = FieldNames.getFieldName("Default-Finised", "Finised");
            string Deleted = FieldNames.getFieldName("Default-Deleted", "Deleted"); 

            string data = "[" + new_treatment + ", " + under_process_treatment + ", " + finished_treatment + ", " + deleted_treatment + "]";
            string names = "['"+New+"', '"+Under_Process+"', '"+Finised+"', '"+Deleted+"']";
            string Pie_Function = "Pie_Chart(" + data + "," + names + ");";
            /*  End of Pie Chart */


            /* Treatment Per mounth Chart */
            DateTime date_today = DateTime.Now;
            int day = date_today.Day;
            date_today = date_today.AddDays(-day + 1);
            List<DateTime> DateList = new List<DateTime>();
            for (int i = 0; i < 6; i++)
            {
                DateList.Add(date_today);
                date_today = date_today.AddMonths(-1);
            }

            string Total = "[";
            string Recived = "[";
            string Sent = "[";
            string categories = "[";

            for (int i = DateList.Count - 1; i >= 0; i--)
            {
                int sent = MasterList.Where(x => x.Create_Date > DateList[i] && x.Create_Date < DateList[i].AddDays(30)).Count();
                int recived = 0;
                for (int k = 0; k < DetialList.Count; k++)
                {
                    recived += FullMaster_Treatment.Where(x => x.Create_Date > DateList[i] && x.Create_Date < DateList[i].AddDays(30) && x.Treatment_Id == DetialList[k].Treatment_Id).Count();
                }

                Total += (sent + recived).ToString();
                Recived += recived.ToString();
                Sent += sent.ToString();
                categories += "'" + DateList[i].ToString("MMM", CultureInfo.InvariantCulture) + "'";
                if (i > 0)
                {
                    Total += ",";
                    Recived += ",";
                    Sent += ",";
                    categories += ",";
                }
            }
            Total += "]";
            Recived += "]";
            Sent += "]";
            categories += "]";
            string Treatment_Per_Mounth_Function = "Pie_ChartColumn(" + Total + "," + Recived + "," + Sent + "," + categories + ");";
            /* End Treatment Per mounth Chart */

            /* Call javascript funcations   */
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", Pie_Function + "  " + Treatment_Per_Mounth_Function, true);
        }
    }
}