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
    
    public partial class Employee_Structure
    {
        public Employee_Structure()
        {
            this.Treatment_Detial = new HashSet<Treatment_Detial>();
            this.Treatments = new HashSet<Treatment>();
        }
    
        public int Employee_Structure_Id { get; set; }
        public Nullable<int> Structure_Id { get; set; }
        public Nullable<int> Employee_Id { get; set; }
        public Nullable<bool> Status_Structure { get; set; }
        public Nullable<bool> Type_Delegation { get; set; }
    
        public virtual Employee Employee { get; set; }
        public virtual Structure Structure { get; set; }
        public virtual ICollection<Treatment_Detial> Treatment_Detial { get; set; }
        public virtual ICollection<Treatment> Treatments { get; set; }
    }
}
