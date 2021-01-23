//
//  UserSettings.swift
//  RMartApp
//
//  Created by RMart on 1/18/21.
//

import Foundation
import Combine

class UserSettings: ObservableObject {
    @Published var phonenumber: String {
        didSet {
            UserDefaults.standard.set(phonenumber, forKey: "phonenumber")
        }
    }
    
    init() {
        self.phonenumber = UserDefaults.standard.object(forKey: "phonenumber") as? String ?? ""
    }
    func getUserPhoneNumber() ->String
    {
        return self.phonenumber
    }
}
