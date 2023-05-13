//
//  ProfileCoordinator.swift
//  Meditation
//
//  Created by Лада on 12.05.2023.
//

import UIKit

class ProfileCoordinator: Coordinator {
    var splitViewController = UISplitViewController()
    var primaryNavigationController = CoordinatedNavigationController()

    init() {
        // Настройка главного конроллера
        primaryNavigationController.navigationBar.prefersLargeTitles = true
        primaryNavigationController.coordinator = self
        let viewController = ProfileViewController()
        viewController.coordinator = self
        primaryNavigationController.viewControllers = [viewController]

        splitViewController.viewControllers = [primaryNavigationController]
        viewController.loadViewIfNeeded()
        splitViewController.tabBarItem = UITabBarItem(title: "Person", image: UIImage(systemName: "button.programmable"), tag: 4)
    }
}
