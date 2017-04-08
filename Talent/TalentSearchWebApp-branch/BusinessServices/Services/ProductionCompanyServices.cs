using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using BusinessServices.Interfaces;
using DataModel.UnitOfWork;
using BusinessEntities.Model;
using DataModel;
using AutoMapper;
using System.Transactions;
using System.Data.SqlClient;
using System.Linq.Dynamic;
using BusinessEntities.GridVm;

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
        public GridVmProductionCompanyList GetAllProducts(int page, string sort, string sortdir, ProductionCompanyEntitiy productEntity)
        {
            GridVmProductionCompanyList objProductionCompanyList = new GridVmProductionCompanyList();
            objProductionCompanyList.PageSize = 3;
            string strWhere = "IsDeleted = false";
            string strSort = string.Empty;

            if (productEntity!= null)
            {
                if (!string.IsNullOrEmpty(strWhere) && !string.IsNullOrEmpty(productEntity.ProductionCompanyName))
                {
                    strWhere += " And ";
                    strWhere += "ProductionCompanyName = \"" + productEntity.ProductionCompanyName + "\"";
                }
            }

            if (sort == "RegionName")
            {
                strSort = "Region.RegionName " + sortdir;
            }
            else {
                strSort = sort + " " + sortdir;
            }

                var products = _unitOfWork.ProductionCompanyRepository.GetManyQueryable(null)
                    .Where(strWhere)
                    .OrderBy(strSort)
                    .Skip((page - 1) * objProductionCompanyList.PageSize).Take(objProductionCompanyList.PageSize)
                    .ToList();

                objProductionCompanyList.TotalRecord = _unitOfWork.ProductionCompanyRepository.DynamicQuery().Where(strWhere).Count();
                objProductionCompanyList.NoOfPages = (objProductionCompanyList.TotalRecord / objProductionCompanyList.PageSize)
                                                        + ((objProductionCompanyList.TotalRecord % objProductionCompanyList.PageSize) > 0 ? 1 : 0);

            if (products.Any())
            {
                Mapper.CreateMap<ProductionCompany, ProductionCompanyEntitiy>().ForMember(x => x.RegionName, opt => opt.MapFrom(src => src.Region.RegionName));
                objProductionCompanyList.ListProductionCompanyEntitiy = Mapper.Map<List<ProductionCompany>, List<ProductionCompanyEntitiy>>(products);
            }

            return objProductionCompanyList;
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
                    RegionId = productionCompanyEntitiy.RegionId,
                    CreatedBy = ((UserEntity)HttpContext.Current.Session["UserInfo"]).UserId,
                    CreatedDate = DateTime.UtcNow,
                    ModifiedDate = DateTime.UtcNow,
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
        /// <param name="productionCompanyEntitiy"></param>
        /// <returns></returns>
        public bool UpdateProduct(ProductionCompanyEntitiy productionCompanyEntitiy)
        {
            var success = false;
            if (productionCompanyEntitiy != null)
            {
                using (var scope = new TransactionScope())
                {
                    var productionCompany = _unitOfWork.ProductionCompanyRepository.GetByID(productionCompanyEntitiy.ProductionCompanyId);
                    if (productionCompany != null)
                    {
                        productionCompany.ProductionCompanyName = productionCompanyEntitiy.ProductionCompanyName;
                        productionCompany.ContactPerson = productionCompanyEntitiy.ContactPerson;
                        productionCompany.EmailId = productionCompanyEntitiy.EmailId;
                        productionCompany.PhoneNumber = productionCompanyEntitiy.PhoneNumber;
                        productionCompany.DescriptionNotes = productionCompanyEntitiy.DescriptionNotes;
                        productionCompany.RegionId = productionCompanyEntitiy.RegionId;
                        productionCompany.modifiedBy = ((UserEntity)HttpContext.Current.Session["UserInfo"]).UserId;
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
        public bool DeleteProduct(long productionCompanyId)
        {
            var success = false;
            if (productionCompanyId > 0)
            {
                var productionCompanyIdToDelete = new SqlParameter("@ProductionCompanyId", productionCompanyId);
                var userId = new SqlParameter("@UserId", ((UserEntity)HttpContext.Current.Session["UserInfo"]).UserId);

                var IsDeleted = _unitOfWork.DeleteUsingProc.GetWithRawSql("exec usp_DeleteProductionCompany @ProductionCompanyId, @UserId", productionCompanyIdToDelete, userId).FirstOrDefault();
                if (IsDeleted == "Success")
                {
                    success = true;
                }
            }

            return success;
        }
    }
}