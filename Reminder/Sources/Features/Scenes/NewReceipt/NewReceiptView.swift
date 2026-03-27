//
//  NewReceiptView.swift
//  Reminder
//
//  Created by Ronan Fernandes on 20/02/26.
//

import UIKit
import Foundation

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
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("new.receipts.add.button.title".localized, for: .normal)
        button.titleLabel?.font = Typography.subHeading
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = Metrics.medium
        button.setTitleColor(Colors.gray800, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let remedyInput = Input(title: "Remédio", placeHolder: "Nome do medicamento")
    let timeInput = Input(title: "Horário", placeHolder: "12:00")
    let recurrenceInput = Input(title: "Recorrência", placeHolder: "Selecione")
    let takeNowCheckbox = Checkbox(title: "Tomar agora")
    
    private let timePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        picker.preferredDatePickerStyle = .wheels
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private let recurrencePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private let recurrenceOptions = [
        "De hora em hora",
        "2 em 2 horas",
        "4 em 4 horas",
        "6 em 6 horas",
        "8 em 8 horas",
        "12 em 12 horas",
    ]
    
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
        setupTimeInput()
        setupRecurrenceInput()
        setupConstraints()
    }
    
    private func setupRecurrenceInput() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didSelectRecurrence)
        )
        
        toolbar.setItems([doneButton], animated: true)
        
        recurrenceInput.textField.inputView = recurrencePicker
        recurrenceInput.textField.inputAccessoryView = toolbar
        
        recurrencePicker.delegate = self
        recurrencePicker.dataSource = self
    }
    
    private func setupTimeInput() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didSelectTime)
        )
        
        toolbar.setItems([doneButton], animated: true)
        
        timeInput.textField.inputView = timePicker
        timeInput.textField.inputAccessoryView = toolbar
    }
    
    @objc
    private func didSelectTime() {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        timeInput.textField.text = formatter.string(from: timePicker.date)
        timeInput.textField.resignFirstResponder()
    }
    
    
    @objc
    private func didSelectRecurrence() {
        let selectedOption = recurrencePicker.selectedRow(inComponent: 0)
        recurrenceInput.textField.text = recurrenceOptions[selectedOption]
        recurrenceInput.textField.resignFirstResponder()
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

extension NewReceiptView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        recurrenceOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        recurrenceOptions[row]
    }
}
