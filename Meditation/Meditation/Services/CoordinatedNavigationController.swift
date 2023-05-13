//
//  CoordinatedNavigationController.swift
//  Meditation
//
//  Created by Лада on 12.05.2023.
//

import UIKit

/// A navigation controller that is aware of its coordinator. This is used extremely rarely through UIResponder-Coordinated.swift, for when we need to find the coordinator responsible for a specific view.
class CoordinatedNavigationController: UINavigationController {
    weak var coordinator: Coordinator?
}
