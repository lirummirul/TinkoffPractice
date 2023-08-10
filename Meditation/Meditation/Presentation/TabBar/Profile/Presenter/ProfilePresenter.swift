//
//  ProfilePresenter.swift
//  Meditation
//
//  Created by Лада on 04.05.2023.
//

import Foundation

class ProfilePresenter {
    weak var view: ProfileViewInput?

    private let output: ProfileModuleOutput
    init(output: ProfileModuleOutput) {
        self.output = output
    }
}

extension ProfilePresenter: ProfileViewOutput {
    func wantsToSwitchToStopwatch() {
        self.output.wantsToSwitchToStopwatch()
    }
    
    func wantsToSwitchToPrograms() {
        self.output.wantsToSwitchToPrograms()
    }
    
    func moduleWantsToGoToTimer() {
        self.output.wantsToSwitchToTimer()
    }
}

extension ProfilePresenter: ProfileModuleInput { }
