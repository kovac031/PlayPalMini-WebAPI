using PlayPalMini.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlayPalMini.Repository.Common
{
    public interface IUserRepository
    {
        Task<(List<RegisteredUser> list, string message)> GetAllAsync();

        Task<(RegisteredUser user, string message)> GetOneByIdAsync(Guid id);
        Task<(bool result, string message)> CreateUserAsync(RegisteredUser user);
    }
}
