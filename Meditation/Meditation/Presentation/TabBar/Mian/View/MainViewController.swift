//
//  MainViewController.swift
//  Meditation
//
//  Created by Лада on 06.04.2023.
//

import UIKit

class MainViewController: UIViewController, SRCountdownTimerDelegate {
    var timer: SRCountdownTimer!
    let datePicker = UIDatePicker()
    
    let buttonStart: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("начать", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        let col = UIColor(red: 0.24, green: 0.54, blue: 0.58, alpha: 1.0)
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
        let col = UIColor(red: 0.24, green: 0.54, blue: 0.58, alpha: 1.0)
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
        let col = UIColor(red: 0.24, green: 0.54, blue: 0.58, alpha: 1.0)
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
        let col = UIColor(red: 0.24, green: 0.54, blue: 0.58, alpha: 1.0)
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
        let col = UIColor(red: 0.24, green: 0.54, blue: 0.58, alpha: 1.0)
        button.setTitleColor(col, for: .normal)
        let backgroundColorButtonAuth = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        button.backgroundColor = backgroundColorButtonAuth
        button.layer.cornerRadius = 20
        return button
    }()
    
    // MARK: - LifeCycle
    private let output: MainViewOutput
    
    init(output: MainViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImage(named: "ocean")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.bounds
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        datePicker.datePickerMode = .countDownTimer
        timer = SRCountdownTimer()
        setup()
    }
    
    // MARK: - UI Setup
    func setup() {
        view.addSubview(timer)
        view.addSubview(datePicker)
        view.addSubview(buttonStart)
        view.addSubview(resumeButton)
        view.addSubview(pauseButton)
        view.addSubview(stopButton)
        view.addSubview(musicButton)
        
        timer.translatesAutoresizingMaskIntoConstraints = false
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        buttonStart.translatesAutoresizingMaskIntoConstraints = false
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        resumeButton.translatesAutoresizingMaskIntoConstraints = false
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        musicButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timer.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            timer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            timer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            timer.widthAnchor.constraint(equalToConstant: 300),
            timer.heightAnchor.constraint(equalToConstant: 300),
            
            datePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 235),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            
            buttonStart.topAnchor.constraint(equalTo: timer.bottomAnchor, constant: 40),
            buttonStart.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            buttonStart.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            pauseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pauseButton.topAnchor.constraint(equalTo: timer.bottomAnchor, constant: 40),
            pauseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            pauseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            resumeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resumeButton.topAnchor.constraint(equalTo: timer.bottomAnchor, constant: 40),
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
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        musicButton.addTarget(self, action: #selector(musicButtonTapped), for: .touchUpInside)
        pauseButton.isHidden = true
        stopButton.isHidden = true
        resumeButton.isHidden = true
    }
    
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        let interval = sender.countDownDuration
        let beginingValue = Int(interval)
        timer.start(beginingValue: beginingValue, interval: 1)
    }
    
    @objc private func startButtonTapped(_ sender: UIButton) {
        Globals.isTimerVisible = true
        Globals.meditationToday = true
        let interval = datePicker.countDownDuration
        let beginingValue = Int(interval)
        timer.start(beginingValue: beginingValue, interval: 1)
        
        buttonStart.isHidden = true
        pauseButton.isHidden = false
        resumeButton.isHidden = true
        stopButton.isHidden = false
        datePicker.isHidden = true
    }
    
    @objc private func pauseButtonTapped(_ sender: UIButton) {
        Globals.isTimerVisible = true
        timer.pause()
        buttonStart.isHidden = true
        resumeButton.isHidden = false
        pauseButton.isHidden = true
        stopButton.isHidden = false
        datePicker.isHidden = true
    }
    
    @objc private func resumeButtonTapped(_ sender: UIButton) {
        Globals.isTimerVisible = true
        timer.resume()
        buttonStart.isHidden = true
        resumeButton.isHidden = true
        pauseButton.isHidden = false
        stopButton.isHidden = false
        datePicker.isHidden = true
    }
    
    @objc private func stopButtonTapped(_ sender: UIButton) {
        Globals.isTimerVisible = false
        timer.end()
        buttonStart.isHidden = false
        resumeButton.isHidden = true
        pauseButton.isHidden = true
        stopButton.isHidden = true
        datePicker.isHidden = false
    }
    
    @objc private func musicButtonTapped(_ sender: UIButton) {
        output.wantsToSwitchToMusic()
    }
}

extension MainViewController: MainViewInput { }

//    var coordinator: MainCoordinator?
//        if let label = datePicker.subviews.first?.subviews.first as? UILabel {
//            label.textColor = UIColor.white
//        }
//        datePicker.tintColor = UIColor.white
//        datePicker.textColor = UIColor.white
        // Создание пользовательского UITextField для отображения выбранной даты
//        let dateTextField = UITextField()
//        dateTextField.inputView = datePicker

        // Настройка цвета текста в UITextField
//        dateTextField.textColor = .white
//        datePicker.backgroundColor = UIColor.clear
