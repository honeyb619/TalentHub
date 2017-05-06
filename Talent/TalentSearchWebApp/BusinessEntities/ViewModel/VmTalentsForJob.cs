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
    }
}
