using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessEntities.Model;

namespace BusinessEntities.GridVm
{
    public class GridVmJobsList
    {
        public GridVmJobsList()
        {
            this.ListJobEntity = new List<JobEntity>();
        }

        public List<JobEntity> ListJobEntity { get; set; }
        public int PageSize { get; set; }
        public int TotalRecord { get; set; }
        public int NoOfPages { get; set; }
    }
}
