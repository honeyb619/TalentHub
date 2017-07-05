using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessEntities.Model;
using BusinessEntities.ViewModel;

namespace BusinessServices.Interfaces
{
    public interface IMediaServices
    {
        VmMedias GetMediaById(long mediaId);
        IEnumerable<MediaEntity> GetMediaByTalentId(long TalentId);
        long CreateMedia(VmMedias mediaEntity);
        bool TalentMediaProfileUpdate(VmMedias mediaModel);
        bool DeleteMedia(long mediaId);
    }
}
