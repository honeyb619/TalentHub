using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessServices.Interfaces;
using DataModel.UnitOfWork;
using AutoMapper;
using BusinessEntities.Model;
using DataModel;

namespace BusinessServices.Services
{
    public class RegionServices : IRegion
    {
        private readonly UnitOfWork _unitOfWork;

        /// <summary>
        /// Public constructor.
        /// </summary>
        public RegionServices()
        {
            _unitOfWork = new UnitOfWork();
        }

        public BusinessEntities.Model.RegionEntity GetRegionById(long regionId)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<BusinessEntities.Model.RegionEntity> GetAllRegions()
        {
            var regions = _unitOfWork.RegionRepository.GetAll(x=>x.OrderBy(j=>j.RegionName)).ToList();
            if (regions.Any())
            {
                Mapper.CreateMap<Region, RegionEntity>();
                var regionsModel = Mapper.Map<List<Region>, List<RegionEntity>>(regions);
                return regionsModel;
            }
            return null;
        }

        public long CreateRegion(BusinessEntities.Model.RegionEntity regionEntity)
        {
            throw new NotImplementedException();
        }

        public bool UpdateRegion(long regionId, BusinessEntities.Model.RegionEntity regionEntity)
        {
            throw new NotImplementedException();
        }

        public bool DeleteRegion(long regionId)
        {
            throw new NotImplementedException();
        }
    }
}
