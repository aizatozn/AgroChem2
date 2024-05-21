//
//  ClientCatalogDetailsViewModel.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 16/5/24.
//

import Combine
import Foundation
import XCoordinator

protocol ClientCatalogDetailsViewModel: BaseVMProtocol {
    var router: UnownedRouter<ClientCatalogRoute>? { get set }
    var cancellables: Set<AnyCancellable> { get set }
    var catalogBulJerde: CurrentValueSubject<[ClientCatalogDetailsModel], Never> { get set }
}

final class ClientCatalogDetailsViewModelImpl: BaseVM<UnownedRouter<ClientCatalogRoute>>,
                                               ClientCatalogDetailsViewModel {
    var catalogBulJerde = CurrentValueSubject<[ClientCatalogDetailsModel], Never>([])

    private var networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        super.init()
    }
}
