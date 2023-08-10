//
//  StopWatchModuleBuilder.swift
//  Meditation
//
//  Created by Лада on 29.05.2023.
//

import UIKit

class StopWatchModuleBuilder {
    func build(output: StopWatchModuleOutput) -> UIViewController {
        let presenter = StopWatchPresenter(output: output)
        let viewController = StopWatchViewController(output: presenter)
        presenter.view = viewController
        return viewController
    }
}

