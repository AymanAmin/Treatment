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

        protected void Page_Load(object sender, EventArgs e)
        {
            SessionWrapper.IsLocked = true;
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
                    logFileModule.logfile(10, "الدخول بعد الايقاف المؤقت", "entry after pause", LogData);

                    SessionWrapper.IsLocked = false;
                    Response.Redirect("~/");
                    
                }
            }
            catch { }
        }
    }
}