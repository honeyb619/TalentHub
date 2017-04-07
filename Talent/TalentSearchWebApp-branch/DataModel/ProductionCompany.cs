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
    
    public partial class ProductionCompany
    {
        public ProductionCompany()
        {
            this.Jobs = new HashSet<Job>();
        }
    
        public long ProductionCompanyId { get; set; }
        public string ProductionCompanyName { get; set; }
        public Nullable<long> RegionId { get; set; }
        public string ContactPerson { get; set; }
        public string PhoneNumber { get; set; }
        public string EmailId { get; set; }
        public string DescriptionNotes { get; set; }
        public long CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<long> modifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
    
        public virtual ICollection<Job> Jobs { get; set; }
        public virtual Region Region { get; set; }
    }
}
