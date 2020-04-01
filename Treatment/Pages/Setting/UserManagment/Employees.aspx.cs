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
        
        protected void Page_Load(object sender, EventArgs e)
        {
            UserCard();
            var id = Request["EmployeeId"];
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int Group_id = 0;
            int.TryParse(Groups.SelectedValue, out Group_id);
            bool result = AU_Emplooyees(Employee_Name_Ar.Text, Employee_Name_En.Text, Employee_Email.Text, Employee_Phone.Text, Active.Checked, Group_id);
            if (result)
            {
                ASPxGridView1.DataBind();
                UserCard();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  The new Employee was Sucessfully saved in system ! ');", true);
            }
        }

        public bool AU_Emplooyees(string ArabicName, string EnglishName, string Email, string Phone, bool Active, int GroupID)
        {
            try
            {
                Employee Emp = db.Employees.Create();
                Emp.Employee_Name_Ar = ArabicName;
                Emp.Employee_Name_En = EnglishName;
                Emp.Employee_Email = Email;
                string New_Password = StringCipher.RandomString(7);
                string Encrypted_Password = StringCipher.Encrypt(New_Password, "Password"); // emp.Employee_Password.ToString();
                Emp.Employee_Password = Encrypted_Password;
                Emp.Employee_Phone = Phone;
                Emp.Employee_Active = Active;
                Emp.Group_Id = GroupID;
                Emp.Employee_Profile= UploadFile(1);
                Emp.Employee_Signature = UploadFile(2);
                db.Employees.Add(Emp);
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
                string yourHTMLstring = "<div class='col-lg-6 col-xl-3 col-md-6'>" +
                                                "<div class='card rounded-card user-card'>"+
                                                    "<div class='card-block'>" +
                                                           " <div class='img-hover'>"+
                                                                //"<img class='img-fluid img-radius' src='~/media/Signature/' alt='m.jpg'> " +
                                                                ImgTag +
                                                                "<div class='img-overlay img-radius'>" +
                                                                 "   <span>" +
                                                                       " <button type='submit' class='btn btn-sm btn-primary' data-toggle='modal' data-target='#sign-in-social'><i class='icofont icofont-plus'></i></button> " +
                                                                       "<input id='EmployeeId' type='text' value='"+ Employees[i].Employee_Id.ToString()+ "' hidden='hidden'/>" +
                                                                        "<a href = ''class='btn btn-sm btn-primary' data-toggle='modal' data-target='#sign-in-social'><i class='icofont icofont-link-alt'></i></a> " +
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


    }
}