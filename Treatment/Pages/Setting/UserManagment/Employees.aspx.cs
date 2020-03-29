using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;
using Website.Classes;

namespace Treatment.Pages.Treatment
{
    public partial class Employees : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int Group_id = 0;
            int.TryParse(Groups.SelectedValue, out Group_id);
            bool result = AU_Emplooyees(Employee_Name_Ar.Text, Employee_Name_En.Text, Employee_Email.Text, Employee_Password.Text, Employee_Phone.Text, Active.Checked, Group_id);
            if (result)
            {
                ASPxGridView1.DataBind();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  The new Employee was Sucessfully saved in system ! ');", true);
            }
        }

        public bool AU_Emplooyees(string ArabicName, string EnglishName, string Email, string PassWord, string Phone, bool Active, int GroupID)
        {
            bool T = false;
            try
            {
                Employee Emp = db.Employees.Create();
                Emp.Employee_Name_Ar = ArabicName;
                Emp.Employee_Name_En = EnglishName;
                Emp.Employee_Email = Email;
                Emp.Employee_Password = PassWord;
                Emp.Employee_Phone = Phone;
                Emp.Employee_Active = Active;
                Emp.Group_Id = GroupID;
                db.Employees.Add(Emp);
                db.SaveChanges();
            }
            catch { return false; }
            return true;
        }
    }
}