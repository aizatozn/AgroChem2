//
//  ServicesAssembly.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 27/1/24.
//

import Swinject
import Foundation
import SwinjectAutoregistration

final class ServicesAssembly: Assembly {

    public func assemble(container: Swinject.Container) {

        container.autoregister(
            NetworkManager.self, initializer: NetworkManagerImpl.init
        ).inObjectScope(.container)

        container.register(UserDefaults.self) { _ in
            UserDefaults.standard
        }.inObjectScope(.container)

        container.autoregister(
            UserDefaultsService.self, initializer: UserDefaultsServiceImpl.init
        ).inObjectScope(.container)

    }
}
