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
            var subCategory = _unitOfWork.SubCategoryRepository.GetByID(subCategoryId);
            if (subCategory.IsDeleted == false || subCategory.IsDeleted == null)
            {
                Mapper.CreateMap<SubCategory, SubCategoryEntity>().ForMember(d => d.CategoryName, o => o.MapFrom(s => s.Category.CategoryName));
                var subCategoriesModel = Mapper.Map<SubCategory, SubCategoryEntity>(subCategory);
                return subCategoriesModel;
            }
            return null;
        }

        public IEnumerable<BusinessEntities.Model.SubCategoryEntity> GetAllSubCategories()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<BusinessEntities.Model.SubCategoryEntity> GetSubCategoriesWithWhere(string[] categoryNames, string[] masterCategoryNames)
        {
            var subCategories = _unitOfWork.SubCategoryRepository.GetWithInclude(x => masterCategoryNames.Contains(x.Category.MasterCategoryName)
                  && categoryNames.Contains(x.Category.CategoryName) && x.IsDeleted == false, "Category").OrderBy(x => x.SubCategoryValue).ToList();

            if (subCategories.Any())
            {
                Mapper.CreateMap<SubCategory, SubCategoryEntity>().ForMember(d => d.CategoryName, o => o.MapFrom(s => s.Category.CategoryName));
                var subCategoriesModel = Mapper.Map<List<SubCategory>, List<SubCategoryEntity>>(subCategories).OrderBy(x => x.SubCategoryName).ToList();
                return subCategoriesModel;
            }
            return null;
        }

        public IEnumerable<BusinessEntities.Model.SubCategoryEntity> GetParentCategories(string[] categoryNames, string[] masterCategoryNames)
        {
            var subCategories = _unitOfWork.SubCategoryRepository.GetWithInclude(x => masterCategoryNames.Contains(x.Category.MasterCategoryName)
                && categoryNames.Contains(x.Category.CategoryName) && x.IsDeleted == false && x.ParentId == null, "Category").OrderBy(x => x.SubCategoryValue).ToList();

            if (subCategories.Any())
            {
                Mapper.CreateMap<SubCategory, SubCategoryEntity>().ForMember(d => d.CategoryName, o => o.MapFrom(s => s.Category.CategoryName));
                var subCategoriesModel = Mapper.Map<List<SubCategory>, List<SubCategoryEntity>>(subCategories).OrderBy(x => x.SubCategoryName).ToList();
                return subCategoriesModel;
            }
            return null;
        }


        public IEnumerable<BusinessEntities.Model.SubCategoryEntity> GetParentChildSubCategoriesWithWhere(string[] categoryNames, string[] masterCategoryNames)
        {
            var subCategories = _unitOfWork.SubCategoryRepository.GetManyQueryable(x => x.IsDeleted == false).OrderBy(x => x.SubCategoryName).ToList();

            var result = _unitOfWork.SubCategoryRepository.GetManyQueryable(x => masterCategoryNames.Contains(x.Category.MasterCategoryName)
                && categoryNames.Contains(x.Category.CategoryName) && x.IsDeleted == false).Join(_unitOfWork.SubCategoryRepository.GetManyQueryable(x => x.IsDeleted == false || x.IsDeleted == null), par => par.SubCategoryId,
                child => child.ParentId,
                (par, child) => new SubCategoryEntity
                {
                    ParentName = par.SubCategoryName,
                    SubCategoryName = child.SubCategoryName,
                    SubCategoryValue = child.SubCategoryValue,
                    SubCategoryDescription = child.SubCategoryDescription,
                    SubCategoryId = child.SubCategoryId
                }).ToList();
            var masteresult = _unitOfWork.SubCategoryRepository.GetManyQueryable(x => masterCategoryNames.Contains(x.Category.MasterCategoryName)
                && categoryNames.Contains(x.Category.CategoryName) && x.IsDeleted == false && x.ParentId == null).Select(x => new SubCategoryEntity
                {
                    ParentName = x.SubCategoryName,
                    SubCategoryName = x.SubCategoryName,
                    SubCategoryValue = x.SubCategoryValue,
                    SubCategoryDescription = x.SubCategoryDescription,
                    SubCategoryId = x.SubCategoryId
                }).ToList();
            result.AddRange(masteresult);

            if (result.Any())
            {
                return result;
            }
            return null;
        }

        public long CreateSubCategory(BusinessEntities.Model.SubCategoryEntity subCategoryEntity)
        {
            throw new NotImplementedException();
        }

        public bool UpdateSubCategory(long subCategoryId, BusinessEntities.Model.SubCategoryEntity subCategoryEntity)
        {
            try
            {
                var Category = _unitOfWork.SubCategoryRepository.GetByID(subCategoryId);
                Category.SubCategoryName = subCategoryEntity.SubCategoryName;
                Category.SubCategoryValue = subCategoryEntity.SubCategoryValue;
                Category.SubCategoryDescription = subCategoryEntity.SubCategoryDescription;
                Category.ModifiedDate = DateTime.Now;
                _unitOfWork.SubCategoryRepository.Update(Category);
                _unitOfWork.Save();
                return true;
            }
            catch
            {
                return false;
            }

        }

        public bool DeleteSubCategory(long subCategoryId, long deletedBy)
        {
            try
            {
                var ParentSubCategory = _unitOfWork.SubCategoryRepository.GetByID(subCategoryId);
                if (ParentSubCategory.ParentId != null)
                {
                    DeleteSkills(ParentSubCategory);
                    ParentSubCategory.IsDeleted = true;
                    _unitOfWork.SubCategoryRepository.Update(ParentSubCategory);
                    _unitOfWork.Save();
                }
                else
                {
                    var ChildCategories = _unitOfWork.SubCategoryRepository.GetMany(x => x.ParentId == ParentSubCategory.SubCategoryId);
                    foreach (var category in ChildCategories)
                    {
                        DeleteSkills(category);
                        category.IsDeleted = true;
                        _unitOfWork.SubCategoryRepository.Update(category);
                    }
                    ParentSubCategory.IsDeleted = true;
                    _unitOfWork.SubCategoryRepository.Update(ParentSubCategory);
                    _unitOfWork.Save();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        private void DeleteSkills(SubCategory category)
        {
            var ChildSkills = _unitOfWork.JobTalentSkillRepository.GetMany(x => x.SkillId == category.SubCategoryId);
            foreach (var skill in ChildSkills)
            {
                skill.IsDeleted = true;
                _unitOfWork.JobTalentSkillRepository.Update(skill);
            }
        }


        public List<BusinessEntities.ViewModel.VmMainSkills> GetParentChildCategoriesWithWhere()
        {
            var subCategories = _unitOfWork.SubCategoryRepository.GetManyQueryable(x => x.Category.MasterCategoryName == "CATEGORY"
                && x.Category.CategoryName == "Category" && x.Category.CategoryName == "Category" && x.IsDeleted == false)
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
            var subCategories = _unitOfWork.SubCategoryRepository.GetManyQueryable(x => x.Category.MasterCategoryName == "CATEGORY" && x.Category.CategoryName == "Category" && x.IsDeleted == false)
                .ToList();
            subCategories.AddRange(_unitOfWork.SubCategoryRepository.GetManyQueryable(x => x.Category.MasterCategoryName == "ADMIN" && x.Category.CategoryName == "Admin" && x.IsDeleted == false));
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

        public bool AddMainCategory(SubCategoryEntity entity)
        {
            try
            {
                Mapper.CreateMap<SubCategoryEntity, SubCategory>();
                var subCategoriesModel = Mapper.Map<SubCategoryEntity, SubCategory>(entity);
                var mainCategory = _unitOfWork.CategoryRepository.GetMany(x => x.CategoryName == "CATEGORY").First();
                subCategoriesModel.CategoryId = mainCategory.CategoryId;
                subCategoriesModel.ParentId = null;
                subCategoriesModel.CreatedBy = 1;
                subCategoriesModel.CreatedDate = DateTime.Now;
                subCategoriesModel.ModifiedDate = DateTime.Now;
                subCategoriesModel.modifiedBy = 1;
                subCategoriesModel.IsDeleted = false;
                _unitOfWork.SubCategoryRepository.Insert(subCategoriesModel);
                _unitOfWork.Save();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool AddChildCategory(SubCategoryEntity entity)
        {
            try
            {
                Mapper.CreateMap<SubCategoryEntity, SubCategory>();
                var subCategoriesModel = Mapper.Map<SubCategoryEntity, SubCategory>(entity);
                var mainCategory = _unitOfWork.CategoryRepository.GetMany(x => x.CategoryName == "CATEGORY").First();
                subCategoriesModel.CategoryId = mainCategory.CategoryId;
                subCategoriesModel.CreatedBy = 1;
                subCategoriesModel.CreatedDate = DateTime.Now;
                subCategoriesModel.ModifiedDate = DateTime.Now;
                subCategoriesModel.modifiedBy = 1;
                subCategoriesModel.IsDeleted = false;
                _unitOfWork.SubCategoryRepository.Insert(subCategoriesModel);
                _unitOfWork.Save();
                return true;
            }
            catch
            {
                return false;
            }

        }

        public List<CategoryEntity> getMasterCategories(string CategoryName)
        {
            Mapper.CreateMap<Category, CategoryEntity>();
            var masterCategories = _unitOfWork.CategoryRepository.GetManyQueryable(x => x.MasterCategoryName.ToLower().Contains(CategoryName.ToLower())).ToList();
            return Mapper.Map<List<Category>, List<CategoryEntity>>(masterCategories).ToList();
        }


        public bool AddIndependentCategory(SubCategoryEntity entity)
        {
            try
            {
                Mapper.CreateMap<SubCategoryEntity, SubCategory>();
                var subCategoriesModel = Mapper.Map<SubCategoryEntity, SubCategory>(entity);
                subCategoriesModel.CreatedBy = 1;
                subCategoriesModel.CreatedDate = DateTime.Now;
                subCategoriesModel.ModifiedDate = DateTime.Now;
                subCategoriesModel.modifiedBy = 1;
                subCategoriesModel.IsDeleted = false;
                _unitOfWork.SubCategoryRepository.Insert(subCategoriesModel);
                _unitOfWork.Save();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
