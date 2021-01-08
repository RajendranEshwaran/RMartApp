//
//  Settings.swift
//  RMart
//
//  Created by RMart on 12/24/20.
//

import Foundation

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
    @Published var showSearchWindow = false
    @Published var categoryArray: [String] = ["All Categories","Bevarages","Snacks","Grocery","Dairy & Backery","Veggies","Fruits","Frozen Foods","NonVeg","Canned Foods","Baking Foods","Clean Ups","Stationaries","Personal Care","Fashion","Jewlerry","Kids Wear","Womens Wear","Mens Wear","Pets"]
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
