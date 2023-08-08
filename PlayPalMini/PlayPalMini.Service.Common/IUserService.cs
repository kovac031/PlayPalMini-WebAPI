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
        Task<List<RegisteredUser>> GetAllAsync();
    }
}
