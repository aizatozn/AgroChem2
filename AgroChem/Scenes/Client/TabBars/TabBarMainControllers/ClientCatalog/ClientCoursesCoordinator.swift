//
//  ClientCoursesCoordinator.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import XCoordinator

enum ClientCatalogRoute: Route {
    case home
    case next
    case medicineDetails(medicine: ClientCatalogModel)
    case catalogDetails(title: String, catalogs: [ClientCatalogDetailsModel])
}

final class ClientCoursesCoordinator: NavigationCoordinator<ClientCatalogRoute> {

    private let appRouter: UnownedRouter<AppRoute>

    init(appRouter: UnownedRouter<AppRoute>) {
        self.appRouter = appRouter
        super.init(rootViewController: BaseNavigationController(), initialRoute: .home)
    }

    override func prepareTransition(for route: ClientCatalogRoute)
    -> NavigationTransition {
        switch route {

        case .home:
            let controller = ClientCatalogController()
            controller.viewModel.router = unownedRouter
            return .set([controller])

        case .next:
            let controller = ClientCatalogController()
            controller.hidesBottomBarWhenPushed = true
            return .push(controller)

        case .medicineDetails(medicine: let medicine):
            let controller = ClientMedicineController()
            controller.title = medicine.name
            return .push(controller)

        case .catalogDetails(let title, let catalogs):
            let controller = ClientCatalogDetailsController()
            controller.title = title
            controller.viewModel.catalogBulJerde.send(catalogs)
            controller.viewModel.router = unownedRouter
            return .push(controller)
        }
    }
}
