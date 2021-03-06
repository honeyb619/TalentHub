//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Talent
    {
        public Talent()
        {
            this.JobTalentCategories = new HashSet<JobTalentCategory>();
            this.JobTalentLanguages = new HashSet<JobTalentLanguage>();
            this.JobTalentSkills = new HashSet<JobTalentSkill>();
            this.JobTalentStatus = new HashSet<JobTalentStatu>();
            this.Media = new HashSet<Medium>();
        }
    
        public long TalentId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailId { get; set; }
        public string AlternateEmailId { get; set; }
        public string Gender { get; set; }
        public long Age { get; set; }
        public string Hobbies { get; set; }
        public Nullable<long> Acsent { get; set; }
        public string Mobile { get; set; }
        public string Phone { get; set; }
        public string PostalAddress { get; set; }
        public long RegionId { get; set; }
        public string EmergencyName { get; set; }
        public string EmergencyNumber { get; set; }
        public Nullable<long> Height { get; set; }
        public string Nationality { get; set; }
        public string EyeColor { get; set; }
        public string Ethicity { get; set; }
        public Nullable<long> Waist { get; set; }
        public string HairColor { get; set; }
        public Nullable<long> ChestSize { get; set; }
        public Nullable<long> HipSize { get; set; }
        public Nullable<bool> IsPublic { get; set; }
        public long CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<long> modifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
    
        public virtual ICollection<JobTalentCategory> JobTalentCategories { get; set; }
        public virtual ICollection<JobTalentLanguage> JobTalentLanguages { get; set; }
        public virtual ICollection<JobTalentSkill> JobTalentSkills { get; set; }
        public virtual ICollection<JobTalentStatu> JobTalentStatus { get; set; }
        public virtual ICollection<Medium> Media { get; set; }
        public virtual Region Region { get; set; }
        public virtual SubCategory SubCategory { get; set; }
    }
}
