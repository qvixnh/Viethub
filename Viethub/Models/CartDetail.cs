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
    
    public partial class CartDetail
    {
        public string userid { get; set; }
        public int ProductID { get; set; }
        public int Quantity { get; set; }
        public int Price { get; set; }
    
        public virtual Dish Dish { get; set; }
        public virtual UserAccount UserAccount { get; set; }
    }
}
