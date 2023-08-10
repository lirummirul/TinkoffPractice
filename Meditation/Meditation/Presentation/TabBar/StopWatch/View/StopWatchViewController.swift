//
//  StopWatchViewController.swift
//  Meditation
//
//  Created by Лада on 12.05.2023.
//

import UIKit

class StopWatchViewController: UIViewController {
//    var coordinator: StopWatchCoordinator?
    private var timer: Timer?
    private var startTime: Date?
    private var elapsedTime: TimeInterval = 0
    private var stopwatch = Stopwatch()

    let labelText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textColor = .white
        return label
    }()
    
    let buttonStart: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("начать", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        let col = UIColor(red: 0.07, green: 0.43, blue: 0.16, alpha: 1.0)
        button.setTitleColor(col, for: .normal)
        let backgroundColorButtonAuth = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        button.backgroundColor = backgroundColorButtonAuth
        button.layer.cornerRadius = 20
        return button
    }()
    
    let pauseButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("пауза", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        let col = UIColor(red: 0.07, green: 0.43, blue: 0.16, alpha: 1.0)
        button.setTitleColor(col, for: .normal)
        let backgroundColorButtonAuth = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        button.backgroundColor = backgroundColorButtonAuth
        button.layer.cornerRadius = 20
        return button
    }()
    
    let resumeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("продолжить", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        let col = UIColor(red: 0.07, green: 0.43, blue: 0.16, alpha: 1.0)
        button.setTitleColor(col, for: .normal)
        let backgroundColorButtonAuth = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        button.backgroundColor = backgroundColorButtonAuth
        button.layer.cornerRadius = 20
        return button
    }()
    
    let stopButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("остановить", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        let col = UIColor(red: 0.07, green: 0.43, blue: 0.16, alpha: 1.0)
        button.setTitleColor(col, for: .normal)
        let backgroundColorButtonAuth = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        button.backgroundColor = backgroundColorButtonAuth
        button.layer.cornerRadius = 20
        return button
    }()

    let musicButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("музыка", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        let col = UIColor(red: 0.07, green: 0.43, blue: 0.16, alpha: 1.0)
        button.setTitleColor(col, for: .normal)
        let backgroundColorButtonAuth = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        button.backgroundColor = backgroundColorButtonAuth
        button.layer.cornerRadius = 20
        return button
    }()
    
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
        labelText.text = self.stopwatch.formattedElapsedTime()
        setup()
    }
    
    // MARK: - UI Setup
    func setup() {
        view.addSubview(labelText)
        view.addSubview(buttonStart)
        view.addSubview(resumeButton)
        view.addSubview(pauseButton)
        view.addSubview(stopButton)
        view.addSubview(musicButton)
        
        labelText.translatesAutoresizingMaskIntoConstraints = false
        buttonStart.translatesAutoresizingMaskIntoConstraints = false
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        resumeButton.translatesAutoresizingMaskIntoConstraints = false
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        musicButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelText.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            labelText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            labelText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            labelText.widthAnchor.constraint(equalToConstant: 300),
            labelText.heightAnchor.constraint(equalToConstant: 300),
            
            buttonStart.topAnchor.constraint(equalTo: labelText.bottomAnchor, constant: 40),
            buttonStart.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            buttonStart.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            pauseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pauseButton.topAnchor.constraint(equalTo: labelText.bottomAnchor, constant: 40),
            pauseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            pauseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            resumeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resumeButton.topAnchor.constraint(equalTo: labelText.bottomAnchor, constant: 40),
            resumeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            resumeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: pauseButton.bottomAnchor, constant: 54),
            stopButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            stopButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            musicButton.topAnchor.constraint(equalTo: buttonStart.bottomAnchor, constant: 8),
            musicButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            musicButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100)
        ])
        buttonStart.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        pauseButton.addTarget(self, action: #selector(pauseButtonTapped), for: .touchUpInside)
        resumeButton.addTarget(self, action: #selector(resumeButtonTapped), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
        musicButton.addTarget(self, action: #selector(musicButtonTapped), for: .touchUpInside)
        pauseButton.isHidden = true
        stopButton.isHidden = true
        resumeButton.isHidden = true
    }
  
    var isRunning: Bool {
        return timer != nil
    }
      
    var currentElapsedTime: TimeInterval {
        return elapsedTime
    }
      
    @objc private func startButtonTapped() {
        if !isRunning {
            startTime = Date()
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateElapsedTime), userInfo: nil, repeats: true)
        }
        buttonStart.isHidden = true
        pauseButton.isHidden = false
        resumeButton.isHidden = true
        stopButton.isHidden = false
    }
    
    @objc private func pauseButtonTapped() {
        buttonStart.isHidden = true
        resumeButton.isHidden = false
        pauseButton.isHidden = true
        stopButton.isHidden = false
    }
    
    @objc private func resumeButtonTapped() {
        buttonStart.isHidden = true
        resumeButton.isHidden = true
        pauseButton.isHidden = false
        stopButton.isHidden = false
    }
      
    @objc private func stopButtonTapped() {
        timer?.invalidate()
        timer = nil
        startTime = nil
        elapsedTime = 0
        buttonStart.isHidden = false
        resumeButton.isHidden = true
        pauseButton.isHidden = true
        stopButton.isHidden = true
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
    
//    @objc private func startButtonTapped(_ sender: UIButton) {
//         if !isRunning {
//             timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
//             isRunning = true
//         }
//     }
//
//     @objc private func pauseButtonTapped(_ sender: UIButton) {
//         timer?.invalidate()
//         timer = nil
//         isRunning = false
//     }
//
//     @objc private func resumeButtonTapped(_ sender: UIButton) {
//         if !isRunning {
//             timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
//             isRunning = true
//         }
//     }
//
//     @objc private func stopButtonTapped(_ sender: UIButton) {
//         timer?.invalidate()
//         timer = nil
//         isRunning = false
//         elapsedSeconds = 0.0
//     }
//
//     @objc private func updateTimer() {
//         elapsedSeconds += 1.0
//         // Обновите UI для отображения прошедшего времени
//     }
//
//    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
//        let interval = sender.countDownDuration
//        let beginingValue = Int(interval)
//        timer.start(beginingValue: beginingValue, interval: 1)
//    }
    
//    @objc private func startButtonTapped(_ sender: UIButton) {
//        Globals.isTimerVisible = true
//        Globals.meditationToday = true
//        let interval = datePicker.countDownDuration
//        let beginingValue = Int(interval)
//        timer.start(beginingValue: beginingValue, interval: 1)
//
//        buttonStart.isHidden = true
//        pauseButton.isHidden = false
//        resumeButton.isHidden = true
//        stopButton.isHidden = false
//    }
//
//      @objc private func pauseButtonTapped(_ sender: UIButton) {
//          Globals.isTimerVisible = true
//          timer.pause()
//          buttonStart.isHidden = true
//          resumeButton.isHidden = false
//          pauseButton.isHidden = true
//          stopButton.isHidden = false
//      }
//
//    @objc private func resumeButtonTapped(_ sender: UIButton) {
//        Globals.isTimerVisible = true
//        timer.resume()
//        buttonStart.isHidden = true
//        resumeButton.isHidden = true
//        pauseButton.isHidden = false
//        stopButton.isHidden = false
//    }
//
//    @objc private func stopButtonTapped(_ sender: UIButton) {
//        Globals.isTimerVisible = false
//        timer.end()
//        buttonStart.isHidden = false
//        resumeButton.isHidden = true
//        pauseButton.isHidden = true
//        stopButton.isHidden = true
//    }
//
    @objc private func musicButtonTapped(_ sender: UIButton) {
        output.wantsToSwitchToMusic()
    }
}

extension StopWatchViewController: StopWatchViewInput { }
