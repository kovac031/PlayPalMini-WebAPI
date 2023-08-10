using PlayPalMini.Model;
using PlayPalMini.Repository.Common;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlayPalMini.Repository
{
    public class UserRepository : IUserRepository
    {
        public static string connectionString = "Data Source=VREMENSKISTROJ;Initial Catalog=PlayPalMini;Integrated Security=True";

        //-------------- GET ALL USERS ---------------------------
        public async Task<(List<RegisteredUser>, string)> GetAllAsync()
        {
            try
            {
                SqlConnection theConnection = new SqlConnection(connectionString); 
                using (theConnection)
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM RegisteredUser", theConnection);
                    theConnection.Open();

                    SqlDataReader reader = await cmd.ExecuteReaderAsync();

                    List<RegisteredUser> list = new List<RegisteredUser>();

                    if(reader.HasRows)
                    {
                        while (reader.Read()) 
                        {
                            RegisteredUser user = new RegisteredUser();
                            user.Id = reader.GetGuid(0);
                            user.Username = reader.GetString(1);
                            user.Pass = reader.GetString(2);
                            user.UserRole = reader.GetString(3);
                            user.UpdatedBy = reader.GetString(5);
                            user.DateUpdated = reader.GetDateTime(7);
                            user.CreatedBy = reader.GetString(4);
                            user.DateCreated = reader.GetDateTime(6); //brojevi su redoslijed stupca u tablici

                            list.Add(user);
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
        //-------------- GET ONE USER BY ID ---------------------------
        public async Task<(RegisteredUser, string)> GetOneByIdAsync(Guid id)
        {
            try
            {
                SqlConnection theConnection = new SqlConnection(connectionString);
                using (theConnection)
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM RegisteredUser WHERE Id = @id", theConnection);
                    cmd.Parameters.AddWithValue("@id", id); //dodao id
                    theConnection.Open();

                    SqlDataReader reader = await cmd.ExecuteReaderAsync();

                    if (reader.HasRows)
                    {
                        RegisteredUser user = new RegisteredUser(); // mora biti tu da ga onaj return dole vidi

                        while (reader.Read())
                        {
                            //RegisteredUser user = new RegisteredUser();
                            user.Id = reader.GetGuid(0);
                            user.Username = reader.GetString(1);
                            user.Pass = reader.GetString(2);
                            user.UserRole = reader.GetString(3);
                            user.UpdatedBy = reader.GetString(5);
                            user.DateUpdated = reader.GetDateTime(7);
                            user.CreatedBy = reader.GetString(4);
                            user.DateCreated = reader.GetDateTime(6); //brojevi su redoslijed stupca u tablici
                        }
                        reader.Close();
                        return (user, "Success");
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
        //------------------ CREATE USER ---------------------
        public async Task<(bool, string)> CreateUserAsync(RegisteredUser user)
        {
            try
            {
                SqlConnection theConnection = new SqlConnection(connectionString);
                using (theConnection)
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO RegisteredUser VALUES (@id, @username, @password, @role, @createdby, @updatedby, @timecreated, @timeupdated);", theConnection);

                    cmd.Parameters.AddWithValue("@id", user.Id = Guid.NewGuid());
                    cmd.Parameters.AddWithValue("@username", user.Username);
                    cmd.Parameters.AddWithValue("@password", user.Pass);
                    cmd.Parameters.AddWithValue("@role", user.UserRole = "User");
                    cmd.Parameters.AddWithValue("@createdby", user.CreatedBy = "Postman");
                    cmd.Parameters.AddWithValue("@updatedby", user.UpdatedBy = "Postman");
                    cmd.Parameters.AddWithValue("@timecreated", user.DateCreated = DateTime.Now);
                    cmd.Parameters.AddWithValue("@timeupdated", user.DateUpdated = DateTime.Now);
                    // u Postmanu ostaviti samo username i password jer sam ovdje sve ostalo zadao

                    theConnection.Open();

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        return (true, "Added this new user!");
                    }
                    else
                    {
                        return (false, "Failed to create new user.");
                    }
                }                       
            }
            catch (Exception)
            {
                return (false, "Exception");
            }
        }
        //------------------ EDIT USER ---------------------
        public async Task<(RegisteredUser, string)> EditUserAsync(RegisteredUser user, Guid id)
        {
            try
            {
                SqlConnection theConnection = new SqlConnection(connectionString);
                using (theConnection)
                {
                    SqlCommand cmdGet = new SqlCommand("SELECT * FROM RegisteredUser WHERE Id = @id", theConnection);
                    cmdGet.Parameters.AddWithValue("@id", id);
                    theConnection.Open();

                    SqlDataReader reader = await cmdGet.ExecuteReaderAsync();

                    if (reader.HasRows)
                    {
                        SqlCommand cmd = new SqlCommand("UPDATE RegisteredUser SET Username = @username, Pass = @password, UserRole = @role, UpdatedBy = @updatedby, DateUpdated = @timeupdated WHERE Id = @id;", theConnection);

                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.Parameters.AddWithValue("@username", user.Username);
                        cmd.Parameters.AddWithValue("@password", user.Pass);
                        cmd.Parameters.AddWithValue("@role", user.UserRole);
                        //cmd.Parameters.AddWithValue("@createdby", user.CreatedBy = "Postman");
                        cmd.Parameters.AddWithValue("@updatedby", user.UpdatedBy = "EditUserAsync");
                        //cmd.Parameters.AddWithValue("@timecreated", user.DateCreated = DateTime.Now);
                        cmd.Parameters.AddWithValue("@timeupdated", user.DateUpdated = DateTime.Now);
                        // u Postmanu ostaviti samo sto se treba rucno mijenjati
                        reader.Close();

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            return (user, "User info edited!");
                        }
                        else
                        {
                            return (null, "Failed to edit user.");
                        }
                    }
                    else
                    {
                        return (null, "No rows.");
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
