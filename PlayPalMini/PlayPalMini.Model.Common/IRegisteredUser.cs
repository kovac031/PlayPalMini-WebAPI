﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlayPalMini.Model.Common
{
    public interface IRegisteredUser
    {
        Guid Id { get; set; }
        string Username { get; set; }
        string Pass { get; set; }
        string UserRole { get; set; }
        string CreatedBy { get; set; }
        string UpdatedBy { get; set; }
        DateTime DateCreated { get; set; }
        DateTime DateUpdated { get; set; }
    }
}
