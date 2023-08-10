//
//  ProgramCoordinator.swift
//  Meditation
//
//  Created by Лада on 12.05.2023.
//

import UIKit

class ProgramCoordinator: Coordinator, ProgramCoordinatorProtocol {
   var splitViewController = UISplitViewController()
   private let output: ProgramOutput
   
   var primaryNavigationController: CoordinatedNavigationController

   init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController(), output: ProgramOutput) {
      // Настройка главного контроллера
      self.output = output
      self.primaryNavigationController = navigationController
        primaryNavigationController.navigationBar.prefersLargeTitles = true
        primaryNavigationController.coordinator = self
      let programViewController = ProgramModuleBuilder().build(output: self)
//        programViewController.coordinator = self
        primaryNavigationController.viewControllers = [programViewController]
        
        // Настройка деталей котроллера
        programViewController.tabBarItem = UITabBarItem(title: "Programs", image: UIImage(systemName: "button.programmable"), tag: 2)
    }
}

extension ProgramCoordinator: ProgramModuleOutput {
   func wantsToSwitchToStopwatch() {
      output.wantsToSwitchToStopwatch()
   }
   
   func wantsToSwitchToTimer() {
      output.wantsToSwitchToTimer()
   }
   
   func wantsToSwitchToProfile() {
      output.wantsToSwitchToProfile()
   }
   
   
}
