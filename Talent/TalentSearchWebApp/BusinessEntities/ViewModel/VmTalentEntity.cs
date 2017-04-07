using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace BusinessEntities.ViewModel
{
    public class VmTalentEntity
    {
        public long TalentId { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public string FirstName { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public string LastName { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public string EmailId { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public string AlternateEmailId { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public string Gender { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public long Age { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public string Hobbies { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public Nullable<long> Acsent { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public string Mobile { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public string Phone { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public string PostalAddress { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public long RegionId { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public string RegionName { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public string EmergencyName { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public string EmergencyNumber { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public Nullable<long> Height { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public string Nationality { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public string EyeColor { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public string Ethnicity { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public Nullable<long> Waist { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public string HairColor { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public Nullable<long> ChestSize { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public Nullable<long> HipSize { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public Nullable<bool> IsPublic { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public long CreatedBy { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public System.DateTime CreatedDate { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public Nullable<long> modifiedBy { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public Nullable<bool> IsDeleted { get; set; }

        public List<VmMainSkills> vmMainSkills { get; set; }
        public List<VmMedias> vmMedias { get; set; }
        public List<string> Languages { get; set; }
    }
}
