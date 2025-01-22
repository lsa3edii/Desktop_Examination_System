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
