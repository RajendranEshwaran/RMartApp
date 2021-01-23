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
    
    func updateUserProfileData(user: UserProfileDataViewModel) {
        DataManager.shared.updateUserProfile(id: user.id ?? UUID(), firstName: user.firstName, lastName: user.lastName, gender: user.gender, dob: user.dob, phoneNumber: user.phoneNumber, emailId: user.emailId,pinCode: user.pinCode)
    }
}
