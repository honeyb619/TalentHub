using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities.Model
{
    public class JobEntity
    {
        public long JobId { get; set; }
        public string JobName { get; set; }
        public long ProductionCompanyId { get; set; }
        public string Gender { get; set; }
        public long MinAge { get; set; }
        public long MaxAge { get; set; }
        public string Ethicity { get; set; }
        public string Pay { get; set; }
        public Nullable<long> NumberOfDays { get; set; }
        public long CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<long> modifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
    }
}
