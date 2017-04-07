using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities.Model
{
    public class CategoryEntity
    {
        public long CategoryId { get; set; }
        public string MasterCategoryName { get; set; }
        public string CategoryName { get; set; }
        public string CategoryValue { get; set; }
        public string CategoryDescription { get; set; }
    }
}
