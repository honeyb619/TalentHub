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
        List<BusinessEntities.ViewModel.VmTalentEntity> GetAllTalents(string search = null);
        List<BusinessEntities.ViewModel.VmTalentEntity> GetAllTalentsbyAdvancedSearch(string Region = null, string Ethicity = null, string HairColor = null, string EyeColor = null, string Age = null, string Waist = null, string Hip = null, string ChestBust = null);
        long CreateTalent(VmInsertTalent talentEntity);
        long UpdateTalent(VmInsertTalent talentEntity);
        bool DeleteTalent(long talentId);
        List<VmTalentsForJob> GetTalentsForJob(long jobId, bool AdvancedSearch = false, string Region = null, string Ethicity = null, string HairColor = null, string EyeColor = null, string Age = null, string Waist = null, string Hip = null, string ChestBust = null);
        List<VmPublicTalent> GetPublicTalents(string category, string subCategory, bool isAdmin = false);
    }
}
