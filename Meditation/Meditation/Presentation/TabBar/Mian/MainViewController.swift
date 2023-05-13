//
//  MainViewController.swift
//  Meditation
//
//  Created by Лада on 06.04.2023.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {
    var coordinator: MainCoordinator?
    
    let datePicker = UIDatePicker()
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
//        let back = UIColor(red: 0.28, green: 0.43, blue: 0.13, alpha: 0.6)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "imgTimer")!)
        datePicker.datePickerMode = .countDownTimer
        datePicker.addTarget(self, action: #selector(datePickerAction), for: .valueChanged)
        setup()
    }
    
    func setup() {
        view.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func datePickerAction() {
        let timeInterval = datePicker.countDownDuration
        if let timer = timer {
            timer.invalidate()
        }
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false) { [weak self] _ in
            self?.timerDidEnd()
        }
    }
    
    func timerDidEnd() { }
}
