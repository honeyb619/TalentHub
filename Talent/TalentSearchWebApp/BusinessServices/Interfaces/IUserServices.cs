using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessEntities.Model;
using BusinessEntities.ViewModel;

namespace BusinessServices.Interfaces
{
    public interface IUserServices
    {
        UserEntity GetUsers(string UserName);
        UserEntity UpdateUsers(UserEntity model);
        UserEntity GetUsersbyEmail(string Email);

    }
}
