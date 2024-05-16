//
//  ClientSystemsViewModel.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 8/4/24.
//

import Combine
import Foundation
import XCoordinator

protocol ClientSystemsViewModel: BaseVMProtocol {
    var router: UnownedRouter<ClientHomeRoute>? { get set }
    var counter: CurrentValueSubject<Int, Never> { get set }
    var nextRoute: PassthroughSubject<Void, Never> { get set }
    var cancellables: Set<AnyCancellable> { get set }
    var pushToLesson: CurrentValueSubject<Int, Never> { get set }
    var selectedSystem: CurrentValueSubject<String?, Never> { get set }
}

final class ClientSystemsViewModelImpl: BaseVM<UnownedRouter<ClientHomeRoute>>,
                                        ClientSystemsViewModel {

    var counter = CurrentValueSubject<Int, Never>(0)
    var nextRoute = PassthroughSubject<Void, Never>()
    var pushToLesson = CurrentValueSubject<Int, Never>(0)
    var selectedSystem = CurrentValueSubject<String?, Never>(nil)

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

        selectedSystem
            .receive(on: DispatchQueue.main)
            .sink { [weak self] name in
                guard let self = self, let name = name else { return }
                var sendData = [SystemCategories]()
                switch name {
                case "Бобовые":
                    sendData = ClientSystemDetailsData.bobData
                case "Зерновые":
                    sendData = ClientSystemDetailsData.zerData
                case "Картофель":
                    sendData = ClientSystemDetailsData.karData
                case "Кукуруза":
                    sendData = ClientSystemDetailsData.kukData
                case "Лён":
                    sendData = ClientSystemDetailsData.lenData
                case "Подсолнечник":
                    sendData = ClientSystemDetailsData.podData
                case "Рапс":
                    sendData = ClientSystemDetailsData.rapsData
                case "Свёкла":
                    sendData = ClientSystemDetailsData.svekData
                default:
                    break
                }
                self.router?.trigger(.systemDetails(title: name,
                                                    data: sendData))
            }
            .store(in: &cancellables)
    }
}
