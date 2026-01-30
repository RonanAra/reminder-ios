//
//  LoginBottomSheetViewController.swift
//  Reminder
//
//  Created by Ronan Fernandes on 25/01/26.
//

import UIKit
import Foundation

class LoginBottomSheetViewController: UIViewController {
    
    private let loginView = LoginBottomSheetView()
    private let bottomSheetHeight: CGFloat = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.delegate = self
        setup()
    }
    
    private func setup() {
        self.view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        setupGesture()
        setupConstraints()
    }
    
    private func setupGesture() {
        // not impl yet
    }
    
    private func handlePanGesture() {
        // not impl yet
    }
    
    func animateShow(onCompletion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        loginView.transform = CGAffineTransform(translationX: 0, y: loginView.frame.height)
        UIView.animate(withDuration: 0, animations: {
            self.loginView.transform = .identity
            self.view.layoutIfNeeded()
            
        }) { _ in
            onCompletion?()
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            loginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            loginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            loginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        let heightConstraint = loginView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
}

extension LoginBottomSheetViewController: LoginBottomSheetViewDelegate {
    func sendLoginData(user: String, password: String) {
        print(user, password)
    }
}
