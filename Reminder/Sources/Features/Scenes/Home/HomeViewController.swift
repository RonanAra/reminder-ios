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
    }
    
    private func setupBindView() {
        self.view.addSubview(contentView)
        setupContentViewToBounds(contentView: contentView)
    }
}
