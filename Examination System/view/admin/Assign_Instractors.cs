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
        public Assign_Instractors()
        {
            InitializeComponent();
            setDisabledItems();
        }

        private void setDisabledItems()
        {
            search.Enabled = false;
        }

        private void setEnabledItems()
        {
            search.Enabled = true;
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
            new Home().Show();
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

        }

        private void assign_btn_Click(object sender, EventArgs e)
        {

        }
    }
}
