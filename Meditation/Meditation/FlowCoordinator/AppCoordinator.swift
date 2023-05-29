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
//    private let output: AppOutput
    init(navigationController: UINavigationController) {
//        self.output = output
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
        let homeVC = TabBarModuleBuilder().build(output: self)
        homeVC.navigationItem.hidesBackButton = true
        navigationController.pushViewController(homeVC, animated: true)
    }
}

extension AppCoordinator: AppInput {
    func signLoginSuccessfully() {
        showMain()
    }
}

extension AppCoordinator: TabBarModuleOutput {
    func moduleDidTabTimer() {
        showMain()
    }
    
    func moduleDidTabStopWatch() {
        showMain()
    }
    
    func moduleDidTabProgram() {
        showMain()
    }
    
    func moduleDidTabProfile() {
        showMain()
    }
    
    
}

extension AppCoordinator: AuthOutput { }
