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
    
    public partial class Treatment_Confidentiality
    {
        public Treatment_Confidentiality()
        {
            this.Treatments = new HashSet<Treatment>();
        }
    
        public int Treatment_Confidentiality_Id { get; set; }
        public string Treatment_Confidentiality_Name { get; set; }
    
        public virtual ICollection<Treatment> Treatments { get; set; }
    }
}