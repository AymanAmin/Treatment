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

        //LogFile Data
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
                return;
       }

        private bool auth_Login(string username, string password)
        {
            try
            {
                List<Employee> emp_list = db.Employees.ToList();
                for (int i = 0; i < emp_list.Count; i++)
                {
                    if (username.ToUpper() == emp_list[i].Employee_Email.ToUpper())
                    {
                        string DecryptedPassword = StringCipher.Decrypt(emp_list[i].Employee_Password, "Password");
                        if (password == DecryptedPassword)
                        {
                            Employee emp = emp_list[i];
                            SessionWrapper.LoggedUser = emp;
                            SessionWrapper.IsLocked = false;
                            int id = SessionWrapper.LoggedUser.Employee_Id;

                            List<Permission_Group> Per_group = db.Permission_Group.Where(x => x.Group_Id == emp.Group_Id).ToList();
                            List_permission.Clear();
                            for (int j = 0; j < Per_group.Count; j++)
                            {
                                Permission per = db.Permissions.Find(Per_group[j].Permission_Id);
                                if (per != null)
                                    List_permission.Add(per);
                            }
                            SessionWrapper.Permssions = List_permission;

                            /* Add it to log file */
                            LogData = "data:" + JsonConvert.SerializeObject(emp, logFileModule.settings);
                            logFileModule.logfile(10, "تسجيل دخول", "", LogData);
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