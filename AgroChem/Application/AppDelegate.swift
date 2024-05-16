//
//  AppDelegate.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 23/1/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private lazy var mainWindow = UIWindow()
    private lazy var router = AppCoordinator().strongRouter
    private lazy var services: [UIApplicationDelegate] = [
        SwinjectServices()
    ]

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
    -> Bool {
        mainWindow.overrideUserInterfaceStyle = .light
        services.forEach {
            _ = $0.application?(application, didFinishLaunchingWithOptions: launchOptions)
        }
        router.setRoot(for: mainWindow)

        return true
    }
}
