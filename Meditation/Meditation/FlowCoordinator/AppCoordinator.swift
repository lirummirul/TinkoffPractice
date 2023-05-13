//
//  AppCoordinator.swift
//  Meditation
//
//  Created by Лада on 13.04.2023.
//

import UIKit
import FirebaseAuth

class AppCoordinator: FlowCoordinatorProtocol {
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if Auth.auth().currentUser == nil {
            auth()
        } else {
            showMain()
        }
    }
    
    func auth() {
        let authCoordinator = AuthCoordinator(output: self, navigationController: navigationController)
        authCoordinator.start()
    }
    
    func showMain() {
        // Лада, не забудь тут builder()
//        let homeVC = MainModuleBuilder().build(output: self)
        let homeVC = MainTabBarController()
        homeVC.navigationItem.hidesBackButton = true
        navigationController.pushViewController(homeVC, animated: true)
    }
}

//extension AppCoordinator: MainModuleOutput {
//    func moduleWantsToExit() {
//        showMain()
//    }
//}

extension AppCoordinator: AppInput {
    func signLoginSuccessfully() {
        showMain()
    }
}

extension AppCoordinator: AuthOutput { }
