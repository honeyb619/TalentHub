using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities.Model
{
    public class MediaEntity
    {
        public long MediaId { get; set; }
        public string MediaType { get; set; }
        public Nullable<long> TalentId { get; set; }
        public Nullable<long> JobId { get; set; }
        public string MimeType { get; set; }
        public Nullable<bool> IsProfilePic { get; set; }
        public string FilePath { get; set; }
        public long CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<long> modifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public string FileName { get; set; }
    }
}
