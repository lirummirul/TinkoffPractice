//
//  StopWatchCoordinator.swift
//  Meditation
//
//  Created by Лада on 12.05.2023.
//

import UIKit

class StopWatchCoordinator: Coordinator, StopWatchCoordinatorProtocol {
    var primaryNavigationController: CoordinatedNavigationController
    private let output: StopWatchOutput
    
    init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController(), output: StopWatchOutput) {
        self.output = output
        // Настройка главного контроллера
        self.primaryNavigationController = navigationController
        primaryNavigationController.navigationBar.prefersLargeTitles = true
        primaryNavigationController.coordinator = self
        let stopwatchViewController = StopWatchModuleBuilder().build(output: self)
//        stopwatchViewController.coordinator = self
        primaryNavigationController.viewControllers = [stopwatchViewController]

        // Настройка деталей контроллера
        stopwatchViewController.tabBarItem = UITabBarItem(title: "Stopwath", image: UIImage(systemName: "button.programmable"), tag: 1)
    }
}

extension StopWatchCoordinator: StopWatchModuleOutput {
    func wantsToSwitchToMusic() {
        output.wantsToSwitchToMusic()
    }
    
    func wantsToSwitchToTimer() {
        output.wantsToSwitchToTimer()
    }
    
    func wantsToSwitchToPrograms() {
        output.wantsToSwitchToPrograms()
    }
    
    func wantsToSwitchToProfile() {
        output.wantsToSwitchToProfile()
    }
    
    
}
