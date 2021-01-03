//
//  Toggles.swift
//  RMart
//
//  Created by RMart on 12/24/20.
//

import Foundation

class Toggles: ObservableObject{
    
    @Published var homeToggle:Bool = false
    @Published var showMenu = false
    @Published var showSign:Bool = false
    @Published var showWallet:Bool = false
}

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}
