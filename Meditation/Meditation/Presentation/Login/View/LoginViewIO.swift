//
//  LoginViewIO.swift
//  Meditation
//
//  Created by Лада on 12.04.2023.
//

import Foundation

protocol LoginViewInput: AnyObject {
}

protocol LoginViewOutput: AnyObject {
    func didTapLoginButton(login: String, password: String) // кнопка входа
    func didTapSignUpButton() // кнопка регисрации
}
