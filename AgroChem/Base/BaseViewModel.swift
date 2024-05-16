//
//  BaseViewModel.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 27/1/24.
//

import Foundation
import Combine
import XCoordinator

enum EmptyRoute: Route {}

typealias BaseVM<RouterType: Router> = BaseVMImpl<RouterType> & BaseVMProtocol

protocol BaseVMProtocol {
    associatedtype RouterType: Router
    var cancellables: Set<AnyCancellable> { get set }
    var router: RouterType? { get set }
}

class BaseVMImpl<RouterType: Router>: ObservableObject {

    var cancellables: Set<AnyCancellable> = []
    var router: RouterType?

    init() {
        onSubscribe()
    }

    func onSubscribe() {}

    deinit {
        cancellables.removeAll()
    }
}
