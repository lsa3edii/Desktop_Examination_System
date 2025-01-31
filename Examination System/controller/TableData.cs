﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

using iTextSharp.text.pdf;
using iTextSharp.text;
using System.IO;

namespace Examination_System.controller
{
    internal abstract class TableData
    {
        public TableData() { }

        public static void getData(String tableName, string column, string searchText, DataGridView table)
        {
            using (SqlConnection connection = controller.DatabaseConnection.GetConnection())
            {
                if (connection == null)
                    return;

                try
                {
                    using (SqlCommand command = new SqlCommand("search", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.AddWithValue("@table", tableName);
                        command.Parameters.AddWithValue("@col", column);
                        command.Parameters.AddWithValue("@search_text", searchText);

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


        public static void fillComboBoxAndTable(Object obj, string stName, string paramName, int id)
        {
            try
            {
                using (SqlConnection connection = controller.DatabaseConnection.GetConnection())
                {
                    using (SqlCommand command = new SqlCommand(stName, connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue($"@{paramName}", id);

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (obj is ComboBox comboBox)
                            {
                                while (reader.Read())
                                    if (reader["CourseName"] != DBNull.Value)
                                        comboBox.Items.Add(reader["CourseName"].ToString());
                            }
                            else if (obj is DataGridView dataGridView)
                            {
                                var dataTable = new DataTable();
                                dataTable.Load(reader);
                                dataGridView.DataSource = dataTable;
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error: {ex.Message}", "Database Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }


        public static bool fillQuesTable(DataGridView table, string stName, int id, string crs_name)
        {
            try
            {
                using (SqlConnection connection = controller.DatabaseConnection.GetConnection())
                {
                    using (SqlCommand command = new SqlCommand(stName, connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("ins_id", id);
                        command.Parameters.AddWithValue("course_name", crs_name);

                        SqlParameter resultParam = new SqlParameter("@result", SqlDbType.Int)
                        {
                            Direction = ParameterDirection.Output
                        };
                        command.Parameters.Add(resultParam);


                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            var dataTable = new DataTable();
                            dataTable.Load(reader);
                            table.DataSource = dataTable;
                        }

                        int result = (int)resultParam.Value;
                        return result == 1;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error: {ex.Message}", "Database Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }


        public static void generateReport(DataGridView table, int flag)
        {
            SaveFileDialog sfd = new SaveFileDialog
            {
                Filter = "PDF file|*.pdf",
                FileName = flag == 1 ? "Students_Grades.pdf" :
                           flag == 2 ? "Pass_Percentage.pdf" : "Report.pdf"
            };

            if (sfd.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    using (FileStream fs = new FileStream(sfd.FileName, FileMode.Create, FileAccess.Write, FileShare.None))
                    {
                        Document document = new Document(PageSize.A4.Rotate()); // Landscape mode for better table display
                        PdfWriter writer = PdfWriter.GetInstance(document, fs);

                        document.Open();

                        // Title
                        iTextSharp.text.Font titleFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 18, BaseColor.BLACK);
                        Paragraph title = new Paragraph(
                            flag == 1 ? "Students Grades Report" :
                            flag == 2 ? "Pass Percentage Report" : "Report",
                        titleFont)
                        {
                            Alignment = Element.ALIGN_CENTER,
                            SpacingAfter = 20
                        };
                        document.Add(title);

                        // Subtitle (e.g., generation date)
                        iTextSharp.text.Font subtitleFont = FontFactory.GetFont(FontFactory.HELVETICA, 12, BaseColor.DARK_GRAY);
                        Paragraph subtitle = new Paragraph($"Generated on: {DateTime.Now.ToShortDateString()}", subtitleFont)
                        {
                            Alignment = Element.ALIGN_CENTER,
                            SpacingAfter = 20
                        };
                        document.Add(subtitle);

                        // Table
                        PdfPTable pdfTable = new PdfPTable(table.Columns.Count)
                        {
                            WidthPercentage = 100,
                            SpacingBefore = 10,
                            SpacingAfter = 10
                        };

                        // Table Header
                        foreach (DataGridViewColumn column in table.Columns)
                        {
                            PdfPCell headerCell = new PdfPCell(new Phrase(column.HeaderText, FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE)))
                            {
                                HorizontalAlignment = Element.ALIGN_CENTER,
                                BackgroundColor = new BaseColor(59, 89, 152), // Dark blue header
                                PaddingTop = 10f,
                                PaddingBottom = 10f,
                                PaddingLeft = 8f,
                                PaddingRight = 8f
                            };
                            pdfTable.AddCell(headerCell);
                        }

                        // Table Data
                        bool alternateRow = false;
                        foreach (DataGridViewRow row in table.Rows)
                        {
                            if (!row.IsNewRow)
                            {
                                foreach (DataGridViewCell cell in row.Cells)
                                {
                                    PdfPCell dataCell = new PdfPCell(new Phrase(cell.Value?.ToString() ?? "", FontFactory.GetFont(FontFactory.HELVETICA, 10)))
                                    {
                                        PaddingTop = 8f,
                                        PaddingBottom = 8f,
                                        PaddingLeft = 5f,
                                        PaddingRight = 5f,
                                        HorizontalAlignment = Element.ALIGN_CENTER,
                                        BackgroundColor = alternateRow ? new BaseColor(245, 245, 245) : BaseColor.WHITE // Alternating row colors
                                    };
                                    pdfTable.AddCell(dataCell);
                                }
                                alternateRow = !alternateRow; // Toggle row color
                            }
                        }

                        document.Add(pdfTable);

                        // Footer with Page Number
                        PdfPTable footerTable = new PdfPTable(1)
                        {
                            WidthPercentage = 100,
                            TotalWidth = document.PageSize.Width - document.LeftMargin - document.RightMargin
                        };
                        PdfPCell footerCell = new PdfPCell(new Phrase($"Page {writer.PageNumber}", FontFactory.GetFont(FontFactory.HELVETICA, 10)))
                        {
                            Border = Rectangle.NO_BORDER,
                            HorizontalAlignment = Element.ALIGN_CENTER
                        };
                        footerTable.AddCell(footerCell);
                        footerTable.WriteSelectedRows(0, -1, document.LeftMargin, document.BottomMargin, writer.DirectContent);

                        document.Close();
                        writer.Close();
                    }

                    MessageBox.Show("PDF Exported Successfully!", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Error: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }


        public static void PrintReports(string storedName, int param1, int param2 = 0)
        {
            SaveFileDialog sfd = new SaveFileDialog
            {
                Filter = "PDF file|*.pdf",
                FileName = $"{storedName}_Report.pdf"
            };

            if (sfd.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    using (SqlConnection connection = controller.DatabaseConnection.GetConnection())
                    {
                        using (SqlCommand cmd = new SqlCommand(storedName, connection))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;


                            switch (storedName)
                            {
                                case "GetStudentInfoByTracks":
                                    cmd.Parameters.AddWithValue("@TracktNo", param1);
                                    break;
                                case "GetStudentGrades":
                                    cmd.Parameters.AddWithValue("@stId", param1);
                                    break;
                                case "GetInsCourse":
                                    cmd.Parameters.AddWithValue("@insId", param1);
                                    break;
                                case "GetCourseTopics":
                                    cmd.Parameters.AddWithValue("@courseId", param1);
                                    break;
                                case "GetExamQuestionsAndChoices":
                                    cmd.Parameters.AddWithValue("@examId", param1);
                                    break;
                                case "GetStudentExamReport":
                                    cmd.Parameters.AddWithValue("@examId", param1);
                                    cmd.Parameters.AddWithValue("@studentId", param2);
                                    break;
                                default:
                                    throw new ArgumentException("Invalid stored procedure name.");
                            }

                            SqlDataAdapter da = new SqlDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            if (dt.Rows.Count == 0)
                            {
                                MessageBox.Show("No data found for the selected parameters.", "No Data", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                                return;
                            }

                            using (FileStream fs = new FileStream(sfd.FileName, FileMode.Create, FileAccess.Write, FileShare.None))
                            {
                                Document document = new Document(PageSize.A4.Rotate());
                                PdfWriter writer = PdfWriter.GetInstance(document, fs);
                                document.Open();

                                // Title
                                Font titleFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 18, BaseColor.BLACK);
                                Paragraph title = new Paragraph($"{storedName} Report", titleFont)
                                {
                                    Alignment = Element.ALIGN_CENTER,
                                    SpacingAfter = 20
                                };
                                document.Add(title);

                                // Subtitle
                                Font subtitleFont = FontFactory.GetFont(FontFactory.HELVETICA, 12, BaseColor.DARK_GRAY);
                                Paragraph subtitle = new Paragraph($"Generated on: {DateTime.Now.ToShortDateString()}", subtitleFont)
                                {
                                    Alignment = Element.ALIGN_CENTER,
                                    SpacingAfter = 20
                                };
                                document.Add(subtitle);

                                // Table
                                PdfPTable pdfTable = new PdfPTable(dt.Columns.Count)
                                {
                                    WidthPercentage = 100,
                                    SpacingBefore = 10,
                                    SpacingAfter = 10
                                };

                                // Table Header
                                foreach (DataColumn column in dt.Columns)
                                {
                                    PdfPCell headerCell = new PdfPCell(new Phrase(column.ColumnName, FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE)))
                                    {
                                        HorizontalAlignment = Element.ALIGN_CENTER,
                                        BackgroundColor = new BaseColor(59, 89, 152),
                                        Padding = 5
                                    };
                                    pdfTable.AddCell(headerCell);
                                }

                                // Table Data
                                bool alternateRow = false;
                                foreach (DataRow row in dt.Rows)
                                {
                                    foreach (var cell in row.ItemArray)
                                    {
                                        PdfPCell dataCell = new PdfPCell(new Phrase(cell?.ToString() ?? "", FontFactory.GetFont(FontFactory.HELVETICA, 10)))
                                        {
                                            Padding = 5,
                                            HorizontalAlignment = Element.ALIGN_CENTER,
                                            BackgroundColor = alternateRow ? new BaseColor(245, 245, 245) : BaseColor.WHITE
                                        };
                                        pdfTable.AddCell(dataCell);
                                    }
                                    alternateRow = !alternateRow;
                                }

                                document.Add(pdfTable);

                                // Footer with Page Number
                                PdfPTable footerTable = new PdfPTable(1)
                                {
                                    WidthPercentage = 100,
                                    TotalWidth = document.PageSize.Width - document.LeftMargin - document.RightMargin
                                };
                                PdfPCell footerCell = new PdfPCell(new Phrase($"Page {writer.PageNumber}", FontFactory.GetFont(FontFactory.HELVETICA, 10)))
                                {
                                    Border = Rectangle.NO_BORDER,
                                    HorizontalAlignment = Element.ALIGN_CENTER
                                };
                                footerTable.AddCell(footerCell);
                                footerTable.WriteSelectedRows(0, -1, document.LeftMargin, document.BottomMargin, writer.DirectContent);

                                document.Close();
                                writer.Close();
                            }

                            MessageBox.Show("PDF generated successfully!", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Error: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        public static void PrintFreeformReport(string storedName, int examId, int studentId)
        {
            SaveFileDialog sfd = new SaveFileDialog
            {
                Filter = "PDF file|*.pdf",
                FileName = $"StudentExamReport_Exam{examId}_Student{studentId}.pdf"
            };

            if (sfd.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    using (SqlConnection connection = controller.DatabaseConnection.GetConnection())
                    {
                        using (SqlCommand cmd = new SqlCommand(storedName, connection))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@examId", examId);
                            cmd.Parameters.AddWithValue("@studentId", studentId);

                            SqlDataAdapter da = new SqlDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            if (dt.Rows.Count == 0)
                            {
                                MessageBox.Show("No data found for the selected exam and student.", "No Data", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                                return;
                            }

                            using (FileStream fs = new FileStream(sfd.FileName, FileMode.Create, FileAccess.Write, FileShare.None))
                            {
                                Document document = new Document(PageSize.A4, 40, 40, 50, 50);
                                PdfWriter writer = PdfWriter.GetInstance(document, fs);
                                document.Open();

                                // Title Styling
                                Font titleFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 18, new BaseColor(0, 51, 153)); // Dark Blue
                                Paragraph title = new Paragraph($"📘 Student Exam Report", titleFont)
                                {
                                    Alignment = Element.ALIGN_CENTER,
                                    SpacingAfter = 10
                                };
                                document.Add(title);

                                // Subtitle Styling
                                string examName = dt.Rows[0]["ExamName"].ToString();
                                Font subtitleFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 14, new BaseColor(80, 80, 80)); // Dark Gray
                                Paragraph subtitle = new Paragraph($"Exam: {examName} (ID: {examId})", subtitleFont)
                                {
                                    Alignment = Element.ALIGN_CENTER,
                                    SpacingAfter = 20
                                };
                                document.Add(subtitle);

                                // Loop through Questions
                                Font questionFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK);
                                Font answerFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, new BaseColor(0, 102, 204)); // Blue
                                Font noAnswerFont = FontFactory.GetFont(FontFactory.HELVETICA_OBLIQUE, 12, BaseColor.RED); // Red Italic for no answer

                                int questionNumber = 1;
                                foreach (DataRow row in dt.Rows)
                                {
                                    string questionText = row["QuestionText"].ToString();
                                    string studentAnswer = row["StudentAnswer"] != DBNull.Value ? row["StudentAnswer"].ToString() : "(No Answer)";

                                    // Background color for the question
                                    PdfPTable questionTable = new PdfPTable(1);
                                    questionTable.WidthPercentage = 100;
                                    PdfPCell questionCell = new PdfPCell(new Phrase($"{questionNumber}) {questionText}", questionFont))
                                    {
                                        BackgroundColor = new BaseColor(230, 230, 230), // Light Gray
                                        Padding = 8,
                                        Border = Rectangle.NO_BORDER
                                    };
                                    questionTable.AddCell(questionCell);
                                    document.Add(questionTable);

                                    // Answer Styling
                                    Paragraph answer = new Paragraph("Answer: ", answerFont)
                                    {
                                        IndentationLeft = 20,
                                        SpacingBefore = 5
                                    };
                                    document.Add(answer);

                                    Paragraph answerText = new Paragraph(studentAnswer, studentAnswer == "(No Answer)" ? noAnswerFont : answerFont)
                                    {
                                        IndentationLeft = 40,
                                        SpacingAfter = 10
                                    };
                                    document.Add(answerText);

                                    questionNumber++;
                                }

                                document.Close();
                                writer.Close();
                            }

                            MessageBox.Show("PDF generated successfully!", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        }
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

