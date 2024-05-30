//
//  ClientDirectoryDetailsViewModel.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 15/4/24.
//

import Combine
import Foundation
import XCoordinator

protocol ClientDirectoryDetailsViewModel: BaseVMProtocol {
    var router: UnownedRouter<ClientDirectoryRoute>? { get set }
    var counter: CurrentValueSubject<Int, Never> { get set }
    var nextRoute: PassthroughSubject<Void, Never> { get set }
    var cancellables: Set<AnyCancellable> { get set }
    var directories: CurrentValueSubject<[ClientDirectoryModel], Never> { get set }
    var tappedDetails: CurrentValueSubject<ClientDirectoryModel?, Never> { get set }
}

final class ClientDirectoryDetailsViewModelImpl: BaseVM<UnownedRouter<ClientDirectoryRoute>>,
                                                 ClientDirectoryDetailsViewModel {
    var tappedDetails = CurrentValueSubject<ClientDirectoryModel?, Never>(nil)
    

    var directories = CurrentValueSubject<[ClientDirectoryModel], Never>([])
    var counter = CurrentValueSubject<Int, Never>(0)
    var nextRoute = PassthroughSubject<Void, Never>()

    private var networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        super.init()
    }

    override func onSubscribe() {
        
        tappedDetails
            .receive(on: DispatchQueue.main)
            .sink { [weak self] model in
                guard let self = self, let model = model else { return }
                self.router?.trigger(.details(model: model))
            }
            .store(in: &cancellables)

        nextRoute
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.router?.trigger(.next)
            }
            .store(in: &cancellables)
    }
}
