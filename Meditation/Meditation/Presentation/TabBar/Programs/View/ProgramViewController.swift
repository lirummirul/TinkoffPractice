//
//  ProgramViewController.swift
//  Meditation
//
//  Created by Лада on 12.05.2023.
//

import UIKit

class ProgramViewController: UIViewController {
    var coordinator: ProgramCoordinator?
    
    // MARK: - LifeCycle
    private let output: ProgramViewOutput
    
    init(output: ProgramViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
//        print("LadaVControllereProgrem")
    }
}

extension ProgramViewController: ProgramViewInput { }
