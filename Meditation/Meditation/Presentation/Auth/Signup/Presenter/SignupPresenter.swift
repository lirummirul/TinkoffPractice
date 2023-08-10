//
//  SignupPresenter.swift
//  Meditation
//
//  Created by Лада on 19.04.2023.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

struct User {
    var login: String
    var email: String
    var password: String
}

class SignupPresenter {
    weak var view: SignupViewInput?
    
    private let output: SignupModuleOutput
    init(output: SignupModuleOutput) {
        self.output = output
    }
}

extension SignupPresenter: SignupViewOutput {
    func signupButtonTapped(login: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error == nil {
                if let result = result {
                    print(result.user.uid)
                    let res = Database.database().reference().child("users")
                    res.child(result.user.uid).updateChildValues(["users": login, "email": email])
                }
            }
        }
    }
}
