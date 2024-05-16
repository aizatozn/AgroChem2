//
//  ClientDirectoryController.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import Combine

final class ClientDirectoryController: VMController<ClientDirectoryPresentable,
                                  ClientDirectoryViewModel> {

    override func onBindViewModel() {
        content.selectedDirectory
            .receive(on: DispatchQueue.main)
            .sink { [weak self] directory in
                guard let self = self, let directory = directory else { return }
                self.viewModel.selectedDirectory.send(directory)
            }
            .store(in: &viewModel.cancellables)
    }

    override func onConfigureController() {
        title = "Справочники"
    }
}
