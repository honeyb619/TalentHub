using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessEntities.Model;

namespace BusinessEntities.GridVm
{
    public class GridVmProductionCompanyList
    {
        public GridVmProductionCompanyList()
        {
            this.ListProductionCompanyEntitiy = new List<ProductionCompanyEntitiy>();
        }

        public List<ProductionCompanyEntitiy> ListProductionCompanyEntitiy { get; set; }
        public int PageSize { get; set; }
        public int TotalRecord { get; set; }
        public int NoOfPages { get; set; }
    }
}
