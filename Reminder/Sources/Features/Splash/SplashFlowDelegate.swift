//
//  SplashFlowDelegate.swift
//  Reminder
//
//  Created by Ronan Fernandes on 04/02/26.
//

import Foundation

public protocol SplashFlowDelegate: AnyObject {
    func openLoginBottomSheet()
    func navigateToHome()
}
