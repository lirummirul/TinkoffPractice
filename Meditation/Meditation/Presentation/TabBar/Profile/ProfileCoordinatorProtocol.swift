//
//  ProfileCoordinatorProtocol.swift
//  Meditation
//
//  Created by Лада on 29.05.2023.
//

import UIKit

protocol ProfileCoordinatorProtocol {
    var primaryNavigationController: CoordinatedNavigationController { get }
}

protocol ProfileInput: AnyObject { }

protocol ProfileOutput: AnyObject {
    func wantsToSwitchToStopwatch()
    func wantsToSwitchToPrograms()
    func wantsToSwitchToTimer()
}

