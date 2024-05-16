//
//  ClientThirdDirectoryDetailsController.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 27/4/24.
//

import UIKit

final class ClientThirdDirectoryDetailsController: VMController<ClientThirdDirectoryDetailsPresentable,
                                              ClientThirdDirectoryDetailsViewModel> {

    override func onBindViewModel() {

        viewModel.directories
            .receive(on: DispatchQueue.main)
            .sink { [weak self] direcs in
                guard let self = self else { return }
                content.directories = direcs
            }
            .store(in: &viewModel.cancellables)
    }
}
