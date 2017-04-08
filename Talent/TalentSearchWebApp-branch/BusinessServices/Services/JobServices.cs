using System;
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

        public BusinessEntities.Model.JobEntity GetJobById(long jobId)
        {
            throw new NotImplementedException();
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
                    .Where(strWhere)
                    .OrderBy(strSort)
                    .Skip((page - 1) * objGridVmJobsList.PageSize).Take(objGridVmJobsList.PageSize)
                    .ToList();

            objGridVmJobsList.TotalRecord = _unitOfWork.JobRepository.DynamicQuery().Where(strWhere).Count();
            objGridVmJobsList.NoOfPages = (objGridVmJobsList.TotalRecord / objGridVmJobsList.PageSize)
                                                    + ((objGridVmJobsList.TotalRecord % objGridVmJobsList.PageSize) > 0 ? 1 : 0);

            if (jobs.Any())
            {
                Mapper.CreateMap<Job, JobEntity>().ForMember(x => x.JobStatus, opt =>
                    opt.MapFrom(src => src.SubCategory.SubCategoryValue))
                   .ForMember(x => x.ProductionCompanyName, opt =>
                    opt.MapFrom(src => src.ProductionCompany.ProductionCompanyName));

                objGridVmJobsList.ListJobEntity = Mapper.Map<List<Job>, List<JobEntity>>(jobs);
            }

            return objGridVmJobsList;
        }

        public long CreateJob(BusinessEntities.Model.JobEntity jobEntity)
        {
            throw new NotImplementedException();
        }

        public bool UpdateJob(BusinessEntities.Model.JobEntity jobEntity)
        {
            throw new NotImplementedException();
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
    }
}
