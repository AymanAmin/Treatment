using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Classes;
using Treatment.Entity;
using Newtonsoft.Json;

namespace Treatment.Pages.Setting.TreatmentManagement
{
    public partial class TreatmentManagement : System.Web.UI.Page
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
                // Priority Grid View
                PriorityGridView.Columns[0].Caption = FieldNames.getFieldName("TreatmentManagement-Action", "Action");
                PriorityGridView.Columns[1].Caption = FieldNames.getFieldName("TreatmentManagement-ArabicName", "Arabic Name");
                PriorityGridView.Columns[2].Caption = FieldNames.getFieldName("TreatmentManagement-EnglishName", "English Name");
                PriorityGridView.Columns[3].Caption = FieldNames.getFieldName("TreatmentManagement-ClassCard", "Class Card");
                PriorityGridView.Columns[4].Caption = FieldNames.getFieldName("TreatmentManagement-ClassCss", "Class Css");
                PriorityGridView.Columns[5].Caption = FieldNames.getFieldName("TreatmentManagement-ID", "ID");

                // Confidentialit Grid View
                ConfidentialityGridView.Columns[0].Caption = FieldNames.getFieldName("TreatmentManagement-Action", "Action");
                ConfidentialityGridView.Columns[1].Caption = FieldNames.getFieldName("TreatmentManagement-ArabicName", "Arabic Name");
                ConfidentialityGridView.Columns[2].Caption = FieldNames.getFieldName("TreatmentManagement-EnglishName", "English Name");
                ConfidentialityGridView.Columns[3].Caption = FieldNames.getFieldName("TreatmentManagement-ClassCss", "Class Css");
                ConfidentialityGridView.Columns[4].Caption = FieldNames.getFieldName("TreatmentManagement-ID", "ID");

                // Type Grid View
                TypeGridView.Columns[0].Caption = FieldNames.getFieldName("TreatmentManagement-ArabicName", "Arabic Name");
                TypeGridView.Columns[1].Caption = FieldNames.getFieldName("TreatmentManagement-EnglishName", "English Name");
                TypeGridView.Columns[2].Caption = FieldNames.getFieldName("TreatmentManagement-Action", "Action");
                TypeGridView.Columns[3].Caption = FieldNames.getFieldName("TreatmentManagement-ID", "ID");

                // Status Grid View
                StatusGridView.Columns[0].Caption = FieldNames.getFieldName("TreatmentManagement-ArabicName", "Arabic Name");
                StatusGridView.Columns[1].Caption = FieldNames.getFieldName("TreatmentManagement-EnglishName", "English Name");
                StatusGridView.Columns[2].Caption = FieldNames.getFieldName("TreatmentManagement-Action", "Action");
                StatusGridView.Columns[3].Caption = FieldNames.getFieldName("TreatmentManagement-ID", "ID");

                // Procedure Grid View
                ProcedureGridView.Columns[0].Caption = FieldNames.getFieldName("TreatmentManagement-ArabicName", "Arabic Name");
                ProcedureGridView.Columns[1].Caption = FieldNames.getFieldName("TreatmentManagement-EnglishName", "English Name");
                ProcedureGridView.Columns[2].Caption = FieldNames.getFieldName("TreatmentManagement-Action", "Action");
                ProcedureGridView.Columns[3].Caption = FieldNames.getFieldName("TreatmentManagement-ID", "ID");

                // Delivery Grid View
                DeliveryGridView.Columns[0].Caption = FieldNames.getFieldName("TreatmentManagement-Action", "Action");
                DeliveryGridView.Columns[1].Caption = FieldNames.getFieldName("TreatmentManagement-ArabicName", "Arabic Name");
                DeliveryGridView.Columns[2].Caption = FieldNames.getFieldName("TreatmentManagement-EnglishName", "English Name");
                DeliveryGridView.Columns[3].Caption = FieldNames.getFieldName("TreatmentManagement-ID", "ID");

                // Class Grid View
                ClassGridView.Columns[0].Caption = FieldNames.getFieldName("TreatmentManagement-Action", "Action");
                ClassGridView.Columns[1].Caption = FieldNames.getFieldName("TreatmentManagement-ArabicName", "Arabic Name");
                ClassGridView.Columns[2].Caption = FieldNames.getFieldName("TreatmentManagement-EnglishName", "English Name");
                ClassGridView.Columns[3].Caption = FieldNames.getFieldName("TreatmentManagement-ID", "ID");
            }
            catch { }
        }

        protected void PriorityGridView_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            db.Configuration.LazyLoadingEnabled = false;
            List<Treatment_Priority> List = db.Treatment_Priority.ToList();
            Treatment_Priority Priority = List[List.Count - 1];

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(Priority, logFileModule.settings);
            logFileModule.logfile(10, "تم اضافة اولوية جديدة", "", LogData);
        }

        protected void PriorityGridView_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            db.Configuration.LazyLoadingEnabled = false;
            int id = (int)e.NewValues["Treatment_Priority_Id"];
            Treatment_Priority Priority = db.Treatment_Priority.Find(id);

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(Priority, logFileModule.settings);
            logFileModule.logfile(10, "تم تعديل اولوية", "", LogData);
        }

        protected void PriorityGridView_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            Treatment_Priority Priority = new Treatment_Priority();
            Priority.Treatment_Priority_Id = (int)e.Values["Treatment_Priority_Id"];
            Priority.Treatment_Priority_Name_Ar = (string)e.Values["Treatment_Priority_Name_Ar"];
            Priority.Treatment_Priority_Name_En = (string)e.Values["Treatment_Priority_Name_En"];
            Priority.Css_Class = (string)e.Values["Css_Class"];
            Priority.Card_Class = (string)e.Values["Card_Class"];

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(Priority, logFileModule.settings);
            logFileModule.logfile(10, "تم حذف الاولوية", "", LogData);
        }

        protected void ConfidentialityGridView_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            db.Configuration.LazyLoadingEnabled = false;
            List<Treatment_Confidentiality> List = db.Treatment_Confidentiality.ToList();
            Treatment_Confidentiality Confidentiality = List[List.Count - 1];

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(Confidentiality, logFileModule.settings);
            logFileModule.logfile(10, "تم اضافة درجة سرية", "", LogData);
        }

        protected void ConfidentialityGridView_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            db.Configuration.LazyLoadingEnabled = false;
            int id = (int)e.NewValues["Treatment_Confidentiality_Id"];
            Treatment_Confidentiality Confidentiality = db.Treatment_Confidentiality.Find(id);

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(Confidentiality, logFileModule.settings);
            logFileModule.logfile(10, "تم تعديل درجة السرية", "", LogData);
        }

        protected void ConfidentialityGridView_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            Treatment_Confidentiality Confidentiality = new Treatment_Confidentiality();
            Confidentiality.Treatment_Confidentiality_Id = (int)e.Values["Treatment_Confidentiality_Id"];
            Confidentiality.Treatment_Confidentiality_Name_Ar = (string)e.Values["Treatment_Confidentiality_Name_Ar"];
            Confidentiality.Treatment_Confidentiality_Name_En = (string)e.Values["Treatment_Confidentiality_Name_En"];
            Confidentiality.Css_Class = (string)e.Values["Css_Class"];

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(Confidentiality, logFileModule.settings);
            logFileModule.logfile(10, "تم حذف درجة سرية", "", LogData);
        }

        protected void TypeGridView_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            db.Configuration.LazyLoadingEnabled = false;
            List<Treatment_Type> List = db.Treatment_Type.ToList();
            Treatment_Type Type = List[List.Count - 1];

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(Type, logFileModule.settings);
            logFileModule.logfile(10, "تم اضافة نوع جديد", "", LogData);
        }

        protected void TypeGridView_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            db.Configuration.LazyLoadingEnabled = false;
            int id = (int)e.NewValues["Treatment_Type_Id"];
            Treatment_Type Type = db.Treatment_Type.Find(id);

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(Type, logFileModule.settings);
            logFileModule.logfile(10, "تم تعديل نوع", "", LogData);
        }

        protected void TypeGridView_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            Treatment_Type Type = new Treatment_Type();
            Type.Treatment_Type_Id = (int)e.Values["Treatment_Type_Id"];
            Type.Treatment_Type_Name_Ar = (string)e.Values["Treatment_Type_Name_Ar"];
            Type.Treatment_Type_Name_En = (string)e.Values["Treatment_Type_Name_En"];

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(Type, logFileModule.settings);
            logFileModule.logfile(10, "تم حذف النوع ", "", LogData);
        }

        protected void StatusGridView_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            db.Configuration.LazyLoadingEnabled = false;
            List<Treatment_Status> List = db.Treatment_Status.ToList();
            Treatment_Status Status = List[List.Count - 1];

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(Status, logFileModule.settings);
            logFileModule.logfile(10, "تم اضافة حالة جديدة", "", LogData);
        }

        protected void StatusGridView_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            db.Configuration.LazyLoadingEnabled = false;
            int id = (int)e.NewValues["Treatment_Status_Id"];
            Treatment_Status Status = db.Treatment_Status.Find(id);

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(Status, logFileModule.settings);
            logFileModule.logfile(10, "تم تعديل حالة", "", LogData);
        }

        protected void StatusGridView_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            Treatment_Status Status = new Treatment_Status();
            Status.Treatment_Status_Id = (int)e.Values["Treatment_Status_Id"];
            Status.Treatment_Status_Name_Ar = (string)e.Values["Treatment_Status_Name_Ar"];
            Status.Treatment_Status_Name_En = (string)e.Values["Treatment_Status_Name_En"];

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(Status, logFileModule.settings);
            logFileModule.logfile(10, "تم حذف حالة ", "", LogData);
        }

        protected void ProcedureGridView_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            db.Configuration.LazyLoadingEnabled = false;
            List<Treatment_Procedure> List = db.Treatment_Procedure.ToList();
            Treatment_Procedure Procedure = List[List.Count - 1];

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(Procedure, logFileModule.settings);
            logFileModule.logfile(10, "تم اضافة اجراء جديد", "", LogData);
        }

        protected void ProcedureGridView_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            db.Configuration.LazyLoadingEnabled = false;
            int id = (int)e.NewValues["Treatment_Procedure_Id"];
            Treatment_Procedure Procedure = db.Treatment_Procedure.Find(id);

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(Procedure, logFileModule.settings);
            logFileModule.logfile(10, "تم تعديل اجراء", "", LogData);
        }

        protected void ProcedureGridView_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            Treatment_Procedure Procedure = new Treatment_Procedure();
            Procedure.Treatment_Procedure_Id = (int)e.Values["Treatment_Procedure_Id"];
            Procedure.Treatment_Procedure_Name_Ar = (string)e.Values["Treatment_Procedure_Name_Ar"];
            Procedure.Treatment_Procedure_Name_En = (string)e.Values["Treatment_Procedure_Name_En"];

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(Procedure, logFileModule.settings);
            logFileModule.logfile(10, "تم حذف اجراء ", "", LogData);
        }

        protected void DeliveryGridView_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            db.Configuration.LazyLoadingEnabled = false;
            List<Treatment_Delivery> List = db.Treatment_Delivery.ToList();
            Treatment_Delivery Delivery = List[List.Count - 1];

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(Delivery, logFileModule.settings);
            logFileModule.logfile(10, "تم اضافة حالة تسليم جديدة", "", LogData);
        }

        protected void DeliveryGridView_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            db.Configuration.LazyLoadingEnabled = false;
            int id = (int)e.NewValues["Treatment_Delivery_Id"];
            Treatment_Delivery Delivery = db.Treatment_Delivery.Find(id);

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(Delivery, logFileModule.settings);
            logFileModule.logfile(10, "تم تعديل حالة التسليم", "", LogData);
        }

        protected void DeliveryGridView_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            Treatment_Delivery Delivery = new Treatment_Delivery();
            Delivery.Treatment_Delivery_Id = (int)e.Values["Treatment_Delivery_Id"];
            Delivery.Treatment_Delivery_Name_Ar = (string)e.Values["Treatment_Delivery_Name_Ar"];
            Delivery.Treatment_Delivery_Name_En = (string)e.Values["Treatment_Delivery_Name_En"];

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(Delivery, logFileModule.settings);
            logFileModule.logfile(10, "تم حذف حالة التسليم ", "", LogData);
        }

        protected void ClassGridView_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            db.Configuration.LazyLoadingEnabled = false;
            List<Treatment_Class> List = db.Treatment_Class.ToList();
            Treatment_Class Class = List[List.Count - 1];

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(Class, logFileModule.settings);
            logFileModule.logfile(10, "تم اضافة تصنيف جديد", "", LogData);
        }

        protected void ClassGridView_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            db.Configuration.LazyLoadingEnabled = false;
            int id = (int)e.NewValues["Treatment_Class_Id"];
            Treatment_Class Class = db.Treatment_Class.Find(id);

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(Class, logFileModule.settings);
            logFileModule.logfile(10, "تم تعديل تصنيف", "", LogData);
        }

        protected void ClassGridView_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            Treatment_Class Class = new Treatment_Class();
            Class.Treatment_Class_Id = (int)e.Values["Treatment_Class_Id"];
            Class.Treatment_Class_Name_Ar = (string)e.Values["Treatment_Class_Name_Ar"];
            Class.Treatment_Class_Name_En = (string)e.Values["Treatment_Class_Name_En"];

            /*Add it to log file */
            LogData = "data:" + JsonConvert.SerializeObject(Class, logFileModule.settings);
            logFileModule.logfile(10, "تم حذف تصنيف", "", LogData);
        }
    }
}