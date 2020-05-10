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

namespace Treatment.Pages.Setting.UserManagment
{
    public partial class ChangeStructure : System.Web.UI.Page
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
           // currentStructureUserId = SessionWrapper.EmpStructure;
            if (!IsPostBack)
                fillDropDownListBox();
            //loadDelegation();
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

        private void fillDropDownListBox()
        {
            using (ECMSEntities dbEmp = new ECMSEntities())
            {
                List<Employee> ListEmployee = new List<Employee>();
                ListEmployee = dbEmp.Employees.ToList<Employee>();
                ddlFiller.dropDDL(employeeTo, "Employee_Id", "Employee_Name_En", ListEmployee, "Select Employee To");

                List<Employee_Structure> ListEmployeeStructure = new List<Employee_Structure>();
                ListEmployeeStructure = dbEmp.Employee_Structure.Where(x => x.Status_Structure == true && x.Type_Delegation == false).ToList<Employee_Structure>();
                var dc = from c in ListEmployeeStructure
                         select new
                         {
                             ddlKey = c.Employee_Structure_Id,
                             ddlValue = c.Employee.Employee_Name_En + " '" + c.Structure.Structure_Name_En + "'",
                         };

                ddlFiller.dropDDL(employeeSturctureFrom, "ddlKey", "ddlValue", dc.ToList(), "Select Employee Structure From");
            }

        }

        protected void SaveChangeEmployee_Click(object sender, EventArgs e)
        {
            if (saveChangeEmployee())
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  Sucessfully saved Change Employee Structure in system');", true);
                fillDropDownListBox();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','" + messageForm + "');", true);
            }
        }
        private bool saveChangeEmployee()
        {
            if (validationForm())
            {
                try
                {
                    //////////////////////// add New Employee Structure /////////////////////////////////
                    db.Configuration.LazyLoadingEnabled = false;
                    var ChangeEmployeeStructure = db.Employee_Structure.Create();
                    int employeeSturctureFormId = int.Parse(employeeSturctureFrom.SelectedValue);
                    var currentEmployeeStructure = db.Employee_Structure.First(x => x.Employee_Structure_Id == employeeSturctureFormId);
                    ChangeEmployeeStructure.Structure_Id = currentEmployeeStructure.Structure_Id;
                    ChangeEmployeeStructure.Employee_Id = int.Parse(employeeTo.SelectedValue);
                    ChangeEmployeeStructure.Status_Structure = true;
                    ChangeEmployeeStructure.Default_Structure = false;
                    ChangeEmployeeStructure.Type_Delegation = false;
                    db.Employee_Structure.Add(ChangeEmployeeStructure);
                    db.SaveChanges();
                    LogData = "data:" + JsonConvert.SerializeObject(ChangeEmployeeStructure, logFileModule.settings);
                    logFileModule.logfile(1009, "تغيير المسمي الموظيفي", "Change Job Title", LogData);

                    //////////////////////// Change Currnet Structure to New Employee /////////////////////////////////
                    int newEmployeeSturctureId = ChangeEmployeeStructure.Employee_Structure_Id;
                    currentEmployeeStructure.Employee_Delegation = newEmployeeSturctureId;
                    currentEmployeeStructure.Status_Structure = false;
                    db.Entry(currentEmployeeStructure).State = EntityState.Modified;
                    db.SaveChanges();
                    LogData = "data:" + JsonConvert.SerializeObject(currentEmployeeStructure, logFileModule.settings);
                    logFileModule.logfile(1009, "تغيير المسمي الموظيفي", "Change Job Title", LogData);

                    //////////////////////// Change Old Structure To New Employee /////////////////////////////////
                    var changelistEmpStur = db.Employee_Structure.Where(x => x.Employee_Delegation == employeeSturctureFormId).ToList();
                    foreach (Employee_Structure oneEmployeeSturcture in changelistEmpStur)
                    {
                        oneEmployeeSturcture.Employee_Delegation = newEmployeeSturctureId;
                        db.Entry(oneEmployeeSturcture).State = EntityState.Modified;
                        
                    }
                    db.SaveChanges();
                    var changelistEmpStur1 = db.Employee_Structure.Where(x => x.Employee_Delegation == newEmployeeSturctureId).ToList();
                    LogData = "data:" + JsonConvert.SerializeObject(changelistEmpStur1, logFileModule.settings);
                    logFileModule.logfile(1009, "تغيير المسمي الموظيفي", "Change Job Title", LogData);
                }
                catch (Exception exceptionLog)
                {
                    string exceptionStackTrace = exceptionLog.StackTrace;
                    string exceptionGetType = exceptionLog.GetType().ToString();
                    string exceptionMessage = exceptionLog.Message;
                    string exceptionData = "data:{\"StackTrace\":\"" + exceptionStackTrace + "\",\"GetType\":\"" + exceptionGetType + "\",\"Message\":\"" + exceptionMessage + "\"}";
                    logFileModule.logfile(1025, "حدث خطأ في حفظ تغيير المسمي الوظيفي", "An error occurred in saving the Job Title", exceptionData);
                    messageForm = "Erorr to save data in system";
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
            if (employeeSturctureFrom.SelectedValue == "" || employeeSturctureFrom.SelectedValue == "0")
            {
                messageForm = "Pleace Select Employee Structure From";
                return false;
            }
            else if (employeeTo.SelectedValue == "" || employeeTo.SelectedValue == "0")
            {
                messageForm = "Pleace Select Employee To";
                return false;
            }
            return true;
        }
        
    }
}