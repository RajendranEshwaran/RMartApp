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
