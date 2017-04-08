using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessEntities.Model;
using BusinessEntities.GridVm;

namespace BusinessServices.Interfaces
{
    public interface IJobs
    {
        JobEntity GetJobById(long jobId);
        GridVmJobsList GetAllJobs(int page, string sort, string sortdir, JobEntity jobEntity);
        long CreateJob (JobEntity jobEntity);
        bool UpdateJob(JobEntity jobEntity);
        bool DeleteJob(long jobId);
    }
}
