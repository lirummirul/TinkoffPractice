//
//  LoginPresenter.swift
//  Meditation
//
//  Created by Лада on 07.04.2023.
//

import Foundation
import FirebaseAuth
import Firebase

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
    
    public func didTapLoginButton(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error == nil {
                print(result?.user.uid)
                self.output.moduleDidFinishAuth()
            } else {
                print(error?.localizedDescription)
            }
        }
     }
}

extension LoginPresenter: LoginModuleInput { }
