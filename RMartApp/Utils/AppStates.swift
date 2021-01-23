//
//  AppStates.swift
//  RMartApp
//
//  Created by RMart on 1/21/21.
//

import Foundation
import SwiftUI
import Combine

class AppState: ObservableObject {
    @Published var moveToHome: Bool = false
}
