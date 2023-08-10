//
//  TabBarModuleBuilder.swift
//  Meditation
//
//  Created by Лада on 28.05.2023.
//

import UIKit

class TabBarModuleBuilder {
    func build(output: TabBarModuleOutput) -> UIViewController {
        let presenter = TabBarPresenter(output: output)
        let viewController = TabBarController(output: presenter)
        presenter.view = viewController
        return viewController
    }
}

