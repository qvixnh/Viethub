using AngleSharp.Html;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Viethub.Help;
using Viethub.Models;

namespace Viethub.Controllers
{
    public class CartController : Controller
    {
        ViethubEntities _db = new ViethubEntities();
        
        string _id = "1001";//user id mặc định
        // GET: Cart
        public int  Shipment(String address)
        {
            if(address == null)
            {
                return 0;
            }else if(address == "HCM")
            {
                return 10;
            }
            return 20;
        }
        public ActionResult Index()
        {
            //lay user id để duyệt cart details
            _id = (string) Session["UserId"];
            
            var v = from t in _db.CartDetails
                    where t.userid == _id
                    select t;
            return View(v.ToList());
        }
public ActionResult Checkout()
{
    // Get all cart detail items for the current user
    List<CartDetail> cartDetails = _db.CartDetails.Where(d => d.userid == _id).ToList();
    UserAccount user = _db.UserAccounts.FirstOrDefault(d => d.id == _id);

    // Calculate the total price of all cart detail items
    decimal subTotalPrice = cartDetails.Sum(d => d.Price * d.Quantity);

    // Retrieve the voucher value from TempData and store it in ViewBag
    int? voucher = TempData["voucher"] as int?;
    ViewBag.voucher = 0;
    int vouc = 0;
    if (voucher != null)
    {
        ViewBag.voucher = voucher;
        vouc = (int)voucher;
    }
    // Clear the TempData value
    TempData.Remove("voucher");

    // Pass the cart details and total price to the view
    ViewBag.CartDetails = cartDetails;
    ViewBag.SubTotalPrice = subTotalPrice;
    int ship= Shipment(user.address);
    ViewBag.Shipment = Shipment(user.address);
    int total = (int)(ship + subTotalPrice - vouc);
    ViewBag.Total = total;
    var v = from t in _db.UserAccounts
            where t.id == _id
            select t;
    return PartialView(v.FirstOrDefault());
}
        public ActionResult getDishByDishID(int id)
        {
            if (id == null)
            {
                id = 1;
            }
            var v = from t in _db.Dishes
                    where t.hide == false && t.id == id
                    orderby t.order ascending
                    select t;
            return PartialView(v.FirstOrDefault());
        
        }
        public ActionResult addToCart(int? DishID)
        {
            if (DishID == null)
            {
                return RedirectToAction("Index", "VhMenu");
            }
            Dish dish = _db.Dishes.FirstOrDefault(d => d.id == DishID);
            // Check if the dish exists
            if (dish == null)
            {
                // If the dish does not exist, return an error message
                TempData["Error"] = "Invalid Dish ID";
                return RedirectToAction("Index", "Home");
            }

            // Create a new CartDetail object and populate its properties
            CartDetail detail = new CartDetail();
            detail.userid = _id;
            detail.ProductID = dish.id;
            detail.Price = (int)dish.price;
            detail.Quantity = 1;

            // Add the CartDetail object to the database and save changes
            _db.CartDetails.Add(detail);
            _db.SaveChanges();

            // Redirect the user to the shopping cart page
            return RedirectToAction("Index", "Cart");
        }
        //sub total
[HttpPost]
public ActionResult getVoucher(String voucher){
    Voucher vouc = _db.Vouchers.FirstOrDefault(d => d.voucherpass== voucher);
    if(vouc != null)
    {
        int getvou = (int)vouc.value;
        TempData["voucher"] = getvou;
        return RedirectToAction("Checkout");
    }
    return RedirectToAction("Index");
}

    }
}