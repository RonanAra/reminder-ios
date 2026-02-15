//
//  ViewModelsFactory.swift
//  Reminder
//
//  Created by Ronan Fernandes on 07/02/26.
//

final class ViewModelsFactory: ViewModelsFactoryProtocol {
    func makeHomeViewModel() -> HomeViewModel {
       let viewModel = HomeViewModel()
       return viewModel
    }
    
    func makeLoginBottomSheetViewModel() -> LoginBottomSheetViewModel {
        let viewModel = LoginBottomSheetViewModel()
        return viewModel
    }
    
}
