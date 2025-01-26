﻿using Examination_System.controller;
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
    public partial class Assign_Instractors : Form
    {
        private Form _Home;
        private string _adminEmail;

        public Assign_Instractors(Form home, string adminEmail)
        {
            InitializeComponent();
            setDisabledItems();
            _Home = home;
            _adminEmail = adminEmail;

            TableData.getData("instructorView", "ins_name", search.Text, instractor_table);
            TableData.getData("Course", "crs_name", search.Text, course_table);
            //TableData.search("", "", search.Text, );
        }

        private void setDisabledItems()
        {
            search.Enabled = false;
        }

        private void setEnabledItems()
        {
            search.Enabled = true;
            search.Clear();
            search.Focus();
        }


        ////////////////////////////////////////////////////////////


        private void exit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void back_Click(object sender, EventArgs e)
        {
            this.Close();
            _Home.Visible = true;
        }

        private void instractor_rbtn_CheckedChanged(object sender, EventArgs e)
        {
            setEnabledItems();
        }

        private void course_rbtn_CheckedChanged(object sender, EventArgs e)
        {
            setEnabledItems();
        }

        private void search_TextChanged(object sender, EventArgs e)
        {
            if (instractor_rbtn.Checked)
                TableData.getData("instructorView", "ins_name", search.Text, instractor_table);
            else if (course_rbtn.Checked)
                TableData.getData("Course", "crs_name", search.Text, course_table);
        }

        private void assign_btn_Click(object sender, EventArgs e)
        {

        }

        private void unassign_btn_Click(object sender, EventArgs e)
        {

        }
    }
}
