//
//  ReminderFlowController.swift
//  Reminder
//
//  Created by Ronan Fernandes on 01/02/26.
//

import Foundation
import UIKit

class ReminderFlowController {
    
    //MARK: - Properties
    private var navigationController: UINavigationController?
    private let viewControllerFactory: ViewControllersFactoryProtocol
    private let viewModelFactory: ViewModelsFactoryProtocol
    
    //MARK: - init
    public init() {
        viewModelFactory = ViewModelsFactory()
        viewControllerFactory = ViewControllersFactory()
    }
    
    //MARK: - Start Flow
    func start() -> UINavigationController? {
        let startViewController = viewControllerFactory.makeSplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}

//MARK: - Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: false)
        let viewController = viewControllerFactory.makeHomeViewController(
            flowDelegate: self,
            viewModel: viewModelFactory.makeHomeViewModel()
        )
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

//MARK: - Splash
extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheet = viewControllerFactory.makeLoginBottomSheetViewController(
            viewModel: viewModelFactory.makeLoginBottomSheetViewModel(),
            flowDelegate: self
        )
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        loginBottomSheet.mainNavigation = self.navigationController
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        self.navigationController?.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow()
        }
        
        func navigateToHome() {
            self.navigationController?.dismiss(animated: false)
            let viewController = viewControllerFactory.makeHomeViewController(
                flowDelegate: self,
                viewModel: viewModelFactory.makeHomeViewModel()
            )
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

//MARK: - Home
extension ReminderFlowController: HomeFlowDelegate {
    func navigateToReceipes() {
        let viewConstroller = viewControllerFactory.makeNewReceiptsViewController()
        self.navigationController?.pushViewController(viewConstroller, animated: true)
    }
    
    func logout() {
        self.navigationController?.popViewController(animated: true)
        self.openLoginBottomSheet()
    }
}
