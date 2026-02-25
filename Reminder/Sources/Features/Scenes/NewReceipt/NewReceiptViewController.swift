//
//  NewReceiptViewController.swift
//  Reminder
//
//  Created by Ronan Fernandes on 20/02/26.
//

import UIKit

class NewReceiptViewController: UIViewController {
    
    private let newReceiptView: NewReceiptView
    
    init(
        newReceiptView: NewReceiptView
    ) {
        self.newReceiptView = newReceiptView
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
    }
    
    @objc
    private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
