//
//  ViewModelsFactory.swift
//  Reminder
//
//  Created by Ronan Fernandes on 07/02/26.
//

import Foundation

protocol ViewModelsFactoryProtocol: AnyObject {
    func makeLoginBottomSheetViewModel() -> LoginBottomSheetViewModel
    func makeHomeViewModel() -> HomeViewModel
}
