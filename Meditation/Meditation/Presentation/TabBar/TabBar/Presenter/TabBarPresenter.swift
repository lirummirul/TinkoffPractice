//
//  TabBarPresenter.swift
//  Meditation
//
//  Created by Лада on 28.05.2023.
//

import Foundation

class TabBarPresenter {
    weak var view: TabBarViewInput?
    
    private let output: TabBarModuleOutput
    init(output: TabBarModuleOutput) {
        self.output = output
    }
}

extension TabBarPresenter: TabBarViewOutput {
    func wantsToSwitchToMusic() {
        output.wantsToSwitchToMusic()
    }
    
    func moduleDidTabTimer() {
        output.moduleDidTabTimer()
    }
    func moduleDidTabStopWatch() {
        output.moduleDidTabStopWatch()
    }
    func moduleDidTabProgram() {
        output.moduleDidTabProgram()
    }
    func moduleDidTabProfile() {
        output.moduleDidTabProfile()
    }
}

extension TabBarPresenter: TabBarViewInput { }
