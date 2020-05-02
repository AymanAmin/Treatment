﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Objects;
    using System.Data.Objects.DataClasses;
    using System.Linq;
    
    public partial class ECMSEntities : DbContext
    {
        public ECMSEntities()
            : base("name=ECMSEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Assignment_Status> Assignment_Status { get; set; }
        public DbSet<Attachment> Attachments { get; set; }
        public DbSet<Employee> Employees { get; set; }
        public DbSet<Employee_Structure> Employee_Structure { get; set; }
        public DbSet<Group> Groups { get; set; }
        public DbSet<LanguageMaster> LanguageMasters { get; set; }
        public DbSet<Lanuage_Detials> Lanuage_Detials { get; set; }
        public DbSet<Log_File> Log_File { get; set; }
        public DbSet<M_Attendees> M_Attendees { get; set; }
        public DbSet<M_Board> M_Board { get; set; }
        public DbSet<M_Board_Classification> M_Board_Classification { get; set; }
        public DbSet<M_Board_Location> M_Board_Location { get; set; }
        public DbSet<M_Board_Member> M_Board_Member { get; set; }
        public DbSet<M_Board_Status> M_Board_Status { get; set; }
        public DbSet<M_Board_Type> M_Board_Type { get; set; }
        public DbSet<M_Meeting> M_Meeting { get; set; }
        public DbSet<M_Member_Type> M_Member_Type { get; set; }
        public DbSet<M_Recommendation> M_Recommendation { get; set; }
        public DbSet<M_Topic> M_Topic { get; set; }
        public DbSet<Notification_Employee> Notification_Employee { get; set; }
        public DbSet<Notification_Master> Notification_Master { get; set; }
        public DbSet<Notification_Show> Notification_Show { get; set; }
        public DbSet<Owner_Relationship> Owner_Relationship { get; set; }
        public DbSet<Permission> Permissions { get; set; }
        public DbSet<Permission_Group> Permission_Group { get; set; }
        public DbSet<Structure> Structures { get; set; }
        public DbSet<Treatment_Class> Treatment_Class { get; set; }
        public DbSet<Treatment_Confidentiality> Treatment_Confidentiality { get; set; }
        public DbSet<Treatment_Delivery> Treatment_Delivery { get; set; }
        public DbSet<Treatment_Detial> Treatment_Detial { get; set; }
        public DbSet<Treatment_Master> Treatment_Master { get; set; }
        public DbSet<Treatment_Priority> Treatment_Priority { get; set; }
        public DbSet<Treatment_Procedure> Treatment_Procedure { get; set; }
        public DbSet<Treatment_Status> Treatment_Status { get; set; }
        public DbSet<Treatment_Type> Treatment_Type { get; set; }
    
        public virtual int sp_alterdiagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_alterdiagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_creatediagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_creatediagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_dropdiagram(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_dropdiagram", diagramnameParameter, owner_idParameter);
        }
    
        public virtual int sp_helpdiagramdefinition(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_helpdiagramdefinition", diagramnameParameter, owner_idParameter);
        }
    
        public virtual int sp_helpdiagrams(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_helpdiagrams", diagramnameParameter, owner_idParameter);
        }
    
        public virtual int sp_renamediagram(string diagramname, Nullable<int> owner_id, string new_diagramname)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var new_diagramnameParameter = new_diagramname != null ?
                new ObjectParameter("new_diagramname", new_diagramname) :
                new ObjectParameter("new_diagramname", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_renamediagram", diagramnameParameter, owner_idParameter, new_diagramnameParameter);
        }
    
        public virtual int sp_upgraddiagrams()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_upgraddiagrams");
        }
    }
}
