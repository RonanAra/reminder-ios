//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Ronan Fernandes on 30/01/26.
//

import Foundation
import Firebase

class LoginBottomSheetViewModel {
    
    var successResult: ((String) -> Void)?
    
    func doAuth(user: String, password: String) {
        Auth.auth().signIn(withEmail: user, password: password) {[weak self] result, error in
            if let error = error {
                print("Authentication Failied: \(error)")
            } else {
                self?.successResult?(user)
            }
        }
    }
}
