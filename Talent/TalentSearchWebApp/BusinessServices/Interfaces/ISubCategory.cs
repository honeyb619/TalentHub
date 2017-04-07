using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessEntities.Model;

namespace BusinessServices.Interfaces
{
    public interface ISubCategory
    {
        SubCategoryEntity GetSubCategoryById(long subCategoryId);
        IEnumerable<SubCategoryEntity> GetAllSubCategories();
        IEnumerable<SubCategoryEntity> GetSubCategoriesWithWhere(string[] categoryNames, string[] masterCategoryNames);
        IEnumerable<BusinessEntities.Model.SubCategoryEntity> GetParentCategories(string[] categoryNames, string[] masterCategoryNames);
        long CreateSubCategory(SubCategoryEntity subCategoryEntity);
        bool UpdateSubCategory(long subCategoryId, SubCategoryEntity subCategoryEntity);
        bool DeleteSubCategory(long subCategoryId, long deletedBy);
        List<BusinessEntities.ViewModel.VmMainSkills> GetParentChildCategoriesWithWhere();
        List<BusinessEntities.ViewModel.VmMainSkills> GetParentChildAdminCategoriesWithWhere();
        IEnumerable<BusinessEntities.Model.SubCategoryEntity> GetSubCategoriesWithWhere1(string[] categoryNames, string[] masterCategoryNames);
        bool AddMainCategory(SubCategoryEntity entity);
        bool AddChildCategory(SubCategoryEntity entity);

    }
}
