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
    
    public partial class Region
    {
        public Region()
        {
            this.ProductionCompanies = new HashSet<ProductionCompany>();
            this.Talents = new HashSet<Talent>();
        }
    
        public long RegionId { get; set; }
        public string RegionName { get; set; }
        public string RegionCode { get; set; }
    
        public virtual ICollection<ProductionCompany> ProductionCompanies { get; set; }
        public virtual ICollection<Talent> Talents { get; set; }
    }
}
