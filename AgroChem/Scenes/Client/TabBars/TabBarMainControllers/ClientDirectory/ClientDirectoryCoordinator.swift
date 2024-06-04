//
//  ClientDirectoryCoordinator.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import XCoordinator

enum ClientDirectoryRoute: Route {
    case home
    case next
    case directoryDetails(title: String, directories: [ClientDirectoryModel])
    case secondDirectoryDetails(title: String, directories: [ClientSecondDirectoryModel])
    case thirdDirectoryDetails(title: String, directories: [ClientThirdDirectoryModel])
    case details(model: ClientDirectoryModel)
}

final class ClientDirectoryCoordinator: NavigationCoordinator<ClientDirectoryRoute> {

    private let appRouter: UnownedRouter<AppRoute>

    init(appRouter: UnownedRouter<AppRoute>) {
        self.appRouter = appRouter
        super.init(rootViewController: BaseNavigationController(), initialRoute: .home)
    }

    override func prepareTransition(for route: ClientDirectoryRoute)
    -> NavigationTransition {
        switch route {

        case .home:
            let controller = ClientDirectoryController()
            controller.viewModel.router = unownedRouter
            return .set([controller])

        case .next:
            let controller = ClientDirectoryController()
            controller.hidesBottomBarWhenPushed = true
            return .push(controller)

        case .directoryDetails(let title, let directories):
            let controller = ClientDirectoryDetailsController()
            controller.title = title
            controller.viewModel.directories.send(directories)
            controller.viewModel.router = unownedRouter
            return .push(controller)

        case .secondDirectoryDetails(let title, let directories):
            let controller = ClientSecondDirectoryDetailsController()
            controller.title = title
            controller.viewModel.directories.send(directories)
            controller.viewModel.router = unownedRouter
            return .push(controller)

        case .thirdDirectoryDetails(let title, let directories):
            let controller = ClientThirdDirectoryDetailsController()
            controller.title = title
            controller.viewModel.directories.send(directories)
            controller.viewModel.router = unownedRouter
            return .push(controller)

        case .details(let model):
            let controller = DirectoryDetailsController()
            controller.viewModel.router = unownedRouter
            controller.viewModel.model.send(model)
            return .push(controller)
        }
    }
}
