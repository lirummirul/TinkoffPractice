//
//  MainCoordinator.swift
//  Meditation
//
//  Created by Лада on 07.04.2023.
//

import UIKit

class AuthCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showLogin()
    }
    
    func showLogin() {
        let loginVC = LoginModuleBuilder().build(output: self)
        navigationController.pushViewController(loginVC, animated: true)
    }
    
    func showSignup() {
        let signupVC = SignupModuleBuilder().build()
        navigationController.pushViewController(signupVC, animated: true)
    }
    
    func showHome() {
        let homeVC = MainViewController()
        navigationController.pushViewController(homeVC, animated: true)
    }

}

extension AuthCoordinator: LoginModuleOutput {
    func moduleDidFinishAuth() { }
    
    func moduleWantsToSignUp() {
        showSignup()
    }
}

extension AuthCoordinator: AuthInput {
    func loginDidFinish() {
        showHome()
    }

    func loginDidTapSingup() {
        showSignup()
    }
}

extension AuthCoordinator: AuthOutput {
    func signLoginSuccessfully() {
        showHome()
    }
}
