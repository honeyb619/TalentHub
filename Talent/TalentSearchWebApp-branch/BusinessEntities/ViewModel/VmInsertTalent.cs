using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessEntities.Model;

namespace BusinessEntities.ViewModel
{
    public class VmInsertTalent
    {
        public VmInsertTalent()
        {
            this.RegionEntities = new List<RegionEntity>();
            this.SubCategoryEntities = new List<SubCategoryEntity>();
        }

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
        public string Ethnicity { get; set; }
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


        public List<int> LanguageIds { get; set; }
        public List<VmMedias> Medias { get; set; }
        public List<VmSkills> Skills { get; set; }
        public List<RegionEntity> RegionEntities { get; set; }
        public List<SubCategoryEntity> SubCategoryEntities { get; set; }
    }
}
