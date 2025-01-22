using Examination_System.model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Examination_System.controller
{
    public class AdminMethods : AdminRepo
    {
        public Admin admin = new Admin();

        public AdminMethods() { }

        public void Insert()
        {
            using (SqlConnection connection = controller.DatabaseConnection.GetConnection())
            {
                if (connection == null)
                    return;

                try
                {
                    string query = "INSERT INTO Admin(name, email, password) VALUES (@name, @email, @password);";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@name", admin.Name);
                        command.Parameters.AddWithValue("@email", admin.Email);
                        command.Parameters.AddWithValue("@password", admin.Password);

                        command.ExecuteNonQuery();
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception("An error occurred: " + ex.Message, ex);
                }
            }
        }
    }
}
