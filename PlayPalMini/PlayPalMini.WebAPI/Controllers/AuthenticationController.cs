using Microsoft.IdentityModel.Tokens;
using PlayPalMini.Model;
using PlayPalMini.Service.Common;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;

namespace PlayPalMini.WebAPI.Controllers
{
    public class AuthenticationController : ApiController
    {
        public IUserService Service { get; set; }
        public AuthenticationController(IUserService service)
        {
            Service = service;
        }
        private string GenerateToken(string username, string userRole)
        {
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("54321")); // Please use a strong, unique key
            var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
                issuer: "PlayPalMini",
                audience: "PlayPalMini",
                claims: new[] { new Claim(ClaimTypes.Name, username), new Claim(ClaimTypes.Role, userRole) },
                expires: DateTime.Now.AddHours(2),
                signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        [HttpPost]
        [Route("api/authenticate")]
        public async Task<IHttpActionResult> Authenticate(RegisteredUser user)
        {
            string userRole = await ValidateUser(user.Username, user.Pass);

            if (!string.IsNullOrEmpty(userRole))
            {
                string token = GenerateToken(user.Username, userRole);
                return Ok(new { Token = token });
            }
            return Unauthorized();
        }

        private async Task<string> ValidateUser(string username, string password)
        {
            // Use ADO.NET to fetch UserRole for the user with the given username and password from the RegisteredUser table.
            // Return UserRole if user is valid, else return null or empty string.

            try
            {
                (RegisteredUser user, string message) = await Service.FindUserAsync(username, password);
                if (user != null)
                    return user.UserRole;  // return user role directly if found
                else
                    return null;
            }
            catch (Exception)
            {
                return null;
            }
        }

    }
}
