//
//  StopWatchModuleIO.swift
//  Meditation
//
//  Created by Лада on 29.05.2023.
//

import Foundation

protocol StopWatchModuleInput: AnyObject { }

protocol StopWatchModuleOutput: AnyObject {
//    func moduleWantsToExit()
    func wantsToSwitchToTimer()
    func wantsToSwitchToPrograms()
    func wantsToSwitchToProfile()
}
