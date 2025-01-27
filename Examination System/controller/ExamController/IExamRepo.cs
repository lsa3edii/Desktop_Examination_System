﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Examination_System.Controller
{
    internal interface IExamRepo
    {
        DataTable GetExamData(int ssn, string course_name);
        void CorrectExam(int ssn, int exam_id);
        int GetExamID(string table, string examName);
    }
}
