//
//  MusicModuleBuilder.swift
//  Meditation
//
//  Created by Лада on 30.05.2023.
//

import UIKit

class MusicModuleBuilder {
    func build(output: MusicModuleOutput) -> UIViewController {
        let networkService = NetworkService()
        let presenterAPI = Presenter(networkService: networkService)
        let presenter = MusicPresenter(output: output, presenterAPI: presenterAPI)
        let viewController = MusicViewController(output: presenter, presenter: presenterAPI)
        presenter.view = viewController
        presenterAPI.view = viewController
        return viewController
    }
}


//let networkService = NetworkService()
//   let presenter = Presenter(networkService: networkService)
//   let view = ViewController(presenter: presenter)
//   presenter.view = view
//   window.rootViewController = view
