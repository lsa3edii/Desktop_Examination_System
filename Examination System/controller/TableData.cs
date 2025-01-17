using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace Examination_System.controller
{
    internal class TableData
    {

        public TableData() { }

        public static void show(String tableName, DataGridView table)
        {
            string query = "select * from " + tableName;
            getData(query, table);
        }


        public static void showAfterSearch(String tableName, string search, DataGridView table)
        {
            string query = "select * from " + tableName + " where st_fname like '%" + search + "%'";
            getData(query, table);
        }


        private static void getData(String query, DataGridView table)
        {
            using (SqlConnection connection = controller.DatabaseConnection.GetConnection())
            {
                if (connection == null)
                    return;

                try
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable dataTable = new DataTable();

                        adapter.Fill(dataTable);
                        table.DataSource = dataTable;
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Error: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

            }
        }

    }
}
