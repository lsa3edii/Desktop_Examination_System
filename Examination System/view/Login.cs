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
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }

        private void exit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void admin_btn_Click(object sender, EventArgs e)
        {
            new admin.LoginAdmin().Show();
            this.Close();
        }

        private void login_btn_Click(object sender, EventArgs e)
        {

        }

        private void clear_btn_Click(object sender, EventArgs e)
        {

        }
    }
}
