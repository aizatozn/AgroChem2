//
//  ClientHomeViewModel.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import Combine
import Foundation
import XCoordinator

protocol ClientHomeViewModel: BaseVMProtocol {
    var router: UnownedRouter<ClientHomeRoute>? { get set }
    var counter: CurrentValueSubject<Int, Never> { get set }
    var nextRoute: PassthroughSubject<Void, Never> { get set }
    var cancellables: Set<AnyCancellable> { get set }
    var catalogCollectionSelected: CurrentValueSubject<Int, Never> { get set }
}

final class ClientHomeViewModelImpl: BaseVM<UnownedRouter<ClientHomeRoute>>,
                                     ClientHomeViewModel {

    var counter = CurrentValueSubject<Int, Never>(0)
    var nextRoute = PassthroughSubject<Void, Never>()
    var catalogCollectionSelected = CurrentValueSubject<Int, Never>(0)

    private var networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        super.init()
    }

    override func onSubscribe() {

        catalogCollectionSelected
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] index in
                guard let self = self else { return }
                switch index {
                case 1:
                    self.router?.trigger(.protectionSystems)
                case 2:
                    self.router?.trigger(.helpAndSupport)
                default:
                    break
                }
            }
            .store(in: &cancellables)
    }
}
