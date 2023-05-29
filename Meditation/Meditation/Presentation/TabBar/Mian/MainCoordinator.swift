//
//  MainCoordinator.swift
//  Meditation
//
//  Created by Лада on 12.05.2023.
//

import UIKit

class MainCoordinator: Coordinator, MainCoordinatorProtocol {
    var primaryNavigationController: CoordinatedNavigationController
    private let output: MainOutput
    private static let firstRunDefaultsKey = "ShownFirstRun"

    // True при первом запуске приложения.
    var isFirstRun: Bool {
        return UserDefaults.standard.bool(forKey: MainCoordinator.firstRunDefaultsKey) == false
    }

    init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController(), output: MainOutput) {
        self.output = output
        self.primaryNavigationController = navigationController
        primaryNavigationController.navigationBar.prefersLargeTitles = true
        primaryNavigationController.coordinator = self

        let viewController = MainModuleBuilder().build(output: self)
//        viewController.coordinator = self
        primaryNavigationController.viewControllers = [viewController]
        
        viewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "button.programmable"), tag: 1)
    }
}

extension MainCoordinator: MainModuleOutput {
    func wantsToSwitchToStopwatch() {
        output.wantsToSwitchToStopwatch()
    }

    func wantsToSwitchToPrograms() {
        output.wantsToSwitchToPrograms()
    }

    func wantsToSwitchToProfile() {
        output.wantsToSwitchToProfile()
    }
}
