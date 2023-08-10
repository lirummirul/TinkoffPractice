//
//  MainCoordinator.swift
//  Meditation
//
//  Created by Лада on 07.04.2023.
//

import UIKit

class AuthCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    private let output: AuthOutput
    init(output: AuthOutput, navigationController: UINavigationController) {
        self.output = output
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
        let signupVC = SignupModuleBuilder().build(output: self)
        navigationController.pushViewController(signupVC, animated: true)
    }
}

extension AuthCoordinator: LoginModuleOutput {
    func moduleDidFinishAuth() {
        output.signLoginSuccessfully()
    }
    
    func moduleWantsToSignUp() {
        showSignup()
    }
}

extension AuthCoordinator: SignupModuleOutput {
    func moduleHasCompletedRegistration() {
        showLogin()
    }
    func moduleWantsToReturn() {
        showLogin()
    }
}

extension AuthCoordinator: AuthInput {
    func loginDidFinish() {
        output.signLoginSuccessfully()
    }

    func loginDidTapSingup() {
        showSignup()
    }
}
