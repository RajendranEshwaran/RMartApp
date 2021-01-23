//
//  Settings.swift
//  RMart
//
//  Created by RMart on 12/24/20.
//

import Foundation
import Combine
import SwiftUI
import CoreData

class Settings: ObservableObject{
    
    @Published var homeToggle:Bool = false
    @Published var showMenu = false
    @Published var showSign:Bool = false
    @Published var showWallet:Bool = false
    @Published var showAllOffers:Bool = false
    @Published var showCustomerService:Bool = false
    @Published var showGuide:Bool = false
    @Published var showMyOrders:Bool = false
    @Published var showMySubscription:Bool = false
    @Published var showShopCategory:Bool = false
    @Published var showLocation:Bool = false
    @Published var showSearchWindow:Bool = false
    @Published var showMyAccount:Bool = false
    @Published var showProfileEdit:Bool = false
    @Published var showProductCat:Bool = false
    @Published var showTopDealListView:Bool = false
    @Published var index:Int = 0
    @Published var categoryArray: [String] = ["All Categories","Bevarages","Grocery","Dairy & Backery","Veggies","Fruits","Meat","Clean Ups","Stationaries","Personal Care","Fashion","Jewlerry","Kids Wear","Womens Wear","Mens Wear","Pets"]
    @Published var categoryIconsArray: [String] = ["category3","beverages","grocery","dairy-products","vegetable","fruits-1","meat","cleaning","stationary","personal-care","fashion","jewelry","baby-clothes","woman-clothes","men-fashion","pets"]
    
    @Published var isSigned : Bool = false
    
    @Published var firstName : String = ""
    @Published var lastName : String = ""
    @Published var gender : String = ""
    @Published var dob : Date?
    @Published var phoneNumber : String = ""
    @Published var emailId : String?
    @Published var pinCode : String = ""
    @Published var userName : String = "UserName"
    
    // MARK:- Card product details
    @Published var selectedProductCount:Int = 0
    
}

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}

