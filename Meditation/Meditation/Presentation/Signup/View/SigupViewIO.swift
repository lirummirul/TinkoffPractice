//
//  SigupViewIO.swift
//  Meditation
//
//  Created by Лада on 19.04.2023.
//

import UIKit

protocol SignupViewInput: AnyObject {
}

protocol SignupViewOutput: AnyObject {
    func signupButtonTapped(login: String, password: String)
}
