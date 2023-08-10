//
//  FlowCoordinatorProtocol.swift
//  Meditation
//
//  Created by Лада on 13.04.2023.
//

import UIKit

protocol FlowCoordinatorProtocol {
    var navigationController: UINavigationController { get }
    func start()
    func auth()
    func showMain()
}

protocol AppInput: AnyObject {
    func signLoginSuccessfully()
}

protocol AppOutput: AnyObject { }
