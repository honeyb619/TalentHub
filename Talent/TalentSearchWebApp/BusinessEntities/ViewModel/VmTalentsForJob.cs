using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities.ViewModel
{
    public class VmTalentsForJob
    {
        public long TalentId { get; set; }
        public string Name { get; set; }
        public string EmailId { get; set; }
        public long StatusId { get; set; }
        public string StatusText { get; set; }
        public string IsAssigned { get; set; }
        public string RegionName { get; set; }
        public string Ethnicity { get; set; }
        public string HairColor { get; set; }
        public string EyeColor { get; set; }
        public long Age { get; set; }
        public long Waist { get; set; }
        public long HipSize { get; set; }
        public long ChestSize { get; set; }
        public string Role { get; set; }
    }
}
