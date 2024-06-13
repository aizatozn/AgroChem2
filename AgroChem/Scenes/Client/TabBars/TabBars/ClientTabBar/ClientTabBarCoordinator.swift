//
//  ClientTabBarCoordinator.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 27/1/24.
//

import UIKit
import XCoordinator

enum ClientTabBarRoute: Route {
    case home
    case courses
    case exams
    case profile
}

final class ClientTabBarCoordinator: TabBarCoordinator<ClientTabBarRoute> {

    private let appRouter: UnownedRouter<AppRoute>

    private let homeRouter: StrongRouter<ClientHomeRoute>
    private let coursesRouter: StrongRouter<ClientCatalogRoute>
    private let examsRouter: StrongRouter<ClientDirectoryRoute>
    private let profileRouter: StrongRouter<ClientProfileRoute>

    convenience init(appRouter: UnownedRouter<AppRoute>) {

        let homeCoordinator = ClientHomeCoordinator(appRouter: appRouter)

        let homeButton = UITabBarItem(
        title: "Главная",
        image: UIImage(systemName: "house"),
        selectedImage: UIImage(systemName: "house.fill"))

        homeCoordinator.rootViewController.tabBarItem = homeButton

        let coursesCoordinator = ClientCoursesCoordinator(appRouter: appRouter)

        let coursesButton = UITabBarItem(
        title: "Каталог",
        image: UIImage(systemName: "magazine"),
        selectedImage: UIImage(systemName: "magazine.fill"))

        coursesCoordinator.rootViewController.tabBarItem = coursesButton

        let examsCoordinator = ClientDirectoryCoordinator(appRouter: appRouter)

        let examsButton = UITabBarItem(
        title: "Справочник",
        image: UIImage(systemName: "books.vertical"),
        selectedImage: UIImage(systemName: "books.vertical.fill"))

        examsCoordinator.rootViewController.tabBarItem = examsButton

        let profileCoordinator = ClientProfileCoordinator(appRouter: appRouter)

        let profileButton = UITabBarItem(
        title: "Аккаунт",
        image: UIImage(systemName: "person"),
        selectedImage: UIImage(systemName: "person.fill"))

        profileCoordinator.rootViewController.tabBarItem = profileButton

        coursesCoordinator.rootViewController.tabBarItem = coursesButton

        self.init(
            homeRouter: homeCoordinator.strongRouter,
            coursesRouter: coursesCoordinator.strongRouter,
            examsRouter: examsCoordinator.strongRouter,
            profileRouter: profileCoordinator.strongRouter,

            appRouter: appRouter
        )
    }

    init(
        homeRouter: StrongRouter<ClientHomeRoute>,
        coursesRouter: StrongRouter<ClientCatalogRoute>,
        examsRouter: StrongRouter<ClientDirectoryRoute>,
        profileRouter: StrongRouter<ClientProfileRoute>,
        appRouter: UnownedRouter<AppRoute>
    ) {
        self.homeRouter = homeRouter
        self.coursesRouter = coursesRouter
        self.examsRouter = examsRouter
        self.profileRouter = profileRouter
        self.appRouter = appRouter

        super.init(
            rootViewController: ClientTabBarController(),
            tabs: [homeRouter, coursesRouter, examsRouter, profileRouter],
            select: homeRouter
        )
    }

    // MARK: Overrides

    override func prepareTransition(for route: ClientTabBarRoute) -> TabBarTransition {
        switch route {
        case .home:
            return .select(homeRouter)
        case .courses:
            return .select(coursesRouter)
        case .exams:
            return .select(examsRouter)
        case .profile:
            return .select(profileRouter)
        }
    }
}
