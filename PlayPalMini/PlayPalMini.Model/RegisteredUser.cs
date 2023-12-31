﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PlayPalMini.Model.Common;

namespace PlayPalMini.Model
{
    public class RegisteredUser : IRegisteredUser
    {
        public Guid Id { get; set; }
        public string Username { get; set; }
        public string Pass { get; set; }
        public string UserRole { get; set; }
        public string CreatedBy { get; set; }
        public string UpdatedBy { get; set;}
        public DateTime DateCreated { get; set; }
        public DateTime DateUpdated { get; set; }
    }
}
