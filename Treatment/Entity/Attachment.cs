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
    
    public partial class Attachment
    {
        public int Attachment_id { get; set; }
        public Nullable<int> Treatment_Id { get; set; }
        public string Attachment_Path { get; set; }
    
        public virtual Treatment Treatment { get; set; }
    }
}
