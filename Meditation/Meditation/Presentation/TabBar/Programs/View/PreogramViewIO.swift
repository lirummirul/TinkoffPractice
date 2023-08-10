//
//  PreogramViewIO.swift
//  Meditation
//
//  Created by Лада on 29.05.2023.
//

import Foundation

protocol ProgramViewInput: AnyObject { }

protocol ProgramViewOutput: AnyObject {
    func moduleWantsToGoToProfile()
    func wantsToSwitchToStopwatch()
    func wantsToSwitchToTimer()
}
