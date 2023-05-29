//
//  ProgramPresenter.swift
//  Meditation
//
//  Created by Лада on 29.05.2023.
//

import Foundation

class ProgramPresenter {
    weak var view: ProgramViewInput?

    private let output: ProgramModuleOutput
    init(output: ProgramModuleOutput) {
        self.output = output
    }
}

extension ProgramPresenter: ProgramViewOutput {
    func wantsToSwitchToStopwatch() {
        self.output.wantsToSwitchToStopwatch()
    }
    
    func wantsToSwitchToTimer() {
        self.output.wantsToSwitchToTimer()
    }
    
    func moduleWantsToGoToProfile() {
        self.output.wantsToSwitchToProfile()
    }
}

extension ProgramPresenter: ProgramModuleInput { }
