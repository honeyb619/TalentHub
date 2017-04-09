using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessEntities.Model;
using BusinessEntities.GridVm;
using BusinessEntities.ViewModel;

namespace BusinessServices.Interfaces
{
    public interface IJobs
    {
        VmInsertJob GetJobById(long jobId);
        GridVmJobsList GetAllJobs(int page, string sort, string sortdir, JobEntity jobEntity);
        long CreateJob(VmInsertJob vmInsertJob);
        bool UpdateJob(VmInsertJob vmInsertJob);
        bool DeleteJob(long jobId);
    }
}
