using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Classes;

namespace Treatment.Pages.Admin
{
    public partial class Language : System.Web.UI.Page
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
                // Language GridView
                LanguageGridView.Columns[0].Caption = FieldNames.getFieldName("Language-Action", "Action");
                LanguageGridView.Columns[1].Caption = FieldNames.getFieldName("Language-ID", "ID");
                LanguageGridView.Columns[2].Caption = FieldNames.getFieldName("Language-FieldName", "Field Name");
                LanguageGridView.Columns[3].Caption = FieldNames.getFieldName("Language-Value", "Value");
                LanguageGridView.Columns[4].Caption = FieldNames.getFieldName("Language-Language", "Language");
            }
            catch { }
        }
    }
}