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
    public partial class Home : Form
    {
        public Home()
        {
            InitializeComponent();
        }

        private void exit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void logout_btn_Click(object sender, EventArgs e)
        {
            this.Close();
            new LoginAdmin().Show();
        }

        private void info_btn_Click(object sender, EventArgs e)
        {
            this.Close();
            new Information().Show();
        }

        private void instractor_btn_Click(object sender, EventArgs e)
        {
            this.Close();
            new ManageInstractors().Show();
        }

        private void student_btn_Click(object sender, EventArgs e)
        {
            this.Close();
            new ManageStudents().Show();
        }
    }
}
