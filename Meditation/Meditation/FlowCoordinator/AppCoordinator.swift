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
        let homeVC = TabBarModuleBuilder().build(output: self)
        homeVC.navigationItem.hidesBackButton = true
        navigationController.pushViewController(homeVC, animated: true)
    }
    
    func showMusic() {
        let musicCoordinator = MusicModuleBuilder().build(output: self)
        navigationController.pushViewController(musicCoordinator, animated: true)
    }
}

extension AppCoordinator: AppInput {
    func signLoginSuccessfully() {
        showMain()
    }
}

extension AppCoordinator: TabBarModuleOutput {
    func wantsToSwitchToMusic() {
        showMusic()
    }
    
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

extension AppCoordinator: MusicModuleOutput {
    func moduleWantsToExit() {
        showMain()
    }
}

extension AppCoordinator: AuthOutput { }
