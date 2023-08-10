//
//  MainViewIO.swift
//  Meditation
//
//  Created by Лада on 28.05.2023.
//

import Foundation

protocol MainViewInput: AnyObject { }

protocol MainViewOutput: AnyObject {
    func moduleWantsToGoToProfile()
    func wantsToSwitchToStopwatch()
    func wantsToSwitchToPrograms()
    func wantsToSwitchToMusic()
}
