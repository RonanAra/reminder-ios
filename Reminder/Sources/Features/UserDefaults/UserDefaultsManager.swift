//
//  UserDefaultsManager.swift
//  Reminder
//
//  Created by Ronan Fernandes on 08/02/26.
//

import Foundation
import UIKit

class UserDefaultsManager {
    private static let userKey: String = "userKey"
    private static let userNameKey: String = "userNameKey"
    private static let profileImageKey: String = "userImageKey"
    
    static func saveUser(user: User) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            UserDefaults.standard.set(encoded, forKey: userKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    static func saveUserName(name: String) {
        UserDefaults.standard.set(name, forKey: userNameKey)
        UserDefaults.standard.synchronize()
    }
    
    static func saveUserImageProfile(image: UIImage) {
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            UserDefaults.standard.set(imageData, forKey: profileImageKey)
        }
    }
    
    static func getUser() -> User? {
        if let userData = UserDefaults.standard.data(forKey: userKey) {
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: userData) {
                return user
            }
        }
        return nil
    }
    
    static func getProfileImage() -> UIImage? {
        if let imageData = UserDefaults.standard.data(forKey: profileImageKey) {
            return UIImage(data: imageData)
        }
        
        return nil
    }
    
    static func getUserName() -> String? {
        return UserDefaults.standard.string(forKey: userNameKey)
    }
    
    static func removeUser() {
        UserDefaults.standard.removeObject(forKey: userKey)
        UserDefaults.standard.removeObject(forKey: profileImageKey)
        UserDefaults.standard.removeObject(forKey: userNameKey)
        UserDefaults.standard.synchronize()
    }
    
    static func removeUserName() {
        UserDefaults.standard.removeObject(forKey: userNameKey)
        UserDefaults.standard.synchronize()
    }
}
