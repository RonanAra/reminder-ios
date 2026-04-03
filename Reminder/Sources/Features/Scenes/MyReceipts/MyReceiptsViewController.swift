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
    
    init(
        contentView: MyReceiptsView
    ) {
        self.contentView = contentView
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
    }

}
