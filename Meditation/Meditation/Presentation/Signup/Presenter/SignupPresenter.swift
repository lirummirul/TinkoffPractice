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
//    weak var viewSignupController: SignupViewController?
//    public static let shared = SignupPresenter()
//    private init() {}
    
    private let output: SignupModuleOutput
    init(output: SignupModuleOutput) {
        self.output = output
    }
}
// Надо спросить, точно ли тут мне закидывать в бд
// Ещё про регистрацию: пользователь должен вводить номер/почту или просто свой ник

extension SignupPresenter: SignupViewOutput {
    // Обработка ошибок и успешной регистрации
    func signupButtonTapped(login: String, email: String, password: String) {
//        Auth.auth().createUser(withEmail: email, password: password) { result, error in
//            if let error = error {
//                print("Ошибочка: \(error.localizedDescription)")
//                print("FATAL ERRROR Вот тут вот")
////                self.viewSignupController!.showOneActionAlert(title: "Error", message: "Ты что-то сделал не так!!!", mainButtomTitle: "OK")
//                return
//            } else {
//                print("Принятно, обработано")
//            }
//
//            let user = [
//                "username": login,
//                "email": email
//            ]
//            let uid = result!.user.uid
//            Database.database().reference().child("users").child(uid).setValue(user)
//
//            guard let resultUser = result?.user else {
////                self.viewSignupController!.showOneActionAlert(title: "Error", message: "Ты что-то сделал не так!!!", mainButtomTitle: "OK")
//                print("FATAL ERRROR")
//                return
//            }
//
//            let db = Firestore.firestore()
//            db.collection("users")
//                .document(resultUser.uid)
//                .setData([
//                    "username": login,
//                    "email": email
//                ]) { error in
//                    if error != nil {
////                        self.viewSignupController!.showOneActionAlert(title: "Error", message: "Ты что-то сделал не так!!!", mainButtomTitle: "OK")
//                        print("FATAL ERRROR")
//                        return
//                    }
//                }
            
//        }
        
//        Auth.auth().createUser(withEmail: login, password: password) { authResult, error in
//            guard let user = authResult?.user, error == nil else {
//                print("Error creating user: \(error!.localizedDescription)")
//                return
//            }
//
//            let userData = [
//                "login": login,
//                "password": password
//            ]
//
//            let db = Firestore.firestore()
//            db.collection("users").document(user.uid).setData(userData) { error in
//                if let error = error {
//                    print("Error saving user data: \(error.localizedDescription)")
//                } else {
//                    // Успешная авторизация
//                    self.output.moduleHasCompletedRegistration()
//                    print("User data saved successfully!")
//                }
//            }
            
//            let db = Firestore.firestore()
//            db.collection("users").document(user.uid).setData([
//              "email": user.email
////              "password": user.password
//            ]) { error in
//              if let error = error {
//                print("Error saving user data: \(error.localizedDescription)")
//              } else {
//                print("User data saved successfully!")
//              }
//            }

//        }
    }
}
