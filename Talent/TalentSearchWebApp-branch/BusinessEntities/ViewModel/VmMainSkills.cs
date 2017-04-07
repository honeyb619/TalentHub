using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace BusinessEntities.ViewModel
{
    public class VmMainSkills
    {
        [DisplayFormat(NullDisplayText = " ")]
        public string MainSkil { get; set; }
        public long MainSkilId { get; set; }

        public List<VmSkills> Skills { get; set; }
    }
}
