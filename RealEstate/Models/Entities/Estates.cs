using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RealEstate.Models
{
    public partial class _Estates
    {
        public SelectList listUser { get; set; }
        public SelectList listRegion { get; set; }
        public SelectList listCity { get; set; }
    }
}