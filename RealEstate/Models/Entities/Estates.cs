using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RealEstate.Models
{
    public partial class Estates
    {
        public SelectList listUser { get; set; }
        public string lastImagePath { get; set; }
    }
}