//
//  MusicModuleIO.swift
//  Meditation
//
//  Created by Лада on 30.05.2023.
//

import Foundation

protocol MusicModuleInput: AnyObject { }

protocol MusicModuleOutput: AnyObject {
    func moduleWantsToExit()
}
