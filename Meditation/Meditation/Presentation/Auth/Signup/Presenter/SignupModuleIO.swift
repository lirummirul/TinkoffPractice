//
//  SignupModuleIO.swift
//  Meditation
//
//  Created by Лада on 28.04.2023.
//

import Foundation

protocol SignupModuleInput: AnyObject { }

protocol SignupModuleOutput: AnyObject {
    func moduleHasCompletedRegistration() // завершение регистрации
}
