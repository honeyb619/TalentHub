using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessEntities.Model;

namespace BusinessEntities.ViewModel
{
    public class VmInsertJob
    {
        public VmInsertJob()
        {
            this.RegionEntities = new List<RegionEntity>();
            this.SubCategoryEntities = new List<SubCategoryEntity>();
            this.Skills = new List<VmSkills>();
        }

        public long JobId { get; set; }
        public string JobName { get; set; }
        public long ProductionCompanyId { get; set; }
        public Nullable<long> StatusId { get; set; }
        public Nullable<long> RegionId { get; set; }
        public string JobDescription { get; set; }
        public string Gender { get; set; }
        public long MinAge { get; set; }
        public long MaxAge { get; set; }
        public string EyeColor { get; set; }
        public Nullable<long> Height { get; set; }
        public Nullable<long> Waist { get; set; }
        public string HairColor { get; set; }
        public Nullable<long> ChestSize { get; set; }
        public Nullable<long> HipSize { get; set; }
        public string Ethicity { get; set; }
        public string Pay { get; set; }
        public Nullable<long> NumberOfDays { get; set; }
        public long CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<long> modifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public string Email { get; set; }
        public List<VmSelectListItem> ProductionCompanyList { get; set; }
        public List<int> LanguageIds { get; set; }
        public List<long> SkillIds { get; set; }
        public List<VmSkills> Skills { get; set; }
        public List<RegionEntity> RegionEntities { get; set; }
        public List<SubCategoryEntity> SubCategoryEntities { get; set; }
        public string Role { get; set; }
    }
}
