using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Xml;
using Treatment;
using Treatment.Entity;

namespace Website.Classes
{
    public class SendSMS
    {
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        ECMSEntities db = new ECMSEntities();

        private string ConvertToUnicode(string val)
        {
            string msg2 = string.Empty;
            int I;
            for (I = 0; I <= val.Length - 1; I++)
                msg2 += convertToUnicode(Convert.ToChar(val.Substring(I, 1)));

            return msg2;
        }

        private string convertToUnicode(char ch)
        {
            System.Text.UnicodeEncoding class1 = new System.Text.UnicodeEncoding();
            byte[] msg = class1.GetBytes(System.Convert.ToString(ch));

            return fourDigits(msg[1] + msg[0].ToString("X"));
        }

        private string fourDigits(string val)
        {
            string result = string.Empty;

            switch ((val.Length))
            {
                case 1:
                    {
                        result = "000" + val;
                        break;
                    }

                case 2:
                    {
                        result = "00" + val;
                        break;
                    }

                case 3:
                    {
                        result = "0" + val;
                        break;
                    }

                case 4:
                    {
                        result = val;
                        break;
                    }
            }

            return result;
        }

        public string SendMessage(string msg, string phone)
        {
            try
            {
                string username = "riyadh.edu", passwor = "MYsms@dmin", sender = "REU-AD";
                /* Encoding msg */
                msg = ConvertToUnicode(msg);
                /* End Encoding msg */

                //string number = "966"+ phone.Substring(1, phone.Length - 1);

                string number = phone;

                string postData = "mobile=" + username + "&password=" + passwor + "&numbers=" + number + "&sender=" + sender + "&msg=" + msg + "&applicationType=24";
                string strResponcse = "-1";

                WebRequest request = WebRequest.Create("http://www.mobily.ws/api/msgSend.php?" + postData);
                request.Method = "GET";
                using (WebResponse response = request.GetResponse())
                {
                    using (Stream stream = response.GetResponseStream())
                    {
                        StreamReader reader = new StreamReader(stream);
                        strResponcse = reader.ReadToEnd();
                        reader.Close();
                        stream.Close();
                    }
                }
                return strResponcse;
            }catch (Exception er)
            {
                Dictionary<string, dynamic> Message_SMS = new Dictionary<string, dynamic>();
                Message_SMS["phone"] = phone;
                Message_SMS["Message"] = msg;
                Message_SMS["Exception"] = er;
                db.Configuration.LazyLoadingEnabled = false;
                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(Message_SMS, logFileModule.settings);
                logFileModule.logfile(10, "حدث خطأ في ارسال رسالة", "New Exception in Send SMS", LogData);
                return "-1";
            }
        }
    }
}