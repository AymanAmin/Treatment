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
    
    public partial class Structure
    {
        public Structure()
        {
            this.Employee_Structure = new HashSet<Employee_Structure>();
            this.Treatment_Master = new HashSet<Treatment_Master>();
            this.M_Topic = new HashSet<M_Topic>();
        }
    
        public int Structure_Id { get; set; }
        public string Structure_Name_Ar { get; set; }
        public Nullable<int> Structure_Parent { get; set; }
        public string Structure_Name_En { get; set; }
        public Nullable<bool> Is_Job_Title { get; set; }
        public Nullable<bool> Is_Manager { get; set; }
    
        public virtual ICollection<Employee_Structure> Employee_Structure { get; set; }
        public virtual ICollection<Treatment_Master> Treatment_Master { get; set; }
        public virtual ICollection<M_Topic> M_Topic { get; set; }
    }
}
