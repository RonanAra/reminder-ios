//
//  LoginBottomSheetViewController.swift
//  Reminder
//
//  Created by Ronan Fernandes on 25/01/26.
//

import UIKit
import Foundation

class LoginBottomSheetViewController: UIViewController {
    var mainNavigation: UINavigationController?
    private let contentView: LoginBottomSheetView
    private let loginViewModel = LoginBottomSheetViewModel()
    public weak var flowDelegate: LoginBottomSheetFlowDelegate?
    private let bottomSheetHeight: CGFloat = 50.0
    
    init(
        contentView: LoginBottomSheetView,
        flowDelegate: LoginBottomSheetFlowDelegate
    ) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.delegate = self
        setup()
        bindViewModel()
    }
    
    private func setup() {
        self.view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        setupGesture()
        setupConstraints()
    }
    
    private func bindViewModel() {
        loginViewModel.successResult = { [weak self] in
            self?.flowDelegate?.navigateToHome()
        }
    }
    
    private func setupGesture() {
        // not impl yet
    }
    
    private func handlePanGesture() {
        // not impl yet
    }
    
    func animateShow(onCompletion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        contentView.transform = CGAffineTransform(translationX: 0, y: contentView.frame.height)
        UIView.animate(withDuration: 0, animations: {
            self.contentView.transform = .identity
            self.view.layoutIfNeeded()
            
        }) { _ in
            onCompletion?()
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
}

extension LoginBottomSheetViewController: LoginBottomSheetViewDelegate {
    func sendLoginData(user: String, password: String) {
        loginViewModel.doAuth(user: user, password: password)
    }
}
