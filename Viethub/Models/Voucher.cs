//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Viethub.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Voucher
    {
        public int id { get; set; }
        public string name { get; set; }
        public string voucherpass { get; set; }
        public Nullable<int> value { get; set; }
        public Nullable<bool> hide { get; set; }
        public Nullable<System.DateTime> datebegin { get; set; }
    }
}