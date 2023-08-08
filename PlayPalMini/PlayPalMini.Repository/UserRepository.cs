using PlayPalMini.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlayPalMini.Repository
{
    public class UserRepository
    {
        public static string connectionString = "Data Source=VREMENSKISTROJ;Initial Catalog=PlayPalMini;Integrated Security=True";

        public async Task<List<RegisteredUser>> GetAllAsync()
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
                            user.UpdatedBy = reader.GetString(4);
                            user.DateUpdated = reader.GetDateTime(5);
                            user.CreatedBy = reader.GetString(6);
                            user.DateCreated = reader.GetDateTime(7);

                            list.Add(user);
                        }
                        reader.Close();
                        return list;
                    }
                    else
                    {
                        return null;
                    }
                }
            }
            catch (Exception)
            {
                return (null);
            }

            return null;
        }
    }
}
