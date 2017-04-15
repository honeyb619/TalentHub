using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TalentSearchWebApp.Models
{
    public class CustomEmailFormat
    {
        public List<Candidate> candidateList { get; set; }
    }

    public class Candidate
    {
        public string profilePicPath { get; set; }
        public long ProfileId { get; set; }
        public string CandidateName { get; set; }
        public string RegionName { get; set; }
    }

}