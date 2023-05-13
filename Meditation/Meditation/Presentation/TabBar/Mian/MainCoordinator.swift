//
//  MainCoordinator.swift
//  Meditation
//
//  Created by Лада on 12.05.2023.
//

import UIKit

class MainCoordinator: Coordinator {
    var splitViewController = UISplitViewController()
    var navigationController = CoordinatedNavigationController()

    private static let firstRunDefaultsKey = "ShownFirstRun"

    // True при первом запуске приложения.
    var isFirstRun: Bool {
        return UserDefaults.standard.bool(forKey: MainCoordinator.firstRunDefaultsKey) == false
    }

    init() {
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.coordinator = self

        let viewController = MainViewController()
        viewController.coordinator = self
        navigationController.viewControllers = [viewController]

        splitViewController.viewControllers = [navigationController]
        splitViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "button.programmable"), tag: 1)
    }
}
