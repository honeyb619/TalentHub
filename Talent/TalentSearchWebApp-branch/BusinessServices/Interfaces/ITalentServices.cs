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
        IEnumerable<TalentEntity> GetAllTalents();
        long CreateTalent(VmInsertTalent talentEntity);
        bool UpdateTalent(long talentId, TalentEntity talentEntity);
        bool DeleteTalent(long talentId, long deletedBy);
        List<VmPublicTalent> GetPublicTalents(string category, string subCategory,bool isAdmin=false);
    }
}
