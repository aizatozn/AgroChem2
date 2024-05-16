//
//  ClientGreetingViewModel.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 27/1/24.
//

import Combine
import Foundation
import XCoordinator

protocol GreetingViewModel: BaseVMProtocol {
    var router: UnownedRouter<ClientCatalogRoute>? { get set }
    var counter: CurrentValueSubject<Int, Never> { get set }
    var nextRoute: PassthroughSubject<Void, Never> { get set }
    var cancellables: Set<AnyCancellable> { get set }
}

final class GreetingViewModelImpl: BaseVM<UnownedRouter<ClientCatalogRoute>>,
                                   GreetingViewModel {

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
