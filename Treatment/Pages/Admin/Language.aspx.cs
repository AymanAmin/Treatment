using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Classes;
using Treatment.Entity;
using Website.Classes;
using Newtonsoft.Json;

namespace Treatment.Pages.Admin
{
    public partial class Language : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        //LogFile Data
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Change_LablesName_BasedOn_Language();
            }
        }

        private void Change_LablesName_BasedOn_Language()
        {
            try
            {
                // Language GridView
                LanguageGridView.Columns[0].Caption = FieldNames.getFieldName("Language-Action", "Action");
                LanguageGridView.Columns[1].Caption = FieldNames.getFieldName("Language-ID", "ID");
                LanguageGridView.Columns[2].Caption = FieldNames.getFieldName("Language-FieldName", "Field Name");
                LanguageGridView.Columns[3].Caption = FieldNames.getFieldName("Language-Value", "Value");
                LanguageGridView.Columns[4].Caption = FieldNames.getFieldName("Language-Language", "Language");
            }
            catch { }
        }

        protected void LanguageGridView_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            db.Configuration.LazyLoadingEnabled = false;
            // Selecet Language Based on User language and set in session
            SessionWrapper.Language = db.Lanuage_Detials.Where(x => x.Language_Master_ID == SessionWrapper.LoggedUser.Language_id).ToList();

            List<Lanuage_Detials> List = db.Lanuage_Detials.ToList();
            Lanuage_Detials lang = List[List.Count - 1];

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(lang, logFileModule.settings);
            logFileModule.logfile(10, "تم اضافة ترجمة جديدة", "", LogData);
        }

        protected void LanguageGridView_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            db.Configuration.LazyLoadingEnabled = false;
            // Selecet Language Based on User language and set in session
            SessionWrapper.Language = db.Lanuage_Detials.Where(x => x.Language_Master_ID == SessionWrapper.LoggedUser.Language_id).ToList();

            int id = (int)e.NewValues["Language_Detial_ID"];
            Lanuage_Detials lang = db.Lanuage_Detials.Find(id);
            
            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(lang, logFileModule.settings);
            logFileModule.logfile(10, "تم تعديل الترجمة", "", LogData);
        }

        protected void LanguageGridView_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            db.Configuration.LazyLoadingEnabled = false;
            // Selecet Language Based on User language and set in session
            SessionWrapper.Language = db.Lanuage_Detials.Where(x => x.Language_Master_ID == SessionWrapper.LoggedUser.Language_id).ToList();

            Lanuage_Detials lang = new Lanuage_Detials();
            lang.Language_Detial_ID = (int)e.Values["Language_Detial_ID"];
            lang.Language_Detial_FieldName = (string)e.Values["Language_Detial_FieldName"];
            lang.Language_Detial_Value = (string)e.Values["Language_Detial_Value"];
            lang.Language_Master_ID = (int)e.Values["Language_Master_ID"];

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(lang, logFileModule.settings);
            logFileModule.logfile(10, "تم حذف الترجمة", "", LogData);
        }
    }
}