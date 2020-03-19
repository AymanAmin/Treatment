using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Treatment.Entity;

namespace Website.Classes
{
    public class ddlFiller
    {
        public static void dropDDL<T>(DropDownList ddlst, string selectID, string selectName, List<T> Entitylst, string selectword)
        {
            using (ECMSEntities db = new ECMSEntities())
            {
                ddlst.Items.Clear();

                ddlst.DataValueField = selectID;
                ddlst.DataTextField = selectName;
                ddlst.DataSource = Entitylst;
                ddlst.DataBind();
                ddlst.Items.Insert(0, new ListItem(selectword, "0"));
                ddlst.SelectedIndex = 0;
            }
        }
    }

}