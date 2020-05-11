using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Classes;
using Treatment.Entity;
using Website.Classes;

namespace Treatment.Pages.Treatment
{
    public partial class AdvancedSearch : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        List<Treatment_Master> treatmentList = new List<Treatment_Master>();
        List<Treatment_Detial> treatmentDList = new List<Treatment_Detial>();
        List<Structure> structureList = new List<Structure>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Setting/Auth/Login.aspx");

            int EmpStructureID = SessionWrapper.EmpStructure;
            int UserID = SessionWrapper.LoggedUser.Employee_Id;
            treatmentList = db.Treatment_Master.Where(x => x.From_Employee_Structure_Id == EmpStructureID).ToList();

            treatmentDList = db.Treatment_Detial.Where(x => x.To_Employee_Structure_Id == EmpStructureID).ToList();
            for(int i =0; i < treatmentDList.Count;i++)
            {
                Treatment_Master treat = treatmentList.FirstOrDefault(x => x.Treatment_Id == treatmentDList[i].Treatment_Id);
                if (treat == null)
                {
                    treatmentDList[i].Treatment_Master.Treatment_Keywork = "inbox";
                    treatmentList.Add(treatmentDList[i].Treatment_Master);
                }
            }
            treatmentList = treatmentList.OrderByDescending(x => x.Create_Date).ToList();

            structureList = db.Structures.ToList();

            if (!IsPostBack)
            {
                FillDropDownLists();
                LoadTable();
            }
        }

        private void Fillter()
        {
            string val_Fillter = string.Empty;
            // 
            if (StartTreatmentDate.Value != "")
            {
                 DateTime date = DateTime.Parse(StartTreatmentDate.Value);
                 treatmentList = treatmentList.Where(x => x.Create_Date >= date).ToList();
                 val_Fillter += "<strong>" + FieldNames.getFieldName("AdvancedSearch-After", "After") + " : </strong>" + date.ToShortDateString() + " , ";
            }
            if (EndTreatmentDate.Value != "")
            {
                DateTime date = DateTime.Parse(EndTreatmentDate.Value);
                treatmentList = treatmentList.Where(x => x.Create_Date <= date).ToList();
                val_Fillter += "<strong>" + FieldNames.getFieldName("AdvancedSearch-Before", "Before") + " : </strong>" + date.ToShortDateString() + " , ";
            }
            // Fillter using standardProcedure
            if (standardProcedure.SelectedIndex != 0)
            {
                int id = int.Parse(standardProcedure.SelectedValue.ToString());
                treatmentList = treatmentList.Where(x => x.Treatment_Procedure_Id == id).ToList();
                val_Fillter += "<strong>" + FieldNames.getFieldName("AdvancedSearch-StandardProcedure", "Standard Procedure") + " : </strong>" + standardProcedure.SelectedItem + " , ";
            }
            // Fillter using preparedManagement
            if (preparedManagement.SelectedIndex != 0)
            {
                int id = int.Parse(preparedManagement.SelectedValue.ToString());
                treatmentList = treatmentList.Where(x => x.Prepared_Administration_Id == id).ToList();
                val_Fillter += "<strong>" + FieldNames.getFieldName("AdvancedSearch-PreparedManagement", "Prepared Management") + " : </strong>" + preparedManagement.SelectedItem + " , ";
            }
            // Fillter using classificationSubject
            if (classificationSubject.SelectedIndex != 0)
            {
                int id = int.Parse(classificationSubject.SelectedValue.ToString());
                treatmentList = treatmentList.Where(x => x.Treatment_Class_Id == id).ToList();
                val_Fillter += "<strong>" + FieldNames.getFieldName("AdvancedSearch-ClassificationSubject", "Classification Subject") + " : </strong>" + classificationSubject.SelectedItem + " , ";
            }
            // Fillter using typeTreatment
            if (typeTreatment.SelectedIndex != 0)
            {
                int id = int.Parse(typeTreatment.SelectedValue.ToString());
                treatmentList = treatmentList.Where(x => x.Treatment_Type_Id == id).ToList();
                val_Fillter += "<strong>" + FieldNames.getFieldName("AdvancedSearch-TypeTreatment", "Type Treatment") + " : </strong>" + typeTreatment.SelectedItem + " , ";
            }
            // Fillter using secretLevel
            if (secretLevel.SelectedIndex != 0)
            {
                int id = int.Parse(secretLevel.SelectedValue.ToString());
                treatmentList = treatmentList.Where(x => x.Treatment_Confidentiality_Id == id).ToList();
                val_Fillter += "<strong>" + FieldNames.getFieldName("AdvancedSearch-SecretLevel", "Secret Level") + " : </strong>" + secretLevel.SelectedItem + " , ";
            }
            // Fillter using priorityLevel
            if (priorityLevel.SelectedIndex != 0)
            {
                int id = int.Parse(priorityLevel.SelectedValue.ToString());
                treatmentList = treatmentList.Where(x => x.Treatment_Priority_id == id).ToList();
                val_Fillter += "<strong>" + FieldNames.getFieldName("AdvancedSearch-PriorityLevel", "Priority Level") + " : </strong>" + priorityLevel.SelectedItem + " , ";
            }
            // Fillter using speedUp
            /*if (speedUp.SelectedIndex != 0)
            {
                int id = int.Parse(speedUp.SelectedValue.ToString());
                treatmentList = treatmentList.Where(x => x.Treatment_Delivery_Id == id).ToList();
                val_Fillter += "<strong>" + FieldNames.getFieldName("AdvancedSearch-SpeedUp", "Speed Up") + " : </strong>" + speedUp.SelectedItem + " , ";
            }*/
            // Fillter using Keyword
            if (Keyword.Text.Trim() != "")
            {
                treatmentList = treatmentList.Where(x => (x.Treatment_Subject != null && x.Treatment_Subject.Contains(Keyword.Text.Trim())) || (x.Treatment_Body != null &&x.Treatment_Body.Contains(Keyword.Text.Trim()))).ToList();
                val_Fillter += "<strong>" + FieldNames.getFieldName("AdvancedSearch-Keyword", "Keyword") + " : </strong>" + Keyword.Text + " , ";
            }


            // Create the details of fillter text
            if (val_Fillter != string.Empty)
            {
                val_Fillter = val_Fillter.Substring(0, val_Fillter.Length - 3);
                FilterUsed.Text = val_Fillter + "";
            }
            else
                FilterUsed.Text = "";

            // Load Data 
            LoadTable();

        }

        private void LoadTable()
        {
            string str = string.Empty;
            string NoData = "No Data";
            string preparedBy = string.Empty;
            string excption_message = "Server Error cann't load data";
            List<Treatment_Detial> List_Fill_D = db.Treatment_Detial.ToList();

            if (SessionWrapper.LoggedUser.Language_id == 1)
            {
                NoData = "لا يوجد بيانات";
                excption_message = "خطاء في السيرفر لم يتمكن من تحميل البيانات";
            }

                try
            {
                Total.Text = treatmentList.Count.ToString();
                
                if (treatmentList.Count == 0)
                    str += "<tr><td colspan='7' style='text-align:center'>" + NoData + "</td></tr>";
                for (int i = 0; i < treatmentList.Count; i++)
                {
                    str += "<tr>";
                    str += "<td style='text-align:center;vertical-align:center;'>" + (i + 1) + "</td>";

                    if (treatmentList[i].Treatment_Keywork == "inbox")
                        str += "<td style='font-size:25px;text-align:center;color:#00c3da;vertical-align:center;'><i class='icofont icofont-inbox'></i></td>";
                    else
                        str += "<td style='font-size:25px;text-align:center;color:orange;vertical-align:center;'><i class='icofont icofont-send-mail'></i></td>";
                    string subject = treatmentList[i].Treatment_Subject;

                    if (subject.Length > 26)
                        str += "<td style='vertical-align:center;'>" + subject.Substring(0,25) + "...</td>";
                    else
                        str += "<td style='vertical-align:center;'>" + subject + "</td>";

                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        try { preparedBy = structureList.FirstOrDefault(x => x.Structure_Id == treatmentList[i].Prepared_Administration_Id).Structure_Name_Ar; } catch { preparedBy = " - "; }
                    else
                        try { preparedBy = structureList.FirstOrDefault(x => x.Structure_Id == treatmentList[i].Prepared_Administration_Id).Structure_Name_En; } catch { preparedBy = " - "; }

                    str += "<td style='text-align:center;vertical-align:center;'>" + preparedBy + "</td>";

                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        str += "<td style='text-align:center;vertical-align:center;'>" + treatmentList[i].Employee_Structure.Employee.Employee_Name_Ar + "</td>";
                    else
                        str += "<td style='text-align:center;vertical-align:center;'>" + treatmentList[i].Employee_Structure.Employee.Employee_Name_En + "</td>";

                    str += "<td>" + treatmentList[i].Treatment_Date + "</td>";

                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        str += "<td style='text-align:center;vertical-align:center;'><label class='" + treatmentList[i].Treatment_Confidentiality.Css_Class + "'>" + treatmentList[i].Treatment_Confidentiality.Treatment_Confidentiality_Name_Ar + "</label></td>";
                    else
                        str += "<td style='text-align:center;vertical-align:center;'><label class='" + treatmentList[i].Treatment_Confidentiality.Css_Class + "'>" + treatmentList[i].Treatment_Confidentiality.Treatment_Confidentiality_Name_En + "</label></td>";

                    // Check if inbox or not (اضفت كلمة انبوكس دي في دالة اللود فوق عشان افرق)
                    if (treatmentList[i].Treatment_Keywork == "inbox")
                    {
                        Treatment_Detial Treat = List_Fill_D.FirstOrDefault(x => x.Treatment_Id == treatmentList[i].Treatment_Id);
                        if (Treat != null)
                            if (Treat.Assignment_Status_Id == 3)
                            {
                                if (treatmentList[i].Treatment_Mother == 0)
                                    str += "<td style='text-align:center;vertical-align:center;'><a href='../../Pages/Treatment/ShowTreatment.aspx?getTreatmentId=" + treatmentList[i].Treatment_Id + "&getTabId=3&getTreatmentDetialId=" + Treat.Treatment_Detial_Id + "' style='font-size:25px;text-align:center;'><i style='color:#452a74;' class='icofont icofont-eye-alt'></i></a></td></tr>";
                                else
                                    str += "<td style='text-align:center;vertical-align:center;'><a href='../../Pages/Treatment/ShowTreatment.aspx?getTreatmentId=" + treatmentList[i].Treatment_Mother + "&getTabId=3&getTreatmentDetialId=" + Treat.Treatment_Detial_Id + "' style='font-size:25px;text-align:center;'><i style='color:#452a74;' class='icofont icofont-eye-alt'></i></a></td></tr>";
                            }
                            else
                            {
                                if (treatmentList[i].Treatment_Mother == 0)
                                    str += "<td style='text-align:center;vertical-align:center;'><a href='../../Pages/Treatment/ShowTreatment.aspx?getTreatmentId=" + treatmentList[i].Treatment_Id + "&getTabId=1&getTreatmentDetialId=" + Treat.Treatment_Detial_Id + "' style='font-size:25px;text-align:center;'><i style='color:#452a74;' class='icofont icofont-eye-alt'></i></a></td></tr>";
                                else
                                    str += "<td style='text-align:center;vertical-align:center;'><a href='../../Pages/Treatment/ShowTreatment.aspx?getTreatmentId=" + treatmentList[i].Treatment_Mother + "&getTabId=1&getTreatmentDetialId=" + Treat.Treatment_Detial_Id + "' style='font-size:25px;text-align:center;'><i style='color:#452a74;' class='icofont icofont-eye-alt'></i></a></td></tr>";

                            }
                    }
                    else
                    {
                        if (treatmentList[i].Treatment_Mother == 0)
                            str += "<td style='text-align:center;vertical-align:center;'><a href='../../Pages/Treatment/ShowTreatment.aspx?getTreatmentId=" + treatmentList[i].Treatment_Id + "&getTabId=2' style='font-size:25px;text-align:center;'><i style='color:#452a74;' class='icofont icofont-eye-alt'></i></a></td></tr>";
                        else
                            str += "<td style='text-align:center;vertical-align:center;'><a href='../../Pages/Treatment/ShowTreatment.aspx?getTreatmentId=" + treatmentList[i].Treatment_Mother + "&getTabId=2' style='font-size:25px;text-align:center;'><i style='color:#452a74;' class='icofont icofont-eye-alt'></i></a></td></tr>";
                    }
                }
            }
            catch (Exception er)
            {
                str += "<tr><td colspan='7' style='text-align:center;color:red;'>" + excption_message + "</td></tr>";
            }
            txtData.Text = str;

        }

        private void FillDropDownLists()
        {
            // Procedure dropdown
            List<Treatment_Procedure> ProcedureList = db.Treatment_Procedure.ToList();
            if (SessionWrapper.LoggedUser.Language_id == 1)
                ddlFiller.dropDDL(standardProcedure, "Treatment_Procedure_Id", "Treatment_Procedure_Name_Ar", ProcedureList, " - الكل -");
            else
                ddlFiller.dropDDL(standardProcedure, "Treatment_Procedure_Id", "Treatment_Procedure_Name_En", ProcedureList, " - All -");

            // Prepared Management dropdown
            List<Structure> preparedManagementeList = db.Structures.ToList();
            if (SessionWrapper.LoggedUser.Language_id == 1)
                ddlFiller.dropDDL(preparedManagement, "Structure_Id", "Structure_Name_Ar", preparedManagementeList, " - الكل -");
            else
                ddlFiller.dropDDL(preparedManagement, "Structure_Id", "Structure_Name_En", preparedManagementeList, " - All -");

            // Classification Subject dropdown
            List<Treatment_Class> ClassificationList = db.Treatment_Class.ToList();
            if (SessionWrapper.LoggedUser.Language_id == 1)
                ddlFiller.dropDDL(classificationSubject, "Treatment_Class_Id", "Treatment_Class_Name_Ar", ClassificationList, " - الكل -");
            else
                ddlFiller.dropDDL(classificationSubject, "Treatment_Class_Id", "Treatment_Class_Name_En", ClassificationList, " - All -");

            // Type dropdown
            List<Treatment_Type> TypeList = db.Treatment_Type.ToList();
            if (SessionWrapper.LoggedUser.Language_id == 1)
                ddlFiller.dropDDL(typeTreatment, "Treatment_Type_Id", "Treatment_Type_Name_Ar", TypeList, " - الكل -");
            else
                ddlFiller.dropDDL(typeTreatment, "Treatment_Type_Id", "Treatment_Type_Name_En", TypeList, " - All -");

            // Secret Level dropdown
            List<Treatment_Confidentiality> SecretLevelList = db.Treatment_Confidentiality.ToList();
            if (SessionWrapper.LoggedUser.Language_id == 1)
                ddlFiller.dropDDL(secretLevel, "Treatment_Confidentiality_Id", "Treatment_Confidentiality_Name_Ar", SecretLevelList, " - الكل -");
            else
                ddlFiller.dropDDL(secretLevel, "Treatment_Confidentiality_Id", "Treatment_Confidentiality_Name_En", SecretLevelList, " - All -");

            // Priority Level dropdown
            List<Treatment_Priority> PriorityList = db.Treatment_Priority.ToList();
            if (SessionWrapper.LoggedUser.Language_id == 1)
                ddlFiller.dropDDL(priorityLevel, "Treatment_Priority_Id", "Treatment_Priority_Name_Ar", PriorityList, " - الكل -");
            else
                ddlFiller.dropDDL(priorityLevel, "Treatment_Priority_Id", "Treatment_Priority_Name_En", PriorityList, " - All -");


            // Speed Up dropdown
            List<Treatment_Delivery> SpeedUpList = db.Treatment_Delivery.ToList();
            if (SessionWrapper.LoggedUser.Language_id == 1)
                ddlFiller.dropDDL(speedUp, "Treatment_Delivery_Id", "Treatment_Delivery_Name_Ar", SpeedUpList, " - الكل -");
            else
                ddlFiller.dropDDL(speedUp, "Treatment_Delivery_Id", "Treatment_Delivery_Name_En", SpeedUpList, " - All -");

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Fillter();
        }

    }

}