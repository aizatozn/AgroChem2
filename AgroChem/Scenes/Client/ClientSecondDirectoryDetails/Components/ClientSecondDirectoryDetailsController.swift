//
//  ClientSecondDirectoryDetailsController.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 26/4/24.
//

import UIKit

final class ClientSecondDirectoryDetailsController: VMController<ClientSecondDirectoryDetailsPresentable,
                                              ClientSecondDirectoryDetailsViewModel> {

    override func onBindViewModel() {

        viewModel.directories
            .receive(on: DispatchQueue.main)
            .sink { [weak self] direcs in
                guard let self = self else { return }
                content.deistDirectories = direcs
            }
            .store(in: &viewModel.cancellables)
    }
}
