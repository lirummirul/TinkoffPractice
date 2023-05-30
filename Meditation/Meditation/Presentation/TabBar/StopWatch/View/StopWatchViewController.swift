//
//  StopWatchViewController.swift
//  Meditation
//
//  Created by Лада on 12.05.2023.
//

import UIKit

class StopWatchViewController: UIViewController {
    var coordinator: StopWatchCoordinator?
    
    // MARK: - LifeCycle
    private let output: StopWatchViewOutput
    
    init(output: StopWatchViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImage(named: "les")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.bounds
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
    }
}

extension StopWatchViewController: StopWatchViewInput { }
