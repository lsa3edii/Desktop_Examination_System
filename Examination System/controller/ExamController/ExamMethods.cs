using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Examination_System.Controller
{
    internal class ExamMethods : IExamRepo
    {
        public ExamMethods() { }

        public DataTable GetExamData(int ssn, string course_name)
        {
            DataTable examData = new DataTable();

            using (SqlConnection connection = controller.DatabaseConnection.GetConnection())
            {
                if (connection == null)
                    return null;

                try
                {
                    using (SqlCommand command = new SqlCommand("GetRandomExamQuestions", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.AddWithValue("@ssn", ssn);
                        command.Parameters.AddWithValue("@course_name", course_name);

                        //connection.Open();
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            adapter.Fill(examData);
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Error: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }

            return examData;
        }


        public void CorrectExam(int ssn, int exam_id)
        {
            using (SqlConnection connection = controller.DatabaseConnection.GetConnection())
            {
                if (connection == null)
                    return;

                try
                {
                    using (SqlCommand command = new SqlCommand("Exam_Correction", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.AddWithValue("@st_id", ssn);
                        command.Parameters.AddWithValue("@exam_id", exam_id);
                       
                        command.ExecuteNonQuery();
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Error: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }


        public int GetExamID(string table, string examName)
        {
            using (SqlConnection connection = controller.DatabaseConnection.GetConnection())
            {
                if (connection == null)
                    throw new Exception("Database connection failed.");

                try
                {
                    using (SqlCommand command = new SqlCommand("get_id", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@table", table);
                        command.Parameters.AddWithValue("@Email", examName);

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

    }
}
