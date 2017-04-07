using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities.Model
{
    public class JobTalentCategoryEntity
    {
        public long JobTalentCategoryId { get; set; }
        public long CategoryId { get; set; }
        public Nullable<long> JobId { get; set; }
        public Nullable<long> TalentId { get; set; }
        public long CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<long> modifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
    }
}
