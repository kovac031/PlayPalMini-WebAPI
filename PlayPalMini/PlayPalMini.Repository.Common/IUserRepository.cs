﻿using PlayPalMini.Common;
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
        Task<(List<RegisteredUser>, string)> GetAllAsync();
        Task<(RegisteredUser, string)> GetOneByIdAsync(Guid id);
        Task<(bool, string)> CreateUserAsync(RegisteredUser user);
        Task<(RegisteredUser, string)> EditUserAsync(RegisteredUser user, Guid id);
        Task<(bool, string)> DeleteUserAsync(Guid id);
        Task<(List<RegisteredUser>, string)> GetAllWithParamsAsync(SearchParam search);
    }
}
