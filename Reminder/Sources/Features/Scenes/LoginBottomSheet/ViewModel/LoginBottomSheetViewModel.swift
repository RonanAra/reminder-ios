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
    var errorResult: ((String) -> Void)?
    
    func doAuth(user: String, password: String) {
        Auth.auth().signIn(withEmail: user, password: password) {[weak self] result, error in
            if error != nil {
                self?.errorResult?("Erro ao tentar logar, verifique as credencias digitadas")
            } else {
                self?.successResult?(user)
            }
        }
    }
}
