//
//  ViewControllersFactory.swift
//  Reminder
//
//  Created by Ronan Fernandes on 07/02/26.
//

import Foundation
import UIKit

final class ViewControllersFactory: ViewControllersFactoryProtocol {
    
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController {
        let contentView = SplashView()
        let viewController = SplashViewController(
            contentView: contentView,
            flowDelegate: flowDelegate
        )
        return viewController
    }
    
    func makeLoginBottomSheetViewController(
        viewModel: LoginBottomSheetViewModel,
        flowDelegate: LoginBottomSheetFlowDelegate
    ) -> LoginBottomSheetViewController {
        let contentView = LoginBottomSheetView()
        let viewController = LoginBottomSheetViewController(
            contentView: contentView,
            viewModel: viewModel,
            flowDelegate: flowDelegate
        )
        return viewController
    }
    
    func makeHomeViewController(flowDelegate: HomeFlowDelegate) -> HomeViewController {
        let contentView = HomeView()
        let viewController = HomeViewController(
            contentView: contentView,
            flowDelegate: flowDelegate
        )
        return viewController
    }
}
