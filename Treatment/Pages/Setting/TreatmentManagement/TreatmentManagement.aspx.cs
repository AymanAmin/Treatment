using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Classes;

namespace Treatment.Pages.Setting.TreatmentManagement
{
    public partial class TreatmentManagement : System.Web.UI.Page
    {
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

                // Confidentialit Grid View
                ConfidentialityGridView.Columns[0].Caption = FieldNames.getFieldName("TreatmentManagement-Action", "Action");
                ConfidentialityGridView.Columns[1].Caption = FieldNames.getFieldName("TreatmentManagement-ArabicName", "Arabic Name");
                ConfidentialityGridView.Columns[2].Caption = FieldNames.getFieldName("TreatmentManagement-EnglishName", "English Name");
                ConfidentialityGridView.Columns[3].Caption = FieldNames.getFieldName("TreatmentManagement-ClassCss", "Class Css");

                // Priority Grid View
                PriorityGridView.Columns[0].Caption = FieldNames.getFieldName("TreatmentManagement-Action", "Action");
                PriorityGridView.Columns[1].Caption = FieldNames.getFieldName("TreatmentManagement-ArabicName", "Arabic Name");
                PriorityGridView.Columns[2].Caption = FieldNames.getFieldName("TreatmentManagement-EnglishName", "English Name");

                // Type Grid View
                TypeGridView.Columns[0].Caption = FieldNames.getFieldName("TreatmentManagement-ArabicName", "Arabic Name");
                TypeGridView.Columns[1].Caption = FieldNames.getFieldName("TreatmentManagement-EnglishName", "English Name");
                TypeGridView.Columns[2].Caption = FieldNames.getFieldName("TreatmentManagement-Action", "Action"); 

                // Status Grid View
                StatusGridView.Columns[0].Caption = FieldNames.getFieldName("TreatmentManagement-ArabicName", "Arabic Name");
                StatusGridView.Columns[1].Caption = FieldNames.getFieldName("TreatmentManagement-EnglishName", "English Name");
                StatusGridView.Columns[2].Caption = FieldNames.getFieldName("TreatmentManagement-Action", "Action");

                // Procedure Grid View
                ProcedureGridView.Columns[0].Caption = FieldNames.getFieldName("TreatmentManagement-ArabicName", "Arabic Name");
                ProcedureGridView.Columns[1].Caption = FieldNames.getFieldName("TreatmentManagement-EnglishName", "English Name");
                ProcedureGridView.Columns[2].Caption = FieldNames.getFieldName("TreatmentManagement-Action", "Action");

                // Delivery Grid View
                DeliveryGridView.Columns[0].Caption = FieldNames.getFieldName("TreatmentManagement-Action", "Action");
                DeliveryGridView.Columns[1].Caption = FieldNames.getFieldName("TreatmentManagement-ArabicName", "Arabic Name");
                DeliveryGridView.Columns[2].Caption = FieldNames.getFieldName("TreatmentManagement-EnglishName", "English Name");

                // Class Grid View
                ClassGridView.Columns[0].Caption = FieldNames.getFieldName("TreatmentManagement-Action", "Action");
                ClassGridView.Columns[1].Caption = FieldNames.getFieldName("TreatmentManagement-ArabicName", "Arabic Name");
                ClassGridView.Columns[2].Caption = FieldNames.getFieldName("TreatmentManagement-EnglishName", "English Name");
            }
            catch { }
        }
    }
}