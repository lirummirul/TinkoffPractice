//
//  ProfileViewIO.swift
//  Meditation
//
//  Created by Лада on 04.05.2023.
//

import Foundation


protocol ProfileViewInput: AnyObject { }

protocol ProfileViewOutput: AnyObject {
    func moduleWantsToGoToTimer()
    func wantsToSwitchToStopwatch()
    func wantsToSwitchToPrograms()
}
