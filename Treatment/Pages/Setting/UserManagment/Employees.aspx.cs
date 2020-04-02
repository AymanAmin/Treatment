using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Classes;
using Treatment.Entity;
using Website.Classes;


namespace Treatment.Pages.Treatment
{
    public partial class Employees : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        int EmployeeId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
             UserCard();
            var name = this.Request.Form["EmployeeId"];
            if (int.TryParse(Request["EmployeeId"], out EmployeeId) && EmployeeId >0 )
            {
                ViewUserCard(EmployeeId);
            }

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int Group_id = 0;
            //int.TryParse(Groups.SelectedValue, out Group_id);
            string omer = "";
            omer = Employee_Name_Ar.Text;
            omer = Employee_Name_En.Text;
            omer = Employee_Email.Text;
            omer = Employee_Phone.Text;
            bool result = AU_Emplooyees(EmployeeId,Employee_Name_Ar.Text, Employee_Name_En.Text, Employee_Email.Text, Employee_Phone.Text, Active.Checked, Group_id);
            if (result)
            {
                ASPxGridView1.DataBind();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  The new Employee was Sucessfully saved in system ! ');", true);
                Response.Redirect("~/Pages/Setting/UserManagment/Employees.aspx");
            }
        }

        public bool AU_Emplooyees(int Employee_Id, string ArabicName, string EnglishName, string Email, string Phone, bool Active, int GroupID)
        {
            try
            {
                Employee Emp = db.Employees.Create();
                if(EmployeeId != 0) Emp = db.Employees.First(x=>x.Employee_Id== EmployeeId);
                Emp.Employee_Name_Ar = ArabicName;
                Emp.Employee_Name_En = EnglishName;
                Emp.Employee_Email = Email;
                if (EmployeeId == 0)
                {
                    string New_Password = StringCipher.RandomString(7);
                    string Encrypted_Password = StringCipher.Encrypt(New_Password, "Password"); // emp.Employee_Password.ToString();
                    Emp.Employee_Password = Encrypted_Password;
                }
                Emp.Employee_Phone = Phone;
                Emp.Employee_Active = Active;
                Emp.Group_Id = GroupID;
                Emp.Employee_Profile= UploadFile(1);
                Emp.Employee_Signature = UploadFile(2);
                if(EmployeeId != 0) {
                    db.Entry(Emp).State =  System.Data.EntityState.Modified;
                }
                else { db.Employees.Add(Emp); }
                EmployeeId = 0;
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
                            //ltrMessage.Text = "<div class='alert alert-danger fade in'><strong>Images only allowed !</strong></div>";
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
                            //ltrMessage.Text = "<div class='alert alert-danger fade in'><strong>Images only allowed !</strong></div>";
                            Imagepath = "false";
                        }
                        Imagepath = string.Empty;

                        Imagepath = UtilityClass.UploadFileWithExtention(ref EmpSignature, Server.MapPath(@"~\media\Signature\"));
                    }
                    break;
            }
           


            return Imagepath;
        }

        public void UserCard()
        {
            int i = 0;
            string ImgTag = "";
            string img = "";
            string yourHTMLstring = "";
            UCard.Controls.Remove(new LiteralControl(yourHTMLstring));
            var Employees = db.Employees.ToList();
            while (i < Employees.Count)
            {

                if (Employees[i].Employee_Profile !="")
                {
                    img = Employees[i].Employee_Profile.ToString();
                }
                else
                {
                    img = "7be69466-86d2-4b79-a9f4-144ba676b1c8.jpg";
                }
                ImgTag = "<img class='img-fluid img-radius'" + "src='../../../../media/Profile/" + img + "'alt='" + img + "'>";
                 yourHTMLstring = "<div class='col-lg-6 col-xl-3 col-md-6'>" +
                                                "<div class='card rounded-card user-card'>"+
                                                    "<div class='card-block'>" +
                                                           " <div class='img-hover'>"+
                                                                //"<img class='img-fluid img-radius' src='~/media/Signature/' alt='m.jpg'> " +
                                                                ImgTag +
                                                                "<div class='img-overlay img-radius'>" +
                                                                 "   <span>" +
                                                                       " <button  type='submit' class='btn btn-sm btn-primary' value='" + Employees[i].Employee_Id.ToString() + "' OnClick='showmodel()'><i class='icofont icofont-plus'></i></button> " +
                                                                       "<input id='EmployeeId' runat='server' runat='server' type='text' value='" + Employees[i].Employee_Id.ToString()+ "' hidden='hidden'/>" +
                                                                        "<a id='mm' href= 'Employees.aspx?EmployeeId=" + Employees[i].Employee_Id.ToString()+ "'class='btn btn-sm btn-primary' data-target='#sign-in-social' runat='server' ><i class='icofont icofont-link-alt'></i></a> " +
                                                                    "</span>" +
                                                                "</div>" +
                                                            "</div>" +
                                                            "<div class='user-content'>" +
                                                                "<h4 class=''>"+ Employees[i].Employee_Name_En.ToString() + "</h4> " +
                                                                "<p class='m-b-0 text-muted'>Network engineer</p> " +
                                                           " </div> " +
                                                   " </div>" +
                                               " </div> " +
                                         "</div>";
                 UCard.Controls.Add(new LiteralControl(yourHTMLstring));
                i += 1;
            }


        }

        public void ViewUserCard(int Employee_Id)
        {
            var Employees = db.Employees.First(x=>x.Employee_Id== Employee_Id);

            if (Employees.Employee_Profile!="") Emp_Profile.ImageUrl = "../../../../media/Profile/" + Employees.Employee_Profile;
            if(Employees.Employee_Signature!="") Emp_Signature.ImageUrl="../../../../media/Signature/" + Employees.Employee_Signature;
            Employee_Name_Ar.Text = Employees.Employee_Name_Ar;
            Employee_Name_En.Text = Employees.Employee_Name_En;
            Employee_Email.Text =   Employees.Employee_Email;
            Employee_Phone.Text =   Employees.Employee_Phone;
            Groups.SelectedValue =  Employees.Group_Id.ToString();
            Active.Checked =bool.Parse(Employees.Employee_Active.ToString());

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showmodel();", true);
        }


    }
}