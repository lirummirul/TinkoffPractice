//
//  SignupModuleBuilder.swift
//  Meditation
//
//  Created by Лада on 19.04.2023.
//

import UIKit

class SignupModuleBuilder {
    func build(output: SignupModuleOutput) -> UIViewController {
        let presenter = SignupPresenter(output: output)
        let viewController = SignupViewController(output: presenter)
        presenter.view = viewController
        return viewController
    }
}
