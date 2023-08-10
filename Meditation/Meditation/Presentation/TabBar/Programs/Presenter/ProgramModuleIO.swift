//
//  ProgramModuleIO.swift
//  Meditation
//
//  Created by Лада on 29.05.2023.
//

import Foundation


protocol ProgramModuleInput: AnyObject { }

protocol ProgramModuleOutput: AnyObject {
//    func moduleWantsToExit()
    func wantsToSwitchToStopwatch()
    func wantsToSwitchToTimer()
    func wantsToSwitchToProfile()
}
