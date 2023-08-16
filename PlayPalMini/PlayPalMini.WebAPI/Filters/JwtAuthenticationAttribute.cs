using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Threading.Tasks;
using System.Threading;
using System.Web;
using System.Web.Http.Filters;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Text;
using System.Net;
using System.Web.Http.Results;

namespace PlayPalMini.WebAPI.Filters
{
    public class JwtAuthenticationAttribute : Attribute, IAuthenticationFilter
    {
        public async Task AuthenticateAsync(HttpAuthenticationContext context, CancellationToken cancellationToken)
        {
            HttpRequestMessage request = context.Request;
            AuthenticationHeaderValue authorization = request.Headers.Authorization;

            if (authorization == null)
            {
                ErrorResponse(context, "Unauthorized", request); // nemas pristup ili ne saljes token
                return; 
            }
            if (authorization.Scheme != "Bearer")
            {
                ErrorResponse(context, "Token value should follow the scheme 'Bearer tokenString'", request);
                return;
            }
            if (string.IsNullOrEmpty(authorization.Parameter))
            {
                ErrorResponse(context, "Missing JWT Token", request);
                return;
            }
            string jwtToken = authorization.Parameter;
            (bool isValid, string message) = IsValidToken(jwtToken); // ako je poslan, a ako je tu onda jest, provjeri je li validan
            if (!isValid)
            {
                //context.ErrorResult = new AuthenticationFailureResult(message, request); // error poruka iz IsValidToken
                ErrorResponse(context, message, request);
            }
        }
        public bool AllowMultiple => false;
        private (bool, string) IsValidToken(string token)
        {
            JwtSecurityTokenHandler tokenHandler = new JwtSecurityTokenHandler();
            byte[] key = Encoding.UTF8.GetBytes("123_ThisIsNotAGoodKeyButWhatever_321"); // mora biti isti kao u kontroleru

            TokenValidationParameters tokenValidationParameters = new TokenValidationParameters
            {
                ValidateIssuer = true,
                ValidateAudience = true,
                ValidateLifetime = true,
                ValidateIssuerSigningKey = true,
                ValidIssuer = "PlayPalMini",
                ValidAudience = "PlayPalMini",
                IssuerSigningKey = new SymmetricSecurityKey(key)
            };
            try
            {
                tokenHandler.ValidateToken(token, tokenValidationParameters, out SecurityToken validatedToken);
                return (true, null);
            }
            catch (SecurityTokenValidationException)
            {
                return (false, "Invalid JWT token, expired?.");
            }
            catch (ArgumentException)
            {
                return (false, "Invalid JWT format, check if token pasted correctly.");
            }
            catch
            {
                return (false, "Something went wrong.");
            }
        }
        private void ErrorResponse(HttpAuthenticationContext context, string errorMessage, HttpRequestMessage request)
        {
            HttpResponseMessage response = new HttpResponseMessage(HttpStatusCode.Unauthorized)
            {
                RequestMessage = request,
                Content = new StringContent($"{{ \"error\": \"{errorMessage}\" }}", Encoding.UTF8, "application/json")
            };
            context.ErrorResult = new ResponseMessageResult(response);
        }

        // This method doesn't do anything but can't be removed because of the required interface
        public async Task ChallengeAsync(HttpAuthenticationChallengeContext context, CancellationToken cancellationToken) { }
    }

}