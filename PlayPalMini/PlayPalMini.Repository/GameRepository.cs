using PlayPalMini.Common;
using PlayPalMini.Model;
using PlayPalMini.Repository.Common;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

// komentirano sta i kako na UserRepository
namespace PlayPalMini.Repository
{
    public class GameRepository : IGameRepository
    {
        public static string connectionString = "Data Source=VREMENSKISTROJ;Initial Catalog=PlayPalMini;Integrated Security=True";

        //-------------- GET ALL BOARD GAMES ---------------------------
        public async Task<(List<BoardGame>, string)> GetAllAsync()
        {
            try
            {
                SqlConnection theConnection = new SqlConnection(connectionString);
                using (theConnection)
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM BoardGame", theConnection);
                    theConnection.Open();

                    SqlDataReader reader = await cmd.ExecuteReaderAsync();

                    List<BoardGame> list = new List<BoardGame>();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            BoardGame game = new BoardGame();
                            game.Id = reader.GetGuid(0);
                            game.Title = reader.GetString(1);
                            game.Description = reader.GetString(2);
                            game.CreatedBy = reader.GetString(3);
                            game.UpdatedBy = reader.GetString(4);                        
                            game.DateCreated = reader.GetDateTime(5);
                            game.DateUpdated = reader.GetDateTime(6);

                            list.Add(game);
                        }
                        reader.Close();
                        return (list, "Success");
                    }
                    else
                    {
                        return (null, "No rows found.");
                    }
                }
            }
            catch (Exception)
            {
                return (null, "Exception");
            }
        }
        //-------------- GET ONE BOARD GAME BY ID ---------------------------
        public async Task<(BoardGame, string)> GetOneByIdAsync(Guid id)
        {
            try
            {
                SqlConnection theConnection = new SqlConnection(connectionString);
                using (theConnection)
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM BoardGame WHERE Id = @id", theConnection);
                    cmd.Parameters.AddWithValue("@id", id); 
                    theConnection.Open();

                    SqlDataReader reader = await cmd.ExecuteReaderAsync();

                    if (reader.HasRows)
                    {
                        BoardGame game = new BoardGame(); 

                        while (reader.Read())
                        {
                            game.Id = reader.GetGuid(0);
                            game.Title = reader.GetString(1);
                            game.Description = reader.GetString(2);
                            game.CreatedBy = reader.GetString(3);
                            game.UpdatedBy = reader.GetString(4);
                            game.DateCreated = reader.GetDateTime(5);
                            game.DateUpdated = reader.GetDateTime(6); 
                        }
                        reader.Close();
                        return (game, "Success");
                    }
                    else
                    {
                        return (null, "No rows found.");
                    }
                }
            }
            catch (Exception)
            {
                return (null, "Exception");
            }
        }
        //------------------ CREATE BOARD GAME ---------------------
        public async Task<(bool, string)> CreateGameAsync(BoardGame game)
        {
            try
            {
                SqlConnection theConnection = new SqlConnection(connectionString);
                using (theConnection)
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO BoardGame VALUES (@id, @title, @description, @createdby, @updatedby, @timecreated, @timeupdated);", theConnection);

                    cmd.Parameters.AddWithValue("@id", game.Id = Guid.NewGuid());
                    cmd.Parameters.AddWithValue("@title", game.Title);
                    cmd.Parameters.AddWithValue("@description", game.Description);
                    cmd.Parameters.AddWithValue("@createdby", game.CreatedBy = "Postman");
                    cmd.Parameters.AddWithValue("@updatedby", game.UpdatedBy = "Postman");
                    cmd.Parameters.AddWithValue("@timecreated", game.DateCreated = DateTime.Now);
                    cmd.Parameters.AddWithValue("@timeupdated", game.DateUpdated = DateTime.Now);

                    theConnection.Open();

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        return (true, "Added this new board game!");
                    }
                    else
                    {
                        return (false, "Failed to create new board game.");
                    }
                }
            }
            catch (Exception)
            {
                return (false, "Exception");
            }
        }
        //------------------ EDIT BOARD GAME ---------------------
        public async Task<(BoardGame, string)> EditGameAsync(BoardGame game, Guid id)
        {
            try
            {
                SqlConnection theConnection = new SqlConnection(connectionString);
                using (theConnection)
                {
                    SqlCommand cmdGet = new SqlCommand("SELECT * FROM BoardGame WHERE Id = @id", theConnection);
                    cmdGet.Parameters.AddWithValue("@id", id);
                    theConnection.Open();

                    SqlDataReader reader = await cmdGet.ExecuteReaderAsync();

                    if (reader.HasRows)
                    {
                        reader.Close(); 

                        SqlCommand cmd = new SqlCommand("UPDATE BoardGame SET Title = @title, Description = @description, UpdatedBy = @updatedby, DateUpdated = @timeupdated WHERE Id = @id;", theConnection);

                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.Parameters.AddWithValue("@title", game.Title);
                        cmd.Parameters.AddWithValue("@description", game.Description);
                        cmd.Parameters.AddWithValue("@updatedby", game.UpdatedBy = "EditGameAsync");
                        cmd.Parameters.AddWithValue("@timeupdated", game.DateUpdated = DateTime.Now);

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            return (game, "Game info edited! (ignore null values, it's all good)");
                        }
                        else
                        {
                            return (null, "Did not edit board game.");
                        }
                    }
                    else
                    {
                        return (null, "No rows found.");
                    }
                }
            }
            catch (Exception)
            {
                return (null, "Exception");
            }
        }
        //-------------- DELETE BOARD GAME BY ID ---------------------------
        public async Task<(bool, string)> DeleteGameAsync(Guid id)
        {
            try
            {
                SqlConnection theConnection = new SqlConnection(connectionString);
                using (theConnection)
                {
                    SqlCommand cmdRead = new SqlCommand("SELECT * FROM BoardGame WHERE Id = @id", theConnection);
                    cmdRead.Parameters.AddWithValue("@id", id);
                    theConnection.Open();

                    SqlDataReader reader = await cmdRead.ExecuteReaderAsync();

                    if (reader.HasRows)
                    {
                        reader.Close();

                        SqlCommand cmd = new SqlCommand("DELETE FROM BoardGame WHERE Id = @id;", theConnection);
                        cmd.Parameters.AddWithValue("@id", id);

                        int affectedRows = await cmd.ExecuteNonQueryAsync(); 
                        if (affectedRows > 0)
                        {
                            return (true, "The game has been deleted!");
                        }
                        else
                        {
                            return (false, "Failed to delete this game.");
                        }
                    }
                    else
                    {
                        return (false, "No rows found.");
                    }
                }
            }
            catch (Exception)
            {
                return (false, "Exception");
            }
        }
        //-------------- GET ALL BOARD GAMES WITH PAGING, SORTING, FILTERING ---------------------------
        public async Task<(List<BoardGame>, string)> GetAllWithParamsAsync(SearchParam search, SortParam sort, PageParam page)
        {
            try
            {
                SqlConnection theConnection = new SqlConnection(connectionString);
                using (theConnection)
                {
                    StringBuilder sb = new StringBuilder(); 
                    SqlCommand cmd = new SqlCommand();

                    if (search != null) 
                    {
                        sb.Append("SELECT * FROM BoardGame WHERE 1=1"); 

                        //------------ FILTERING -------------------
                        if (!string.IsNullOrWhiteSpace(search.Title))
                        {
                            sb.Append(" AND Title LIKE @title");
                            cmd.Parameters.AddWithValue("@title", "%" + search.Title + "%");
                        }
                        if (!string.IsNullOrWhiteSpace(search.Description))
                        {
                            sb.Append(" AND Description LIKE @description");
                            cmd.Parameters.AddWithValue("@description", "%" + search.Description + "%");
                        }
                        if (!string.IsNullOrWhiteSpace(search.CreatedBy))
                        {
                            sb.Append(" AND CreatedBy LIKE @CreatedBy");
                            cmd.Parameters.AddWithValue("@CreatedBy", search.CreatedBy);
                        }
                        if (!string.IsNullOrWhiteSpace(search.UpdatedBy))
                        {
                            sb.Append(" AND UpdatedBy LIKE @UpdatedBy");
                            cmd.Parameters.AddWithValue("@UpdatedBy", search.UpdatedBy);
                        }
                        if (search.CreatedAfter != null && search.CreatedBefore != null) 
                        {
                            sb.Append(" AND DateCreated >= @createdafter AND DateCreated <= @createdbefore");
                            cmd.Parameters.AddWithValue("@createdafter", search.CreatedAfter);
                            cmd.Parameters.AddWithValue("@createdbefore", search.CreatedBefore);
                        }
                        else if (search.CreatedAfter != null)
                        {
                            sb.Append(" AND DateCreated >= @createdafter"); 
                            cmd.Parameters.AddWithValue("@createdafter", search.CreatedAfter);
                        }
                        else if (search.CreatedBefore != null)
                        {
                            sb.Append(" AND DateCreated <= @createdbefore"); 
                            cmd.Parameters.AddWithValue("@createdbefore", search.CreatedBefore);
                        }
                        if (search.UpdatedAfter != null && search.UpdatedBefore != null)
                        {
                            sb.Append(" AND DateUpdated >= @updatedafter AND DateUpdated <= @updatedbefore");
                            cmd.Parameters.AddWithValue("@updatedafter", search.UpdatedAfter);
                            cmd.Parameters.AddWithValue("@updatedbefore", search.UpdatedBefore);
                        }
                        else if (search.UpdatedAfter != null)
                        {
                            sb.Append(" AND DateUpdated >= @updatedafter"); 
                            cmd.Parameters.AddWithValue("@updatedafter", search.UpdatedAfter);
                        }
                        else if (search.UpdatedBefore != null)
                        {
                            sb.Append(" AND DateUpdated <= @updatedbefore"); 
                            cmd.Parameters.AddWithValue("@updatedbefore", search.UpdatedBefore);
                        }

                        //---------------- SORTING -----------------
                        if (sort.OrderByWhat != null && sort.SortDirection != null) 
                        {
                            sb.Append($" ORDER BY {sort.OrderByWhat} {sort.SortDirection}");                             
                        }
                        else if (sort.OrderByWhat != null) 
                        {
                            sb.Append($" ORDER BY {sort.OrderByWhat} ASC");
                        }
                        else if (sort.SortDirection != null) 
                        {
                            sb.Append($" ORDER BY DateCreated {sort.SortDirection}");
                        }

                        //---------------- PAGING ----------------------
                        if (sort.OrderByWhat == null && sort.SortDirection == null) 
                        {
                            sb.Append($" ORDER BY DateCreated DESC");
                        }
                        if (page.PageNumber != null && page.EntriesPerPage != null)
                        {
                            sb.Append(" OFFSET @Offset ROWS FETCH NEXT @EntriesPerPage ROWS ONLY;");
                            int? pageOffset = (page.PageNumber - 1) * page.EntriesPerPage;
                            cmd.Parameters.AddWithValue("@Offset", pageOffset);
                            cmd.Parameters.AddWithValue("@EntriesPerPage", page.EntriesPerPage);
                        }
                        else if (page.PageNumber != null) 
                        {
                            sb.Append(" OFFSET @Offset ROWS FETCH NEXT 5 ROWS ONLY;"); 
                            int? pageOffset = (page.PageNumber - 1) * 5;
                            cmd.Parameters.AddWithValue("@Offset", pageOffset);
                        }
                        else if (page.EntriesPerPage != null) 
                        {
                            sb.Append(" OFFSET 0 ROWS FETCH NEXT @EntriesPerPage ROWS ONLY;");
                            cmd.Parameters.AddWithValue("@EntriesPerPage", page.EntriesPerPage);
                        }
                        //-----------------------------------------------------------
                    }
                    else
                    {
                        sb.Append("SELECT * FROM BoardGame"); 
                    };
                    cmd.Connection = theConnection;
                    cmd.CommandText = sb.ToString(); 

                    theConnection.Open();
                    SqlDataReader reader = await cmd.ExecuteReaderAsync();

                    List<BoardGame> list = new List<BoardGame>();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            BoardGame game = new BoardGame();
                            game.Id = reader.GetGuid(0);
                            game.Title = reader.GetString(1);
                            game.Description = reader.GetString(2);
                            game.CreatedBy = reader.GetString(3);
                            game.UpdatedBy = reader.GetString(4);
                            game.DateCreated = reader.GetDateTime(5);
                            game.DateUpdated = reader.GetDateTime(6);

                            list.Add(game);
                        }
                        reader.Close();
                        return (list, "Success");
                    }
                    else
                    {
                        return (null, "No rows found.");
                    }
                }
            }
            catch (Exception)
            {
                return (null, "Exception");
            }
        }
    }
}
