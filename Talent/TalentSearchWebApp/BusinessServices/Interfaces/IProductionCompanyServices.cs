using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessEntities.Model;
using BusinessEntities.GridVm;
using BusinessEntities.ViewModel;

namespace BusinessServices.Interfaces
{
    public interface IProductionCompanyServices
    {
        ProductionCompanyEntitiy GetProductById(long productionCompanyId);
        GridVmProductionCompanyList GetAllProducts(int page, string sort, string sortdir, ProductionCompanyEntitiy productEntity);
        long CreateProduct(ProductionCompanyEntitiy productEntity);
        bool UpdateProduct(ProductionCompanyEntitiy productEntity);
        bool DeleteProduct(long productionCompanyId);
        List<VmSelectListItem> GetProductionCompanyDropdown();
    }
}
