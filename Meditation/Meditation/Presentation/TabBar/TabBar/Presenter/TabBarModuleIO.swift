//
//  TabBarModuleIO.swift
//  Meditation
//
//  Created by Лада on 28.05.2023.
//

import Foundation

protocol TabBarModuleInput: AnyObject { }

protocol TabBarModuleOutput: AnyObject {
    func moduleDidTabTimer()
    func moduleDidTabStopWatch()
    func moduleDidTabProgram()
    func moduleDidTabProfile()
    func wantsToSwitchToMusic()
}
