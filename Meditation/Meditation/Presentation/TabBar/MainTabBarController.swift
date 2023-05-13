//
//  MainTabBarController.swift
//  Meditation
//
//  Created by Лада on 12.05.2023.
//

import UIKit
// MARK: Лучше пользоваться navcontr вместо splitViewController

class MainTabBarController: UITabBarController {
//    timer, stopwatch, calendar, programs
    let timer = MainCoordinator()
    let stopwatch = StopWatchCoordinator()
    let programs = ProgramCoordinator()
    let calendar = ProfileCoordinator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [timer.splitViewController, stopwatch.splitViewController, programs.splitViewController, calendar.splitViewController]
    }
    
    func handle(_ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        if let item = launchOptions?[.shortcutItem] as? UIApplicationShortcutItem {
            handle(shortcutItem: item)
        }
    }
    
    func handle(shortcutItem: UIApplicationShortcutItem) {
        switch shortcutItem.type {
        case "com.hackingwithswift.unwrapswift.challenges":
            selectedViewController = stopwatch.splitViewController
        case "com.hackingwithswift.unwrapswift.news":
            selectedViewController = programs.splitViewController
        default:
            fatalError("Unknown shortcut item type: \(shortcutItem.type).")
        }
    }
}
