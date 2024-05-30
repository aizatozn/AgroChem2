//
//  ClientDirectoryDetailsController.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 15/4/24.
//

import UIKit

final class ClientDirectoryDetailsController: VMController<ClientDirectoryDetailsPresentable,
                                              ClientDirectoryDetailsViewModel> {

    override func onBindViewModel() {
        
        content.pushToDetails
            .receive(on: DispatchQueue.main)
            .sink { [weak self] model in
                guard let self = self else { return }
                viewModel.tappedDetails.send(model)
            }
            .store(in: &viewModel.cancellables)
        

        viewModel.directories
            .receive(on: DispatchQueue.main)
            .sink { [weak self] direcs in
                guard let self = self else { return }
                content.firstDirectories = direcs
            }
            .store(in: &viewModel.cancellables)
    }
}
