//
//  MusicViewIO.swift
//  Meditation
//
//  Created by Лада on 30.05.2023.
//

import Foundation

protocol MusicViewInput: AnyObject { }

protocol MusicViewOutput: AnyObject {
    func moduleWantsToExit()
}
