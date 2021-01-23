//
//  ViewModels.swift
//  RMartApp
//
//  Created by RMart on 1/16/21.
//

import Foundation
import SwiftUI
import Combine

class UserProfileDataViewModel {
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
