﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;

namespace Treatment.Pages.Treatment
{
    public partial class inbox : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Entity.Treatment treat = new Entity.Treatment();
        }
    }
}