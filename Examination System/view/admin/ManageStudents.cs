using Examination_System.controller;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Examination_System.view.admin
{
    public partial class ManageStudents : Form
    {
        private Form _Home;

        public ManageStudents(Form home)
        {
            InitializeComponent();
            TableData.show("student", students_table);
            _Home = home;
        }

        private void exit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void back_Click(object sender, EventArgs e)
        {
            this.Close();
            _Home.Visible = true;
        }

        private void insert_btn_Click(object sender, EventArgs e)
        {

        }

        private void update_btn_Click(object sender, EventArgs e)
        {

        }

        private void delete_btn_Click(object sender, EventArgs e)
        {

        }

        private void search_TextChanged(object sender, EventArgs e)
        {
            TableData.showAfterSearch("student", search.Text, students_table);
        }
    }
}
