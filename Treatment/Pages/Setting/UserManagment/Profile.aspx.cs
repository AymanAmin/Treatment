using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Classes;
using Treatment.Entity;
using Website.Classes;

namespace Treatment.Pages.Setting.UserManagment
{
    public partial class Profile : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        int EmployeeId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser != null)
            {
                if (SessionWrapper.LoggedUser.Employee_Id > 0) EmployeeId = SessionWrapper.LoggedUser.Employee_Id;
            }
            else
            {
                Response.Redirect("~/Pages/Setting/Auth/Login.aspx");
            }

            if (!IsPostBack)
            {
              ViewEmpLoyeeData();
            }
        }


        public void ViewEmpLoyeeData()
        {
            int i = 0;
            String EmpStru = "";
            if (EmployeeId > 0)
            {
                var Employees = db.Employees.First(x => x.Employee_Id == EmployeeId);
                if (Employees.Employee_Profile != "" && Employees.Employee_Profile != null)
                {
                    Emp_Profile.ImageUrl = "../../../../media/Profile/" + Employees.Employee_Profile;
                    Emp_Profile1.ImageUrl = "../../../../media/Profile/" + Employees.Employee_Profile;
                }
                if (Employees.Employee_Signature != "" && Employees.Employee_Signature != null) Emp_Signature.ImageUrl = "../../../../media/Signature/" + Employees.Employee_Signature;

                ArabicName.InnerText = Employees.Employee_Name_Ar;
                EnglishName.InnerText = Employees.Employee_Name_En;
                Name.InnerText = Employees.Employee_Name_En;

                Employee_Email.Text = Employees.Employee_Email;
                Email.InnerText = Employees.Employee_Email;

                Employee_Phone.Text = Employees.Employee_Phone;
                Phone.InnerText = Employees.Employee_Phone;

                if (Employees.Calendar_id == 1) CalendarType.InnerText = "Birth Date"; else CalendarType.InnerText = "Hegira Date";
                ActiveL.InnerText= bool.Parse(Employees.Employee_Active.ToString()).ToString();

                if (Employees.Group_Id != null && Employees.Group_Id >0)
                {
                    var Gro = db.Groups.First(x => x.Group_Id == Employees.Group_Id);
                    Group.InnerText = Gro.Group_Name_En;
                }

                if (Employees.Language_id != null && Employees.Language_id > 0)
                {
                    var Lang = db.LanguageMasters.First(x => x.ID == Employees.Language_id);
                    EmpLanguage.InnerText = Lang.Language_Name;
                }

                var Emp_Stru = db.Employee_Structure.Where(x => x.Employee_Id == EmployeeId && x.Status_Structure==true ).ToList();
               while(i < Emp_Stru.Count)
                {
                    EmpStru += " - " + Emp_Stru[i].Structure.Structure_Name_En;
                    i++;
                }

                    Structure.InnerText = EmpStru;
                   Position.InnerText = EmpStru;
            }

        }

        protected void EmpUpdate_Click(object sender, EventArgs e)
        {
            int calander_id = 0;
            int Lang = 0;
            int.TryParse(Language.SelectedValue, out Lang);
            if (DateofBirth.Checked) calander_id = 1;
            bool result = AU_Emplooyees(EmployeeId, Employee_Email.Text, Employee_Phone.Text, Lang, calander_id);

            if (result)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  The Update Info was Sucessfully saved in system ! ');", true);
                ViewEmpLoyeeData();
            }
        }

        public bool AU_Emplooyees(int EmployeeID, string Email,string Phone,int lang, int calander)
        {
            try
            {
                Employee Emp = db.Employees.First(x => x.Employee_Id == EmployeeID);
                Emp.Employee_Email = Email;
                Emp.Employee_Phone = Phone;
                Emp.Language_id = lang;
                Emp.Calendar_id = calander;
                string ImagepathProfile = UploadFile(1);
                string ImagepathSignature = UploadFile(2);
                if (ImagepathProfile != "") Emp.Employee_Profile = ImagepathProfile;
                if (ImagepathSignature != "") Emp.Employee_Signature = ImagepathSignature;
                db.Entry(Emp).State = System.Data.EntityState.Modified;
                db.SaveChanges();

            }
            catch { return false; }
            return true;
        }

        public string UploadFile(int Type)
        {
            string Imagepath = " ";
            switch (Type)
            {
                case 1:
                    if (this.Page.IsValid)
                    {
                        if (!UtilityClass.UploadFileIsValid(ref EmpProfile, UtilityClass.ValidImagesExtentions))
                        {
                            Imagepath = "false";
                        }
                        Imagepath = string.Empty;

                        Imagepath = UtilityClass.UploadFileWithExtention(ref EmpProfile, Server.MapPath(@"~\media\Profile\"));
                    }
                    break;
                case 2:
                    if (this.Page.IsValid)
                    {
                        if (!UtilityClass.UploadFileIsValid(ref EmpSignature, UtilityClass.ValidImagesExtentions))
                        {
                            Imagepath = "false";
                        }
                        Imagepath = string.Empty;

                        Imagepath = UtilityClass.UploadFileWithExtention(ref EmpSignature, Server.MapPath(@"~\media\Signature\"));
                    }
                    break;
            }



            return Imagepath;
        }

        protected void ChangeButton_Click(object sender, EventArgs e)
        {
            string PassWord = SessionWrapper.LoggedUser.Employee_Password;
            string pass = StringCipher.Decrypt(PassWord, "Password");
            if (OldPassWord.Text.Equals(pass))
            {
                if (NewPassWord.Text.Equals(TryNewPassWord.Text))
                {
                   Employee Emp = db.Employees.First(x => x.Employee_Id == EmployeeId);
                    string EncryptedPassword = StringCipher.Encrypt(NewPassWord.Text, "Password");
                    Emp.Employee_Password = EncryptedPassword;
                    db.Entry(Emp).State = System.Data.EntityState.Modified;
                    db.SaveChanges();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  The Change PassWord was Sucessfully saved in system ! ');", true);
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','Try Agin New PassWord');", true);
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','The Old PassWord is rong');", true);
            }
        }
    }
}