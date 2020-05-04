using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Treatment.Pages.Setting.UserManagment
{
    public partial class Groups : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["IsECMS"] != null)
                if (!(bool)Session["IsECMS"])
                    this.MasterPageFile = "~/EminutesMaster.Master";
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}