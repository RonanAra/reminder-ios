//
//  ButtonHomeView.swift
//  Reminder
//
//  Created by Ronan Fernandes on 16/02/26.
//

import UIKit
import Foundation

class ButtonHomeView: UIView {
    
    private let iconView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray600
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.subHeading
        label.textColor = Colors.gray100
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionabel: UILabel = {
        let label = UILabel()
        label.font = Typography.body
        label.textColor = Colors.gray200
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        imageView.tintColor = Colors.gray300
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(
        icon: UIImage?,
        title: String,
        description: String
    ) {
        super.init(frame: .zero)
        backgroundColor = Colors.gray700
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        iconImageView.image = icon
        titleLabel.text = title
        descriptionabel.text = description
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(iconView)
        iconView.addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(descriptionabel)
        addSubview(arrowImageView)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 80),
            iconView.widthAnchor.constraint(equalToConstant: 80),
            
            iconImageView.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            iconImageView.centerXAnchor.constraint(equalTo: iconView.centerXAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 48),
            iconImageView.widthAnchor.constraint(equalToConstant: 48),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: Metrics.midier),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.midier),
            
            descriptionabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.midier),
            descriptionabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.midier),
            descriptionabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -Metrics.midier),
            
            arrowImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.midier),
            arrowImageView.widthAnchor.constraint(equalToConstant: 16),
            arrowImageView.heightAnchor.constraint(equalToConstant: 16),
        ])
    }
}
