//
//  UserDefaultsManager.swift
//  WisdomQuizzes
//
//  Created by Andres Cordón on 6/1/25.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    var accessToken: String? {
        return UserDefaults.standard.string(forKey: "accessToken")
    }
    
    var refreshToken: String? {
        return UserDefaults.standard.string(forKey: "refreshToken")
    }
    
    var username: String {
        set {
            UserDefaults.standard.set(newValue, forKey: "username")
        }
        get {
            return UserDefaults.standard.string(forKey: "username") ?? ""
        }
    }
    
    func saveTokens(accessToken: String, refreshToken: String) {
        UserDefaults.standard.set(accessToken, forKey: "accessToken")
        UserDefaults.standard.set(refreshToken, forKey: "refreshToken")
    }
    
    func saveAccessToken(accessToken: String) {
        UserDefaults.standard.set(accessToken, forKey: "accessToken")
    }
    
    /*func isAccessTokenValid() -> Bool {
        
        guard let token = accessToken else {
            return false
        }

        let expirationDate = Utils.shared.getExpirationDateFromJWT(token: token)
        
        return expirationDate > Date()
    }*/
}
