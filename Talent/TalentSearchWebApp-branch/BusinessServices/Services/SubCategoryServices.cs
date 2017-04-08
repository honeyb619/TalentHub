using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessServices.Interfaces;
using BusinessEntities.Model;
using AutoMapper;
using DataModel.UnitOfWork;
using DataModel;
using BusinessEntities.ViewModel;

namespace BusinessServices.Services
{
    public class SubCategoryServices : ISubCategory
    {
        private readonly UnitOfWork _unitOfWork;

        /// <summary>
        /// Public constructor.
        /// </summary>
        public SubCategoryServices()
        {
            _unitOfWork = new UnitOfWork();
        }

        public BusinessEntities.Model.SubCategoryEntity GetSubCategoryById(long subCategoryId)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<BusinessEntities.Model.SubCategoryEntity> GetAllSubCategories()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<BusinessEntities.Model.SubCategoryEntity> GetSubCategoriesWithWhere(string[] categoryNames, string[] masterCategoryNames)
        {
            var subCategories = _unitOfWork.SubCategoryRepository.GetWithInclude(x => masterCategoryNames.Contains(x.Category.MasterCategoryName)
                && categoryNames.Contains(x.Category.CategoryName), "Category").OrderBy(x => x.SubCategoryValue).ToList();

            if (subCategories.Any())
            {
                Mapper.CreateMap<SubCategory, SubCategoryEntity>().ForMember(d => d.CategoryName, o => o.MapFrom(s => s.Category.CategoryName));
                var subCategoriesModel = Mapper.Map<List<SubCategory>, List<SubCategoryEntity>>(subCategories);
                return subCategoriesModel;
            }
            return null;
        }

        public long CreateSubCategory(BusinessEntities.Model.SubCategoryEntity subCategoryEntity)
        {
            throw new NotImplementedException();
        }

        public bool UpdateSubCategory(long subCategoryId, BusinessEntities.Model.SubCategoryEntity subCategoryEntity)
        {
            throw new NotImplementedException();
        }

        public bool DeleteSubCategory(long subCategoryId, long deletedBy)
        {
            throw new NotImplementedException();
        }


        public List<BusinessEntities.ViewModel.VmMainSkills> GetParentChildCategoriesWithWhere()
        {
            var subCategories = _unitOfWork.SubCategoryRepository.GetManyQueryable(x => x.Category.MasterCategoryName == "CATEGORY"
                && x.Category.CategoryName == "Category" && x.Category.CategoryName == "Category")
                .ToList();

            List<BusinessEntities.ViewModel.VmMainSkills> objListVmMainSkills = new List<VmMainSkills>();

            foreach (var a in subCategories.Where(x => x.ParentId == null))
            {
                VmMainSkills objVmMainSkills = new VmMainSkills();
                objVmMainSkills.MainSkilId = a.SubCategoryId;
                objVmMainSkills.MainSkil = a.SubCategoryValue;
                objVmMainSkills.Skills = new List<VmSkills>();

                foreach (var b in subCategories.Where(x => x.ParentId == a.SubCategoryId))
                {
                    VmSkills objVmSkills = new VmSkills();
                    objVmSkills.ParentId = a.SubCategoryId;
                    objVmSkills.SkillId = b.SubCategoryId;
                    objVmSkills.SkillName = b.SubCategoryValue;

                    objVmMainSkills.Skills.Add(objVmSkills);
                }

                objListVmMainSkills.Add(objVmMainSkills);
            }

            return objListVmMainSkills;
        }

        public List<BusinessEntities.ViewModel.VmMainSkills> GetParentChildAdminCategoriesWithWhere()
        {
            var subCategories = _unitOfWork.SubCategoryRepository.GetManyQueryable(x => x.Category.MasterCategoryName == "CATEGORY" && x.Category.CategoryName == "Category")
                .ToList();
            subCategories.AddRange(_unitOfWork.SubCategoryRepository.GetManyQueryable(x => x.Category.MasterCategoryName == "ADMIN" && x.Category.CategoryName == "Admin"));
            List<BusinessEntities.ViewModel.VmMainSkills> objListVmMainSkills = new List<VmMainSkills>();

            foreach (var a in subCategories.Where(x => x.ParentId == null))
            {
                VmMainSkills objVmMainSkills = new VmMainSkills();
                objVmMainSkills.MainSkilId = a.SubCategoryId;
                objVmMainSkills.MainSkil = a.SubCategoryValue;
                objVmMainSkills.Skills = new List<VmSkills>();

                foreach (var b in subCategories.Where(x => x.ParentId == a.SubCategoryId))
                {
                    VmSkills objVmSkills = new VmSkills();
                    objVmSkills.ParentId = a.SubCategoryId;
                    objVmSkills.SkillId = b.SubCategoryId;
                    objVmSkills.SkillName = b.SubCategoryName;
                    objVmSkills.SkillValue = b.SubCategoryValue;
                    objVmMainSkills.Skills.Add(objVmSkills);
                }

                objListVmMainSkills.Add(objVmMainSkills);
            }

            return objListVmMainSkills;
        }

    }
}
