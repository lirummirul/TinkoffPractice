//
//  AppDelegate.swift
//  Meditation
//
//  Created by Лада on 23.03.2023.
//

import UIKit
import FirebaseCore
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        FirebaseApp.configure()
//        Auth.auth().addStateDidChangeListener{ (auth, user) in
//            if user == nil {
//                print("Лада, ты тут")
//            }
//        }

        return true
    }
}
