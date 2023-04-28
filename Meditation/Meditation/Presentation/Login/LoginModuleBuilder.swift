//
//  LoginModuleBuilder.swift
//  Meditation
//
//  Created by Лада on 12.04.2023.
//

import UIKit

class LoginModuleBuilder {
    func build(output: LoginModuleOutput) -> UIViewController {
        let presenter = LoginPresenter(output: output)
        let viewController = LoginViewController(output: presenter)
        presenter.view = viewController
        return viewController
    }
}
