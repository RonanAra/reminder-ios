//
//  HomeView.swift
//  Reminder
//
//  Created by Ronan Fernandes on 10/02/26.
//

import UIKit
import Foundation

class HomeView: UIView {
    
    public weak var delegate: HomeViewDelegate?
    
    private let profileBackground: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray600
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let contentBackground: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray800
        view.layer.cornerRadius = Metrics.medium
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let profileImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = Metrics.medium
        view.isUserInteractionEnabled = true
        view.clipsToBounds = true
        view.image = UIImage(named: "user")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let welcomeLabel: UILabel = {
        let view = UILabel()
        view.text = "home.welcome.label".localized
        view.textColor = Colors.gray200
        view.font = Typography.input
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Insira seu nome"
        view.textColor = Colors.gray100
        view.font = Typography.heading
        view.returnKeyType = .done
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let feedbackButton: UIButton = {
        let button = UIButton()
        button.setTitle("home.feedback.button.title".localized, for: .normal)
        button.backgroundColor = Colors.gray100
        button.layer.cornerRadius = Metrics.medium
        button.setTitleColor(Colors.gray800, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let myPrescriptionButtons: ButtonHomeView = {
        let button = ButtonHomeView(
            icon: UIImage(named: "paper"),
            title: "Minhas receitas",
            description: "Acompanhe os medicamentos e gerencie lembretes"
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let newPrescriptionButtons: ButtonHomeView = {
        let button = ButtonHomeView(
            icon: UIImage(named: "pills"),
            title: "Nova receita",
            description: "Cadastre novos lembretes de receitas"
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(profileBackground)
        profileBackground.addSubview(profileImage)
        profileBackground.addSubview(welcomeLabel)
        profileBackground.addSubview(nameTextField)
        
        addSubview(contentBackground)
        contentBackground.addSubview(feedbackButton)
        contentBackground.addSubview(myPrescriptionButtons)
        contentBackground.addSubview(newPrescriptionButtons)
        
        setupConstraints()
        setupImageGesture()
    }
    
    private func setupImageGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        
        profileImage.addGestureRecognizer(tapGesture)
    }
    
    private func setupTextField() {
        nameTextField.addTarget(
            self,
            action: #selector(nameTextFieldDidEndEditing),
            for: .editingDidEnd
        )
        nameTextField.delegate = self
    }
    
    @objc
    private func nameTextFieldDidEndEditing() {
        let name = nameTextField.text ?? ""
        UserDefaultsManager.saveUserName(name: name)
    }
    
    @objc
    private func profileImageTapped() {
        delegate?.didTapProfileImage()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            profileBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileBackground.topAnchor.constraint(equalTo: topAnchor),
            profileBackground.heightAnchor.constraint(equalToConstant: Metrics.backgroundProfileSize),
            
            profileImage.topAnchor.constraint(equalTo: profileBackground.topAnchor, constant: Metrics.large),
            profileImage.leadingAnchor.constraint(equalTo: profileBackground.leadingAnchor, constant: Metrics.medium),
            profileImage.heightAnchor.constraint(equalToConstant: Metrics.profileImageSize),
            profileImage.widthAnchor.constraint(equalToConstant: Metrics.profileImageSize),
            
            welcomeLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: Metrics.small),
            welcomeLabel.leadingAnchor.constraint(equalTo: profileImage.leadingAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: Metrics.little),
            nameTextField.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            
            contentBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentBackground.topAnchor.constraint(equalTo: profileBackground.bottomAnchor),
            contentBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            feedbackButton.bottomAnchor.constraint(equalTo: contentBackground.bottomAnchor, constant: -Metrics.large),
            feedbackButton.leadingAnchor.constraint(equalTo: contentBackground.leadingAnchor, constant: Metrics.medium),
            feedbackButton.trailingAnchor.constraint(equalTo: contentBackground.trailingAnchor, constant: -Metrics.medium),
            feedbackButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
            
            myPrescriptionButtons.topAnchor.constraint(equalTo: contentBackground.topAnchor, constant: Metrics.huge),
            myPrescriptionButtons.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            myPrescriptionButtons.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            myPrescriptionButtons.heightAnchor.constraint(equalToConstant: 112),
            
            newPrescriptionButtons.topAnchor.constraint(equalTo: myPrescriptionButtons.bottomAnchor, constant: Metrics.midier),
            newPrescriptionButtons.leadingAnchor.constraint(equalTo: myPrescriptionButtons.leadingAnchor),
            newPrescriptionButtons.trailingAnchor.constraint(equalTo: myPrescriptionButtons.trailingAnchor),
            newPrescriptionButtons.heightAnchor.constraint(equalToConstant: 112)
        ])
    }
}

extension HomeView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let name = nameTextField.text ?? ""
        UserDefaultsManager.saveUserName(name: name)
        return true
    }
}
