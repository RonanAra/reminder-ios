//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by Ronan Fernandes on 25/01/26.
//

import UIKit
import Foundation

class LoginBottomSheetView: UIView {
    
    private let handleArea: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = Metrics.tiny
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let view = UILabel()
        view.text = "login.welcome.title".localized
        view.font = Typography.subHeading
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let loginTextFieldLabel: UILabel = {
        let view = UILabel()
        view.text = "login.email.title".localized
        view.font = Typography.label
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emailTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "login.email.placeholder".localized
        view.borderStyle = .roundedRect
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let passwordTextFieldLabel: UILabel = {
        let view = UILabel()
        view.text = "login.password.title".localized
        view.font = Typography.label
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let passwordTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "login.password.placeholder".localized
        view.isSecureTextEntry = true
        view.borderStyle = .roundedRect
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let loginButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("login.button.title".localized, for: .normal)
        view.backgroundColor = Colors.primaryRedBase
        view.layer.cornerRadius = Metrics.medium
        view.tintColor = .white
        view.titleLabel?.font = Typography.subHeading
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = Metrics.small
        
        addSubview(handleArea)
        addSubview(titleLabel)
        addSubview(loginTextFieldLabel)
        addSubview(emailTextField)
        addSubview(passwordTextFieldLabel)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            handleArea.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.small),
            handleArea.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            handleArea.widthAnchor.constraint(equalToConstant: 40),
            handleArea.heightAnchor.constraint(equalToConstant: 6),
            
            titleLabel.topAnchor.constraint(equalTo: handleArea.bottomAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            loginTextFieldLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.large),
            loginTextFieldLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            emailTextField.topAnchor.constraint(equalTo: loginTextFieldLabel.bottomAnchor, constant: Metrics.small),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.small),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            passwordTextFieldLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordTextFieldLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldLabel.bottomAnchor, constant: Metrics.small),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Metrics.huge),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize)
        ])
        
    }
}
