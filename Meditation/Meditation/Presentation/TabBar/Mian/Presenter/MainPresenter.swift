//
//  MainPresenter.swift
//  Meditation
//
//  Created by Лада on 28.05.2023.
//

import Foundation

class MainPresenter {
    weak var view: MainViewInput?

    private let output: MainModuleOutput
    init(output: MainModuleOutput) {
        self.output = output
    }
}

extension MainPresenter: MainViewOutput {
    func wantsToSwitchToStopwatch() {
        self.output.wantsToSwitchToStopwatch()
    }
    
    func wantsToSwitchToPrograms() {
        self.output.wantsToSwitchToPrograms()
    }
    
    func moduleWantsToGoToProfile() {
        self.output.wantsToSwitchToProfile()
    }
}

extension MainPresenter: MainModuleInput { }
