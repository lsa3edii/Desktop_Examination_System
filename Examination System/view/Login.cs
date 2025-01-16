using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Examination_System.view
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();

            setDisabledItems();
            password.UseSystemPasswordChar = true;
        }

        private void setDisabledItems()
        {
            email.Enabled = false;
            password.Enabled = false;
            login_btn.Enabled = false;
            clear_btn.Enabled = false;
        }

        private void setEnabledItems()
        {
            email.Enabled = true;
            password.Enabled = true;
            login_btn.Enabled = true;
            clear_btn.Enabled = true;
        }


        ////////////////////////////////////////////////////////////


        private void exit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void admin_btn_Click(object sender, EventArgs e)
        {
            new Prompt(this).Show();
        }

        private void login_btn_Click(object sender, EventArgs e)
        {
            if(instractor_rbtn.Checked)
            {
                MessageBox.Show("Successfuly Login !!", "Message", MessageBoxButtons.OK, MessageBoxIcon.Information);
                
                this.Close();
                new instractor.Home().Show();
            }
            else if (student_rbtn.Checked)
            {
                MessageBox.Show("Successfuly Login !!", "Message", MessageBoxButtons.OK, MessageBoxIcon.Information);
                
                this.Close();
                new student.Home().Show();
            }
        }

        private void clear_btn_Click(object sender, EventArgs e)
        {
            email.Text = "";
            password.Text = "";
        }

        private void instractor_rbtn_CheckedChanged(object sender, EventArgs e)
        {
            setEnabledItems();
        }

        private void student_rbtn_CheckedChanged(object sender, EventArgs e)
        {
            setEnabledItems();
        }
    }
}
