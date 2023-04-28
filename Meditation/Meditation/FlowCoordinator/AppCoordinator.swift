//
//  AppCoordinator.swift
//  Meditation
//
//  Created by Лада on 13.04.2023.
//

import UIKit

class AppCoordinator: FlowCoordinatorProtocol {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        auth()
    }
    
    func auth() {
        let authCoordinator = AuthCoordinator(navigationController: navigationController)
        authCoordinator.start()
    }
}

extension AppCoordinator: AppInput {
    
}

extension AppCoordinator: AppOutput {
    
}
