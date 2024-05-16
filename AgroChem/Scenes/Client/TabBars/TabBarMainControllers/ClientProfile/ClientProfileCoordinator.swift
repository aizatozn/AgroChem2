//
//  ClientProfileCoordinator.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import XCoordinator

enum ClientProfileRoute: Route {
    case home
    case next
}

final class ClientProfileCoordinator: NavigationCoordinator<ClientProfileRoute> {

    private let appRouter: UnownedRouter<AppRoute>

    init(appRouter: UnownedRouter<AppRoute>) {
        self.appRouter = appRouter
        super.init(rootViewController: BaseNavigationController(), initialRoute: .home)
    }

    override func prepareTransition(for route: ClientProfileRoute)
    -> NavigationTransition {
        switch route {

        case .home:
            let controller = ClientProfileController()
            controller.viewModel.router = unownedRouter
            return .set([controller])

        case .next:
            let controller = ClientProfileController()
            controller.hidesBottomBarWhenPushed = true
            return .push(controller)
        }
    }
}
