using PlayPalMini.Model;
using PlayPalMini.Repository;
using PlayPalMini.Repository.Common;
using PlayPalMini.Service.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlayPalMini.Service
{
    public class UserService : IUserService
    {
        // dependency injection
        public IUserRepository Repository { get; set; }
        public UserService(IUserRepository repository)
        {
            Repository = repository;
        }
        public async Task<(List<RegisteredUser>, string)> GetAllAsync()
        {
            (List<RegisteredUser> list, string message) = await Repository.GetAllAsync();
            if (list == null)
            {
                throw new Exception(message);
            }
            return (list, message);
        }
        //----------------
        public async Task<RegisteredUser> GetOneByIdAsync(Guid id)
        {
            (RegisteredUser user, string message) = await Repository.GetOneByIdAsync(id);
            if (user == null)
            {
                throw new Exception(message);
            }
            return user;
        }
        //----------------
        public async Task<bool> CreateUserAsync(RegisteredUser user)
        {
            (bool result, string message) = await Repository.CreateUserAsync(user);
            if (!result) 
            {
                throw new Exception(message);
            }
            return result;
        }
        //-----------------
        public async Task<(RegisteredUser, string)> EditUserAsync(RegisteredUser user, Guid id)
        {
            (RegisteredUser userService, string message) = await Repository.EditUserAsync(user, id);
            if (userService == null)
            {
                throw new Exception(message);
            }
            return (userService, message);
        }
    }
}
