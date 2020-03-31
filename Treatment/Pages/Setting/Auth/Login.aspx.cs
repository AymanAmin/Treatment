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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser != null)
                Response.Redirect("~/");
        }

        protected void btLogin_Click(object sender, EventArgs e)
        {
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
                Employee emp = db.Employees.Where(x => x.Employee_Email == username && x.Employee_Password == password).FirstOrDefault();
                if (emp != null)
                {
                    SessionWrapper.LoggedUser = emp;
                    SessionWrapper.IsLocked = false;
                    int id = SessionWrapper.LoggedUser.Employee_Id;
                   
                    List<Permission_Group> Per_group = db.Permission_Group.Where(x => x.Group_Id == emp.Group_Id).ToList();
                    List_permission.Clear();
                    for (int i = 0; i < Per_group.Count; i++)
                    {

                        Permission per = db.Permissions.Find(Per_group[i].Permission_Id);
                       if(per != null)
                            List_permission.Add(per);
                    }
                    SessionWrapper.Permssions = List_permission;
                }
                else
                    return false;

                return true;
            }
            catch (Exception er) { return false; }
        }
    }
}