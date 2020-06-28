using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;
using Website.Classes;

namespace Treatment.Pages.Eminutes.TopicManagment
{
    public partial class TopicInfo : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        int TopicID, MeetingID,BoardID = 0;
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //TopicID = 1;
            // MeetingID = 1;

            if (Request["MeetingID"] == null || Request["BoardID"] == null) { 
                Response.Redirect("~/Pages/Eminutes/Home.aspx");
            }
            else { 
                MeetingID = int.Parse(Request["MeetingID"].ToString());
                BoardID = int.Parse(Request["BoardID"].ToString());
            }

            if (Request["TopicID"] != null)
                TopicID = int.Parse(Request["TopicID"].ToString());

            if (!IsPostBack)
            {
                fillDropDown();
                if (TopicID == 0) ini(); else ViewTopic(TopicID);
            }
        }


        private void fillDropDown()
        {
            List<Structure> ListStructure = db.Structures.ToList();
            if (SessionWrapper.LoggedUser.Language_id == 1)
                ddlFiller.dropDDL(Structure, "Structure_Id", "Structure_Name_Ar", ListStructure, "إختر من الهيكل الإداري");
            else
                ddlFiller.dropDDL(Structure, "Structure_Id", "Structure_Name_En", ListStructure, "Select Structure");

            if (SessionWrapper.LoggedUser.Language_id == 1)
                TopicStatus.DataTextField = "M_Topic_Status_Name_Ar";

            if (SessionWrapper.LoggedUser.Language_id == 1)
                translateValidationArabic();
        }
        public void ini()
        {
            try
            {
                if (MeetingID != 0)
                {
                    var Board = db.M_Meeting.First(x => x.Meeting_Id == MeetingID);
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                    {
                        MeetingName.Text = Board.Meeting_Name_Ar;
                    }
                    else
                    {
                        MeetingName.Text = Board.Meeting_Name_En;
                    }
                    
                }
            }
            catch (Exception e) { }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int TopicStatus_id = 0;
            int.TryParse(TopicStatus.SelectedValue, out TopicStatus_id);

            int Structure_Id = 0;
            int.TryParse(Structure.SelectedValue, out Structure_Id);

            bool result = SaveTopic(TopicID,MeetingID, ArabicName.Text, EnglishName.Text, TopicStatus_id,Structure_Id, ArabicDescription.Text, EnglishDescription.Text, ArabicRecommendation.Text,EnglishRecommendation.Text,ArabicRecommendationDoc.Text,EnglishRecommendationDoc.Text);
            if (result)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  The  Meeting was Sucessfully saved in system ! ');", true);
                if (TopicID == 0) ClearForm();

                Response.Redirect("~/Pages/Eminutes/Meeting.aspx?BoardId="+BoardID+"&MeetingID="+MeetingID);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','Error');", true);
            }
        }

        public bool SaveTopic(int Topic_Id, int Meeting_Id, string Topic_Name_Ar, string Topic_Name_En, int Topic_Status_Id ,int Structure_Id, string Arabic_Description, string English_Description,string Arabic_Recommendation, string English_Recommendation,string Arabic_RecommendationDoc,string English_RecommendationDoc)
        {
            try
            {
                db.Configuration.LazyLoadingEnabled = false;
                M_Topic Topic = db.M_Topic.Create();
                if (Topic_Id != 0) Topic = db.M_Topic.First(x => x.Topic_Id == Topic_Id);
                Topic.Meeting_Id = Meeting_Id;
                Topic.Topic_Status = Topic_Status_Id;
                if(Structure_Id > 0) Topic.Structure_Id = Structure_Id;else Topic.Structure_Id = null;
                Topic.Topic_Name_Ar = Topic_Name_Ar;
                Topic.Topic_Name_En = Topic_Name_En;
                Topic.Topic_Description_Ar = Arabic_Description;
                Topic.Topic_Description_En = English_Description;
                Topic.Topic_Recommendation_Ar = Arabic_Recommendation;
                Topic.Topic_Recommendation_En = English_Recommendation;
                Topic.Topic_Recommendation_Doc_Ar = Arabic_RecommendationDoc;
                Topic.Topic_Recommendation_Doc_En = English_RecommendationDoc;

                if (Topic_Id != 0)
                {
                    db.Entry(Topic).State = System.Data.EntityState.Modified;
                }
                else
                {
                    Topic.Create_Date = DateTime.Now.Date;
                    db.M_Topic.Add(Topic);
                }
                db.SaveChanges();
                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(Topic, logFileModule.settings);
                if (Meeting_Id != 0)
                {
                    logFileModule.logfile(10, "تعديل بيانات موضوع", "update Topic", LogData);
                }
                else
                {
                    logFileModule.logfile(10, "إضافة موضوع", "Add Topic", LogData);
                }

            }
            catch { return false; }
            return true;
        }


        public void ViewTopic(int Topic_Id)
        {
            var Topic= db.M_Topic.First(x => x.Topic_Id == Topic_Id);
            var MName = db.M_Meeting.First(x => x. Meeting_Id == MeetingID);
            MeetingID = int.Parse(Topic.Meeting_Id.ToString());
            //CDate.Text = Meet.Create_Date.ToString();
            //if (SessionWrapper.LoggedUser.Language_id == 1)
            MeetingName.Text = MName.Meeting_Name_En;
            ArabicName.Text = Topic.Topic_Name_Ar;
            EnglishName.Text = Topic.Topic_Name_En;
            TopicStatus.SelectedValue = Topic.Topic_Status.ToString();
            if (Topic.Structure_Id != null) Structure.SelectedValue = Topic.Structure_Id.ToString();
            ArabicDescription.Text = Topic.Topic_Description_Ar;
            EnglishDescription.Text = Topic.Topic_Description_En;
            ArabicRecommendation.Text = Topic.Topic_Recommendation_Ar;
            EnglishRecommendation.Text = Topic.Topic_Recommendation_En;
            ArabicRecommendationDoc.Text = Topic.Topic_Recommendation_Doc_Ar;
            EnglishRecommendationDoc.Text = Topic.Topic_Recommendation_Doc_En;
        }

        public void ClearForm()
        {
            //MeetingID = 0;
            TopicID = 0;
            ArabicName.Text = "";
            EnglishName.Text = "";
            TopicStatus.SelectedValue = null;
            ArabicDescription.Text = "";
            EnglishDescription.Text = "";
            ArabicRecommendation.Text = "";
            EnglishRecommendation.Text = "";
            ArabicRecommendationDoc.Text = "";
            EnglishRecommendationDoc.Text = "";
          
        }

        public void translateValidationArabic()
        {
            MeetingNameValidator.Text = "أدخل إسم الإجتماع";
            EnglishNameValidator.Text = "أدخل إسم الموضوع بالانجليزي";
            ArabicNameValidator.Text = "أدخل إسم الموضوع بالعربي";
            StatusofTopicValidator.Text = "إختر الحالة الموضوع";
            ArabicDescriptionValidator.Text = " أدخل وصف الموضوع بالعربي";
            EnglishDescriptionValidator.Text = "أدخل وصف الموضوع بالانجليزي";
          
            MeetingName.Attributes["placeholder"] = "أدخل إسم الإجتماع";
            EnglishName.Attributes["placeholder"] = "أدخل إسم الموضوع بالانجليزي";
            ArabicName.Attributes["placeholder"] = "أدخل إسم الموضوع بالعربي";
            ArabicDescription.Attributes["placeholder"] = " أدخل وصف الموضوع بالعربي";
            EnglishDescription.Attributes["placeholder"] = "أدخل وصف الموضوع بالانجليزي";

            Save.Text = "حفظ";
            Cancel.Text = "إلغاء";

        }
    }
}