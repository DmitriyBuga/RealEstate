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
        public List<CommonDirJSON> users { get; set; }
        public List<CommonDirJSON> regions { get; set; }
        public List<CommonDirJSON> cities{ get; set; }
        public List<CommonDirJSON> floors { get; set; }
        public List<CommonDirJSON> rooms { get; set; }
    }
}