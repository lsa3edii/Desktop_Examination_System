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
    public partial class LoginAdmin : Form
    {
        public LoginAdmin()
        {
            InitializeComponent();

            setDisabledItems();
            password.UseSystemPasswordChar = true;
        }

        private void setDisabledItems()
        {
            login_btn.Enabled = false;
            clear_btn.Enabled = false;
        }

        private void setEnabledItems()
        {
            login_btn.Enabled = true;
            clear_btn.Enabled = true;
        }

        private void inputTextChange()
        {
            if (email.Text.Equals("") || password.Text.Equals(""))
                setDisabledItems();
            else
                setEnabledItems();
        }

        ////////////////////////////////////////////////////////////


        private void exit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void back_Click(object sender, EventArgs e)
        {
            new Login().Show();
            this.Close();
        }

        private void signup_btn_Click(object sender, EventArgs e)
        {
            new SignUpAdmin().Show();
            this.Close();
        }

        private void login_btn_Click(object sender, EventArgs e)
        {
            if (true) ///
            {
                MessageBox.Show("Successfuly Login !!", "Message", MessageBoxButtons.OK, MessageBoxIcon.Information);

                new admin.Home(email.Text).Show();
                this.Close();
            }
        }

        private void clear_btn_Click(object sender, EventArgs e)
        {
            email.Text = "";
            password.Text = "";
        }

        private void email_TextChanged(object sender, EventArgs e)
        {
            inputTextChange();
        }

        private void password_TextChanged(object sender, EventArgs e)
        {
            inputTextChange();
        }
    }
}
