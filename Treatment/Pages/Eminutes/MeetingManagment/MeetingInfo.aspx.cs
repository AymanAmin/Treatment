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
            BoardID = 1;
           // MeetingID = 1;
            if (!IsPostBack)
            {
                if (MeetingID == 0) ini(); else ViewMeeting(MeetingID);
            }
            
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
                    /*if (SessionWrapper.LoggedUser.Language_id == 1)
                    {
                        BoardName.Text = Board.Board_Name_Ar;
                    }
                    else
                    {
                    }*/
                    BoardName.Text = Board.Board_Name_En;
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
            
            bool result = SaveMeeting(MeetingID,BoardID,ArabicName.Text,EnglishName.Text, MDate, MeetingTme, MeetingStatus_id,Minutes.Text, MeetingLocation_id);
            if (result)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  The  Meeting was Sucessfully saved in system ! ');", true);
                if(MeetingID==0)ClearForm();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','Error');", true);
            }
        }

        public bool SaveMeeting(int Meeting_Id, int Board_Id, string Meeting_Name_Ar, string Meeting_Name_En, DateTime Meeting_Date, DateTime Meeting_Time, int Meeting_Status_Id, string Meeting_Minutes, int Board_Location_Id)
        {
            db.Configuration.LazyLoadingEnabled = false;
            try
            {
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
            MeetingDate.Value= Meet.Meeting_Date.ToString();
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
    }
}