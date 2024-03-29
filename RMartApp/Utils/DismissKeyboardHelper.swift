//
//  DismissKeyboardHelper.swift
//  RMartApp
//
//  Created by RMart on 1/16/21.
//

import Foundation
import UIKit

class DismissKeyboardHelper {
    static func dismiss() {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        keyWindow!.endEditing(true)
    }
}
