using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Security.Policy;
using System.Windows.Forms;

namespace Examination_System.controller
{
    internal class DatabaseConnection
    {
        private static string connectionString = @"Data Source=LSA3EDII\SQLEXPRESS;Initial Catalog=ITI;Integrated Security=True;";

        public DatabaseConnection() { }
    
        public static SqlConnection GetConnection()
        {
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();

                return connection;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error!!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return null;
            }
            //finally
            //{
            //    connection.Close();
            //}
        }
    }
}
