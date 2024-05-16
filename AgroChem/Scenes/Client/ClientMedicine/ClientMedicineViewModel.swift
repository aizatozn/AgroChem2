//
//  ClientMedicineViewModel.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 8/4/24.
//

import Combine
import Foundation
import XCoordinator

protocol ClientMedicineViewModel: BaseVMProtocol {
    var router: UnownedRouter<ClientCatalogRoute>? { get set }
    var cancellables: Set<AnyCancellable> { get set }
}

final class ClientMedicineViewModelImpl: BaseVM<UnownedRouter<ClientCatalogRoute>>,
                                         ClientMedicineViewModel {

    private var networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        super.init()
    }
}
