//
//  MyReceiptsView.swift
//  Reminder
//
//  Created by Ronan Fernandes on 02/04/26.
//

import Foundation
import UIKit

class MyReceiptsView: UIView {
    weak public var delegate: MyReceiptsViewDelegate?
    
    let headerBackground: UIView = {
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
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = Colors.gray100
        button.addTarget(MyReceiptsView.self, action: #selector(didTapBackButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Minhas receitas"
        label.textColor = Colors.primaryBlueBase
        label.font = Typography.heading
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Acompanhe seus medicamentos cadastrados e gerencie lembretes"
        label.textColor = Colors.gray200
        label.font = Typography.body
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "add-button"), for: .normal)
        button.addTarget(MyReceiptsView.self, action: #selector(didTapAddButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(headerBackground)
        headerBackground.addSubview(backButton)
        headerBackground.addSubview(addButton)
        headerBackground.addSubview(titleLabel)
        headerBackground.addSubview(subtitleLabel)
        addSubview(contentBackground)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerBackground.topAnchor.constraint(equalTo: topAnchor),
            headerBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerBackground.heightAnchor.constraint(equalToConstant: Metrics.backgroundProfileSize),
            
            backButton.topAnchor.constraint(equalTo: headerBackground.topAnchor, constant: Metrics.medium),
            backButton.leadingAnchor.constraint(equalTo: headerBackground.leadingAnchor, constant: Metrics.medium),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            backButton.widthAnchor.constraint(equalToConstant: 24),
            
            addButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: headerBackground.trailingAnchor, constant: -Metrics.medium),
            addButton.heightAnchor.constraint(equalToConstant: 40),
            addButton.widthAnchor.constraint(equalToConstant: 40),
            
            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.small),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: headerBackground.trailingAnchor, constant: -Metrics.medium),
            
            contentBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentBackground.topAnchor.constraint(equalTo: headerBackground.bottomAnchor, constant: -Metrics.small),
            contentBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    @objc
    private func didTapBackButton() {
        delegate?.didTapBackButton()
    }
    
    @objc
    private func didTapAddButton() {
        delegate?.didTapBackButton()
    }
}

protocol MyReceiptsViewDelegate: AnyObject {
    func didTapBackButton()
    func didTapAddButton()
}
