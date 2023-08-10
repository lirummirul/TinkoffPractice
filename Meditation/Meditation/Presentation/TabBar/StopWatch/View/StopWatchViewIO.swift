//
//  StopWatchViewIO.swift
//  Meditation
//
//  Created by Лада on 29.05.2023.
//

import Foundation

protocol StopWatchViewInput: AnyObject { }

protocol StopWatchViewOutput: AnyObject {
    func moduleWantsToGoToTimer()
    func wantsToSwitchToProfile()
    func wantsToSwitchToPrograms()
    func wantsToSwitchToMusic()
}
