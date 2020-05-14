using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Website.Classes;
using Treatment.Entity;

namespace Treatment.Classes
{
    public static class FieldNames
    {
        public static string getFieldName(string fieldname, string DefaultValue)
        {
            string name = DefaultValue;
            
            if (SessionWrapper.Language != null)
            {
                try
                {
                    int LanguageID = (int)SessionWrapper.LoggedUser.Language_id;
                    List<Lanuage_Detials> list = SessionWrapper.Language;
                    Lanuage_Detials lang = list.Where(x => x.Language_Detial_FieldName == fieldname && x.Language_Master_ID == LanguageID).First();
                    name = lang.Language_Detial_Value;
                }
                catch { return name; }
            }

            return name;
        }

        public static string getJavaScriptRTL()
        {
            if (SessionWrapper.LoggedUser.Language_id == 1)
                return "<script src='../../../../Theme/files/assets/js/menu/menu-rtl.js'></script>";
            else
                return string.Empty;
        }

        public static string getDirRTL()
        {
            if (SessionWrapper.LoggedUser.Language_id == 1)
                return "rtl";
            else
                return string.Empty;
        }
    }
}