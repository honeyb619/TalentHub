using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessEntities.Model;

namespace BusinessServices.Interfaces
{
    public interface IRegion
    {
        RegionEntity GetRegionById(long regionId);
        IEnumerable<RegionEntity> GetAllRegions();
        long CreateRegion(RegionEntity regionEntity);
        bool UpdateRegion(long regionId, RegionEntity regionEntity);
        bool DeleteRegion(long regionId);
    }
}
