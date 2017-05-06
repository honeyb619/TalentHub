using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities.ViewModel
{
    public class VmSaveJobTalentAssociation
    {
        public VmSaveJobTalentAssociation()
        {
            this.TalentStatusIds = new List<VmStatusTalentAssociation>();
        }

        public long JobId { get; set; }
        public List<VmStatusTalentAssociation> TalentStatusIds { get; set; }
    }
}
