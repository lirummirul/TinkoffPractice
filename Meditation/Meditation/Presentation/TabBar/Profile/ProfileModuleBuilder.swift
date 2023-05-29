//
//  ProfileModuleBuilder.swift
//  Meditation
//
//  Created by Лада on 04.05.2023.
//

import UIKit

class ProfileModuleBuilder {
    func build(output: ProfileModuleOutput) -> UIViewController {
        let presenter = ProfilePresenter(output: output)
        let viewController = ProfileViewController(output: presenter)
        presenter.view = viewController
        return viewController
    }
}
