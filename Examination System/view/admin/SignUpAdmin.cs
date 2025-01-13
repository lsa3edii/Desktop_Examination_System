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
        }

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

        }
    }
}
