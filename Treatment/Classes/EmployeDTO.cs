using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Treatment.Classes;
using Treatment.Entity;

namespace Treatment.Models
{
    public class EmployeDTO
    {
        public int Employee_Id { get; set; }

        public string Employee_Name_Ar { get; set; }

        public string Employee_Email { get; set; }

        public string Employee_Phone { get; set; }

        public Nullable<int> Group_Id { get; set; }

        public string Employee_Name_En { get; set; }

        public string Employee_Profile { get; set; }

        public string Employee_Signature { get; set; }

        public string Employee_Password { get; set; }

        public Nullable<bool> Employee_Active { get; set; }
        public IEnumerable<int?> Structures { get; set; }

        public Nullable<int> Language_id { get; set; }
        public Nullable<int> Calendar_id { get; set; }
    }
}