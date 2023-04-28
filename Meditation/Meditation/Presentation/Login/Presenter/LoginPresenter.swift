//
//  LoginPresenter.swift
//  Meditation
//
//  Created by Лада on 07.04.2023.
//

import Foundation

class LoginPresenter {
    weak var view: LoginViewInput?
    
    private let output: LoginModuleOutput
    init(output: LoginModuleOutput) {
        self.output = output
    }
}

extension LoginPresenter: LoginViewOutput {
    func didTapSignUpButton() {
        output.moduleWantsToSignUp()
    }
    
    func didTapLoginButton(login: String, password: String) {
        // тут валидация
    }
}

extension LoginPresenter: LoginModuleInput { }
