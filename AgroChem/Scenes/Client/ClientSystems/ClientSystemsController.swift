//
//  ClientSystemsController.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 8/4/24.
//

import UIKit
import Combine

final class ClientSystemsController: VMController<ClientSystemsPresentable,
                                     ClientSystemsViewModel> {

    override func onBindViewModel() {
        content.selectedSystem
            .receive(on: DispatchQueue.main)
            .sink { [weak self] name in
                guard let self = self, let name = name else { return }
                self.viewModel.selectedSystem.send(name)
            }
            .store(in: &viewModel.cancellables)
    }

    override func onConfigureController() {
        title = "Системы защиты"
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
