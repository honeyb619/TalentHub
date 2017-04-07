using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace BusinessEntities.ViewModel
{
    public class VmSkills
    {
        [DisplayFormat(NullDisplayText = " ")]
        public string SkillName { get; set; }
        public long? ParentId { get; set; }
        public long SkillId { get; set; }
        public string SkillValue { get; set; }
        [DisplayFormat(NullDisplayText = " ")]
        public string Description { get; set; }
    }
}
