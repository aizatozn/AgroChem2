//
//  SwinjectServices.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 27/1/24.
//

import UIKit
import Swinject

final class SwinjectServices: NSObject,
                              UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {

        assemblyApplication()
        return true
    }

    private func assemblyApplication() {

        Swinjectable.assembler.apply(
            assemblies: [
                ViewModulesAssembly(),
                ServicesAssembly()
            ]
        )
    }
}
