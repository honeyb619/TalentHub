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
    
    public partial class MasterCategory
    {
        public MasterCategory()
        {
            this.Categories = new HashSet<Category>();
        }
    
        public string MasterCategoryName { get; set; }
        public string MasterCategoryDescription { get; set; }
    
        public virtual ICollection<Category> Categories { get; set; }
    }
}
