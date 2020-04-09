//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Treatment.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class Employee
    {
        public Employee()
        {
            this.Employee_Structure = new HashSet<Employee_Structure>();
            this.Log_File = new HashSet<Log_File>();
        }
    
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
        public Nullable<int> Language_id { get; set; }
        public Nullable<int> Calendar_id { get; set; }
    
        public virtual Group Group { get; set; }
        public virtual LanguageMaster LanguageMaster { get; set; }
        public virtual ICollection<Employee_Structure> Employee_Structure { get; set; }
        public virtual ICollection<Log_File> Log_File { get; set; }
    }
}
