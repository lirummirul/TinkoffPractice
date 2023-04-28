//
//  SignupModuleBuilder.swift
//  Meditation
//
//  Created by Лада on 19.04.2023.
//

import UIKit

class SignupModuleBuilder {
    func build() -> UIViewController {
        let presenter = SignupPresenter()
        let viewController = SignupViewController(presenter: presenter)
        presenter.view = viewController
        return viewController
    }
}
