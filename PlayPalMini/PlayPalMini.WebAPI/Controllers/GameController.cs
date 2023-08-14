using PlayPalMini.Common;
using PlayPalMini.Model;
using PlayPalMini.Service.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace PlayPalMini.WebAPI.Controllers
{
    public class GameController : ApiController
    {
        public IGameService Service { get; set; }
        public GameController(IGameService service)
        {
            Service = service;
        }
        //---------------------------GET ALL-----------------------------
        [HttpGet]
        [Route("game/getall/")]
        public async Task<HttpResponseMessage> GetAllAsync()
        {
            try
            {
                (List<BoardGame> list, string message) = await Service.GetAllAsync();
                return Request.CreateResponse(HttpStatusCode.OK, new { Message = message, List = list });
            }
            catch (Exception x)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, $"Error for GetAllAsync: {x.Message}");
            }
        }
        //---------------------------GET ONE BY ID-----------------------------
        [HttpGet]
        [Route("game/getonebyid/{id}")]
        public async Task<HttpResponseMessage> GetOneByIdAsync(Guid id)
        {
            try
            {
                (BoardGame game, string message) = await Service.GetOneByIdAsync(id);
                return Request.CreateResponse(HttpStatusCode.OK, new { Message = message, Game = game });
            }
            catch (Exception x)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, $"Error for GetOneByIdAsync: {x.Message}");
            }
        }
        //---------------------------CREATE NEW-----------------------------
        [HttpPost]
        [Route("game/create")]
        public async Task<HttpResponseMessage> CreateGameAsync(BoardGame game)
        {
            try
            {
                (bool result, string message) = await Service.CreateGameAsync(game);

                if (result)
                {
                    return Request.CreateResponse(HttpStatusCode.Created, message);
                }
                else
                {
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, message);
                }
            }
            catch (Exception x)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, $"Error for CreateGameAsync: {x.Message}");
            }
        }
        //---------------------------EDIT BOARD GAME-----------------------------
        [HttpPut]
        [Route("game/edit/{id}")]
        public async Task<HttpResponseMessage> EditGameAsync(BoardGame game, Guid id) 
        {
            try
            {
                (BoardGame editedGame, string message) = await Service.EditGameAsync(game, id);
                return Request.CreateResponse(HttpStatusCode.OK, new { Message = message, Game = editedGame });

            }
            catch (Exception x)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, $"Error for EditGameAsync: {x.Message}");
            }
        }
        //---------------------------DELETE BOARD GAME-----------------------------
        [HttpDelete]
        [Route("game/delete/{id}")]
        public async Task<HttpResponseMessage> DeleteGameAsync(Guid id)
        {
            try
            {
                (bool result, string message) = await Service.DeleteGameAsync(id);

                if (result)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, message);
                }
                else
                {
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, message);
                }
            }
            catch (Exception x)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, $"Error for DeleteGameAsync: {x.Message}");
            }
        }
        //--------------------GET ALL WITH FILTERING, PAGING, SORTING-----------------------------
        [HttpGet]
        [Route("game/params/")]
        public async Task<HttpResponseMessage> GetAllWithParamsAsync([FromUri] SearchParam search, [FromUri] SortParam sort, [FromUri] PageParam page) 
        {
            try
            {
                (List<BoardGame> list, string message) = await Service.GetAllWithParamsAsync(search, sort, page);
                return Request.CreateResponse(HttpStatusCode.OK, new { Message = message, List = list });
            }
            catch (Exception x)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, $"Error for GetAllWithParamsAsync: {x.Message}");
            }
        }
    }
}
