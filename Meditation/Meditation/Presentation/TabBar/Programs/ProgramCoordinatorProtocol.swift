//
//  ProgramCoordinatorProtocol.swift
//  Meditation
//
//  Created by Лада on 29.05.2023.
//

import Foundation

protocol ProgramCoordinatorProtocol {
    var primaryNavigationController: CoordinatedNavigationController { get }
}

protocol ProgramInput: AnyObject { }

protocol ProgramOutput: AnyObject {
    func wantsToSwitchToStopwatch()
    func wantsToSwitchToTimer()
    func wantsToSwitchToProfile()
}
