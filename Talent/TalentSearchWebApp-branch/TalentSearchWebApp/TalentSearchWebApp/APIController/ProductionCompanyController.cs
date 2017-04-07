using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BusinessServices.Interfaces;
using BusinessServices.Services;
using BusinessEntities.Model;

namespace TalentSearchWebApp.APIController
{
    public class ProductionCompanyController : ApiController
    {
        private readonly IProductionCompanyServices _productionCompanyServices;

         #region Public Constructor

        /// <summary>
        /// Public constructor to initialize product service instance
        /// </summary>
        public ProductionCompanyController()
        {
            _productionCompanyServices = new ProductionCompanyServices();
        }

        #endregion

        // GET api/product
        public HttpResponseMessage Get()
        {
            var products = _productionCompanyServices.GetAllProducts();
            if (products != null)
            {
                var productEntities = products as List<ProductionCompanyEntitiy> ?? products.ToList();
                if (productEntities.Any())
                    return Request.CreateResponse(HttpStatusCode.OK, productEntities);
            }
            return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Products not found");
        }

        // GET api/product/5
        public HttpResponseMessage Get(int id)
        {
            var product = _productionCompanyServices.GetProductById(id);
            if (product != null)
                return Request.CreateResponse(HttpStatusCode.OK, product);
            return Request.CreateErrorResponse(HttpStatusCode.NotFound, "No product found for this id");
        }

        // POST api/product
        public long Post([FromBody] ProductionCompanyEntitiy productEntity)
        {
            return _productionCompanyServices.CreateProduct(productEntity);
        }

        // PUT api/product/5
        public bool Put(int id, [FromBody]ProductionCompanyEntitiy productEntity)
        {
            if (id  > 0)
            {
                return _productionCompanyServices.UpdateProduct(id, productEntity);
            }
            return false;
        }

        // DELETE api/product/5
        public bool Delete(int id, int deletedBy)
        {
            if (id > 0)
                return _productionCompanyServices.DeleteProduct(id, deletedBy);
            return false;
        }
    }
}
