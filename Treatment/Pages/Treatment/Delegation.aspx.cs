using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;
using Website.Classes;

namespace Treatment.Pages.Treatment
{
    public partial class Delegation : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        string messageForm = "";
        int currentUserId = 0, currentStructureUserId = 0;
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            checkLogin();
            currentUserId = SessionWrapper.LoggedUser.Employee_Id;
            currentStructureUserId = SessionWrapper.EmpStructure;
            if(!IsPostBack)
                fillDropDownListBox();
            loadDelegation();
            translateArabic();
        }

        private void checkLogin()
        {
            if (SessionWrapper.LoggedUser != null)
            {
                if (SessionWrapper.IsLocked)
                    Response.Redirect("~/Pages/Setting/admin/LockScreen.aspx");
            }
            else
            {
                Response.Redirect("~/Pages/Setting/Auth/Login.aspx");
            }
        }

        private void loadDelegation()
        {
            int isDelegationId = isDelegation();
            if (isDelegationId != 0)
            {
                employeeDelegation.SelectedValue = isDelegationId.ToString();
                employeeDelegation.Attributes["readonly"] = "readonly";
                employeeDelegation.Attributes["disabled"] = "disabled";
                SaveDelegation.Style["display"] = "none";
                removeDelegation.Style["display"] = "inline";
            }
            else
            {
                SaveDelegation.Style["display"] = "inline";
                removeDelegation.Style["display"] = "none";
            }
        }

        private int isDelegation()
        {
            var currentEmployeeStructure = db.Employee_Structure.FirstOrDefault(x => x.Employee_Structure_Id == currentStructureUserId);
            if(currentEmployeeStructure == null)
                return 0;
            int currentStructure = (int)currentEmployeeStructure.Structure_Id;
            var isDelegationEmployee = db.Employee_Structure.FirstOrDefault(x => x.Employee_Delegation == currentStructureUserId && x.Structure_Id == currentStructure && x.Type_Delegation == true && x.Status_Structure == true);
            if (isDelegationEmployee == null)
                return 0;
            return (int)isDelegationEmployee.Employee_Id;
        }
        private void fillDropDownListBox()
        {
            List<Employee> ListEmployee = new List<Employee>();
            ListEmployee = db.Employees.Where(x => x.Employee_Id != currentUserId).ToList<Employee>();
            if(SessionWrapper.LoggedUser.Language_id == 1)
                 ddlFiller.dropDDL(employeeDelegation, "Employee_Id", "Employee_Name_Ar", ListEmployee, "إختيار الموظف المفوض");
            else ddlFiller.dropDDL(employeeDelegation, "Employee_Id", "Employee_Name_En", ListEmployee, "Select Employee Delegation");
        }

        protected void SaveDelegation_Click(object sender, EventArgs e)
        {
            if (saveEmployeeDelegation())
            {
                loadDelegation();
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'left', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  حالة الحفظ : ','  تم حفظ التفويض بنجاح في النظام');", true);
                else Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  Sucessfully saved Delegation in system');", true);
            }
            else
            {
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'left', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  حالة الحفظ : ','" + messageForm + "');", true);
                else Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','" + messageForm + "');", true);
            }
        }

        private bool saveEmployeeDelegation()
        {
            if (validationForm())
            {
                try
                {
                    db.Configuration.LazyLoadingEnabled = false;
                    var delegationEmployeeStructure = db.Employee_Structure.Create();
                    var currentEmployeeStructure = db.Employee_Structure.First(x => x.Employee_Structure_Id == currentStructureUserId);
                    delegationEmployeeStructure.Structure_Id = currentEmployeeStructure.Structure_Id;
                    delegationEmployeeStructure.Employee_Id = int.Parse(employeeDelegation.SelectedValue);
                    delegationEmployeeStructure.Status_Structure = true;
                    delegationEmployeeStructure.Default_Structure = false;
                    delegationEmployeeStructure.Type_Delegation = true;
                    delegationEmployeeStructure.Date_Delegation = DateTime.Now;
                    delegationEmployeeStructure.Employee_Delegation = currentStructureUserId;
                    db.Employee_Structure.Add(delegationEmployeeStructure);
                    db.SaveChanges();
                    LogData = "data:" + JsonConvert.SerializeObject(delegationEmployeeStructure, logFileModule.settings);
                    logFileModule.logfile(1009, "تفويض معاملات", "Delegation transaction", LogData);

                    currentEmployeeStructure.Employee_Delegation = delegationEmployeeStructure.Employee_Structure_Id;
                    currentEmployeeStructure.Type_Delegation = false;
                    currentEmployeeStructure.Date_Delegation = DateTime.Now;
                    db.Entry(currentEmployeeStructure).State = EntityState.Modified;
                    db.SaveChanges();
                    LogData = "data:" + JsonConvert.SerializeObject(currentEmployeeStructure, logFileModule.settings);
                    logFileModule.logfile(1009, "تفويض معاملات", "Delegation transaction", LogData);
                }
                catch (Exception exceptionLog)
                {
                    string exceptionStackTrace = exceptionLog.StackTrace;
                    string exceptionGetType = exceptionLog.GetType().ToString();
                    string exceptionMessage = exceptionLog.Message;
                    string exceptionData = "data:{\"StackTrace\":\"" + exceptionStackTrace + "\",\"GetType\":\"" + exceptionGetType + "\",\"Message\":\"" + exceptionMessage + "\"}";
                    logFileModule.logfile(1025, "حدث خطأ في حفظ التفويض", "An error occurred in saving the Delegation", exceptionData);
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        messageForm = "حدث خطأ في حفظ البيانات في النظام";
                    else messageForm = "Erorr to save data in system";
                    return false;
                }
                return true;
            }
            else
            {
                return false;
            }
        }

        private bool validationForm()
        {
            if (employeeDelegation.SelectedValue == "" || employeeDelegation.SelectedValue == "0")
            {
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    messageForm = "الرجاء إختيار الموظف المفوض";
                else messageForm = "Pleace Select Employee Delegation";
                return false;
            }
            return true;
        }

        protected void removeDelegation_Click(object sender, EventArgs e)
        {
            if (removeEmployeeDelegation())
            {
                loadDelegation();
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'left', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  حالة الحفظ : ','  تم إلغاء التفويض بنجاح');", true);
                else Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  Sucessfully Remove Delegation in system');", true);
            }
            else
            {
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'left', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  حالة الحفظ : ','" + messageForm + "');", true);
                else Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','" + messageForm + "');", true);
            }
        }

        private bool removeEmployeeDelegation()
        {
            if (validationForm())
            {
                try
                {
                    db.Configuration.LazyLoadingEnabled = false;

                    var currentEmployeeStructure = db.Employee_Structure.First(x => x.Employee_Structure_Id == currentStructureUserId);
                    currentEmployeeStructure.Employee_Delegation = null;
                    db.Entry(currentEmployeeStructure).State = EntityState.Modified;
                    db.SaveChanges();
                    LogData = "data:" + JsonConvert.SerializeObject(currentEmployeeStructure, logFileModule.settings);
                    logFileModule.logfile(1009, "حذف التفويض", "Remove Delegation", LogData);

                    int currentStructure = (int)currentEmployeeStructure.Structure_Id;
                    var delegationEmployeeStructure = db.Employee_Structure.FirstOrDefault(x => x.Employee_Delegation == currentStructureUserId && x.Structure_Id == currentStructure && x.Type_Delegation == true && x.Status_Structure == true);
                    delegationEmployeeStructure.Status_Structure = false;
                    db.Entry(delegationEmployeeStructure).State = EntityState.Modified;
                    db.SaveChanges();
                    LogData = "data:" + JsonConvert.SerializeObject(delegationEmployeeStructure, logFileModule.settings);
                    logFileModule.logfile(1009, "حذف التفويض", "Remove Delegation", LogData);

                }
                catch (Exception exceptionLog)
                {
                    string exceptionStackTrace = exceptionLog.StackTrace;
                    string exceptionGetType = exceptionLog.GetType().ToString();
                    string exceptionMessage = exceptionLog.Message;
                    string exceptionData = "data:{\"StackTrace\":\"" + exceptionStackTrace + "\",\"GetType\":\"" + exceptionGetType + "\",\"Message\":\"" + exceptionMessage + "\"}";
                    logFileModule.logfile(1025, "حدث خطأ في حفظ التفويض", "An error occurred in saving the Delegation", exceptionData);
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        messageForm = "حدث خطأ في حفظ البيانات في النظام";
                    else messageForm = "Erorr to save data in system";
                    return false;
                }
                return true;
            }
            else
            {
                return false;
            }
        }

        private void translateArabic()
        {
            if (SessionWrapper.LoggedUser.Language_id != null)
            {
                if (SessionWrapper.LoggedUser.Language_id == 1)
                {
                    valEmployeeDelegation.Text = "إختير الموظف المفوض";

                    SaveDelegation.Text = "حفظ التفويض";
                    removeDelegation.Text = "حذف التفويض";

                }

                else
                {

                }
            }
        }
    }
}