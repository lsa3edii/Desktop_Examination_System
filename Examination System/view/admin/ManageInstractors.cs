using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using System.Data.SqlClient;
using Examination_System.controller;

namespace Examination_System.view.admin
{
    public partial class ManageInstractors : Form
    {
        public ManageInstractors()
        {
            InitializeComponent();
            TableData.show("instructor", instractors_table);
        }

        private void exit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void back_Click(object sender, EventArgs e)
        {
            this.Close();
            new Home().Show();
        }

        private void insert_btn_Click(object sender, EventArgs e)
        {
            //using (SqlConnection connection = controller.DatabaseConnection.GetConnection())
            //{
            //    if (connection == null) 
            //        return;

            //    try
            //    {
            //        string query = "INSERT INTO Instructor(Ins_Id, Ins_Name, Ins_Degree, Salary, Dept_Id) VALUES (@Ins_Id, @Ins_Name, @Ins_Degree, @Salary, @Dept_Id);";

            //        using (SqlCommand command = new SqlCommand(query, connection))
            //        {
            //            command.Parameters.AddWithValue("@Ins_Id", 16);
            //            command.Parameters.AddWithValue("@Ins_Name", "Muhammed");
            //            command.Parameters.AddWithValue("@Ins_Degree", DBNull.Value);
            //            command.Parameters.AddWithValue("@Salary", DBNull.Value);
            //            command.Parameters.AddWithValue("@Dept_Id", 40);

            //            command.ExecuteNonQuery();

            //            MessageBox.Show("Insert Successful!", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
            //        }
            //    }
            //    catch (Exception ex)
            //    {
            //        MessageBox.Show($"Error: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //    }
            //}
        }

        private void update_btn_Click(object sender, EventArgs e)
        {
            
        }

        private void delete_btn_Click(object sender, EventArgs e)
        {

        }

        private void search_TextChanged(object sender, EventArgs e)
        {
            TableData.showAfterSearch("instructor", search.Text, instractors_table);
        }
    }
}
