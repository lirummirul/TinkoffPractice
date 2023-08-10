//
//  SceneDelegate.swift
//  Meditation
//
//  Created by Лада on 23.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var coordinator: AppCoordinator?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let navController = UINavigationController()
        navController.navigationBar.prefersLargeTitles = true
        coordinator = AppCoordinator(navigationController: navController)
        coordinator?.start()
        window = UIWindow(windowScene: scene)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
