//
//  ViewControllersFactoryProtocol.swift
//  Reminder
//
//  Created by Ronan Fernandes on 07/02/26.
//

import Foundation

protocol ViewControllersFactoryProtocol: AnyObject {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController
    func makeLoginBottomSheetViewController(
        viewModel: LoginBottomSheetViewModel,
        flowDelegate: LoginBottomSheetFlowDelegate
    ) -> LoginBottomSheetViewController
    func makeHomeViewController(
        flowDelegate: HomeFlowDelegate,
        viewModel: HomeViewModel
    ) -> HomeViewController
}
