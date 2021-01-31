//
//  DemoDatas.swift
//  RMartApp
//
//  Created by RMart on 1/20/21.
//

import Foundation
open class DemoDatas{
    
    static let topCategoryName: [String] = ["FLOURS","OILS","BISCUTS","VEGITABLES","FRUITS","PERSONAL CARE","KIDS WEAR","WOMENS WEAR","MENS WEAR"]
    static let topCategoryThumb : [String] = ["flours","oils","biscuts","vegitables","fruits1","personal_care","kids_wear","womens_wear","mens_wear"]
}

struct TopDeals : Identifiable{
    var id = UUID()
    var productName: String?
    var productOffer: String?
    var productAPrice: String?
    var productCPrice: String?
    var productSPrice:String?
    var productImage:String?
    static var topDeals:[TopDeals] {
        [TopDeals(productName: "Diet Coke 300ml", productOffer: "5%", productAPrice: "40.00", productCPrice: "35.00", productSPrice: "5.00",productImage:"0"),
         TopDeals( productName: "Fortune Health Physically Refined Oil 5L", productOffer: "5%", productAPrice: "1190.00", productCPrice: "900.00", productSPrice: "290.00",productImage:"0"),
         TopDeals( productName: "Tropicana Mixed Fruit Delight 300ml", productOffer: "5%", productAPrice: "110.00", productCPrice: "90.00", productSPrice: "20.00",productImage:"0"),
         TopDeals( productName: "Pringles Original Potato Crisps 300gm", productOffer: "5%", productAPrice: "40.00", productCPrice: "35.00", productSPrice: "5.00",productImage:"0"),
         TopDeals( productName: "Bingo Yumitos Salt Potato Chips", productOffer: "5%", productAPrice: "50.00", productCPrice: "40.00", productSPrice: "10.00",productImage:"0"),
         TopDeals( productName: "Bingo Yumitos Masti Mad Angles", productOffer: "5%", productAPrice: "40.00", productCPrice: "30.00", productSPrice: "10.00",productImage:"0"),
         TopDeals( productName: "Kinley Soda 750ml", productOffer: "5%", productAPrice: "20.00", productCPrice: "15.00", productSPrice: "5.00",productImage:"0"),
         TopDeals( productName: "Bisleri Packaged Driniking Water 300ml", productOffer: "5%", productAPrice: "20.00", productCPrice: "18.00", productSPrice: "2.00",productImage:"0"),
         TopDeals( productName: "Bisleri Soda 300ml", productOffer: "5%", productAPrice: "20.00", productCPrice: "18.00", productSPrice: "2.00",productImage:"0"),
         TopDeals( productName: "Knorr Classic Thick Tomato Soup 300ml", productOffer: "5%", productAPrice: "40.00", productCPrice: "35.00", productSPrice: "5.00",productImage:"0"),
         TopDeals( productName: "Borges Fusili Pasta 500g", productOffer: "5%", productAPrice: "40.00", productCPrice: "35.00", productSPrice: "5.00",productImage:"0"),
         TopDeals( productName: "Amul Pasteurised Butter 500g", productOffer: "5%", productAPrice: "235.00", productCPrice: "227.00", productSPrice: "7.00",productImage:"0")
        ]
    }
}


struct ShopGrocery:Identifiable
{
    var id = UUID()
    var productName: String?
    var productImage:String?
    static var shopGrocery:[ShopGrocery] {
        [ShopGrocery(productName: "Honey Products", productImage:"sc1"),
         ShopGrocery(productName: "Sugar Products", productImage:"sc2"),
         ShopGrocery(productName: "Dals Products", productImage:"sc3"),
         ShopGrocery(productName: "Rice Bags", productImage:"sc4"),
         ShopGrocery(productName: "Grocery Items", productImage:"sc5"),
         ShopGrocery(productName: "Rices & Noodles", productImage:"sc6"),
         ShopGrocery(productName: "Creamy & Sauce", productImage:"sc7"),
         ShopGrocery(productName: "Chilli Products", productImage:"sc8")]
    }
}

struct BestDeals:Identifiable
{
    var id = UUID()
    var productName: String?
    var productImage:String?
    static var bestDeals:[BestDeals] {
        [BestDeals(productName: "Rice Grocery", productImage:"bd1"),
         BestDeals(productName: "Breads & Cakes", productImage:"bd2"),
         BestDeals(productName: "Sugar & Sweetner", productImage:"bd3"),
         BestDeals(productName: "Masala Powders", productImage:"bd4"),
         BestDeals(productName: "Napkins for All", productImage:"bd5"),
         BestDeals(productName: "Tooth Paste & Brush", productImage:"bd6"),
         BestDeals(productName: "Diet Coke 300ml", productImage:"bd7"),
         BestDeals(productName: "Diet Coke 300ml", productImage:"bd8")]
    }
}

struct ExclusiveDeals:Identifiable
{
    var id = UUID()
    var productName: String?
    var productImage:String?
    static var exclusiveDeals:[ExclusiveDeals] {
        [ExclusiveDeals(productName: "Best Oils", productImage:"ed1"),
         ExclusiveDeals(productName: "Basic Grocerys", productImage:"ed2"),
         ExclusiveDeals(productName: "Milks", productImage:"ed3"),
         ExclusiveDeals(productName: "Coconuts Products", productImage:"ed4"),
         ExclusiveDeals(productName: "Cleaning Products", productImage:"ed5"),
         ExclusiveDeals(productName: "Dals & Nuts", productImage:"ed6"),
         ExclusiveDeals(productName: "Diet Coke 300ml", productImage:"0"),
         ExclusiveDeals(productName: "Diet Coke 300ml", productImage:"0")]
    }
}


struct TopDealsGallery:Identifiable
{
    var id = UUID()
    var productName: String?
    var productImage:String?
    static var topdealgallery:[TopDealsGallery] {
        [TopDealsGallery(productName: "Oils & Flours", productImage:"td1"),
         TopDealsGallery(productName: "Washing Items", productImage:"td2"),
         TopDealsGallery(productName: "Cleaning Products", productImage:"td3"),
         TopDealsGallery(productName: "Shampoo & Toothpaste", productImage:"td4"),
         TopDealsGallery(productName: "Brand oils", productImage:"td5"),
         TopDealsGallery(productName: "Mens Beard Oil", productImage:"td6"),
         TopDealsGallery(productName: "Diet Coke 300ml", productImage:"0"),
         TopDealsGallery(productName: "Diet Coke 300ml", productImage:"0")]
    }
}

struct PampletTitle:Identifiable
{
    var id = UUID()
    var title: String?
    static var pamptitles:[PampletTitle] {
        [PampletTitle(title: "HOME CHEF SUPER DEALS"),
         PampletTitle(title: "SPARKLING CLEANING DEALS"),
         PampletTitle(title: "HOUSE HOLDS"),
         PampletTitle(title: "PERSONAL CARE SUPER DEALS"),
         PampletTitle(title: "BEAUTY BARGAINS"),
         PampletTitle(title: "COOKING ESSENTIALS")]
    }
}
