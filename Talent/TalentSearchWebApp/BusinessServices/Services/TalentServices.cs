using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessServices.Interfaces;
using AutoMapper;
using DataModel.UnitOfWork;
using DataModel;
using BusinessEntities.Model;
using BusinessEntities.ViewModel;
using System.Transactions;
using System.Data.SqlClient;
using System.Web;

namespace BusinessServices.Services
{
    public class TalentServices : ITalentServices
    {
        private readonly UnitOfWork _unitOfWork;

        /// <summary>
        /// Public constructor.
        /// </summary>
        public TalentServices()
        {
            _unitOfWork = new UnitOfWork();
        }

        public BusinessEntities.ViewModel.VmTalentEntity GetTalentById(long talentId)
        {
            var talent = _unitOfWork.TalentRepository.GetWithInclude(x => x.TalentId == talentId, "Region", "JobTalentSkills", "SubCategory")
                .FirstOrDefault();

            //var talent1 = _unitOfWork.TalentRepository.GetByID(talentId);

            if (talent != null)
            {
                Mapper.CreateMap<Talent, VmTalentEntity>().ForMember(d => d.RegionName, o => o.MapFrom(s => s.Region.RegionName))
                    .ForMember(d => d.vmMainSkills, o => o.MapFrom(s => s.JobTalentCategories.Select(a =>
                        new VmMainSkills
                        {
                            MainSkil = a.SubCategory.SubCategoryValue,
                            Skills = a.JobTalentSkills.Select(x => new VmSkills { Description = x.Description, SkillName = x.SubCategory.SubCategoryValue }).ToList()
                        }))).ForMember(d => d.vmMedias, o => o.MapFrom(s => s.Media.Select(a => new VmMedias
                        {
                            MediaId = a.MediaId,
                            MediaPath = a.FilePath,
                            MediaType = a.MediaType,
                            isProfilePic = a.IsProfilePic,
                            MediaName = a.FileName
                        }))).ForMember(d => d.Languages, o => o.MapFrom(s => s.JobTalentLanguages.Select(a => a.SubCategory.SubCategoryValue)));

                var talentModel = Mapper.Map<Talent, VmTalentEntity>(talent);
                return talentModel;
            }
            return null;
        }

        public List<BusinessEntities.ViewModel.VmTalentEntity> GetAllTalents()
        {
            var talent = _unitOfWork.TalentRepository.GetMany(x => !(x.IsDeleted == true)).ToList();

            if (talent != null)
            {
                Mapper.CreateMap<Talent, VmTalentEntity>().ForMember(d => d.RegionName, o => o.MapFrom(s => s.Region.RegionName))
                    .ForMember(d => d.vmMainSkills, o => o.MapFrom(s => s.JobTalentCategories.Select(a =>
                        new VmMainSkills
                        {
                            MainSkil = a.SubCategory.SubCategoryValue,
                            Skills = a.JobTalentSkills.Select(x => new VmSkills { Description = x.Description, SkillName = x.SubCategory.SubCategoryValue }).ToList()
                        }))).ForMember(d => d.vmMedias, o => o.MapFrom(s => s.Media.Select(a => new VmMedias
                        {
                            MediaId = a.MediaId,
                            MediaPath = a.FilePath,
                            MediaType = a.MediaType,
                            isProfilePic = a.IsProfilePic,
                            MediaName = a.FileName
                        }))).ForMember(d => d.Languages, o => o.MapFrom(s => s.JobTalentLanguages.Select(a => a.SubCategory.SubCategoryValue)));

                var talentModel = Mapper.Map<List<Talent>, List<VmTalentEntity>>(talent);
                return talentModel;
            }
            return null;
        }

        public long CreateTalent(BusinessEntities.ViewModel.VmInsertTalent talentEntity)
        {
            if (talentEntity != null)
            {

                DateTime currentDate = DateTime.Now;
                talentEntity.CreatedBy = 1;
                talentEntity.CreatedDate = currentDate;
                talentEntity.modifiedBy = 1;
                talentEntity.ModifiedDate = currentDate;
                talentEntity.IsDeleted = false;

                Mapper.CreateMap<VmInsertTalent, Talent>();
                var talentModel = Mapper.Map<VmInsertTalent, Talent>(talentEntity);

                if (talentEntity.LanguageIds != null)
                {
                    foreach (var talent in talentEntity.LanguageIds)
                    {
                        JobTalentLanguage objJobTalentLanguage = new JobTalentLanguage();
                        objJobTalentLanguage.LanguageId = talent;
                        objJobTalentLanguage.CreatedBy = 1;
                        objJobTalentLanguage.CreatedDate = currentDate;
                        objJobTalentLanguage.modifiedBy = 1;
                        objJobTalentLanguage.ModifiedDate = currentDate;
                        objJobTalentLanguage.IsDeleted = false;
                        talentModel.JobTalentLanguages.Add(objJobTalentLanguage);
                    }
                }

                using (var scope = new TransactionScope())
                {

                    _unitOfWork.TalentRepository.Insert(talentModel);
                    //_unitOfWork. .Insert(talentModel);
                    //_unitOfWork.TalentRepository.Insert(talentModel);

                    _unitOfWork.Save();

                    if (talentEntity.Skills != null)
                    {
                        long[] childIds = talentEntity.Skills.Select(x => x.SkillId).ToArray();
                        var parentCategoryIds = _unitOfWork.SubCategoryRepository.GetManyQueryable(x => childIds.Contains(x.SubCategoryId)).Select(x => new { x.ParentId, x.SubCategoryId }).Distinct().ToArray();

                        foreach (var childCategory in talentEntity.Skills)
                        {
                            childCategory.ParentId = parentCategoryIds.Where(x => x.SubCategoryId == childCategory.SkillId).Select(x => x.ParentId).FirstOrDefault();
                        }

                        long parentId = 0;

                        foreach (var parentCategory in parentCategoryIds)
                        {
                            if (parentId != (long)parentCategory.ParentId)
                            {
                                JobTalentCategory objJobTalentCategory = new JobTalentCategory();

                                objJobTalentCategory.TalentId = talentModel.TalentId;
                                objJobTalentCategory.CategoryId = (long)parentCategory.ParentId;
                                objJobTalentCategory.CreatedBy = 1;
                                objJobTalentCategory.CreatedDate = currentDate;
                                objJobTalentCategory.modifiedBy = 1;
                                objJobTalentCategory.ModifiedDate = currentDate;
                                objJobTalentCategory.IsDeleted = false;

                                foreach (var childCategory in talentEntity.Skills.Where(x => x.ParentId == parentCategory.ParentId))
                                {
                                    JobTalentSkill objJobTalentSkill = new JobTalentSkill();
                                    objJobTalentSkill.TalentId = talentModel.TalentId;
                                    objJobTalentSkill.ParentCategoryId = (long)parentCategory.ParentId;
                                    objJobTalentSkill.SkillId = childCategory.SkillId;
                                    objJobTalentSkill.Description = childCategory.Description;
                                    objJobTalentSkill.CreatedBy = 1;
                                    objJobTalentSkill.CreatedDate = currentDate;
                                    objJobTalentSkill.modifiedBy = 1;
                                    objJobTalentSkill.ModifiedDate = currentDate;
                                    objJobTalentSkill.IsDeleted = false;
                                    objJobTalentCategory.JobTalentSkills.Add(objJobTalentSkill);
                                }

                                parentId = (long)parentCategory.ParentId;
                                _unitOfWork.JobTalentCategoryRepository.Insert(objJobTalentCategory);
                                _unitOfWork.Save();
                            }
                        }

                    }

                    scope.Complete();
                    return talentModel.TalentId;
                }
            }
            //_unitOfWork.TalentRepository.Insert();
            return 0;
        }

        public bool UpdateTalent(long talentId, BusinessEntities.Model.TalentEntity talentEntity)
        {
            throw new NotImplementedException();
        }

        public bool DeleteTalent(long talentId)
        {
            var success = false;
            if (talentId > 0)
            {
                var TalentidToDelete = new SqlParameter("@TalentId", talentId);
                var userId = new SqlParameter("@UserId", ((UserEntity)HttpContext.Current.Session["UserInfo"]).UserId);

                var IsDeleted = _unitOfWork.DeleteUsingProc.GetWithRawSql("exec [usp_DeleteTalent] @TalentId, @UserId", TalentidToDelete, userId).FirstOrDefault();
                if (IsDeleted == "Success")
                {
                    success = true;
                }
            }

            return success;
        }

        public List<VmPublicTalent> GetPublicTalents(string category, string subCategory, bool isAdmin = false)
        {
            var categoryName = new SqlParameter("@Category", category.Trim());
            var subCategoryName = new SqlParameter("@SubCategory", subCategory.Trim());
            var isAdminParam = new SqlParameter("@isAdmin", isAdmin);
            var publicTalents = _unitOfWork.Usp_GetPublicTalent_ResultRepository.GetWithRawSql("exec usp_GetPublicTalent @Category, @SubCategory", categoryName, subCategoryName).ToList();

            if (publicTalents != null)
            {
                Mapper.CreateMap<usp_GetPublicTalent_Result, VmPublicTalent>();
                var publicTalentsModel = Mapper.Map<List<usp_GetPublicTalent_Result>, List<VmPublicTalent>>(publicTalents);
                return publicTalentsModel;
            }

            return null;
        }
    }
}
