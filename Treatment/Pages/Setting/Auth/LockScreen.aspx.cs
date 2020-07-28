using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Website.Classes;
using Treatment.Classes;
using Newtonsoft.Json;

namespace Treatment.Pages.Setting.Auth
{ 
    public partial class LockScreen : System.Web.UI.Page
    {
        //LogFile Data
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        string name = string.Empty, URL = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["URL"] == null)
                URL = "?URL=" +Request["URL"];


            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Setting/Auth/Login.aspx"+ URL);

            SessionWrapper.IsLocked = true;
            if (SessionWrapper.LoggedUser.Language_id == 1)
                name = "الدخول كـ "+ SessionWrapper.LoggedUser.Employee_Name_Ar;
            else
                name  = "Login As "+ SessionWrapper.LoggedUser.Employee_Name_En;

            UserName.Text = name;
        }

        protected void Unlock_Click(object sender, EventArgs e)
        {
            try
            {
                string existedPassowrd = StringCipher.Decrypt(SessionWrapper.LoggedUser.Employee_Password, "Password");
                if (txtPassword.Text == existedPassowrd)
                {
                    /* Add it to log file */
                    LogData = "data:" + JsonConvert.SerializeObject(SessionWrapper.LoggedUser, logFileModule.settings);
                    logFileModule.logfile(10, "الدخول بعد الايقاف المؤقت", "login after pause", LogData);

                    SessionWrapper.IsLocked = false;
                    Response.Redirect("~/"+ URL);
                    
                }
            }
            catch { }
        }
    }
}