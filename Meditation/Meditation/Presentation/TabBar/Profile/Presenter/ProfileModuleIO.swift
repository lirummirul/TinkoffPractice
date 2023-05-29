//
//  ProfileModuleIO.swift
//  Meditation
//
//  Created by Лада on 04.05.2023.
//

import Foundation

protocol ProfileModuleInput: AnyObject { }

protocol ProfileModuleOutput: AnyObject {
//    func moduleWantsToExit()
    func wantsToSwitchToStopwatch()
    func wantsToSwitchToPrograms()
    func wantsToSwitchToTimer()
}
