using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities.ViewModel
{
    public class VmStatusTalentAssociation
    {
        public long TalentId { get; set; }
        public long StatusId { get; set; }
        public string Role { get; set; }
    }
}
