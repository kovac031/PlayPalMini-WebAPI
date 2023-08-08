using PlayPalMini.Model;
using PlayPalMini.Service;
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
        [HttpGet]
        [Route("user/getall/")]
        public async Task<HttpResponseMessage> GetAllAsync()
        {
            UserService service = new UserService();

            try
            {
                List<RegisteredUser> list = await service.GetAllAsync();
                return Request.CreateResponse(HttpStatusCode.OK, list);
            }
            catch (Exception x)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, $"Error for GetAllAsync: {x.Message}");
            }
        }

    }
}
