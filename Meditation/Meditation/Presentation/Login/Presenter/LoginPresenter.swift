//
//  LoginPresenter.swift
//  Meditation
//
//  Created by Лада on 07.04.2023.
//

import Foundation
import FirebaseAuth

class LoginPresenter {
    weak var view: LoginViewInput?
//    weak var viewLoginController: LoginViewController?
    
    private let output: LoginModuleOutput
    init(output: LoginModuleOutput) {
        self.output = output
    }
}

extension LoginPresenter: LoginViewOutput {
    func didTapSignUpButton() {
        output.moduleWantsToSignUp()
    }
    
//    func didTapLoginButton(login: String, password: String) {
//        // тут валидация
//        output.moduleDidFinishAuth()
//    }
    public func didTapLoginButton(email: String, password: String) {
//        Auth.auth().signIn(
//            withEmail: email,
//            password: password
//        ) { result, error in
//            if error != nil {
////                self.viewLoginController!.showOneActionAlert(title: "Error", message: "Вы что-то сделали не правильно", mainButtomTitle: "OK")
//                print("FATAL ERRROR")
////                 return
//            } else {
                output.moduleDidFinishAuth()
//            }
//        }
     }
}

extension LoginPresenter: LoginModuleInput { }
