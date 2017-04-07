using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities.Model
{
    public class SubCategoryEntity
    {
        public long SubCategoryId { get; set; }
        public long CategoryId { get; set; }
        public string CategoryName { get; set; }
        public string SubCategoryName { get; set; }
        public string SubCategoryValue { get; set; }
        public string SubCategoryDescription { get; set; }
        public Nullable<long> ParentId { get; set; }
        public string ParentName { get; set; }
        public long CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<long> modifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
    }
}
