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
    @EnvironmentObject var setting: Settings
    
    func fetchUserProfileWithPhonenumber(phoneNumber:String) {
        self.userProfile = DataManager.shared.getUserProfileData(phonenumber: phoneNumber).map(UserProfileDataViewModel.init)
    }
    
    func fetchAllUserProfile()
    {
        self.userProfile = DataManager.shared.getUserProfileAllData().map(UserProfileDataViewModel.init)
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
