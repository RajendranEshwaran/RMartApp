//
//  ListViewModels.swift
//  RMartApp
//
//  Created by RMart on 1/16/21.
//

import Foundation
import SwiftUI
import Combine

class UserDataListViewModel: ObservableObject {
    
    @Published var userProfile = [UserProfileDataViewModel]()
    @Published var userCart = [UserCartDataViewModel]()
    @Published var proCart = [SingleProductDataViewModel]()
    @EnvironmentObject var setting: Settings
    
    func fetchUserProfileWithPhonenumber(phoneNumber:String) {
        self.userProfile = DataManager.shared.getUserProfileData(phonenumber: phoneNumber).map(UserProfileDataViewModel.init)
    }
    
    func fetchAllUserProfile()
    {
        self.userProfile = DataManager.shared.getUserProfileAllData().map(UserProfileDataViewModel.init)
    }
    
    func fetchUserCartItemCount(phoneNumber:String)
    {
        self.userCart = DataManager.shared.getUserCartData(phonenumber: phoneNumber).map(UserCartDataViewModel.init)
    }
    func fetchUserCartItemCountWithoutPhone()
    {
        self.userCart = DataManager.shared.getUserCartDataWithoutPhone().map(UserCartDataViewModel.init)
    }
    func fetchSingleProductCartData(phoneNumber:String)
    {
        self.proCart = DataManager.shared.getCartSingeProductData(phonenumber: phoneNumber).map(SingleProductDataViewModel.init)
    }
    func fetchSingleProductCartDataAllFromCoreData()
    {
        self.proCart = DataManager.shared.getCartSingeProductDataAll().map(SingleProductDataViewModel.init)
    }
//    func removeBirthday(at index: Int) {
//        let bday = userProfile[index]
//        DataManager.shared.removeBirthday(id: bday.id)
//    }
//    func updateUserProfileWithPhoneNumber(phoneNumber:String)
//    {
//        self.userProfile = DataManager.shared.updateUserProfile(id: <#T##UUID#>, firstName: <#T##String?#>, lastName: <#T##String?#>, gender: <#T##String?#>, dob: <#T##Date?#>, phoneNumber: <#T##String#>, emailId: <#T##String?#>)
//    }
}
