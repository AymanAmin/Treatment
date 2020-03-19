using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;

namespace Treatment.Pages.Setting
{
    public partial class TreatmentPriority : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            AddPriority(Name.Text);
        }


        private bool AddPriority(string name)
        {
            try
            {
                Treatment_Priority TP = db.Treatment_Priority.Create();
                TP.Treatment_Priority_Name = name;
                db.Treatment_Priority.Add(TP);
                db.SaveChanges();

                //PriorityDataSource.DataBind();
            }
            catch { return false; }
            return true;
        }
    }
}
 