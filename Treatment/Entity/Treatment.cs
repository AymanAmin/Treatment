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
    
    public partial class Treatment
    {
        public Treatment()
        {
            this.Attachments = new HashSet<Attachment>();
            this.Owner_Relationship = new HashSet<Owner_Relationship>();
            this.Treatment_Detial = new HashSet<Treatment_Detial>();
        }
    
        public int Treatment_Id { get; set; }
        public string Treatment_Subject { get; set; }
        public Nullable<System.DateTime> Create_Date { get; set; }
        public Nullable<System.DateTime> Update_Date { get; set; }
        public string Treatment_Body { get; set; }
        public Nullable<bool> Required_Reply { get; set; }
        public Nullable<int> From_Employee_Structure_Id { get; set; }
        public Nullable<int> Treatment_Type_Id { get; set; }
        public Nullable<int> Treatment_Class_Id { get; set; }
        public Nullable<int> Treatment_Priority_id { get; set; }
        public Nullable<int> Treatment_Confidentiality_Id { get; set; }
        public Nullable<int> Treatment_Delivery_Id { get; set; }
        public Nullable<int> Treatment_Status_Id { get; set; }
        public Nullable<int> Treatment_Procedure_Id { get; set; }
        public Nullable<int> Prepared_Administration_Id { get; set; }
    
        public virtual ICollection<Attachment> Attachments { get; set; }
        public virtual Employee_Structure Employee_Structure { get; set; }
        public virtual ICollection<Owner_Relationship> Owner_Relationship { get; set; }
        public virtual Prepared_Administration Prepared_Administration { get; set; }
        public virtual ICollection<Treatment_Detial> Treatment_Detial { get; set; }
        public virtual Treatment_Class Treatment_Class { get; set; }
        public virtual Treatment_Confidentiality Treatment_Confidentiality { get; set; }
        public virtual Treatment_Delivery Treatment_Delivery { get; set; }
        public virtual Treatment_Priority Treatment_Priority { get; set; }
        public virtual Treatment_Procedure Treatment_Procedure { get; set; }
        public virtual Treatment_Status Treatment_Status { get; set; }
        public virtual Treatment_Type Treatment_Type { get; set; }
    }
}
