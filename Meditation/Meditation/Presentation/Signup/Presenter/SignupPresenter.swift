//
//  SignupPresenter.swift
//  Meditation
//
//  Created by Лада on 19.04.2023.
//

import Foundation

class SignupPresenter {
    weak var view: SignupViewInput?

    
}

extension SignupPresenter: SignupViewOutput {
    func signupButtonTapped(login: String, password: String) {
        // тут валидация
    }
    
    
}
