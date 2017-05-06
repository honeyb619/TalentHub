﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataModel
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Objects;
    using System.Data.Objects.DataClasses;
    using System.Linq;
    
    public partial class TalentSearchEntities : DbContext
    {
        public TalentSearchEntities()
            : base("name=TalentSearchEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Category> Categories { get; set; }
        public DbSet<ContactU> ContactUs { get; set; }
        public DbSet<Job> Jobs { get; set; }
        public DbSet<JobTalentAssociation> JobTalentAssociations { get; set; }
        public DbSet<JobTalentCategory> JobTalentCategories { get; set; }
        public DbSet<JobTalentLanguage> JobTalentLanguages { get; set; }
        public DbSet<JobTalentSkill> JobTalentSkills { get; set; }
        public DbSet<MasterCategory> MasterCategories { get; set; }
        public DbSet<Medium> Media { get; set; }
        public DbSet<ProductionCompany> ProductionCompanies { get; set; }
        public DbSet<Region> Regions { get; set; }
        public DbSet<SubCategory> SubCategories { get; set; }
        public DbSet<Talent> Talents { get; set; }
        public DbSet<Token> Tokens { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<ErrorTracer> ErrorTracers { get; set; }
    
        public virtual ObjectResult<usp_GetPublicTalent_Result> usp_GetPublicTalent(string category, string subCategory)
        {
            var categoryParameter = category != null ?
                new ObjectParameter("Category", category) :
                new ObjectParameter("Category", typeof(string));
    
            var subCategoryParameter = subCategory != null ?
                new ObjectParameter("SubCategory", subCategory) :
                new ObjectParameter("SubCategory", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<usp_GetPublicTalent_Result>("usp_GetPublicTalent", categoryParameter, subCategoryParameter);
        }
    
        public virtual int Proc_InsertErrorDetails()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("Proc_InsertErrorDetails");
        }
    
        public virtual ObjectResult<usp_GetTalentsForJob_Result> usp_GetTalentsForJob(Nullable<long> jobId)
        {
            var jobIdParameter = jobId.HasValue ?
                new ObjectParameter("JobId", jobId) :
                new ObjectParameter("JobId", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<usp_GetTalentsForJob_Result>("usp_GetTalentsForJob", jobIdParameter);
        }
    }
}
