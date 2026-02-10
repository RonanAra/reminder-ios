//
//  LoginBottomSheetViewDelegate.swift
//  Reminder
//
//  Created by Ronan Fernandes on 29/01/26.
//

import UIKit
import Foundation

protocol LoginBottomSheetViewDelegate: AnyObject {
    func sendLoginData(user: String, password: String)
}
