//
//  ClientSecondDirectoryDetailsViewModel.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 26/4/24.
//

import Combine
import Foundation
import XCoordinator

protocol ClientSecondDirectoryDetailsViewModel: BaseVMProtocol {
    var router: UnownedRouter<ClientDirectoryRoute>? { get set }
    var counter: CurrentValueSubject<Int, Never> { get set }
    var nextRoute: PassthroughSubject<Void, Never> { get set }
    var cancellables: Set<AnyCancellable> { get set }
    var directories: CurrentValueSubject<[ClientSecondDirectoryModel], Never> { get set }
}

final class ClientSecondDirectDetailsViewModelImpl:
                            BaseVM<UnownedRouter<ClientDirectoryRoute>>,
                                ClientSecondDirectoryDetailsViewModel {

    var directories = CurrentValueSubject<[ClientSecondDirectoryModel], Never>([])
    var counter = CurrentValueSubject<Int, Never>(0)
    var nextRoute = PassthroughSubject<Void, Never>()

    private var networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        super.init()
    }

    override func onSubscribe() {

        nextRoute
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.router?.trigger(.next)
            }
            .store(in: &cancellables)
    }
}
