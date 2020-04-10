using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Treatment.Models;

namespace Treatment.Classes
{
    public class Emp_Structure
    {
        public int? Structure_Id { get; set; }

        public string Structure_Name_Ar { get; set; }

        public Nullable<int> Structure_Parent { get; set; }

        public string Structure_Name_En { get; set; }
        

        
    }
}