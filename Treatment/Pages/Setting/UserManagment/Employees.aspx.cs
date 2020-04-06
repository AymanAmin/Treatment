using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Classes;
using Treatment.Entity;
using Treatment.Models;
using Website.Classes;



namespace Treatment.Pages.Treatment
{
    public partial class Employees : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
         int EmployeeId = 0;
        public string name { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
             UserCard();          
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int Group_id = 0;

            int Emp_ID = 0;
            int.TryParse(EmpID.Value ,out Emp_ID);
            int.TryParse(Groups.SelectedValue, out Group_id);
            string EMPN = Employee_Name_Ar.Text;
            bool result = AU_Emplooyees(Emp_ID, EMPN, Employee_Name_En.Text, Employee_Email.Text, Employee_Phone.Text, Active.Checked, Group_id);

            bool result = AU_Emplooyees(EmployeeId,Employee_Name_Ar.Text, Employee_Name_En.Text, Employee_Email.Text, Employee_Phone.Text, Active.Checked, Group_id);
            if (result)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  The new Employee was Sucessfully saved in system ! ');", true);
            }
        }

        public bool AU_Emplooyees(int EmployeeID, string ArabicName, string EnglishName, string Email, string Phone, bool Active, int GroupID)
        {
            try
            {
                Employee Emp = db.Employees.Create();
                if(EmployeeID != 0) Emp = db.Employees.First(x=>x.Employee_Id== EmployeeID);
                Emp.Employee_Name_Ar = ArabicName;
                Emp.Employee_Name_En = EnglishName;
                Emp.Employee_Email = Email;
                if (EmployeeID == 0)
                {
                    string New_Password = StringCipher.RandomString(7);
                    string Encrypted_Password = StringCipher.Encrypt(New_Password, "Password"); // emp.Employee_Password.ToString();
                    Emp.Employee_Password = Encrypted_Password;
                }
                Emp.Employee_Phone = Phone;
                Emp.Employee_Active = Active;
                Emp.Group_Id = GroupID;
                string ImagepathProfile = UploadFile(1);
                string ImagepathSignature = UploadFile(2);
                if (ImagepathProfile != "") Emp.Employee_Profile = ImagepathProfile;
                if (ImagepathSignature != "") Emp.Employee_Signature =ImagepathSignature;
                /////////////////////////////////////// Employee_Structure /////////////////////////////////////
                if (EmployeeID != 0)
                {
                    var widgets = db.Employee_Structure.Where(x => x.Employee_Id == EmployeeID).ToList();
                    if (widgets.Count > 0)
                    {
                        foreach (Employee_Structure widget in widgets)
                        {
                            db.Employee_Structure.Remove(widget);

                        }
                    }
                }
                Employee_Structure Emp_Stu ;
                for (int i = 0; i < Emp_Structure.Items.Count; i++)
                {
                    if (Emp_Structure.Items[i].Selected)
                    {
                        Emp_Stu = new Employee_Structure();
                        Emp_Stu.Structure_Id= int.Parse(Emp_Structure.Items[i].Value);
                        Emp.Employee_Structure.Add(Emp_Stu);
                    }
                }
                /////////////////////////////////////// Employee_Structure /////////////////////////////////////
                if (EmployeeID != 0) {
                    db.Entry(Emp).State =  System.Data.EntityState.Modified;
                }
                else {
                    db.Employees.Add(Emp);
                }
                db.SaveChanges();
                UserCard();
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

            UCard.Controls.Clear();
            var Employees = db.Employees.ToList();
            while (i < Employees.Count)
            {

                if (Employees[i].Employee_Profile !="" && Employees[i].Employee_Profile !=null)
                {
                    img = Employees[i].Employee_Profile.ToString();
                }
                else
                {
                    img = "Profile.jpg";
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
                                                                       " <a class='btn btn-primary btn-outline-primary btn-icon'  id='" + Employees[i].Employee_Id.ToString()+ "'OnClick='showmodel(this)'><i class='icofont icofont-ui-edit text-info h5'></i></a> " +
                                                                       " <a class='btn btn-danger btn-outline-danger btn-icon'  id='" + Employees[i].Employee_Id.ToString()+ "'OnClick='DeleteEmplooye(this)'><i class='icofont icofont-ui-delete text-danger h5'></i></a> " +
                                                                    "</span>" +
                                                                "</div>" +
                                                            "</div>" +
                                                            "<div class='user-content'>" +
                                                                "<h4 class=''>"+ Employees[i].Employee_Name_En.ToString() + "</h4> " +
                                                           " </div> " +
                                                   " </div>" +
                                               " </div> " +
                                         "</div>";
                 UCard.Controls.Add(new LiteralControl(yourHTMLstring));
                i += 1;
            }


        }
        [WebMethod]
        public static string ViewUserCard(int Employee_Id)
        {
            
            using (var dbcont = new ECMSEntities())
            {
                    var Emplo = dbcont.Employees.Where(d=>d.Employee_Id == Employee_Id).Select(x => new EmployeDTO {
                    Employee_Name_Ar = x.Employee_Name_Ar,
                    Employee_Name_En = x.Employee_Name_En,
                    Employee_Id=x.Employee_Id,
                    Employee_Active = x.Employee_Active,
                    Employee_Email = x.Employee_Email,
                    Employee_Password = x.Employee_Password,
                    Employee_Phone = x.Employee_Phone,
                    Employee_Profile = x.Employee_Profile,
                    Employee_Signature = x.Employee_Signature,
                    Group_Id = x.Group_Id,
                    Structures = x.Employee_Structure.Select(c=> c.Structure_Id)
                    }).FirstOrDefault();
             
                 JavaScriptSerializer js = new JavaScriptSerializer();
                return JsonConvert.SerializeObject(Emplo);
            }
        }

        [WebMethod]
        public static void DeleteEmplooye(int Employee_Id)
        {
          try{ 
                ECMSEntities db = new ECMSEntities();
                var widgets = db.Employee_Structure.Where(x => x.Employee_Id == Employee_Id).ToList();
                if (widgets.Count > 0)
                {
                    foreach (Employee_Structure widget in widgets)
                    {
                        db.Employee_Structure.Remove(widget);
                    }
                }
                var DelEmp = db.Employees.First(x => x.Employee_Id == Employee_Id);
                db.Employees.Remove(DelEmp);
                db.SaveChanges();
            }catch(Exception e)
            {

            }

        }


        public void ViewDataEmp()
        {
            if (EmployeeId >0 ) {
                var Employees = db.Employees.First(x => x.Employee_Id == EmployeeId);
               // if (Employees.Employee_Profile != "" && Employees.Employee_Profile!=null) Emp_Profile.ImageUrl = "../../../../media/Profile/" + Employees.Employee_Profile;
               // if (Employees.Employee_Signature != "" && Employees.Employee_Signature != null) Emp_Signature.ImageUrl = "../../../../media/Signature/" + Employees.Employee_Signature;
                Employee_Name_Ar.Text = Employees.Employee_Name_Ar;
                Employee_Name_En.Text = Employees.Employee_Name_En;
                Employee_Email.Text = Employees.Employee_Email;
                Employee_Phone.Text = Employees.Employee_Phone;
                Groups.SelectedValue = Employees.Group_Id.ToString();
                Active.Checked = bool.Parse(Employees.Employee_Active.ToString());
            }

            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showmodel();", true);
        }



    }
}