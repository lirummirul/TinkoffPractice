//
//  UserModel.swift
//  Meditation
//
//  Created by Лада on 02.04.2023.
//

import UIKit

class UserModel {
    var name: String?
    var email: String?
    var password: String?
    
    func isValidEmail() -> Bool {
        // Проверяем, что email пользователя валиден
        return true
    }
    
    func isValidPassword() -> Bool {
        // Проверяем, что пароль пользователя валиден
        return true
    }
    
    // ...
}
// В модели UserModel определены свойства для хранения данных пользователя и методы для проверки валидности электронной почты и пароля.
