//
//  StopWatchCoordinator.swift
//  Meditation
//
//  Created by Лада on 12.05.2023.
//

import UIKit

class StopWatchCoordinator: Coordinator {
    var splitViewController = UISplitViewController()
    var primaryNavigationController = CoordinatedNavigationController()
 
    init() {
        // Настройка главного контроллера
        primaryNavigationController.navigationBar.prefersLargeTitles = true
        primaryNavigationController.coordinator = self
        let stopwatchViewController = StopWatchViewController()
        stopwatchViewController.coordinator = self
        primaryNavigationController.viewControllers = [stopwatchViewController]

        // Настройка деталей контроллера
        splitViewController.viewControllers = [primaryNavigationController]
        splitViewController.tabBarItem = UITabBarItem(title: "Stopwath", image: UIImage(systemName: "button.programmable"), tag: 1)
    }
}
