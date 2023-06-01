//
//  LoginModuleIO.swift
//  Meditation
//
//  Created by Лада on 21.04.2023.
//

import Foundation

protocol LoginModuleInput: AnyObject { }

protocol LoginModuleOutput: AnyObject {
    func moduleWantsToSignUp()
    func moduleDidFinishAuth()
}
