using RealEstate.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstate.Models
{
    public class TableModel
    {
        public List<EstatesJSON> estates { get; set; }
        public List<UsersJSON> users { get; set; }
        public List<RegionsJSON> regions { get; set; }
        public List<CitiesJSON> cities{ get; set; }
    }
}