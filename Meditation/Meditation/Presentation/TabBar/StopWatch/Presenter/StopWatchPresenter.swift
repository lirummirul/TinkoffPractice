//
//  StopWatchPresenter.swift
//  Meditation
//
//  Created by Лада on 29.05.2023.
//

import Foundation

class StopWatchPresenter {
    weak var view: StopWatchViewInput?

    private let output: StopWatchModuleOutput
    init(output: StopWatchModuleOutput) {
        self.output = output
    }
}

extension StopWatchPresenter: StopWatchViewOutput {
    
    func moduleWantsToGoToTimer() {
        self.output.wantsToSwitchToTimer()
    }
    
    func wantsToSwitchToPrograms() {
        self.output.wantsToSwitchToPrograms()
    }
    
    func wantsToSwitchToProfile() {
        self.output.wantsToSwitchToProfile()
    }
}

extension StopWatchPresenter: StopWatchModuleInput { }
