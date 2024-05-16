//
//  ClientCatalogController.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import Combine

final class ClientCatalogController: VMController<ClientCatalogPresentable,
                                     ClientCatalogViewModel> {

    override func onBindViewModel() {

        content.selectedMedicine
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] obj in
                guard let self = self else { return }
                self.viewModel.selectedMedicine.send(obj)
            }
            .store(in: &viewModel.cancellables)
    }

    override func onConfigureController() {
        title = "Каталог"
    }
}
