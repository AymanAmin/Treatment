﻿

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
using System.Data.Entity;
using System.Data.Entity.Infrastructure;


public partial class ECMSEntities : DbContext
{
    public ECMSEntities()
        : base("name=ECMSEntities")
    {
<<<<<<< HEAD
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
=======

>>>>>>> 60375737d9c40c1bae275e24705374f6e58986df
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

    public DbSet<Log_File> Log_File { get; set; }

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

    public DbSet<LanguageMaster> LanguageMasters { get; set; }

    public DbSet<Lanuage_Detials> Lanuage_Detials { get; set; }

}

}

