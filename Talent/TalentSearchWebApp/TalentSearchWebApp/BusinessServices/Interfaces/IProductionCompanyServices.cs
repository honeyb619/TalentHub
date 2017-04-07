using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessEntities.Model;

namespace BusinessServices.Interfaces
{
    public interface IProductionCompanyServices
    {
        ProductionCompanyEntitiy GetProductById(long productionCompanyId);
        IEnumerable<ProductionCompanyEntitiy> GetAllProducts();
        long CreateProduct(ProductionCompanyEntitiy productEntity);
        bool UpdateProduct(long productionCompanyId, ProductionCompanyEntitiy productEntity);
        bool DeleteProduct(long productionCompanyId, long deletedBy);
    }
}
