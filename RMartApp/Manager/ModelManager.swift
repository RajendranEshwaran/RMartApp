//
//  ModelManager.swift
//  RMartApp
//
//  Created by RMart on 1/16/21.
//

import Foundation
import SwiftUI

class AddNewUserProfileDataViewModel {
        
    func saveUserProfile(user: UserProfileDataViewModel) {
        DataManager.shared.saveUserProfileData(id: user.id ?? UUID(), firstName: user.firstName, lastName: user.lastName, gender: user.gender, dob: user.dob, phoneNumber: user.phoneNumber, emailId: user.emailId)
    }
}
