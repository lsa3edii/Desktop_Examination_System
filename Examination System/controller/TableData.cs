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


        public static void fillComboBox(ComboBox combobox)
        {
            try
            {
                using (SqlConnection connection = controller.DatabaseConnection.GetConnection())
                {
                    string query = "select Crs_Name from Course";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                            while (reader.Read())
                                if (reader["Crs_Name"] != DBNull.Value)
                                    combobox.Items.Add(reader["Crs_Name"].ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error: {ex.Message}", "Database Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        public static void generateReport(DataGridView table)
        {
            SaveFileDialog sfd = new SaveFileDialog
            {
                Filter = "PDF file|*.pdf",
                FileName = "Students_Grades.pdf"
            };


            if (sfd.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    using (FileStream fs = new FileStream(sfd.FileName, FileMode.Create, FileAccess.Write, FileShare.None))
                    {
                        Document document = new Document();
                        PdfWriter writer = PdfWriter.GetInstance(document, fs);

                        document.Open();


                        iTextSharp.text.Font titleFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 16);
                        Paragraph title = new Paragraph("Students Grades", titleFont)
                        {
                            Alignment = Element.ALIGN_CENTER
                        };

                        document.Add(title);
                        document.Add(new Paragraph("\n"));

                        PdfPTable pdfTable = new PdfPTable(table.Columns.Count);

                        foreach (DataGridViewColumn column in table.Columns)
                        {
                            PdfPCell headerCell = new PdfPCell(new Phrase(column.HeaderText))
                            {
                                HorizontalAlignment = Element.ALIGN_CENTER,
                                BackgroundColor = new BaseColor(192, 192, 192)
                            };

                            pdfTable.AddCell(headerCell);
                        }

                        foreach (DataGridViewRow row in table.Rows)
                        {
                            if (!row.IsNewRow)
                            {
                                foreach (DataGridViewCell cell in row.Cells)
                                {
                                    pdfTable.AddCell(new Phrase(cell.Value?.ToString() ?? ""));
                                }
                            }
                        }

                        document.Add(pdfTable);

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


    }
}
