using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Treatment
{
    public partial class MasterEn : System.Web.UI.MasterPage
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadBreadcrumb();
        }

        private void LoadBreadcrumb()
        {
            string str = "<li class='breadcrumb-item'><a href = 'index.html' ><i class='feather icon-home'></i></a></li>";
            for (int i = 0; i < 3; i++)
            {
                str += "<li class='breadcrumb-item'><a href='#'>Leve " + i + "</a> </li>";
            }
            breadcrumb.Text = str;
        }
    }
}