﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessServices.Interfaces;
using DataModel.UnitOfWork;
using AutoMapper;
using DataModel;
using BusinessEntities.Model;
using System.Data.SqlClient;
using System.Web;
using BusinessEntities.GridVm;
using System.Linq.Dynamic;
using BusinessEntities.ViewModel;
using System.Transactions;
using System.Xml.Serialization;
using System.IO;

namespace BusinessServices.Services
{
    public class JobServices : IJobs
    {
        private readonly UnitOfWork _unitOfWork;

        /// <summary>
        /// Public constructor.
        /// </summary>
        public JobServices()
        {
            _unitOfWork = new UnitOfWork();
        }

        public List<JobEntity> GetJobsByTalentId(long TalentId)
        {
            VmInsertJob objVmInsertJob = new VmInsertJob();
            return _unitOfWork.JobTalentAssociationRepository.GetAll().Where(x => x.IsDeleted == false && x.TalentId == TalentId).
                Join(_unitOfWork.JobRepository.GetAll().Where(job => job.IsDeleted == false), JobTalentAssociation => JobTalentAssociation.JobId, Job => Job.JobId, (JobTalentAssociation, Job) => new JobTalentAssociation { JobId = Job.JobId, Status = JobTalentAssociation.Status, IsDeleted = JobTalentAssociation.IsDeleted, Job = JobTalentAssociation.Job }).
                Join(_unitOfWork.SubCategoryRepository.GetAll(), job => job.Status, category => category.SubCategoryId, (job, sub) => new JobEntity { JobName = job.Job.JobName + " : " + job.Job.JobDescription, JobStatus = sub.SubCategoryName }).ToList();
        }

        public string GetRoleByJobTalentId(long TalentId, long JobId)
        {
            var result = _unitOfWork.JobTalentAssociationRepository.GetAll().Where(obj => obj.JobId == JobId && obj.TalentId == TalentId).First();
            if (result != null)
                return result.Role;
            return "";

        }


        public bool DeleteJobTalentAssociation(long TalentId, long JobId) {
            var result = _unitOfWork.JobTalentAssociationRepository.GetAll().Where(obj => obj.JobId == JobId && obj.TalentId == TalentId).First();
            if (result != null)
            {
                _unitOfWork.JobTalentAssociationRepository.Delete(result);
                _unitOfWork.Save();
                return true;
            }
            return true;
        }


        public VmInsertJob GetJobById(long jobId)
        {
            VmInsertJob objVmInsertJob = new VmInsertJob();

            var job = _unitOfWork.JobRepository.Get(x => x.IsDeleted == false && x.JobId == jobId);

            if (job != null)
            {
                Mapper.CreateMap<Job, VmInsertJob>();
                objVmInsertJob = Mapper.Map<Job, VmInsertJob>(job);

                var jobLanguages = _unitOfWork.JobTalentLanguageRepository.GetManyQueryable(x => x.IsDeleted == false &&
                                    x.JobId == jobId && x.TalentId == null).ToList();
                if (jobLanguages.Any())
                {
                    objVmInsertJob.LanguageIds = new List<int>();
                    foreach (var item in jobLanguages)
                    {
                        objVmInsertJob.LanguageIds.Add((Int32)item.LanguageId);
                    }
                }

                var jobTalentSkills = _unitOfWork.JobTalentSkillRepository.GetManyQueryable(x => x.IsDeleted == false && x.JobId == jobId && x.TalentId == null).ToList();
                if (jobTalentSkills != null && jobTalentSkills.Count > 0)
                {
                    objVmInsertJob.SkillIds = new List<long>();
                    foreach (var item in jobTalentSkills)
                    {
                        objVmInsertJob.SkillIds.Add(item.SkillId);
                    }
                }

                return objVmInsertJob;
            }

            return objVmInsertJob;
        }

        public GridVmJobsList GetAllJobs(int page, string sort, string sortdir, JobEntity jobEntity)
        {
            GridVmJobsList objGridVmJobsList = new GridVmJobsList();
            objGridVmJobsList.PageSize = 10;
            string strWhere = "IsDeleted = false";
            string strSort = string.Empty;

            if (jobEntity != null)
            {
                if (!string.IsNullOrEmpty(strWhere) && !string.IsNullOrEmpty(jobEntity.ProductionCompanyName))
                {
                    strWhere += " And ";
                    strWhere += "ProductionCompany.ProductionCompanyName = \"" + jobEntity.ProductionCompanyName + "\"";
                }
            }

            switch (sort)
            {
                case "RegionName":
                    strSort = "Region.RegionName " + sortdir;
                    break;
                case "ProductionCompanyName":
                    strSort = "ProductionCompany.ProductionCompanyName " + sortdir;
                    break;
                case "JobStatus":
                    strSort = "SubCategory.SubCategoryValue " + sortdir;
                    break;
                default:
                    strSort = sort + " " + sortdir;
                    break;
            }

            var jobs = _unitOfWork.JobRepository.GetManyQueryable(null)
                    .Where(job => job.IsDeleted == false)
                    .ToList();

            if (jobEntity != null)
            {
                if (jobEntity.JobName != null)
                {
                    jobs = jobs.Where(job => job.JobName.ToLower().Contains(jobEntity.JobName.ToLower())).ToList();
                }

                if (jobEntity.ProductionCompanyName != null)
                {
                    jobs = jobs.Where(job => job.ProductionCompany.ProductionCompanyName.ToLower().Contains(jobEntity.ProductionCompanyName.ToLower())).ToList();
                }

            }

            objGridVmJobsList.TotalRecord = _unitOfWork.JobRepository.DynamicQuery().Where(strWhere).Count();
            objGridVmJobsList.NoOfPages = (objGridVmJobsList.TotalRecord / objGridVmJobsList.PageSize)
                                                    + ((objGridVmJobsList.TotalRecord % objGridVmJobsList.PageSize) > 0 ? 1 : 0);

            if (jobs.Any())
            {
                Mapper.CreateMap<Job, JobEntity>().ForMember(x => x.JobStatus, opt =>
                    opt.MapFrom(src => src.SubCategory.SubCategoryValue))
                   .ForMember(x => x.ProductionCompanyName, opt =>
                    opt.MapFrom(src => src.ProductionCompany.ProductionCompanyName))
                    .ForMember(x => x.RegionName, opt =>
                    opt.MapFrom(src => src.Region.RegionName));

                objGridVmJobsList.ListJobEntity = Mapper.Map<List<Job>, List<JobEntity>>(jobs).OrderBy(x => x.JobName).ToList();
            }

            return objGridVmJobsList;
        }

        public long CreateJob(VmInsertJob vmInsertJob)
        {
            if (vmInsertJob != null)
            {

                DateTime currentDate = DateTime.Now;
                int userId = ((UserEntity)HttpContext.Current.Session["UserInfo"]).UserId;

                vmInsertJob.CreatedBy = userId;
                vmInsertJob.CreatedDate = currentDate;
                vmInsertJob.modifiedBy = userId;
                vmInsertJob.ModifiedDate = currentDate;
                vmInsertJob.IsDeleted = false;

                Mapper.CreateMap<VmInsertJob, Job>();
                var jobModel = Mapper.Map<VmInsertJob, Job>(vmInsertJob);

                if (vmInsertJob.LanguageIds != null)
                {
                    foreach (var languageId in vmInsertJob.LanguageIds)
                    {
                        JobTalentLanguage objJobTalentLanguage = new JobTalentLanguage();
                        objJobTalentLanguage.LanguageId = languageId;
                        objJobTalentLanguage.CreatedBy = userId;
                        objJobTalentLanguage.CreatedDate = currentDate;
                        objJobTalentLanguage.modifiedBy = userId;
                        objJobTalentLanguage.ModifiedDate = currentDate;
                        objJobTalentLanguage.IsDeleted = false;
                        jobModel.JobTalentLanguages.Add(objJobTalentLanguage);
                    }
                }

                if (vmInsertJob.SkillIds != null && vmInsertJob.SkillIds.Count > 0)
                {
                    foreach (var skillId in vmInsertJob.SkillIds)
                    {
                        VmSkills objVmSkills = new VmSkills();
                        objVmSkills.SkillId = skillId;
                        vmInsertJob.Skills.Add(objVmSkills);
                    }
                }

                using (var scope = new TransactionScope())
                {

                    _unitOfWork.JobRepository.Insert(jobModel);
                    _unitOfWork.Save();

                    if (vmInsertJob.Skills != null && vmInsertJob.Skills.Count > 0)
                    {
                        long[] childIds = vmInsertJob.Skills.Select(x => x.SkillId).ToArray();
                        var parentCategoryIds = _unitOfWork.SubCategoryRepository.GetManyQueryable(x => childIds.Contains(x.SubCategoryId)).Select(x => new { x.ParentId, x.SubCategoryId }).Distinct().ToArray();

                        foreach (var childCategory in vmInsertJob.Skills)
                        {
                            childCategory.ParentId = parentCategoryIds.Where(x => x.SubCategoryId == childCategory.SkillId).Select(x => x.ParentId).FirstOrDefault();
                        }

                        long parentId = 0;

                        foreach (var parentCategory in parentCategoryIds)
                        {
                            if (parentId != (long)parentCategory.ParentId)
                            {
                                JobTalentCategory objJobTalentCategory = new JobTalentCategory();

                                objJobTalentCategory.JobId = jobModel.JobId;
                                objJobTalentCategory.CategoryId = (long)parentCategory.ParentId;
                                objJobTalentCategory.CreatedBy = userId;
                                objJobTalentCategory.CreatedDate = currentDate;
                                objJobTalentCategory.modifiedBy = userId;
                                objJobTalentCategory.ModifiedDate = currentDate;
                                objJobTalentCategory.IsDeleted = false;

                                foreach (var childCategory in vmInsertJob.Skills.Where(x => x.ParentId == parentCategory.ParentId))
                                {
                                    JobTalentSkill objJobTalentSkill = new JobTalentSkill();
                                    objJobTalentSkill.JobId = jobModel.JobId;
                                    objJobTalentSkill.SkillId = childCategory.SkillId;
                                    objJobTalentSkill.Description = childCategory.Description;
                                    objJobTalentSkill.CreatedBy = userId;
                                    objJobTalentSkill.CreatedDate = currentDate;
                                    objJobTalentSkill.modifiedBy = userId;
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
                    return jobModel.JobId;
                }
            }

            return 0;
        }

        public bool UpdateJob(VmInsertJob vmInsertJob)
        {
            var success = false;

            if (vmInsertJob != null)
            {
                if (vmInsertJob.SkillIds != null && vmInsertJob.SkillIds.Count > 0)
                {
                    foreach (var skillId in vmInsertJob.SkillIds)
                    {
                        VmSkills objVmSkills = new VmSkills();
                        objVmSkills.SkillId = skillId;
                        vmInsertJob.Skills.Add(objVmSkills);
                    }
                }

                StringBuilder sbData = new StringBuilder();
                var stringwriter = new StringWriter(sbData);
                var serializer = new XmlSerializer(typeof(VmInsertJob));
                serializer.Serialize(stringwriter, vmInsertJob);

                var updateXmlData = new SqlParameter("@UpdateXmlData", sbData.ToString());
                var userId = new SqlParameter("@UserId", ((UserEntity)HttpContext.Current.Session["UserInfo"]).UserId);

                var IsUpdated = _unitOfWork.DeleteUsingProc.GetWithRawSql("exec UpdateJobFromXML @UpdateXmlData, @UserId", updateXmlData, userId).FirstOrDefault();
                if (IsUpdated == "Success")
                {
                    success = true;
                }
            }

            return success;
        }

        public bool DeleteJob(long jobId)
        {
            var success = false;
            if (jobId > 0)
            {
                var jobIdToDelete = new SqlParameter("@JobId", jobId);
                var userId = new SqlParameter("@UserId", ((UserEntity)HttpContext.Current.Session["UserInfo"]).UserId);

                var IsDeleted = _unitOfWork.DeleteUsingProc.GetWithRawSql("exec usp_DeleteJob @JobId, @UserId", jobIdToDelete, userId).FirstOrDefault();
                if (IsDeleted == "Success")
                {
                    success = true;
                }
            }

            return success;
        }


        public bool SaveJobTalentAssociation(VmSaveJobTalentAssociation objVmSaveJobTalentAssociation)
        {
            var success = false;

            if (objVmSaveJobTalentAssociation != null)
            {
                StringBuilder sbData = new StringBuilder();
                var stringwriter = new StringWriter(sbData);
                var serializer = new XmlSerializer(typeof(VmSaveJobTalentAssociation));
                serializer.Serialize(stringwriter, objVmSaveJobTalentAssociation);

                var updateXmlData = new SqlParameter("@UpdateXmlData", sbData.ToString());
                var userId = new SqlParameter("@UserId", ((UserEntity)HttpContext.Current.Session["UserInfo"]).UserId);

                var IsUpdated = _unitOfWork.DeleteUsingProc.GetWithRawSql("exec [JobTalentAssociationFromXML] @UpdateXmlData, @UserId", updateXmlData, userId).FirstOrDefault();
                if (IsUpdated == "Success")
                {
                    success = true;
                }
            }

            return success;
        }
    }
}
