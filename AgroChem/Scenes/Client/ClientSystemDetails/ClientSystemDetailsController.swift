//
//  ClientSystemDetailsController.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 15/4/24.
//

import UIKit
import Combine

final class ClientSystemDetailsController: VMController<ClientSystemDetailsPresentable,
                                           ClientSystemDetailsViewModel> {

    override func onBindViewModel() {

        viewModel.inputData
            .receive(on: DispatchQueue.main)
            .sink { [weak self] inputData in
                guard let self = self else { return }
                self.content.data = inputData
            }
            .store(in: &viewModel.cancellables)
    }
}
