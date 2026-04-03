//
//  MyReceiptsViewController.swift
//  Reminder
//
//  Created by Ronan Fernandes on 02/04/26.
//

import UIKit
import Foundation

class MyReceiptsViewController: UIViewController {
    
    let contentView: MyReceiptsView
    public weak var flowDelegate: MyReceiptsFlowDelegate?
    
    init(
        contentView: MyReceiptsView,
        flowDelegate: MyReceiptsFlowDelegate
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
        setupView()
    }
    
    private func setupView() {
        view.addSubview(contentView)
        view.backgroundColor = Colors.gray600
        self.setupContentViewToBounds(contentView: contentView)
        contentView.delegate = self
    }
}

extension MyReceiptsViewController: MyReceiptsViewDelegate {
    func didTapBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func didTapAddButton() {
        flowDelegate?.goToNewReceipts()
    }
}
