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

namespace BusinessServices.Services
{
    public class MediaServices : IMediaServices
    {
        private readonly UnitOfWork _unitOfWork;

        /// <summary>
        /// Public constructor.
        /// </summary>
        public MediaServices()
        {
            _unitOfWork = new UnitOfWork();
        }



        public VmMedias GetMediaById(long mediaId)
        {
            var media = _unitOfWork.MediaRepository.GetWithInclude(x => x.MediaId == mediaId)
                .FirstOrDefault();

            if (media != null)
            {
                Mapper.CreateMap<Medium, VmMedias>();
                var mediaModel = Mapper.Map<Medium, VmMedias>(media);
                return mediaModel;
            }
            return null;

        }

        public IEnumerable<MediaEntity> GetAllMedias()
        {
            throw new NotImplementedException();
        }

        public long CreateMedia(VmMedias mediaModel)
        {
            var mediaEntity = new MediaEntity()
            {
                FilePath = mediaModel.MediaPath,
                IsProfilePic = mediaModel.isProfilePic,
                TalentId = mediaModel.TalentId,
                FileName = mediaModel.MediaName,
                MediaType = mediaModel.MediaType,
                MimeType = mediaModel.MimeType,
                CreatedDate = DateTime.UtcNow,
                CreatedBy = 1,
                IsDeleted = false
            };
            Mapper.CreateMap<MediaEntity, Medium>();
            var media = Mapper.Map<MediaEntity, Medium>(mediaEntity);
            _unitOfWork.MediaRepository.Insert(media);
            _unitOfWork.Save();
            return media.MediaId;
        }

        public bool UpdateMedia(long mediaId, MediaEntity talentEntity)
        {
            throw new NotImplementedException();
        }

        public bool DeleteMedia(long mediaId, long deletedBy)
        {
            throw new NotImplementedException();
        }
    }
}
