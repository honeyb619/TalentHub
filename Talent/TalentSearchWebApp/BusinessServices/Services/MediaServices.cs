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

        public bool TalentMediaProfileUpdate(VmMedias mediaModel)
        {
            var mediaEntity = _unitOfWork.MediaRepository.GetMany(x => x.MediaId == mediaModel.MediaId).FirstOrDefault();
            var profileMedia = _unitOfWork.MediaRepository.GetMany(x => x.MediaId != mediaModel.MediaId && x.TalentId == mediaEntity.Talent.TalentId);
            foreach (var media in profileMedia)
            {
                media.IsProfilePic = false;
                _unitOfWork.MediaRepository.Update(media);
                _unitOfWork.Save();
            }
            mediaEntity.FilePath = mediaModel.MediaPath;
            mediaEntity.IsProfilePic = mediaModel.isProfilePic;
            mediaEntity.FileName = mediaModel.MediaName;
            mediaEntity.ModifiedDate = DateTime.UtcNow;
            _unitOfWork.MediaRepository.Update(mediaEntity);
            _unitOfWork.Save();
            return true;
        }

        public bool DeleteMedia(long mediaId)
        {
            if (mediaId > 0)
            {
                var media = _unitOfWork.MediaRepository.GetMany(x => x.MediaId == mediaId).FirstOrDefault();
                media.IsDeleted = true;
                _unitOfWork.MediaRepository.Update(media);
                _unitOfWork.Save();
                return true;
            }

            return false;
        }
    }
}
