using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;
using Website.Classes;

namespace Treatment.Pages.Eminutes.MeetingManagment
{
    public partial class MeetingInfo : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        int BoardID,MeetingID = 0;
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //BoardID = 1;
            // MeetingID = 1;

            if (Request["BoardId"] == null)
                Response.Redirect("~/Pages/Eminutes/Home.aspx");

            BoardID = int.Parse(Request["BoardId"].ToString());
            if (Request["MeetingID"] != null)
                MeetingID = int.Parse(Request["MeetingID"].ToString());

            if (!IsPostBack)
            {
                fillDropDown();
                if (MeetingID == 0) ini(); else ViewMeeting(MeetingID);
            }
            
        }

        private void fillDropDown()
        {
            List<M_Board_Location> ListLocations  = db.M_Board_Location.Where(x => x.Board_Id == BoardID).ToList();
            if (SessionWrapper.LoggedUser.Language_id == 1)
                ddlFiller.dropDDL(MeetingLocation, "Board_Location_Id", "Board_Location_Name_Ar", ListLocations, "إختر الموقع");
            else
                ddlFiller.dropDDL(MeetingLocation, "Board_Location_Id", "Board_Location_Name_En", ListLocations, "Select Locations");

            if (SessionWrapper.LoggedUser.Language_id == 1)
                MeetingStatus.DataTextField = "Meeting_Status__Name_Ar";

            if (SessionWrapper.LoggedUser.Language_id == 1)
                translateValidationArabic();
        }

        public void ini()
        {
            try
            {
                if (MeetingID == 0)
                {
                    CDate.Text = DateTime.Now.Date.ToString();
                }

                if (BoardID != 0)
                {
                    var Board = db.M_Board.First(x => x.Board_Id == BoardID);
                   if (SessionWrapper.LoggedUser.Language_id == 1)
                    {
                        BoardName.Text = Board.Board_Name_Ar;
                    }
                    else
                    {
                        BoardName.Text = Board.Board_Name_En;
                    }
                }
            }
            catch (Exception e) { }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int MeetingStatus_id = 0;
            int.TryParse(MeetingStatus.SelectedValue, out MeetingStatus_id);

            int MeetingLocation_id = 0;
            int.TryParse(MeetingLocation.SelectedValue, out MeetingLocation_id);

            DateTime MDate = DateTime.Now;
            DateTime.TryParse(MeetingDate.Value.ToString(), out MDate);

            DateTime MeetingTme = DateTime.Now;
            DateTime.TryParse(timepicker.Text, out MeetingTme);
            
            bool result = SaveMeeting(MeetingID,BoardID,ArabicName.Text,EnglishName.Text, MDate, MeetingTme, MeetingStatus_id,Minutes.Text, MeetingLocation_id, addAttachments);
            if (result)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  The  Meeting was Sucessfully saved in system ! ');", true);
                if(MeetingID==0)ClearForm();

                Response.Redirect("~/Pages/Eminutes/Board.aspx?BoardId=" + BoardID);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','Error');", true);
            }
        }

        public bool SaveMeeting(int Meeting_Id, int Board_Id, string Meeting_Name_Ar, string Meeting_Name_En, DateTime Meeting_Date, DateTime Meeting_Time, int Meeting_Status_Id, string Meeting_Minutes, int Board_Location_Id,FileUpload M_Attachments)
        {
            
            try
            {
                db.Configuration.LazyLoadingEnabled = false;
                M_Meeting Meeting = db.M_Meeting.Create();
                if (Meeting_Id != 0) Meeting = db.M_Meeting.First(x => x.Meeting_Id == Meeting_Id);
                Meeting.Board_Id = Board_Id;
                Meeting.Meeting_Name_Ar = Meeting_Name_Ar;
                Meeting.Meeting_Name_En = Meeting_Name_En;
                Meeting.Meeting_Date = Meeting_Date;
                Meeting.Meeting_Time = Meeting_Time.TimeOfDay;
                Meeting.Meeting_Status = Meeting_Status_Id;
                Meeting.Meeting_Minutes = Meeting_Minutes;
                Meeting.Board_Location_Id = Board_Location_Id;

                if (Meeting_Id != 0)
                {
                    db.Entry(Meeting).State = System.Data.EntityState.Modified;
                }
                else
                {
                    Meeting.Create_Date = DateTime.Parse(CDate.Text);
                    db.M_Meeting.Add(Meeting);
                }
                db.SaveChanges();

                if (Meeting_Id != 0)
                {
                    MeetingID = Meeting_Id;
                }
                else
                {
                    MeetingID = Meeting.Meeting_Id;
                }

                 AttachmentFile(MeetingID, M_Attachments, @"~\Pages\Eminutes\media\M_Attachments\");
                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(Meeting, logFileModule.settings);
                if (Meeting_Id != 0)
                {
                    logFileModule.logfile(10, "تعديل بيانات إجتماع", "update Meeting", LogData);
                }
                else
                {
                    logFileModule.logfile(10, "إضافة إجتماع", "Add Meeting", LogData);
                }
               
            }
            catch { return false; }
            return true;
        }

        public void AttachmentFile(int MeetingID, FileUpload Uplofile, string Path)
        {
            foreach (HttpPostedFile postfiles in Uplofile.PostedFiles)
            {
                if (postfiles.ContentLength > 0 && postfiles.FileName != "")
                {
                    M_M_Attachments Fil = db.M_M_Attachments.Create();
                    Fil.Meeting_Id = MeetingID;
                    Fil.FileName = Uplofile.FileName;
                    Fil.Path = UploadFile(postfiles,Path);
                    db.M_M_Attachments.Add(Fil);
                    db.SaveChanges();
                }
            }
        }

        public string UploadFile(HttpPostedFile fileAttach , string Path)
        {
            string Imagepath = " ";
            if (this.Page.IsValid)
            {
                if (!UtilityClass.UploadFileIsValid(ref fileAttach, UtilityClass.ValidFileExtentions))
                {
                    //ltrMessage.Text = "<div class='alert alert-danger fade in'><strong>Images only allowed !</strong></div>";
                    Imagepath = "false";
                }
                Imagepath = string.Empty;

                Imagepath = UtilityClass.UploadFilePostedFile(ref fileAttach, Server.MapPath(Path));
            }
            return Imagepath;
        }

       

        public void ViewMeeting(int Meeting_Id)
        {
            var Meet = db.M_Meeting.First(x => x.Meeting_Id == Meeting_Id);
            var BName = db.M_Board.First(x => x.Board_Id == BoardID);
            BoardID = int.Parse(Meet.Board_Id.ToString());
            CDate.Text = Meet.Create_Date.ToString();
            //if (SessionWrapper.LoggedUser.Language_id == 1)
            BoardName.Text = BName.Board_Name_En;
            ArabicName.Text= Meet.Meeting_Name_Ar;
            EnglishName.Text= Meet.Meeting_Name_En;
            MeetingDate.Value = Meet.Meeting_Date.ToString();
            timepicker.Text= Meet.Meeting_Time.ToString();
            MeetingStatus.SelectedValue= Meet.Meeting_Status.ToString();
            Minutes.Text= Meet.Meeting_Minutes;
            MeetingLocation.SelectedValue = Meet.Board_Location_Id.ToString();
        }

        public void ClearForm()
        {
            MeetingID = 0;
            BoardID = 0;
            ArabicName.Text = "";
            EnglishName.Text = "";
            MeetingDate.Value = "";
            timepicker.Text = "";
            MeetingStatus.SelectedValue = null;
            Minutes.Text = "";
            MeetingLocation.SelectedValue = null;
        }

        public bool DeleteMetting(int Meeting_id)
        {
            LogFileModule logFileModule = new LogFileModule();
            String LogData = "";
            try
            {
                var DelMeeting = db.M_Meeting.First(x => x.Meeting_Id == Meeting_id);
                db.M_Meeting.Remove(DelMeeting);
                db.SaveChanges();
                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(DelMeeting, logFileModule.settings);
                logFileModule.logfile(10, "حذف الإجتماع", "Delete Meeting", LogData);

            }
            catch (Exception e)
            {
                return false;
            }
            return true;
        }

        public void translateValidationArabic()
        {
            EnglishNameValidator.Text = "أدخل إسم الإجتماع بالانجليزي";
            ArabicNameValidator.Text = "أدخل إسم الإجتماع بالعربي";
            StatusofMeetingValidator.Text = "إختر الحالة الإجتماع";
            BoardNameValidator.Text = " أدخل الإسم المجلس أو اللجنة";
            MeetingDateValidator.Text = "أدخل تاريخ الإجتماع";
            timepickerValidator.Text = " أدخل زمن الإجتماع";
            MeetingLocationValidator.Text = "إختر موقع الإجتماع";
       
            EnglishName.Attributes["placeholder"] = "أدخل الإسم بالانجليزي";
            ArabicName.Attributes["placeholder"] = "أدخل الإسم بالعربي";
            BoardName.Attributes["placeholder"] = "أدخل الإسم المجلس أو اللجنة";
            MeetingDate.Attributes["placeholder"] = "أدخل تاريخ الإجتماع";
            timepicker.Attributes["placeholder"] = "أدخل زمن الإجتماع";
            MeetingLocation.Attributes["placeholder"] = "إختر موقع الإجتماع";

            Save.Text = "حفظ";
            Cancel.Text = "إلغاء";

        }
    }
}