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
            int LanguageID = 2;
            if (SessionWrapper.Language != null)
            {
                try
                {
                    List<Lanuage_Detials> list = SessionWrapper.Language;
                    Lanuage_Detials lang = list.Where(x => x.Language_Detial_FieldName == fieldname && x.Language_Master_ID == LanguageID).First();
                    name = lang.Language_Detial_Value;
                }
                catch { return name; }
            }

            return name;
        }
    }
}