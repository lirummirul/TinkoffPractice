//
//  MainModuleBuilder.swift
//  Meditation
//
//  Created by Лада on 28.05.2023.
//

import UIKit

class MainModuleBuilder {
    func build(output: MainModuleOutput) -> UIViewController {
        let presenter = MainPresenter(output: output)
        let viewController = MainViewController(output: presenter)
        presenter.view = viewController
        return viewController
    }
}
