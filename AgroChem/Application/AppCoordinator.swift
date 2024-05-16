//
//  AppCoordinator.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 27/1/24.
//

import UIKit
import XCoordinator

enum AppRoute: Route {
    case home
}

final class AppCoordinator: NavigationCoordinator<AppRoute> {

    init() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .white
        let navigation = BaseNavigationController(
        rootViewController: viewController)

        super.init(rootViewController: navigation, initialRoute: .home)
    }

    override func prepareTransition(for route: AppRoute)
    -> NavigationTransition {

        switch route {

        case .home:
            rootViewController.isNavigationBarHidden = true
            let coordinator = ClientTabBarCoordinator(appRouter: unownedRouter)
            return .set([coordinator])
        }
    }
}
