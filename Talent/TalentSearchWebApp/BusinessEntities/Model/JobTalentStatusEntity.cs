using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities.Model
{
    public class JobTalentStatusEntity
    {
        public long JobTalentStatusId { get; set; }
        public Nullable<long> JobId { get; set; }
        public Nullable<long> TalentId { get; set; }
        public Nullable<long> StatusId { get; set; }
        public Nullable<long> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<long> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
    }
}
