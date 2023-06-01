//
//  MusicPresenter.swift
//  Meditation
//
//  Created by Лада on 30.05.2023.
//

import Foundation

class MusicPresenter {
    weak var view: MusicViewInput?
    private let presenterAPI: Presenter

    private let output: MusicModuleOutput
    init(output: MusicModuleOutput, presenterAPI: Presenter) {
        self.output = output
        self.presenterAPI = presenterAPI
    }
}

extension MusicPresenter: MusicViewOutput {
    func moduleWantsToExit() {
        self.output.moduleWantsToExit()
    }
}

extension MusicPresenter: MusicModuleInput { }
