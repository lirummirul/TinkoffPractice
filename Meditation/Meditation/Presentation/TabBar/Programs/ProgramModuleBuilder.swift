//
//  ProgramModuleBuilder.swift
//  Meditation
//
//  Created by Лада on 29.05.2023.
//

import UIKit

class ProgramModuleBuilder {
    func build(output: ProgramModuleOutput) -> UIViewController {
        let presenter = ProgramPresenter(output: output)
        let viewController = ProgramViewController(output: presenter)
        presenter.view = viewController
        return viewController
    }
}
