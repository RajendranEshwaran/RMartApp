//
//  ModelManager.swift
//  RMartApp
//
//  Created by RMart on 1/16/21.
//

import Foundation
import SwiftUI

class ViewModelManager {
        
    func saveUserProfile(user: UserProfileDataViewModel) {
        DataManager.shared.saveUserProfileData(id: user.id ?? UUID(), firstName: user.firstName, lastName: user.lastName, gender: user.gender, dob: user.dob, phoneNumber: user.phoneNumber, emailId: user.emailId,pinCode: user.pinCode)
    }
    func saveUserCartData(user:UserCartDataViewModel)
    {
        DataManager.shared.saveUserCartData(id: user.id, productCount: Int(user.itemCount),phoneNumber: user.phoneNumber )
    }
    
    func saveSingleProductCartData(user:SingleProductDataViewModel)
    {
        DataManager.shared.saveSingleProductCartData(id: user.id, productName: user.productName, productCPrice: user.productCPrice, productAPrice: user.productAPrice, productSPrice: user.productSPrice, productCount: user.productCount, phoneNumber: user.phoneNumber ?? "")
    }
    
    func updateUserProfileData(user: UserProfileDataViewModel) {
        DataManager.shared.updateUserProfile(id: user.id ?? UUID(), firstName: user.firstName, lastName: user.lastName, gender: user.gender, dob: user.dob, phoneNumber: user.phoneNumber, emailId: user.emailId,pinCode: user.pinCode)
    }
    
    func updateSingleProductCartData(user:SingleProductDataViewModel)
    {
        DataManager.shared.updateSingleProductCartData(id: user.id, productName: user.productName, productCPrice: user.productCPrice, productAPrice: user.productAPrice, productSPrice: user.productSPrice, productCount: user.productCount, phoneNumber: user.phoneNumber ?? "")
    }
    
    func updateUserCartCountData(user:UserCartDataViewModel)
    {
        DataManager.shared.updateUserCartCount(id: user.id, itemCount: user.itemCount, phoneNumber: user.phoneNumber)
    }
}
