//
//  MainCoordinatorProtocol.swift
//  Meditation
//
//  Created by Лада on 28.05.2023.
//

import UIKit

protocol MainCoordinatorProtocol {
    var primaryNavigationController: CoordinatedNavigationController { get }
}

protocol MainInput: AnyObject { }

protocol MainOutput: AnyObject {
    func wantsToSwitchToStopwatch()
    func wantsToSwitchToPrograms()
    func wantsToSwitchToProfile()
}
