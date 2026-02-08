//
//  ViewModelsFactory.swift
//  Reminder
//
//  Created by Ronan Fernandes on 07/02/26.
//

final class ViewModelsFactory: ViewModelsFactoryProtocol {
    func makeLoginBottomSheetViewModel() -> LoginBottomSheetViewModel {
        let viewModel = LoginBottomSheetViewModel()
        return viewModel
    }
}
