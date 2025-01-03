//
//  LocalState.swift
//  BankApp
//
//  Created by Sena Küçükerdoğan on 28.12.2024.
//

import Foundation

public class LocalState {
    
    private enum Keys: String {
        case hasOnboarded
    }
    
    public static var hasOnboarded: Bool { // Computed property
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
//          UserDefaults.standard.synchronize()  / As of iOS 12 synchronized is no longer required when writing too NSUserDefaults.
        }
    }
}
