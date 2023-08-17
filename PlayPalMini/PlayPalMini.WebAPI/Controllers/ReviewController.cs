using PlayPalMini.Common;
using PlayPalMini.Model;
using PlayPalMini.Service.Common;
using PlayPalMini.WebAPI.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace PlayPalMini.WebAPI.Controllers
{
    public class ReviewController : ApiController
    {
        public IReviewService Service { get; set; }
        public ReviewController(IReviewService service)
        {
            Service = service;
        }
        //---------------------------GET ALL-----------------------------
        [JwtAuthentication]
        [AuthorizeRole("Administrator")]
        [HttpGet]
        [Route("review/getall/")]
        public async Task<HttpResponseMessage> GetAllAsync()
        {
            try
            {
                (List<Review> list, string message) = await Service.GetAllAsync();
                return Request.CreateResponse(HttpStatusCode.OK, new { Message = message, List = list });
            }
            catch (Exception x)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, $"Error for GetAllAsync: {x.Message}");
            }
        }
        //---------------------------GET ONE BY ID-----------------------------
        [JwtAuthentication]
        [AuthorizeRole("Administrator", "User")]
        [HttpGet]
        [Route("review/getonebyid/{id}")]
        public async Task<HttpResponseMessage> GetOneByIdAsync(Guid id)
        {
            try
            {
                (Review review, string message) = await Service.GetOneByIdAsync(id);
                return Request.CreateResponse(HttpStatusCode.OK, new { Message = message, Review = review });
            }
            catch (Exception x)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, $"Error for GetOneByIdAsync: {x.Message}");
            }
        }
        //---------------------------CREATE NEW-----------------------------
        [JwtAuthentication]
        [AuthorizeRole("User")]
        [HttpPost]
        [Route("review/create")]
        public async Task<HttpResponseMessage> CreateReviewAsync(Review review)
        {
            try
            {
                (bool result, string message) = await Service.CreateReviewAsync(review);

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
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, $"Error for CreateReviewAsync: {x.Message}");
            }
        }
        //---------------------------EDIT REVIEW-----------------------------
        [JwtAuthentication]
        [AuthorizeRole("Administrator", "User")]
        [HttpPut]
        [Route("review/edit/{id}")]
        public async Task<HttpResponseMessage> EditReviewAsync(Review review, Guid id)
        {
            try
            {
                (Review editedReview, string message) = await Service.EditReviewAsync(review, id);
                return Request.CreateResponse(HttpStatusCode.OK, new { Message = message, Review = editedReview });

            }
            catch (Exception x)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, $"Error for EditReviewAsync: {x.Message}");
            }
        }
        //---------------------------DELETE REVIEW-----------------------------
        [JwtAuthentication]
        [AuthorizeRole("Administrator", "User")]
        [HttpDelete]
        [Route("review/delete/{id}")]
        public async Task<HttpResponseMessage> DeleteReviewAsync(Guid id)
        {
            try
            {
                (bool result, string message) = await Service.DeleteReviewAsync(id);

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
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, $"Error for DeleteReviewAsync: {x.Message}");
            }
        }
        //--------------------GET ALL WITH FILTERING, PAGING, SORTING------------------------
        [JwtAuthentication]
        [AuthorizeRole("Administrator", "User")]
        [HttpGet]
        [Route("review/params/")]
        public async Task<HttpResponseMessage> GetAllWithParamsAsync([FromUri] SearchParam search, [FromUri] SortParam sort, [FromUri] PageParam page)
        {
            try
            {
                (List<Review> list, string message) = await Service.GetAllWithParamsAsync(search, sort, page);
                return Request.CreateResponse(HttpStatusCode.OK, new { Message = message, List = list });
            }
            catch (Exception x)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, $"Error for GetAllWithParamsAsync: {x.Message}");
            }
        }
        //-----------GET ALL REVIEWS FOR SPECIFIC GAME, WITH FILTERING, PAGING, SORTING------------------------
        [JwtAuthentication]
        [AuthorizeRole("Administrator", "User")]
        [HttpGet]
        [Route("review/params/{id}")]
        public async Task<HttpResponseMessage> GetAllReviewsForOneGame(Guid id, [FromUri] SearchParam search, [FromUri] SortParam sort, [FromUri] PageParam page)
        {
            try
            {
                (List<Review> list, string message) = await Service.GetAllReviewsForOneGame(id, search, sort, page);
                return Request.CreateResponse(HttpStatusCode.OK, new { Message = message, List = list });
            }
            catch (Exception x)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, $"Error for GetAllReviewsForOneGame: {x.Message}");
            }
        }
    }
}
