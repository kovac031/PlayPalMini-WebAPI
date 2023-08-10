﻿using PlayPalMini.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlayPalMini.Service.Common
{
    public interface IUserService
    {
        Task<(List<RegisteredUser>, string)> GetAllAsync();
        Task<(RegisteredUser, string)> GetOneByIdAsync(Guid id);
        Task<bool> CreateUserAsync(RegisteredUser user);
        Task<(RegisteredUser, string)> EditUserAsync(RegisteredUser user, Guid id);
    }
}
