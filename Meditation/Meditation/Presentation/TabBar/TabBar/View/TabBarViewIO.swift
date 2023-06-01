//
//  TabBarViewIO.swift
//  Meditation
//
//  Created by Лада on 28.05.2023.
//

import Foundation

protocol TabBarViewInput: AnyObject { }

protocol TabBarViewOutput: AnyObject {
    func moduleDidTabTimer()
    func moduleDidTabStopWatch()
    func moduleDidTabProgram()
    func moduleDidTabProfile()
    func wantsToSwitchToMusic()
}
