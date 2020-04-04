using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using Treatment.Entity;
using Website.Classes;

namespace Treatment
{
    
    public class LogFileModule
    {
        ECMSEntities db = new ECMSEntities();
        public JsonSerializerSettings settings = new JsonSerializerSettings()
        {
            ReferenceLoopHandling = ReferenceLoopHandling.Ignore,
            Error = (sender, args) =>
            {
                args.ErrorContext.Handled = true;
            },
        };
        public void logfile(int controlId, string logName, string logDescription, String noteData)
        {
            try
            {
                using (var dbLog = new ECMSEntities())
                {
                    Log_File logFileInsert = dbLog.Log_File.Create();
                    logFileInsert.Log_Date = DateTime.Now;
                    if (controlId != 0)
                    {
                        if (SessionWrapper.LoggedUser != null)
                            logFileInsert.Login_Id = SessionWrapper.LoggedUser.Employee_Id;
                        else
                            logFileInsert.Login_Id = 1;
                        logFileInsert.Form_Id = currentPage();
                    }
                    logFileInsert.Log_Name = logName;
                    logFileInsert.Log_Description = logDescription;
                    logFileInsert.Log_Note = noteData;
                    dbLog.Log_File.Add(logFileInsert);
                    dbLog.SaveChanges();
                }
            }catch(Exception er) { }
        }

        private int currentPage()
        {
            Permission CurrentPage = new Permission();
            try
            {
                string LocalPath = String.Concat(HttpContext.Current.Request.Url.LocalPath.Skip(1));
                int found = LocalPath.IndexOf(".aspx");
                string url = LocalPath.Substring(0, found + 5);
                CurrentPage = db.Permissions.Where(x => x.Url_Path == url).First();
            }
            catch { CurrentPage = db.Permissions.FirstOrDefault(); }

            return CurrentPage.Permission_Id;
        }
    }
}
