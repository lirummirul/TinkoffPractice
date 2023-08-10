//
//  StopWatchCoordinatopProtocol.swift
//  Meditation
//
//  Created by Лада on 29.05.2023.
//

import UIKit

protocol StopWatchCoordinatorProtocol {
    var primaryNavigationController: CoordinatedNavigationController { get }
}

protocol StopWatchInput: AnyObject { }

protocol StopWatchOutput: AnyObject {
    func wantsToSwitchToTimer()
    func wantsToSwitchToPrograms()
    func wantsToSwitchToProfile()
    func wantsToSwitchToMusic()
}
