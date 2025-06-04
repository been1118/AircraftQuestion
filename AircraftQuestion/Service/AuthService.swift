//
//  AuthService.swift
//  AeroPass
//
//  Created by 신동현 on 5/29/25.
//

import Foundation
import SwiftKeychainWrapper

func saveKeychain(key: String, value: String) {
    KeychainWrapper.standard.set(value, forKey: key)
}

func getKeychain(key: String) -> String? {
    return KeychainWrapper.standard.string(forKey: key)
}

func removeKeychain(key: String) {
    KeychainWrapper.standard.removeObject(forKey: key)
}
