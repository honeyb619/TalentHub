using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities.Model
{
    public class TalentEntity
    {
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
    }
}
