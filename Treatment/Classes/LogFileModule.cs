using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Treatment.Entity;

namespace Treatment
{
    public class LogFileModule
    {
        int currentUserId = 1;
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
            using (var dbLog = new ECMSEntities())
            {
                Log_File logFileInsert = dbLog.Log_File.Create();
                logFileInsert.Log_Date = DateTime.Now;
                if (controlId != 0)
                {
                    logFileInsert.Login_Id = currentUserId;
                    logFileInsert.Form_Id = controlId;
                }
                logFileInsert.Log_Name = logName;
                logFileInsert.Log_Description = logDescription;
                logFileInsert.Log_Note = noteData;
                dbLog.Log_File.Add(logFileInsert);
                dbLog.SaveChanges();
            }
        }
    }
}
