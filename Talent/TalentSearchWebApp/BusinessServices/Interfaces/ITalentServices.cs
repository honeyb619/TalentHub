using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessEntities.Model;
using BusinessEntities.ViewModel;

namespace BusinessServices.Interfaces
{
    public interface ITalentServices
    {
        VmTalentEntity GetTalentById(long talentId);
        List<BusinessEntities.ViewModel.VmTalentEntity> GetAllTalents(string search=null);
        long CreateTalent(VmInsertTalent talentEntity);
        long UpdateTalent(VmInsertTalent talentEntity);
        bool DeleteTalent(long talentId);
        List<VmTalentsForJob> GetTalentsForJob(long jobId);
        List<VmPublicTalent> GetPublicTalents(string category, string subCategory,bool isAdmin=false);
    }
}
