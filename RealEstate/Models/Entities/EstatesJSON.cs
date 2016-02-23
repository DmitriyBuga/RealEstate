using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstate.Models.Entities
{
    public class UsersJSON
    {
        public int id;
        public string name;
    }
    public class CitiesJSON
    {
        public int id;
        public string name;
    }
    public class RegionsJSON
    {
        public int id;
        public string name;
    }
    public class EstatesJSON
    {
        public int id { get; set; }
        public string city { get; set; }
        public string street { get; set; }
        public Nullable<int> floors { get; set; }
        public Nullable<int> floor { get; set; }
        public Nullable<int> rooms { get; set; }
        public Nullable<float> square { get; set; }
        public Nullable<float> type_op { get; set; }
        public Nullable<float> price { get; set; }
        public string user_name { get; set; }
        public string name_op { get; set; }
        public int user_id { get; set; }
        public int? city_id { get; set; }

    }
}