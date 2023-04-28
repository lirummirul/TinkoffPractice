//
//  FlowCoordinatorProtocol.swift
//  Meditation
//
//  Created by Лада on 13.04.2023.
//

import UIKit

protocol FlowCoordinatorProtocol {
    var navigationController: UINavigationController { get }
    func start()
}

protocol AppInput: AnyObject {
    
}

protocol AppOutput: AnyObject {
    
}
