//
//  Stopwatch.swift
//  Meditation
//
//  Created by Лада on 01.06.2023.
//

import Foundation

class Stopwatch {
    private var timer: Timer?
    private var startTime: Date?
    private var elapsedTime: TimeInterval = 0
    
    var isRunning: Bool {
        return timer != nil
    }
    
    var currentElapsedTime: TimeInterval {
        return elapsedTime
    }
    
    func start() {
        if !isRunning {
            startTime = Date()
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateElapsedTime), userInfo: nil, repeats: true)
        }
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
        startTime = nil
        elapsedTime = 0
    }
    
    @objc private func updateElapsedTime() {
        guard let startTime = startTime else { return }
        elapsedTime = -startTime.timeIntervalSinceNow
    }
    
    func formattedElapsedTime() -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.hour, .minute, .second]
        
        return formatter.string(from: elapsedTime) ?? "00:00:00"
    }
}
