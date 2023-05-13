//
//  ProgramCoordinator.swift
//  Meditation
//
//  Created by Лада on 12.05.2023.
//

import UIKit

class ProgramCoordinator: Coordinator {
    var splitViewController = UISplitViewController()
    var primaryNavigationController = CoordinatedNavigationController()

    init() {
        // Настройка главного контроллера
        primaryNavigationController.navigationBar.prefersLargeTitles = true
        primaryNavigationController.coordinator = self
        let programViewController = ProgramViewController()
        programViewController.coordinator = self
        primaryNavigationController.viewControllers = [programViewController]
        
        // Настройка деталей котроллера
        splitViewController.viewControllers = [primaryNavigationController]
        splitViewController.tabBarItem = UITabBarItem(title: "Programs", image: UIImage(systemName: "button.programmable"), tag: 2)
    }
}
