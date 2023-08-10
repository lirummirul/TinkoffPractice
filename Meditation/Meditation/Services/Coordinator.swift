//
//  Coordinator.swift
//  Meditation
//
//  Created by Лада on 07.04.2023.
//

import UIKit

/// Used to dictate the basics of all coordinators in the app.
protocol Coordinator: AnyObject {
    var primaryNavigationController: CoordinatedNavigationController { get set }
//    var splitViewController: UISplitViewController { get set }
}
