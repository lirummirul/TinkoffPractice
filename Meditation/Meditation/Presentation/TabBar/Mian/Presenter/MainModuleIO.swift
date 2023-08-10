//
//  MainModuleIO.swift
//  Meditation
//
//  Created by Лада on 28.05.2023.
//

import Foundation

protocol MainModuleInput: AnyObject { }

protocol MainModuleOutput: AnyObject {
//    func moduleWantsToExit()
    func wantsToSwitchToStopwatch()
    func wantsToSwitchToPrograms()
    func wantsToSwitchToProfile()
    func wantsToSwitchToMusic()
}
