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
        IEnumerable<MediaEntity> GetAllMedias();
        long CreateMedia(VmMedias mediaEntity);
        bool UpdateMedia(long mediaId, MediaEntity talentEntity);
        bool DeleteMedia(long mediaId, long deletedBy);
    }
}
