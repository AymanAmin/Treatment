using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Classes;
using Treatment.Entity;
using Website.Classes;

namespace Treatment.Pages.Setting.Auth
{
    public partial class Login : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        List<Permission> List_permission = new List<Permission>();

        string Error_message = " Incorrect email or password entered. Please try again.";

        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser != null)
                Response.Redirect("~/");
        }

        protected void btLogin_Click(object sender, EventArgs e)
        {
          //string Encrpted_Password = StringCipher.Encrypt(,"Password");
           bool result =  auth_Login(txtEmail.Text, txtPassword.Text);
            if (result)
                Response.Redirect("~/");
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-check', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Validation : ','  " + Error_message + " ! ');", true);
            }
       }

        private bool auth_Login(string username, string password)
        {
            try
            {
                db.Configuration.LazyLoadingEnabled = false;
                List<Employee> emp_list = db.Employees.ToList();
                for (int i = 0; i < emp_list.Count; i++)
                {
                    if (username.ToUpper() == emp_list[i].Employee_Email.ToUpper())
                    {
                        string DecryptedPassword = StringCipher.Decrypt(emp_list[i].Employee_Password, "Password");
                        if (password == DecryptedPassword && (bool)emp_list[i].Employee_Active)
                        {
                            Employee emp = emp_list[i];
                            SessionWrapper.LoggedUser = emp;
                            SessionWrapper.IsLocked = false;
                            SessionWrapper.Language = db.Lanuage_Detials.Where(x => x.Language_Master_ID == emp.Language_id).ToList();
                            List<Permission_Group> Per_group = db.Permission_Group.Where(x => x.Group_Id == emp.Group_Id).ToList();
                            List_permission.Clear();
                            for (int j = 0; j < Per_group.Count; j++)
                            {
                                Permission per = db.Permissions.Find(Per_group[j].Permission_Id);
                                if (per != null)
                                    List_permission.Add(per);
                            }
                            // Set User info in session
                            SessionWrapper.LoggedUser = emp;

                            // Set LockScreen as false in session
                            SessionWrapper.IsLocked = false;

                            // Selecet Language Based on User language and set in session
                            SessionWrapper.Language = db.Lanuage_Detials.Where(x => x.Language_Master_ID == emp.Language_id).ToList();

                            // Set Permission List in session
                            SessionWrapper.Permssions = List_permission;

                            /* Add it to log file */
                            LogData = "data:" + JsonConvert.SerializeObject(emp, logFileModule.settings);
                            logFileModule.logfile(10, "تسجيل دخول", "login to system", LogData);
                        }
                        else
                            continue;

                        return true;
                    }
                }
                return false;
            }
            catch (Exception er) { return false; }
        }       
    }
}