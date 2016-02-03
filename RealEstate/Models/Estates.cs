//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RealEstate.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Estates
    {
        public int id { get; set; }
        public int cust_id { get; set; }
        public int user_id { get; set; }
        public int manager_id { get; set; }
        public Nullable<int> type_op { get; set; }
        public Nullable<int> type_estate { get; set; }
        public string descr { get; set; }
        public Nullable<int> floors { get; set; }
        public Nullable<int> floor { get; set; }
        public Nullable<int> rooms { get; set; }
        public Nullable<float> square { get; set; }
        public Nullable<float> price { get; set; }
        public string region { get; set; }
        public string city { get; set; }
        public string district { get; set; }
        public string street { get; set; }
        public string building { get; set; }
        public string apt { get; set; }
        public Nullable<int> city_id { get; set; }
        public Nullable<int> region_id { get; set; }
        public Nullable<System.DateTime> datainput { get; set; }
        public Nullable<System.DateTime> dstart { get; set; }
        public Nullable<System.DateTime> dend { get; set; }
        public Nullable<bool> isempty { get; set; }
    
        public virtual Users Users { get; set; }
    }
}
