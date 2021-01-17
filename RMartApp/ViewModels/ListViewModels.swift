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
    
    func fetchAllUserProfile() {
        self.userProfile = DataManager.shared.getUserProfileData().map(UserProfileDataViewModel.init)
    }
    
//    func removeBirthday(at index: Int) {
//        let bday = userProfile[index]
//        DataManager.shared.removeBirthday(id: bday.id)
//    }
}
