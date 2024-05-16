//
//  ClientTabBarController.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 27/1/24.
//

import UIKit

final class ClientTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarAppearance()
        drawLineAtTopOfTabBar()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        var tabBarFrame = tabBar.frame
        tabBarFrame.size.height = UIScreen.main.bounds.height * 0.11
        tabBarFrame.origin.y = view.frame.size.height - UIScreen.main.bounds.height * 0.1
        tabBar.frame = tabBarFrame
    }

    private func drawLineAtTopOfTabBar() {
        let lineView = UIView()
        lineView.backgroundColor = .gray
        lineView.frame = CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 0.5)
        tabBar.addSubview(lineView)
    }

    private func setTabBarAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBar.backgroundColor = .white
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .white
        tabBar.standardAppearance = tabBarAppearance
        tabBar.itemSpacing = (UIScreen.main.bounds.width / 5.9) / 100
        tabBar.tintColor = UIColor(red: 0/255, green: 153/255, blue: 51/255, alpha: 1.0)
        tabBar.unselectedItemTintColor = .lightGray
    }
}
