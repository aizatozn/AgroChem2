//
//  ClientCatalogViewModel.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import Combine
import Foundation
import XCoordinator

struct ClientCatalogModel: Codable {
    let image: String
    let name: String
    let subName: String
    let description: String
}

protocol ClientCatalogViewModel: BaseVMProtocol {
    var router: UnownedRouter<ClientCatalogRoute>? { get set }
    var counter: CurrentValueSubject<Int, Never> { get set }
    var nextRoute: PassthroughSubject<Void, Never> { get set }
    var cancellables: Set<AnyCancellable> { get set }
    var pushToLesson: CurrentValueSubject<Int, Never> { get set }
    var selectedMedicine: CurrentValueSubject<ClientCatalogModel?, Never> { get set }
}

final class ClientCatalogViewModelImpl: BaseVM<UnownedRouter<ClientCatalogRoute>>,
                                        ClientCatalogViewModel {

    var counter = CurrentValueSubject<Int, Never>(0)
    var nextRoute = PassthroughSubject<Void, Never>()
    var pushToLesson = CurrentValueSubject<Int, Never>(0)
    var selectedMedicine = CurrentValueSubject<ClientCatalogModel?, Never>(nil)

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

        selectedMedicine
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] object in
                guard let self = self,
                      let object = object else { return }
                self.router?.trigger(.medicineDetails(medicine: object))
            }
            .store(in: &cancellables)
    }
}
