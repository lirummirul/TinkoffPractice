//
//  ProfileCoordinator.swift
//  Meditation
//
//  Created by Лада on 12.05.2023.
//

import UIKit

class ProfileCoordinator: Coordinator, ProfileCoordinatorProtocol {
    var primaryNavigationController: CoordinatedNavigationController

    private let output: ProfileOutput

    init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController(), output: ProfileOutput) {
        // Настройка главного конроллера
        self.output = output
        self.primaryNavigationController = navigationController
        primaryNavigationController.navigationBar.prefersLargeTitles = true
        primaryNavigationController.coordinator = self
        let viewController = ProfileModuleBuilder().build(output: self)
        primaryNavigationController.viewControllers = [viewController]
        
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = UIColor.clear

        viewController.loadViewIfNeeded()
        viewController.tabBarItem = UITabBarItem(title: "Person", image: UIImage(systemName: "button.programmable"), tag: 4)
    }
}

extension ProfileCoordinator: ProfileModuleOutput {
    func wantsToSwitchToStopwatch() {
        output.wantsToSwitchToStopwatch()
    }
    
    func wantsToSwitchToPrograms() {
        output.wantsToSwitchToPrograms()
    }
    
    func wantsToSwitchToTimer() {
        output.wantsToSwitchToTimer()
    }
}
