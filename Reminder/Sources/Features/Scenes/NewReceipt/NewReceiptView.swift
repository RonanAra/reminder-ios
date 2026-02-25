//
//  NewReceiptView.swift
//  Reminder
//
//  Created by Ronan Fernandes on 20/02/26.
//

import UIKit

class NewReceiptView: UIView {
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = Colors.gray100
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.heading
        label.textColor = Colors.primaryRedBase
        label.text = "new.receipts.title.label".localized
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.body
        label.tintColor = Colors.gray200
        label.text = "new.receipts.description.label".localized
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("new.receipts.add.button.title".localized, for: .normal)
        button.titleLabel?.font = Typography.subHeading
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = Metrics.medium
        button.setTitleColor(Colors.gray800, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let remedyInput = Input(title: "Remédio", placeHolder: "Nome do medicamento")
    private let timeInput = Input(title: "Horário", placeHolder: "12:00")
    private let recurrenceInput = Input(title: "Recorrência", placeHolder: "Selecione")
    private let takeNowCheckbox = Checkbox(title: "Tomar agora")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(addButton)
        addSubview(remedyInput)
        addSubview(timeInput)
        addSubview(recurrenceInput)
        addSubview(takeNowCheckbox)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.small),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.large),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            backButton.widthAnchor.constraint(equalToConstant: 24),
            
            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Metrics.midier),
            titleLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.midier),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            remedyInput.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Metrics.medium),
            remedyInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.large),
            remedyInput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.large),
            
            timeInput.topAnchor.constraint(equalTo: remedyInput.bottomAnchor, constant: Metrics.medium),
            timeInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.large),
            timeInput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.large),
            
            recurrenceInput.topAnchor.constraint(equalTo: timeInput.bottomAnchor, constant: Metrics.medium),
            recurrenceInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.large),
            recurrenceInput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.large),
            
            takeNowCheckbox.topAnchor.constraint(equalTo: recurrenceInput.bottomAnchor, constant: Metrics.medium),
            takeNowCheckbox.leadingAnchor.constraint(equalTo: recurrenceInput.leadingAnchor),
            takeNowCheckbox.trailingAnchor.constraint(equalTo: recurrenceInput.trailingAnchor),
            
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.huge),
            addButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
        ])
    }
}
