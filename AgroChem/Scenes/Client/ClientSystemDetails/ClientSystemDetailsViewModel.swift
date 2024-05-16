//
//  ClientSystemDetailsViewModel.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 15/4/24.
//

import Combine
import Foundation
import XCoordinator

struct SystemCategories {
    let systemCategory: ClientSystemCategoryModel
    let categoryDetails: [ClientCategoryDetailsModel]
    var isOpened = false
}

protocol ClientSystemDetailsViewModel: BaseVMProtocol {
    var router: UnownedRouter<ClientHomeRoute>? { get set }
    var counter: CurrentValueSubject<Int, Never> { get set }
    var nextRoute: PassthroughSubject<Void, Never> { get set }
    var cancellables: Set<AnyCancellable> { get set }
    var inputData: CurrentValueSubject<[SystemCategories], Never> { get set }
}

final class ClientSystemDetailsViewModelImpl: BaseVM<UnownedRouter<ClientHomeRoute>>,
                                              ClientSystemDetailsViewModel {
    var inputData = CurrentValueSubject<[SystemCategories], Never>([])

    var counter = CurrentValueSubject<Int, Never>(0)
    var nextRoute = PassthroughSubject<Void, Never>()

    private var networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        super.init()
    }
}
