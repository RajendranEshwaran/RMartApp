//
//  ViewModels.swift
//  RMartApp
//
//  Created by RMart on 1/16/21.
//

import Foundation
import SwiftUI
import Combine

struct UserProfileDataViewModel {
    var id: UUID?
    var firstName: String?
    var lastName: String?
    var gender:String?
    var dob: Date?
    var phoneNumber:String
    var emailId:String?
    var pinCode:String?
    init(id: UUID, fname: String?,lname:String?,gender:String?,dob:Date?,phoneNumber:String,emailId:String?,pinCode:String?) {
        self.id = id
        self.firstName  = fname
        self.lastName = lname
        self.gender = gender
        self.dob = dob
        self.phoneNumber = phoneNumber
        self.emailId = emailId
        self.pinCode = pinCode
    }
    
    init(userProfileData: UserDataEntity) {
        self.id = userProfileData.id ?? UUID()
        self.firstName = userProfileData.firstName ?? ""
        self.lastName = userProfileData.lastName ?? ""
        self.gender = userProfileData.gender ?? ""
        self.dob = userProfileData.dob ?? Date()
        self.phoneNumber = userProfileData.phoneNumber ?? ""
        self.emailId = userProfileData.emailId ?? ""
        self.pinCode = userProfileData.pinCode ?? ""
    }
}


struct UserCartDataViewModel {
    var id: String
    var itemCount: Int64
    var phoneNumber:String
    
    init(id: String, iCount: Int64,phoneNumber:String) {
        self.id = id
        self.itemCount  = iCount
        self.phoneNumber = phoneNumber
    }
    
    init(userCartData: CartEntity) {
        self.id = userCartData.id ?? ""
        self.itemCount = userCartData.itemCount
        self.phoneNumber = userCartData.phoneNumber ?? ""
    }
}

struct SingleProductDataViewModel : Identifiable,Hashable{
    
    var id: UUID
    var productCount: Int64
    var productName:String?
    var productAPrice:String?
    var productCPrice:String?
    var productSPrice:String?
    var phoneNumber:String?
    init(id: UUID, productCount: Int64,phoneNumber:String,productAPrice:String?,productCPrice:String?,productSPrice:String?,productName:String?) {
        self.id = id
        self.productCount = productCount
        self.productName = productName
        self.productAPrice = productAPrice
        self.productCPrice = productCPrice
        self.productSPrice = productSPrice
        self.phoneNumber = phoneNumber
    }
    
    init(userCartData: CartProductEntity) {
        self.id = userCartData.id
        self.productCount = userCartData.productCount
        self.productName = userCartData.productName ?? ""
        self.productAPrice = userCartData.productAPrice ?? ""
        self.productSPrice = userCartData.productSPrice ?? ""
        self.productCPrice = userCartData.productCPrice ?? ""
        self.phoneNumber = userCartData.phoneNumber ?? ""
    }
}
