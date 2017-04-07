using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessServices.Interfaces;
using DataModel.UnitOfWork;
using BusinessEntities.Model;
using DataModel;
using AutoMapper;
using System.Transactions;

namespace BusinessServices.Services
{
    public class ProductionCompanyServices : IProductionCompanyServices
    {
        private readonly UnitOfWork _unitOfWork;

        /// <summary>
        /// Public constructor.
        /// </summary>
        public ProductionCompanyServices()
        {
            _unitOfWork = new UnitOfWork();
        }

        /// <summary>
        /// Fetches production company details by id
        /// </summary>
        /// <param name="productionCompanyId"></param>
        /// <returns></returns>
        public ProductionCompanyEntitiy GetProductById(long productionCompanyId)
        {
            var productionCompany = _unitOfWork.ProductionCompanyRepository.GetByID(productionCompanyId);
            if (productionCompany != null)
            {
                Mapper.CreateMap<ProductionCompany, ProductionCompanyEntitiy>();
                var productionCompanyModel = Mapper.Map<ProductionCompany, ProductionCompanyEntitiy>(productionCompany);
                return productionCompanyModel;
            }
            return null;
        }

        /// <summary>
        /// Fetches all the production companies.
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ProductionCompanyEntitiy> GetAllProducts()
        {
            var products = _unitOfWork.ProductionCompanyRepository.GetWithInclude(x => x.IsDeleted == false, "Region").ToList();
            if (products.Any())
            {
                Mapper.CreateMap<ProductionCompany, ProductionCompanyEntitiy>().ForMember(x => x.RegionName, opt => opt.MapFrom(src => src.Region.RegionName));
                var productionCompanyModel = Mapper.Map<List<ProductionCompany>, List<ProductionCompanyEntitiy>>(products);
                return productionCompanyModel;
            }
            return null;
        }

        /// <summary>
        /// Creates a production company
        /// </summary>
        /// <param name="productionCompanyEntitiy"></param>
        /// <returns></returns>
        public long CreateProduct(ProductionCompanyEntitiy productionCompanyEntitiy)
        {
            using (var scope = new TransactionScope())
            {
                var productionCompany = new ProductionCompany
                {
                    ProductionCompanyName = productionCompanyEntitiy.ProductionCompanyName,
                    ContactPerson = productionCompanyEntitiy.ContactPerson,
                    EmailId = productionCompanyEntitiy.EmailId,
                    PhoneNumber = productionCompanyEntitiy.PhoneNumber,
                    DescriptionNotes = productionCompanyEntitiy.DescriptionNotes,
                    CreatedBy = productionCompanyEntitiy.CreatedBy,
                    CreatedDate = DateTime.UtcNow,
                    IsDeleted = false
                };
                _unitOfWork.ProductionCompanyRepository.Insert(productionCompany);
                _unitOfWork.Save();
                scope.Complete();
                return productionCompany.ProductionCompanyId;
            }
        }

        /// <summary>
        /// Updates a production company
        /// </summary>
        /// <param name="productionCompanyId"></param>
        /// <param name="productionCompanyEntitiy"></param>
        /// <returns></returns>
        public bool UpdateProduct(long productionCompanyId, ProductionCompanyEntitiy productionCompanyEntitiy)
        {
            var success = false;
            if (productionCompanyEntitiy != null)
            {
                using (var scope = new TransactionScope())
                {
                    var productionCompany = _unitOfWork.ProductionCompanyRepository.GetByID(productionCompanyId);
                    if (productionCompany != null)
                    {
                        productionCompany.ProductionCompanyName = productionCompanyEntitiy.ProductionCompanyName;
                        productionCompany.ContactPerson = productionCompanyEntitiy.ContactPerson;
                        productionCompany.EmailId = productionCompanyEntitiy.EmailId;
                        productionCompany.PhoneNumber = productionCompanyEntitiy.PhoneNumber;
                        productionCompany.DescriptionNotes = productionCompanyEntitiy.DescriptionNotes;
                        productionCompany.modifiedBy = productionCompanyEntitiy.modifiedBy;
                        productionCompany.ModifiedDate = DateTime.UtcNow;
                        _unitOfWork.ProductionCompanyRepository.Update(productionCompany);
                        _unitOfWork.Save();
                        scope.Complete();
                        success = true;
                    }
                }
            }
            return success;
        }

        /// <summary>
        /// Deletes a particular production company
        /// </summary>
        /// <param name="productionCompanyId"></param>
        /// <returns></returns>
        public bool DeleteProduct(long productionCompanyId, long deletedBy)
        {
            var success = false;
            if (productionCompanyId > 0)
            {
                using (var scope = new TransactionScope())
                {
                    var productionCompany = _unitOfWork.ProductionCompanyRepository.GetByID(productionCompanyId);
                    if (productionCompany != null)
                    {
                        productionCompany.modifiedBy = deletedBy;
                        productionCompany.ModifiedDate = DateTime.UtcNow;
                        productionCompany.IsDeleted = true;
                        _unitOfWork.ProductionCompanyRepository.Update(productionCompany);
                        _unitOfWork.Save();
                        scope.Complete();
                        success = true;
                    }
                }
            }
            return success;
        }
    }
}
