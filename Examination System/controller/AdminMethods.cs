using Examination_System.model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace Examination_System.controller
{
    internal class AdminMethods : IAdminRepo
    {
        public AdminMethods() { }

        public void Insert(Admin admin) 
        {
            string columns = "name, email, password";
            string values = $"'{admin.Name}', '{admin.Email}', '{admin.Password}'";
            ExecuteDmlQuery("Admin", "insert", columns, values);
        }


        public void Update(Admin admin)
        {
            string columns = $"name = '{admin.Name}', password = '{admin.Password}'";
            string condition = $"id = {admin.Id}";
            ExecuteDmlQuery("Admin", "update", columns, null, condition);
        }


        //public bool login()
        //{

        //}


        public int getID(string email)
        {
            using (SqlConnection connection = controller.DatabaseConnection.GetConnection())
            {
                if (connection == null)
                    throw new Exception("Database connection failed.");

                try
                {
                    using (SqlCommand command = new SqlCommand("getID", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@Email", email);

                        var result = command.ExecuteScalar();

                        if (result == DBNull.Value)
                            return -1;

                        return Convert.ToInt32(result);
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception("An error occurred: " + ex.Message, ex);
                }
            }
        }


        public bool checkPassword(string password, string email)
        {
            using (SqlConnection connection = controller.DatabaseConnection.GetConnection())
            {
                if (connection == null)
                    throw new Exception("Database connection failed.");

                try
                {
                    using (SqlCommand command = new SqlCommand("getPassword", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@Email", email);

                        var result = command.ExecuteScalar();

                        if (result == DBNull.Value)
                            return false;

                        return result.ToString() == password;
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception("An error occurred: " + ex.Message, ex);
                }
            }
        }


        private void ExecuteDmlQuery(string tableName, string operation, string columns = null, string values = null, string condition = null)
        {
            using (SqlConnection connection = controller.DatabaseConnection.GetConnection())
            {
                if (connection == null)
                    throw new Exception("Database connection failed.");

                try
                {
                    using (SqlCommand command = new SqlCommand("dmlQueries", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.AddWithValue("@tablename", tableName);
                        command.Parameters.AddWithValue("@operation", operation);
                        command.Parameters.AddWithValue("@columns", (object)columns ?? DBNull.Value);
                        command.Parameters.AddWithValue("@values", (object)values ?? DBNull.Value);
                        command.Parameters.AddWithValue("@condition", (object)condition ?? DBNull.Value);

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
