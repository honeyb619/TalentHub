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
using System.Transactions;

namespace BusinessServices.Services
{
    public class UserServices : IUserServices
    {
        private readonly UnitOfWork _unitOfWork;

        public UserServices()
        {
            _unitOfWork = new UnitOfWork();
        }

        public UserEntity GetUsers(string UserName)
        {
            var adminUser = _unitOfWork.UserRepository.GetWithInclude(user => user.UserName == UserName).FirstOrDefault();
            Mapper.CreateMap<User, UserEntity>();
            var adminEntity = Mapper.Map<User, UserEntity>(adminUser);
            return adminEntity;
        }

        public UserEntity UpdateUsers(UserEntity model)
        {
            var adminUser = _unitOfWork.UserRepository.GetWithInclude(user => user.UserName == model.UserName).FirstOrDefault();
            adminUser.Password = model.Password;
            _unitOfWork.UserRepository.Update(adminUser);
            _unitOfWork.Save();
            Mapper.CreateMap<User, UserEntity>();
            var adminEntity = Mapper.Map<User, UserEntity>(adminUser);
            return adminEntity;
        }
    }
}
