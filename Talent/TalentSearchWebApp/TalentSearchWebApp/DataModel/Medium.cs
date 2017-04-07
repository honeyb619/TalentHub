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
    
    public partial class Medium
    {
        public long MediaId { get; set; }
        public string MediaType { get; set; }
        public Nullable<long> TalentId { get; set; }
        public Nullable<long> JobId { get; set; }
        public string MimeType { get; set; }
        public Nullable<bool> IsProfilePic { get; set; }
        public string FilePath { get; set; }
        public long CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<long> modifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
    
        public virtual Job Job { get; set; }
        public virtual Talent Talent { get; set; }
    }
}
