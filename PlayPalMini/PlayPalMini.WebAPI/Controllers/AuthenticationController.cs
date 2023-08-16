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
        [HttpPost]
        [Route("api/authenticate")]
        public async Task<IHttpActionResult> Authenticate(RegisteredUser user)
        {
            (string userRole, string message) = await ValidateUser(user.Username, user.Pass); // prvo trazi usera koristeci metodu od ispod

            if (!string.IsNullOrEmpty(userRole))
            {
                string token = GenerateToken(user.Username, userRole); // ako je nasao usera, poziva drugu metodu od ispod da dobije token
                return Ok(new { Token = token });
            }

            if (!string.IsNullOrEmpty(message))
            {
                return BadRequest(message);
            }

            return Unauthorized();
        }
        private async Task<(string UserRole, string Message)> ValidateUser(string username, string password)
        {
            try
            {
                (RegisteredUser user, string message) = await Service.FindUserAsync(username, password);
                if (user != null)
                    return (user.UserRole, message);
                else
                    return (null, message);
            }
            catch (Exception x)
            {
                return (null, x.Message);
            }
        }
        private string GenerateToken(string username, string userRole)
        {
            SymmetricSecurityKey key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("123_ThisIsNotAGoodKeyButWhatever_321")); // treba bit nesto dugacko, 12345 ne prolazi
            SigningCredentials credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            JwtSecurityToken token = new JwtSecurityToken(
                issuer: "PlayPalMini",
                audience: "PlayPalMini",
                claims: new[] { new Claim(ClaimTypes.Name, username), new Claim(ClaimTypes.Role, userRole) },
                expires: DateTime.Now.AddHours(2),
                signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
