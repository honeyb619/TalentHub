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
        public string ProductionCompanyName { get; set; }
        public string RegionName { get; set; }
        public string Gender { get; set; }
        public long MinAge { get; set; }
        public long MaxAge { get; set; }
        public string Ethicity { get; set; }
        public string Pay { get; set; }
        public string JobStatus { get; set; }
        public Nullable<long> NumberOfDays { get; set; }
        public long CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<long> modifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public string EyeColor { get; set; }
        public Nullable<long> Height { get; set; }
        public Nullable<long> Waist { get; set; }
        public string HairColor { get; set; }
        public Nullable<long> ChestSize { get; set; }
        public Nullable<long> HipSize { get; set; }
        public string Email { get; set; }
        public string Role { get; set; }
    }
}