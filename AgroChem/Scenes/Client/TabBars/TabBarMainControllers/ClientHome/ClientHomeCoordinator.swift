//
//  ClientHomeCoordinator.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import XCoordinator

enum ClientHomeRoute: Route {
    case home
    case next
    case helpAndSupport
    case protectionSystems
    case systemDetails(title: String,
                       data: [SystemCategories])
}

final class ClientHomeCoordinator: NavigationCoordinator<ClientHomeRoute> {

    private let appRouter: UnownedRouter<AppRoute>

    init(appRouter: UnownedRouter<AppRoute>) {
        self.appRouter = appRouter
        super.init(rootViewController: BaseNavigationController(), initialRoute: .home)
    }

    override func prepareTransition(for route: ClientHomeRoute)
    -> NavigationTransition {
        switch route {

        case .home:
            let controller = ClientHomeController()
            controller.viewModel.router = unownedRouter
            return .set([controller])

        case .next:
            let controller = ClientHomeController()
            controller.hidesBottomBarWhenPushed = true
            return .push(controller)

        case .helpAndSupport:
            let controller = ClientHelpAndSupportController()
            controller.viewModel.router = unownedRouter
            return .push(controller)

        case .protectionSystems:
            let controller = ClientSystemsController()
            controller.viewModel.router = unownedRouter
            return .push(controller)

        case .systemDetails(let title, let data):
            let controller = ClientSystemDetailsController()
            controller.title = title
            controller.viewModel.inputData.send(data)
            return .push(controller)
        }
    }
}
