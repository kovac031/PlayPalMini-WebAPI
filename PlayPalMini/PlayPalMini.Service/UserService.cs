using PlayPalMini.Model;
using PlayPalMini.Repository;
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
        public async Task<List<RegisteredUser>> GetAllAsync()
        {
            UserRepository repository = new UserRepository(); 
            List<RegisteredUser> list = await repository.GetAllAsync();
            return list;
        }
    }
}
