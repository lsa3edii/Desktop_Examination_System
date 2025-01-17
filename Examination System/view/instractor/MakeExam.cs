using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace Examination_System.view.instractor
{
    public partial class MakeExam : Form
    {
        public MakeExam()
        {
            InitializeComponent();
            setDisabledItems();
        }

        private void setDisabledItems()
        {
            question.Enabled = false;
            option_a.Enabled = false;
            option_b.Enabled = false;
            option_c.Enabled = false;
            option_d.Enabled = false;
        }

        private void setDisabledItems2()
        {
            option_a.Enabled = false;
            option_b.Enabled = false;
            option_c.Enabled = false;
            option_d.Enabled = false;
        }

        private void setEnabledItems()
        {
            question.Enabled = true;
            option_a.Enabled = true;
            option_b.Enabled = true;
            option_c.Enabled = true;
            option_d.Enabled = true;
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

        private void quesion_no_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (question_no.Text != string.Empty && question_type.Text != string.Empty)
            {
                setEnabledItems();
                if (question_type.Text == "TF")
                {
                    setDisabledItems2();
                    option_a.Text = "True";
                    option_b.Text = "False";
                }
                else
                {
                    option_a.Text = "";
                    option_b.Text = "";
                }
            }
            else
                setDisabledItems();
        }

        private void question_type_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (question_no.Text != string.Empty && question_type.Text != string.Empty)
            {
                setEnabledItems();
                if (question_type.Text == "TF")
                {
                    setDisabledItems2();
                    option_a.Text = "True";
                    option_b.Text = "False";
                }
                else
                {
                    option_a.Text = "";
                    option_b.Text = "";
                }
            }
            else
                setDisabledItems();
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
    }
}
