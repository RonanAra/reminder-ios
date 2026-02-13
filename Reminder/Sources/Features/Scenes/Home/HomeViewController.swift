//
//  HomeViewController.swift
//  Reminder
//
//  Created by Ronan Fernandes on 10/02/26.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    public weak var flowDelegate: HomeFlowDelegate?
    private var contentView: HomeView
    
    init(
        contentView: HomeView,
        flowDelegate: HomeFlowDelegate
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
        setupBindView()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.hidesBackButton = true
        
        let logoutButton = UIBarButtonItem(
            image: UIImage(named: "logoutIcon"),
            style: .plain,
            target: self,
            action: #selector(logoutAction)
        )
        logoutButton.tintColor = Colors.primaryRedBase
        
        navigationItem.rightBarButtonItem = logoutButton
    }
    
    private func setupBindView() {
        self.view.addSubview(contentView)
        self.view.backgroundColor = Colors.gray600
        setupContentViewToBounds(contentView: contentView)
    }
    
    @objc
    private func logoutAction() {
        UserDefaultsManager.removeUser()
        flowDelegate?.logout()
    }
}
