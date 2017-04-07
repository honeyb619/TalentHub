using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities.ViewModel
{
    public class VmMedias
    {
        public long MediaId { get; set; }
        public long? TalentId { get; set; }
        public string MediaPath { get; set; }
        public string MediaType { get; set; }
        public bool? isProfilePic { get; set; }
        public string MediaName { get; set; }
        public string MimeType { get; set; }
    }
}
