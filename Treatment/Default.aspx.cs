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
        int EmpStructureID = 0;
        List<Employee_Structure> ListDelegationEmpStru = new List<Employee_Structure>();
        bool isDelegation = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Setting/Auth/Login.aspx");

            EmpStructureID = SessionWrapper.EmpStructure;
            int masterID = 0;
            isDelegation = getIsDelegation();
            ListDelegationEmpStru = getAllEmployeeStructure();
            //int UserID = SessionWrapper.LoggedUser.Employee_Id;
            /*List<Employee_Structure> List_Emp_Struct = db.Employee_Structure.Where(x=> x.Employee_Structure_Id == EmpStructureID || x.Employee_Delegation == EmpStructureID).ToList();
            for(int i = 0; i < List_Emp_Struct.Count; i++)
            {*/
                /*if(List_Emp_Struct[i].Employee_Delegation == EmpStructureID)
                {

                }*/
                /*if (List_Emp_Struct[i].Employee_Delegation == null || List_Emp_Struct[i].Employee_Delegation == 0)
                {
                    EmpStructureID = List_Emp_Struct[i].Employee_Structure_Id;
                    break;
                }

            }

            treatmentList = db.Treatment_Master.Where(x => x.From_Employee_Structure_Id == EmpStructureID).ToList();
            treatmentDList = db.Treatment_Detial.Where(x => x.To_Employee_Structure_Id == EmpStructureID).ToList()*/
            treatmentList = getTreatmentMaster();
            treatmentDList = getTreatmentDetail();
            Treatment_Status();
            Charts(treatmentList, treatmentDList);
        }
        private void Treatment_Status()
        {
            txtAllTreatment.Text = (treatmentDList.Where(x => x.Assignment_Status_Id != 3).Count() + treatmentList.Where(x => x.Treatment_Status_Id == 1).Count() + treatmentDList.Where(x => x.Assignment_Status_Id == 3).Count()).ToString();
            txtNewInboxTreatment.Text = treatmentDList.Where(x => x.Assignment_Status_Id != 3).Count().ToString();
            txtOutboxTreatment.Text = treatmentList.Where(x => x.Treatment_Status_Id == 1).Count().ToString();
            txtComplateTreatment.Text = (treatmentDList.Where(x => x.Assignment_Status_Id == 3).Count()).ToString();
            string str = FieldNames.getFieldName("Default-Update", "Update") + " : ";

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
                int sent = MasterList.Where(x => x.Create_Date > DateList[i] && x.Create_Date < DateList[i].AddDays(30) && x.Treatment_Status_Id == 1).Count();
                int recived = 0;
                for (int k = 0; k < DetialList.Count; k++)
                {
                    recived += FullMaster_Treatment.Where(x => x.Create_Date > DateList[i] && x.Create_Date < DateList[i].AddDays(30) && x.Treatment_Id == DetialList[k].Treatment_Id).Count();
                }

                Total += (sent + recived).ToString();
                Recived += recived.ToString();
                Sent += sent.ToString();
                string mounth = DateList[i].ToString("MMM", CultureInfo.InvariantCulture);
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    mounth = ArabicDate(mounth);
                categories += "'" + mounth + "'";
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

        private string ArabicDate(string DateName)
        {
            if (DateName == "Jan")
                DateName = "يناير";
            else if (DateName == "Feb")
                DateName = "فبراير";
            else if (DateName == "Mar")
                DateName = "مارس";
            else if (DateName == "Apr")
                DateName = "ابريل";
            else if (DateName == "May")
                DateName = "مايو";
            else if (DateName == "Jun")
                DateName = "يونيو";
            else if (DateName == "Jul")
                DateName = "يوليو";
            else if (DateName == "Aug")
                DateName = "أغسطس";
            else if (DateName == "Sep")
                DateName = "سبتمبر";
            else if (DateName == "Oct")
                DateName = "اكتوبر";
            else if (DateName == "Nov")
                DateName = "نوفمبر";
            else if (DateName == "Dec")
                DateName = "ديسمبر";

            return DateName;
        }

        private bool getIsDelegation()
        {
            bool flayDele = false;
            try
            {
                flayDele = (bool)db.Employee_Structure.First(x => x.Employee_Structure_Id == EmpStructureID).Type_Delegation;
                return flayDele;
            }
            catch { return flayDele; }
        }

        private List<Employee_Structure> getAllEmployeeStructure()
        {
            List<Employee_Structure> listEpSt = new List<Employee_Structure>();
            List<Employee_Structure> listEpStRetrun = new List<Employee_Structure>();
            List<Employee_Structure> listEpSt1;
            try
            {
                listEpSt = db.Employee_Structure.Where(x => x.Employee_Delegation == EmpStructureID).ToList<Employee_Structure>();
                listEpStRetrun.AddRange(listEpSt);
                int delgaEpStId = 0;
                for (int i = 0; i < listEpSt.Count; i++)
                {
                    if ((bool)listEpSt[i].Status_Structure && !(bool)listEpSt[i].Type_Delegation)
                    {
                        delgaEpStId = listEpSt[i].Employee_Structure_Id;
                        listEpSt1 = new List<Employee_Structure>();
                        listEpSt1 = db.Employee_Structure.Where(x => x.Employee_Delegation == delgaEpStId).ToList<Employee_Structure>();
                        listEpStRetrun.AddRange(listEpSt1);
                    }
                }
            }
            catch (Exception ee) { }
            return listEpStRetrun;
        }
        private List<Treatment_Detial> getTreatmentDetail()
        {
            List<Treatment_Detial> treatmentDetial = new List<Treatment_Detial>();
            using (ECMSEntities db = new ECMSEntities())
            {
                try
                {
                    treatmentDetial = db.Treatment_Detial.Where(x => x.To_Employee_Structure_Id == EmpStructureID).OrderByDescending(x => x.Treatment_Detial_Id).ToList<Treatment_Detial>();
                    List<Treatment_Detial> treatmentDetialDelegation;
                    int delgEmpStrId = 0;
                    for (int i = 0; i < ListDelegationEmpStru.Count; i++)
                    {
                        delgEmpStrId = ListDelegationEmpStru[i].Employee_Structure_Id;
                        treatmentDetialDelegation = new List<Treatment_Detial>();
                        treatmentDetialDelegation = db.Treatment_Detial.Where(x => x.To_Employee_Structure_Id == delgEmpStrId).OrderByDescending(x => x.Treatment_Detial_Id).ToList<Treatment_Detial>();
                        treatmentDetial.AddRange(treatmentDetialDelegation);
                    }
                }
                catch (Exception eexs) { }
            }
            return treatmentDetial.OrderByDescending(x => x.Treatment_Detial_Id).ToList<Treatment_Detial>();
        }

        private List<Treatment_Master> getTreatmentMaster()
        {
            List<Treatment_Master> treatmentMaster = new List<Treatment_Master>();
            using (ECMSEntities db = new ECMSEntities())
            {
                try
                {
                    treatmentMaster = db.Treatment_Master.Where(x => x.From_Employee_Structure_Id == EmpStructureID && x.Treatment_Status_Id == 1).OrderByDescending(x => x.Treatment_Id).ToList<Treatment_Master>();
                    List<Treatment_Master> treatmentMasterDelegation;
                    int delgEmpStrId = 0;
                    if (!isDelegation)
                    {
                        for (int i = 0; i < ListDelegationEmpStru.Count; i++)
                        {
                            delgEmpStrId = ListDelegationEmpStru[i].Employee_Structure_Id;
                            treatmentMasterDelegation = new List<Treatment_Master>();
                            treatmentMasterDelegation = db.Treatment_Master.Where(x => x.From_Employee_Structure_Id == delgEmpStrId && x.Treatment_Status_Id == 1).OrderByDescending(x => x.Treatment_Id).ToList<Treatment_Master>();
                            treatmentMaster.AddRange(treatmentMasterDelegation);
                        }
                    }
                }
                catch (Exception eexs) { }
            }
            return treatmentMaster.OrderByDescending(x => x.Treatment_Id).ToList<Treatment_Master>();
        }
    }
}