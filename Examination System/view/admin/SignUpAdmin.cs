using Examination_System.view.admin;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Examination_System.view
{
    public partial class SignUpAdmin : Form
    {
        public SignUpAdmin()
        {
            InitializeComponent();

            setDisabledItems();
            password.UseSystemPasswordChar = true;
            confirmPassword.UseSystemPasswordChar = true;
        }

        private void setDisabledItems()
        {
            createAcc_btn.Enabled = false;
            clear_btn.Enabled = false;
        }

        private void setEnabledItems()
        {
            createAcc_btn.Enabled = true;
            clear_btn.Enabled = true;
        }


        ////////////////////////////////////////////////////////////
        

        private void exit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void back_Click(object sender, EventArgs e)
        {
            new LoginAdmin().Show();
            this.Close(); 
        }

        private void clear_btn_Click(object sender, EventArgs e)
        {
            username.Text = "";
            email.Text = "";
            password.Text = "";
            confirmPassword.Text = "";
        }

        private void username_TextChanged(object sender, EventArgs e)
        {
            if (username.Text.Equals("") || email.Text.Equals("") ||
                password.Text.Equals("") || confirmPassword.Text.Equals(""))
                setDisabledItems();
            else
                setEnabledItems();
        }

        private void email_TextChanged(object sender, EventArgs e)
        {
            if (username.Text.Equals("") || email.Text.Equals("") ||
                password.Text.Equals("") || confirmPassword.Text.Equals(""))
                setDisabledItems();
            else
                setEnabledItems();
        }

        private void password_TextChanged(object sender, EventArgs e)
        {
            if (username.Text.Equals("") || email.Text.Equals("") || 
                password.Text.Equals("") || confirmPassword.Text.Equals(""))
                setDisabledItems();
            else
                setEnabledItems();
        }

        private void confirmPassword_TextChanged(object sender, EventArgs e)
        {
            if (username.Text.Equals("") || email.Text.Equals("") ||
                password.Text.Equals("") || confirmPassword.Text.Equals(""))
                setDisabledItems();
            else
                setEnabledItems();
        }

        private void createAcc_btn_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Account Successfuly Created !!", "Message", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
    }
}
