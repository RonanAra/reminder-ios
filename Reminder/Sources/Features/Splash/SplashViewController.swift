//
//  SplashViewController.swift
//  Reminder
//
//  Created by Ronan Fernandes on 21/01/26.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    
    let contentView = SplashView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        self.view.addSubview(contentView)
        self.navigationController?.navigationBar.isHidden = true
        setupConstraints()
        setupGesture()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func showLoginBottomSheet() {
        let loginBottomSheet = LoginBottomSheetViewController()
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        self.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow()
        }
    }
}
