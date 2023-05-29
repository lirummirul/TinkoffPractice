//
//  MainViewController.swift
//  Meditation
//
//  Created by Лада on 06.04.2023.
//
//
//import UIKit
//
//class MainViewController: UIViewController  {
//    var coordinator: MainCoordinator?
//
////    let datePicker = UIDatePicker()
//    var timer: Timer?
//    let whiteView = UIView()
//    var count = 0
//    var alarmDate = 0.0
//
//    let remainingTimeLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Оставшееся время"
//        return label
//    }()
//
//    let sleepButtonImage: UIImageView = {
//        let image = UIImageView()
//        return image
//    }()
//
//    let startButtonImage: UIImageView = {
//        let image = UIImageView()
//        return image
//    }()
//
//    let buttonExit: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("   Выйти   ", for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
//        let titleColorButt = UIColor(red: 0.12, green: 0.25, blue: 0.05, alpha: 1.0)
//        button.setTitleColor(titleColorButt, for: .normal)
//        button.backgroundColor = UIColor.white.withAlphaComponent(0.65)
//        button.layer.cornerRadius = 15
//        return button
//    }()
//
//    let buttonStart: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("   Начать   ", for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
//        let titleColorButt = UIColor(red: 0.12, green: 0.25, blue: 0.05, alpha: 1.0)
//        button.setTitleColor(titleColorButt, for: .normal)
//        button.backgroundColor = UIColor.white.withAlphaComponent(0.65)
//        button.layer.cornerRadius = 15
//        return button
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        sleepButtonImage.isHidden = true
//        whiteView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
//        whiteView.layer.cornerRadius = 15
//        whiteView.layer.masksToBounds = true
//        view.backgroundColor = UIColor(patternImage: UIImage(named: "imgTimer")!)
////        datePicker.datePickerMode = .countDownTimer
////        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
////        datePicker.addTarget(self, action: #selector(startTimer), for: .valueChanged)
////        datePicker.addTarget(self, action: #selector(datePickerActionTwo(sender:)), for: .valueChanged)
//        setup()
//    }
//
//    func setup() {
//        view.addSubview(whiteView)
//        //        view.addSubview(buttonExit)
////        view.addSubview(datePicker)
//        view.addSubview(buttonStart)
////        datePicker.translatesAutoresizingMaskIntoConstraints = false
//        whiteView.translatesAutoresizingMaskIntoConstraints = false
//        whiteView.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        whiteView.heightAnchor.constraint(equalToConstant: 300).isActive = true
//        //        buttonExit.center = CGPoint(x: view.frame.midX, y: view.frame.midY - view.frame.height / 3.5)
//
//        NSLayoutConstraint.activate([
////            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 20),
////            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
//
//            whiteView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            whiteView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
//
//            buttonStart.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor),
//            buttonStart.centerYAnchor.constraint(equalTo: whiteView.centerYAnchor, constant: 200)
//        ])
////        buttonStart.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
////        buttonExit.addTarget(self, action: #selector(timerFinished), for: .touchUpInside)
//    }
//
////    @objc func datePickerAction() {
////        let timeInterval = datePicker.countDownDuration
////        if let timer = timer {
////            timer.invalidate()
////        }
////        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false) { [weak self] _ in
////            self?.timerDidEnd()
////        }
////    }
//
////    @objc func startTimer() {
////        let selectedHours = pickerView.selectedRow(inComponent: 0)
////        let selectedMinutes = pickerView.selectedRow(inComponent: 1)
////        let selectedSeconds = pickerView.selectedRow(inComponent: 2)
////
////        let totalSeconds = selectedHours * 3600 + selectedMinutes * 60 + selectedSeconds
////        timer = Timer.scheduledTimer(timeInterval: TimeInterval(totalSeconds), target: self, selector: #selector(timerFinished), userInfo: nil, repeats: false)
////    }
////
////    @objc func timerFinished() {
////        // Обработка завершения таймера
////        print("Timer finished!")
////    }
//
////    func timerDidEnd() { }
////
////    @objc func didTapStartButton() { }
////
////    @objc func exit() {
////        print("Timer finished!")
////    }
////
////    @objc func startTimer() {
////        let duration = datePicker.countDownDuration // Получаем отрицательное значение из date picker
////        timer = Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(exit), userInfo: nil, repeats: false)
////    }
//
//
////    func createTimer() {
//////        let timeInterval = datePicker.countDownDuration
//////        if let timer = timer {
//////            timer.invalidate()
//////        }
//////        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [self]_ in
////        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [self] (timer: Timer) in
////            //        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false) { [weak self] _ in
////            if self.count == 0 {
////                //                self.stopSoundRelax()
////                //                self.playSound()
////                self.remainingTimeLabel.isHidden = true
////                self.stopTimer()
////            } else {
////                self.count -= 1
////                let (h,m,s) = self?.secondsToHoursMinutesSeconds(seconds: self.count)
////                self.remainingTimeLabel.text = "осталось \(h):\(m):\(s)"
////            }
////        })
////        //        }
////    }
////
////    func createTimer() {
////        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [self]_ in
////            if count.words.isEmpty {
//////                self.stopSoundRelax()
//////                self.playSound()
////                self.remainingTimeLabel.isHidden = true
////                self.stopTimer()
////            } else {
////                self.count -= 1
////                let (hours, minuts, second) = self.secondsToHoursMinutesSeconds(seconds: self.count)
////                self.remainingTimeLabel.text = "осталось \(hours):\(minuts):\(second)"
////            }
////        })
////    }
////
////    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
////        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
////    }
////
////    func stopTimer() {
////        timer?.invalidate()
////    }
////
////    @objc func datePickerActionTwo(sender: UIDatePicker) {
////        alarmDate = sender.date.timeIntervalSince1970
////    }
////
////    @objc func didTapStartButton(sender: UIButton){
////        if sender.title(for: .normal) == "Приступить ко сну"{
////            sender.setTitle("Проснуться", for: .normal)
////            self.remainingTimeLabel.isHidden = false
////            self.sleepButtonImage.isHidden = false
////            self.startButtonImage.isHidden = true
////            count = Int(self.alarmDate) - Int(Date().timeIntervalSince1970)
////            createTimer()
////            //            playSoundRelax()
////        } else {
////            sender.setTitle("Приступить ко сну", for: .normal)
////
////            self.startButtonImage.isHidden = false
////            self.sleepButtonImage.isHidden = true
////            //            playerRelax.stop()
////            //            stopSound()
////        }
////    }
//}


import UIKit

class MainViewController: UIViewController {
//    var coordinator: MainCoordinator?
    var timer: SRCountdownTimer!
    
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
        timer = SRCountdownTimer()
        setup()
    }
    
    // MARK: - UI Setup
    func setup() {
        view.addSubview(timer)
        timer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timer.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            timer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            timer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            timer.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func moduleWantsToGoToProfile() {
        output.moduleWantsToGoToProfile()
    }
    
    @objc func wantsToSwitchToStopwatch() {
        output.wantsToSwitchToStopwatch()
    }
    
    @objc func wantsToSwitchToPrograms() {
        output.wantsToSwitchToPrograms()
    }
}

extension MainViewController: MainViewInput { }
