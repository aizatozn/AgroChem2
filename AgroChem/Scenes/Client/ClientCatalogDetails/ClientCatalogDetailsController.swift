//
//  ClientCatalogDetails.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 16/5/24.
//

import UIKit
import Combine

final class ClientCatalogDetailsController: VMController<ClientCatalogDetailsPresentable,
                                            ClientCatalogDetailsViewModel> {
    
    override func onBindViewModel() {

        viewModel.catalogBulJerde
            .receive(on: DispatchQueue.main)
            .sink { [weak self] catalogs in
                guard let self = self else { return }
                content.name = navigationItem.title ?? ""
                content.catalogDetails = catalogs
            }
            .store(in: &viewModel.cancellables)
    }

}
