//
//  Coordinator.swift
//  Meditation
//
//  Created by Лада on 07.04.2023.
//

import UIKit

protocol CoordinatorProtocol {
    var navigationController: UINavigationController { get }
    func start()
    func showLogin()
    func showSignup()
}

protocol AuthInput: AnyObject {
    func loginDidFinish()
    func loginDidTapSingup()
}

protocol AuthOutput: AnyObject {
    func signLoginSuccessfully()
}
