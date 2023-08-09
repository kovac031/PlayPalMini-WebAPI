using PlayPalMini.Model;
using PlayPalMini.Service;
using PlayPalMini.Service.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.UI;

namespace PlayPalMini.WebAPI.Controllers
{
    public class UserController : ApiController
    {
        // dependency injection
        public IUserService Service { get; set; }
        public UserController(IUserService service)
        {
            Service = service;
        }

        //---------------------------GET ALL-----------------------------
        [HttpGet]
        [Route("user/getall/")]
        public async Task<HttpResponseMessage> GetAllAsync()
        {
            try
            {
                List<RegisteredUser> list = await Service.GetAllAsync();
                return Request.CreateResponse(HttpStatusCode.OK, list);
            }
            catch (Exception x)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, $"Error for GetAllAsync: {x.Message}");
            }
        }
        //---------------------------GET ONE BY ID-----------------------------
        [HttpGet]
        [Route("user/getonebyid/{id}")]
        public async Task<HttpResponseMessage> GetOneByIdAsync(Guid id)
        {
            try
            {
                RegisteredUser user = await Service.GetOneByIdAsync(id);
                return Request.CreateResponse(HttpStatusCode.OK, user);
            }
            catch (Exception x)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, $"Error for GetOneByIdAsync: {x.Message}");
            }
        }
        //---------------------------CREATE NEW-----------------------------
        [HttpPost]
        [Route("user/create")]
        public async Task<HttpResponseMessage> CreateUserAsync(RegisteredUser user)
        {
            try
            {
                bool result = await Service.CreateUserAsync(user);
                //return Request.CreateResponse(HttpStatusCode.OK, user);
                if (result)
                {
                    return Request.CreateResponse(HttpStatusCode.Created, "User created successfully.");
                }
                else
                {
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Failed to create user.");
                }
            }
            catch (Exception x)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, $"Error for CreateUserAsync: {x.Message}");
            }
        }
    }
}
