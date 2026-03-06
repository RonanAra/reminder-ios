//
//  NewReceiptViewController.swift
//  Reminder
//
//  Created by Ronan Fernandes on 20/02/26.
//

import UIKit

class NewReceiptViewController: UIViewController {
    
    private let newReceiptView: NewReceiptView
    private let newReceiptViewModel: NewReceiptViewModel
    
    init(
        newReceiptView: NewReceiptView,
        newReceiptViewModel: NewReceiptViewModel,
    ) {
        self.newReceiptView = newReceiptView
        self.newReceiptViewModel = newReceiptViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupActions()
    }
    
    private func setupView() {
        view.backgroundColor = Colors.gray800
        view.addSubview(newReceiptView)
        self.setupContentViewToBounds(contentView: newReceiptView)
    }
    
    private func setupActions() {
        newReceiptView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        newReceiptView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func addButtonTapped() {
        let remedy = newReceiptView.remedyInput.getText()
        let time = newReceiptView.timeInput.getText()
        let recurrence = newReceiptView.recurrenceInput.getText()
        let takeNow = false
        
        newReceiptViewModel.addReceipt(
            remedy: remedy,
            time: time,
            recurrence: recurrence,
            takeNow: takeNow
        )
    }
}
