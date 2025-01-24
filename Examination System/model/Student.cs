using Examination_System.model;
using System;

namespace Examination_System.Model
{
    public enum Gender
    {
        Male,
        Female
    }

    internal class Student : User
    {
        private string phone;
        private string address;
        private Gender gender;
        private DateTime birthDate;
        private int trackId;
        private int adminId;

        public Student( ) { } 

        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }

        public string Address
        {
            get { return address; }
            set { address = value; }
        }

        public Gender Gender
        {
            get { return gender; }
            set { gender = value; }
        }

        public DateTime BirthDate
        {
            get { return birthDate; }
            set { birthDate = value; }
        }

        public int TrackId
        {
            get { return trackId; }
            set { trackId = value; }
        }

        public int AdminId
        {
            get { return adminId; }
            set { adminId = value; }
        }
    }

}
