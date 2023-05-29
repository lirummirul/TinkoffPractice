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
    private static let firstRunDefaultsKey = "ShownFirstRun"

    // True при первом запуске приложения.
    
    init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController(), output: ProfileOutput) {
        // Настройка главного конроллера
        self.output = output
        self.primaryNavigationController = navigationController
        primaryNavigationController.navigationBar.prefersLargeTitles = true
        primaryNavigationController.coordinator = self
        let viewController = ProfileModuleBuilder().build(output: self)
//        viewController.coordinator = self
        primaryNavigationController.viewControllers = [viewController]

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
