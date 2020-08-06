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
using Website.Classes;



namespace Treatment.Pages.Treatment
{
    public partial class Employees : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
         int EmployeeId = 0;
        //LogFile Data
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        List<Employee> ALLEmployees = new List<Employee>();
        public string name { get; set; }

        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["IsECMS"] != null)
                if (!(bool)Session["IsECMS"])
                    this.MasterPageFile = "~/EminutesMaster.Master";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Setting/Auth/Login.aspx");

            if (!IsPostBack)
            {
                FillDropDownLists();
            }
            ALLEmployees = db.Employees.ToList();
            UserCard();
            Emp_Language();
        }

        public void Emp_Language()
        {
            if (SessionWrapper.LoggedUser.Language_id == 1)
            {
                Groups.DataTextField = "Group_Name_Ar";
                Emp_Structure.DataTextField = "Structure_Name_Ar";
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int Group_id = 0;
            int calander_id = 0;
            int Lang = 0;

            int Emp_ID = 0;
            int.TryParse(EmpID.Value ,out Emp_ID);
            int.TryParse(Groups.SelectedValue, out Group_id);
            int.TryParse(Language.SelectedValue, out Lang);
            if(DateofBirth.Checked) calander_id = 1;
            string EMPN = Employee_Name_Ar.Text;
            bool result = AU_Emplooyees(Emp_ID, EMPN, Employee_Name_En.Text, Employee_Email.Text, Employee_Phone.Text, Active.Checked, Group_id,Lang, calander_id);

            if (result)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  The  Employee was Sucessfully saved in system ! ');", true);
                ALLEmployees = db.Employees.ToList();
                UserCard();

            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','Error');", true);
            }
        }

        public bool AU_Emplooyees(int EmployeeID, string ArabicName, string EnglishName, string Email, string Phone, bool Active, int GroupID,int lang,int calander)
        {
            
            try
            {
                db.Configuration.LazyLoadingEnabled = false;
                Employee Emp = db.Employees.Create();
                if(EmployeeID != 0) Emp = db.Employees.First(x=>x.Employee_Id== EmployeeID);
                Emp.Employee_Name_Ar = ArabicName;
                Emp.Employee_Name_En = EnglishName;
                Emp.Employee_Email = Email;
                Employee_Structure Emp_Stu= new Employee_Structure(); ;
                if (EmployeeID == 0)
                {
                    string New_Password = StringCipher.RandomString(7);
                    string Encrypted_Password = StringCipher.Encrypt(New_Password, "Password"); // emp.Employee_Password.ToString();
                    Emp.Employee_Password = Encrypted_Password;

                    string sever_name = Request.Url.Authority.ToString();
                    SendEmail send = new SendEmail();
                    bool EmailResult = send.ResetEmail(Email, New_Password, sever_name);
                    if (EmailResult)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "show_model_sucess();", true);
                    }
                }
                Emp.Employee_Phone = Phone;
                Emp.Employee_Active = Active;
                Emp.Group_Id = GroupID;
                Emp.Language_id = lang;
                Emp.Calendar_id = calander;
                string ImagepathProfile = UploadFile(1);
                string ImagepathSignature = UploadFile(2);
                if (ImagepathProfile != "" ) Emp.Employee_Profile = ImagepathProfile; else if(EmployeeID == 0) ImagepathProfile = "Profile.JPG";
                if (ImagepathSignature != "") Emp.Employee_Signature =ImagepathSignature;else if (EmployeeID == 0) ImagepathSignature = "Signature.JPG";
                /////////////////////////////////////// Employee_Structure /////////////////////////////////////
                Boolean DefaultStructure = false;
                for (int i = 0; i < Emp_Structure.Items.Count; i++)
                {
                    int id = 0;
                    Boolean IsFound = false;
                    int.TryParse(Emp_Structure.Items[i].Value, out id);
                    var Emp_Stru_found = db.Employee_Structure.Where(x => x.Employee_Id == EmployeeID && x.Structure_Id==id).ToList();
                    if(Emp_Stru_found.Count > 0 ) IsFound = true;
                    if (Emp_Structure.Items[i].Selected)
                    {
                        if (!IsFound) {
                            Emp_Stu = new Employee_Structure();
                            Emp_Stu.Structure_Id = int.Parse(Emp_Structure.Items[i].Value);
                            Emp_Stu.Status_Structure = true;
                            Emp_Stu.Type_Delegation = false;
                            if (!DefaultStructure) { Emp_Stu.Default_Structure = true; DefaultStructure = true; } else { Emp_Stu.Default_Structure = false; }
                            Emp.Employee_Structure.Add(Emp_Stu);
                        }
                        else
                        {
                            Emp_Stu = db.Employee_Structure.First(x => x.Employee_Id == EmployeeID && x.Structure_Id == id);
                            Emp_Stu.Status_Structure = true;
                            Emp_Stu.Type_Delegation = false;
                            if (!DefaultStructure) { Emp_Stu.Default_Structure = true; DefaultStructure = true; } else { Emp_Stu.Default_Structure = false; }
                            Emp.Employee_Structure.Add(Emp_Stu);
                        }
                    }
                    else if(IsFound)
                    {
                        Emp_Stu = db.Employee_Structure.First(x => x.Employee_Id == EmployeeID && x.Structure_Id == id);
                        Emp_Stu.Status_Structure = false;
                        Emp_Stu.Type_Delegation = false;
                        Emp_Stu.Default_Structure = false;
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
                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(Emp, logFileModule.settings);
                if (EmployeeID != 0){
                    logFileModule.logfile(10, "تعديل بيانات موظف", "update Employee", LogData);
                } else{
                    logFileModule.logfile(10, "إضافة موظف", "Add Employee", LogData);
                }
                LogData = "data:" + JsonConvert.SerializeObject(Emp_Stu, logFileModule.settings);
                logFileModule.logfile(10, "هيكلة موظف", "Employee Structure", LogData);
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




        private void Fillter()
        {
            string val_Fillter = string.Empty;
            
             if (StructureF.SelectedIndex !=0)
             {
                 int id = int.Parse(StructureF.SelectedValue.ToString());
                ALLEmployees = (from s in ALLEmployees
                 join sl in db.Employee_Structure on s.Employee_Id equals sl.Employee_Id
                 where sl.Structure_Id == id
                 select s).ToList();
                //ALLEmployees = ALLEmployees.Where(x => x.Employee_Signature.Where(f=> f.)).ToList();
                 val_Fillter += "<strong>" + FieldNames.getFieldName("Employees-Structure", "Structure") + " : </strong>" + StructureF.SelectedItem + " , ";
             }

            if (GroupF.SelectedIndex !=0)
           {
               int id = int.Parse(GroupF.SelectedValue.ToString());
               ALLEmployees = ALLEmployees.Where(x => x.Group_Id==id).ToList();
               val_Fillter += "<strong>" + FieldNames.getFieldName("Employees-Group", "Group") + " : </strong>" + GroupF.SelectedItem + " , ";
           }

            if (LanguageF.SelectedIndex != 0)
            {
                int id = int.Parse(LanguageF.SelectedValue.ToString());
                ALLEmployees = ALLEmployees.Where(x => x.Language_id == id).ToList();
                val_Fillter += "<strong>" + FieldNames.getFieldName("Employees-Language", "Language") + " : </strong>" + LanguageF.SelectedItem + " , ";
            }

            if (ActiveF.Value != null)
            {
                ALLEmployees = ALLEmployees.Where(x => x.Employee_Active == ActiveF.Checked).ToList();
                val_Fillter += "<strong>" + FieldNames.getFieldName("Employees-Active", "Active") + " : </strong>" + ActiveF.Checked + " , ";
            }
            if (Keyword.Text.Trim() != "")
            {
                ALLEmployees = ALLEmployees.Where(x => (x.Employee_Name_Ar != null && x.Employee_Name_Ar.Contains(Keyword.Text.Trim())) || (x.Employee_Name_En != null && x.Employee_Name_En.Contains(Keyword.Text.Trim())) || (x.Employee_Email != null && x.Employee_Email.Contains(Keyword.Text.Trim())) || (x.Employee_Phone != null && x.Employee_Phone.Contains(Keyword.Text.Trim()))).ToList();
                val_Fillter += "<strong>" + FieldNames.getFieldName("AdvancedSearch-Keyword", "Keyword") + " : </strong>" + Keyword.Text + " , ";
            }

            // Create the details of fillter text
            if (val_Fillter != string.Empty)
            {
                val_Fillter = val_Fillter.Substring(0, val_Fillter.Length - 3);
                FilterUsed.Text = val_Fillter + "";
            }
            else
                FilterUsed.Text = "";

            UserCard();
        }


        public void UserCard()
        {
            int i = 0;
            string ImgTag = "";
            string img = "";
            string yourHTMLstring = "";
            string Emp_Name = "";
            UCard.Controls.Clear();
           // ALLEmployees = db.Employees.ToList();
            while (i < ALLEmployees.Count)
            {

                if (ALLEmployees[i].Employee_Profile !="" && ALLEmployees[i].Employee_Profile !=null)
                {
                    img = ALLEmployees[i].Employee_Profile.ToString();
                }
                else
                {
                    img = "Profile.jpg";
                }
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Emp_Name = ALLEmployees[i].Employee_Name_Ar.ToString();
                else
                    Emp_Name = ALLEmployees[i].Employee_Name_En.ToString();

                ImgTag = "<img class='img-fluid img-radius'" + "src='../../../../media/Profile/" + img + "'alt='" + img + "'>";
                 yourHTMLstring = "<div class='col-lg-6 col-xl-3 col-md-6'>" +
                                                "<div class='card rounded-card user-card'>"+
                                                    "<div class='card-block'>" +
                                                           " <div class='img-hover'>"+
                                                                //"<img class='img-fluid img-radius' src='~/media/Signature/' alt='m.jpg'> " +
                                                                ImgTag +
                                                                "<div class='img-overlay img-radius'>" +
                                                                   "<span>" +
                                                                         "<a class='btn btn-primary btn-outline-primary btn-icon'  id='" + ALLEmployees[i].Employee_Id.ToString()+ "'OnClick='showmodel(this)'><i class='icofont icofont-ui-edit text-info h5'></i></a> " +
                                                                          //" <a class='btn btn-danger btn-outline-danger btn-icon'  id='" + ALLEmployees[i].Employee_Id.ToString()+ "'OnClick='DeleteEmplooye(this)'><i class='icofont icofont-ui-delete text-danger h5'></i></a> " +
                                                                         "<a class='btn btn-danger btn-outline-danger btn-icon'  id='" + ALLEmployees[i].Employee_Id.ToString() + "' data-href = '" + ALLEmployees[i].Employee_Id.ToString() + "' data-toggle='modal' data-target='#confirm-delete'><i class='icofont icofont-ui-delete text-danger h5'></i></a>" +

                                                                   "</span>" +
                                                                "</div>" +
                                                            "</div>" +
                                                            "<div class='user-content'>" +
                                                                "<h4 class=''>"+ Emp_Name + "</h4> " +
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
                    Language_id =x.Language_id,
                    Calendar_id =x.Calendar_id,
                    Group_Id = x.Group_Id,
                    Structures = x.Employee_Structure.Where(f => f.Status_Structure==true && f.Type_Delegation==false).Select(c=> c.Structure_Id)
                    }).FirstOrDefault();
             
                 JavaScriptSerializer js = new JavaScriptSerializer();
                return JsonConvert.SerializeObject(Emplo);
            }
        }

        [WebMethod]
        public static string DeleteEmplooye(int Employee_Id)
        {
            string returnDeleteEmp = "0";
            LogFileModule logFileModule = new LogFileModule();
            String LogData = "";
            try
            { 
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
                returnDeleteEmp = "1";
                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(DelEmp, logFileModule.settings);
                logFileModule.logfile(10, "حذف الموظف", "Delete Employee", LogData);
             
            }
            catch(Exception e)
            {
            }
            return JsonConvert.SerializeObject(returnDeleteEmp);
        }

        public void ViewDataEmp()
        {
            if (EmployeeId >0 ) {
                var Employeess = db.Employees.First(x => x.Employee_Id == EmployeeId);
               // if (Employees.Employee_Profile != "" && Employees.Employee_Profile!=null) Emp_Profile.ImageUrl = "../../../../media/Profile/" + Employees.Employee_Profile;
               // if (Employees.Employee_Signature != "" && Employees.Employee_Signature != null) Emp_Signature.ImageUrl = "../../../../media/Signature/" + Employees.Employee_Signature;
                Employee_Name_Ar.Text = Employeess.Employee_Name_Ar;
                Employee_Name_En.Text = Employeess.Employee_Name_En;
                Employee_Email.Text = Employeess.Employee_Email;
                Employee_Phone.Text = Employeess.Employee_Phone;
                Groups.SelectedValue = Employeess.Group_Id.ToString();
                Active.Checked = bool.Parse(Employeess.Employee_Active.ToString());
            }

            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showmodel();", true);
        }

        private void FillDropDownLists()
        {
            // Structure dropdown
            List<Structure> StructuresList = db.Structures.ToList();
            if (SessionWrapper.LoggedUser.Language_id == 1)
                ddlFiller.dropDDL(StructureF, "Structure_Id", "Structure_Name_Ar", StructuresList, " - الكل -");
            else
                ddlFiller.dropDDL(StructureF, "Structure_Id", "Structure_Name_En", StructuresList, " - All -");

            // Group dropdown
            List<Group> GroupList = db.Groups.ToList();
            if (SessionWrapper.LoggedUser.Language_id == 1)
                ddlFiller.dropDDL(GroupF, "Group_Id", "Group_Name_Ar", GroupList, " - الكل -");
            else
                ddlFiller.dropDDL(GroupF, "Group_Id", "Group_Name_En", GroupList, " - All -");

            // Group dropdown
            List<LanguageMaster> LanguageList = db.LanguageMasters.ToList();
            if (SessionWrapper.LoggedUser.Language_id == 1)
                ddlFiller.dropDDL(LanguageF, "ID", "Language_Name", LanguageList, " - الكل -");
                else
                ddlFiller.dropDDL(LanguageF, "ID", "Language_Name", LanguageList, " - All -");

            if (SessionWrapper.LoggedUser.Language_id == 1)
                translateValidationArabic();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Fillter();
        }

        public void translateValidationArabic()
        {
            Employee_Name_ArValidator.Text = "أدخل الإسم بالعربي";
            Employee_Name_EnValidator.Text = "أدخل الإسم بالإنجليزي";
            Employee_EmailValidator.Text = "أدخل البريد الإلكتروني";
            Employee_PhoneValidator.Text = "أدخل الهاتف";
            Emp_StructureValidator.Text = "إختر الهيكل الوظيفي";
            GroupsValidator.Text = "إختر المجموعة";
            LanguageValidator.Text = "إختر اللغة";
            btnSearch.Text = "بحث";

            Employee_Name_Ar.Attributes["placeholder"] = "أدخل الإسم بالعربي";
            Employee_Name_En.Attributes["placeholder"] = "أدخل الإسم بالإنجليزي";
            Employee_Email.Attributes["placeholder"] = "أدخل البريد الإلكتروني";
            Employee_Phone.Attributes["placeholder"] = "أدخل الهاتف";
            Keyword.Attributes["placeholder"] = "الإسم أو الهاتف أو البريدالإلكتروني";
            Emp_Structure.Attributes["placeholder"] = "إختر الهيكل الوظيفي";


        }


    }
}