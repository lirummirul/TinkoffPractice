//
//  TabBarController.swift
//  Meditation
//
//  Created by Лада on 12.05.2023.
//

import UIKit

// MARK: MVP ЛАДААА!!!!

class TabBarController: UITabBarController {
    private let output: TabBarViewOutput
    init(output: TabBarViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    timer, stopwatch, calendar, programs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let timer = MainCoordinator(output: self)
        let stopwatch = StopWatchCoordinator(output: self)
        let programs = ProgramCoordinator(output: self)
        let calendar = ProfileCoordinator(output: self)
        
        viewControllers = [timer.primaryNavigationController, stopwatch.primaryNavigationController, programs.primaryNavigationController, calendar.primaryNavigationController]
    }
}
extension TabBarController: MainOutput, StopWatchOutput, ProgramOutput, ProfileOutput {
    func wantsToSwitchToTimer() {
        output.moduleDidTabTimer()
    }
    
    func wantsToSwitchToStopwatch() {
        output.moduleDidTabStopWatch()
    }
    
    func wantsToSwitchToPrograms() {
        output.moduleDidTabProgram()
    }
    
    func wantsToSwitchToProfile() {
        output.moduleDidTabProfile()
    }
}

extension TabBarController: TabBarViewInput { } 
