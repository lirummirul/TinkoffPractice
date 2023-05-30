//
//  SRCountdownTimer.swift
//  Meditation
//
//  Created by Лада on 22.05.2023.
//

import UIKit

@objc protocol SRCountdownTimerDelegate: class {
    @objc optional func timerDidUpdateCounterValue(sender: SRCountdownTimer, newValue: Int)
    @objc optional func timerDidStart(sender: SRCountdownTimer)
    @objc optional func timerDidPause(sender: SRCountdownTimer)
    @objc optional func timerDidResume(sender: SRCountdownTimer)
    @objc optional func timerDidEnd(sender: SRCountdownTimer, elapsedTime: TimeInterval)
}

class SRCountdownTimer: UIView  {
    @IBInspectable public var lineWidth: CGFloat = 6.0
    @IBInspectable public var lineColor: UIColor = .white
    @IBInspectable public var trailLineColor: UIColor = .green
//    UIColor.lightGray.withAlphaComponent(0.5)
    
    @IBInspectable public var isLabelHidden: Bool = false
    @IBInspectable public var labelFont: UIFont?
    @IBInspectable public var labelTextColor: UIColor?
    @IBInspectable public var timerFinishingText: String?

    public weak var delegate: SRCountdownTimerDelegate?
    
    // использую часы, минуты и секунды для презентации
    public var useMinutesAndSecondsRepresentation = true
    public var moveClockWise = false
    
    private var timer: Timer?
    private var beginingValue: Int = 1
    private var totalTime: TimeInterval = 1
    private var elapsedTime: TimeInterval = 0
    private var interval: TimeInterval = 1 // Интервал, который устанавливается пользователем
    private let fireInterval: TimeInterval = 0.01 // ~60 FPS
    let timerVisible = Globals.isTimerVisible
    
    private lazy var counterLabel: UILabel = {
        let label = UILabel()
        self.addSubview(label)

        label.textAlignment = .center
        label.frame = self.bounds
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .black
        return label
    }()
    
    private var currentCounterValue: Int = 0 {
        didSet {
            if !isLabelHidden {
                if let text = timerFinishingText, currentCounterValue == 0 {
                    counterLabel.text = text
                } else {
                    if useMinutesAndSecondsRepresentation {
                        counterLabel.text = getHoursAndMinutesAndSeconds(remainingSeconds: currentCounterValue)
                    } else {
                        counterLabel.text = "\(currentCounterValue)"
                    }
                }
            }
            delegate?.timerDidUpdateCounterValue?(sender: self, newValue: currentCounterValue)
        }
    }
    
    // MARK: Inits
    override public init(frame: CGRect) {
        if frame.width != frame.height {
            fatalError("Please use a rectangle frame for SRCountdownTimer")
        }

        super.init(frame: frame)

        layer.cornerRadius = frame.width / 2
        clipsToBounds = true
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        let context = UIGraphicsGetCurrentContext()
        let radius = (rect.width - lineWidth) / 2
        var currentAngle : CGFloat!
        if moveClockWise {
            currentAngle = CGFloat((.pi * 2 * elapsedTime) / totalTime)
        } else {
            currentAngle = CGFloat(-(.pi * 2 * elapsedTime) / totalTime)
        }
        context?.setLineWidth(lineWidth)

        // Основная линия
        context?.beginPath()
        context?.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: radius,
            startAngle: currentAngle - .pi / 2,
            endAngle: .pi * 2 - .pi / 2,
            clockwise: false)
        context?.setStrokeColor(UIColor.white.cgColor)
        context?.strokePath()

        // Линия следа
        context?.beginPath()
        context?.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: radius,
            startAngle: -.pi / 2,
            endAngle: currentAngle - .pi / 2,
            clockwise: false)
        context?.setStrokeColor(UIColor.white.cgColor)
        context?.strokePath()
    }
    
    // ОТМЕТИТЬ: Общедоступные методы
    /**
        * Запускает таймер и анимацию. Если таймер был запущен ранее, это приведет к его аннулированию.
        * - Параметры:
        * - * - начальное значение: значение, с которого начинается обратный отсчет.
        * - интервал: интервал между уменьшением счетчика (по умолчанию 1 секунда)
        */
    public func start(beginingValue: Int, interval: TimeInterval = 1) {
        self.beginingValue = beginingValue
        self.interval = interval
        totalTime = TimeInterval(beginingValue) * interval
        elapsedTime = 0
        currentCounterValue = beginingValue
        timer?.invalidate()
        timer = Timer(timeInterval: fireInterval, target: self, selector: #selector(SRCountdownTimer.timerFired(_:)), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
        delegate?.timerDidStart?(sender: self)
    }

    /**
     * Приостанавливает работу таймера с сохранением текущего состояния
     */
    public func pause() {
        timer?.fireDate = Date.distantFuture
        delegate?.timerDidPause?(sender: self)
    }

    /**
     * Возобновляет работу таймера из текущего состояния
     */
    public func resume() {
        timer?.fireDate = Date()
        delegate?.timerDidResume?(sender: self)
    }

    /**
     * Сброс таймера
     */
    public func reset() {
        self.currentCounterValue = 0
        timer?.invalidate()
        self.elapsedTime = 0
        setNeedsDisplay()
    }
    
    /**
     * Отключите таймер
     */
    public func end() {
        self.currentCounterValue = 0
        timer?.invalidate()
        delegate?.timerDidEnd?(sender: self, elapsedTime: elapsedTime)
    }
    
    /**
     * Вычислите значение в минутах и секундах и верните его в виде строки
     */
    private func getHoursAndMinutesAndSeconds(remainingSeconds: Int) -> (String) {
        if Globals.isTimerVisible {
            let hours = remainingSeconds / 3600
            let minutes = (remainingSeconds % 3600) / 60
            let seconds = remainingSeconds % 60
            let hourString = hours < 10 ? "0" + hours.description : hours.description
            let minuteString = minutes < 10 ? "0" + minutes.description : minutes.description
            let secondString = seconds < 10 ? "0" + seconds.description : seconds.description
            return "\(hourString):\(minuteString):\(secondString)"
        } else {
            return ""
        }
    }

    // MARK: Private methods
    @objc private func timerFired(_ timer: Timer) {
        elapsedTime += fireInterval

        if elapsedTime <= totalTime {
            setNeedsDisplay()

            let computedCounterValue = beginingValue - Int(elapsedTime / interval)
            if computedCounterValue != currentCounterValue {
                currentCounterValue = computedCounterValue
            }
        } else {
            end()
        }
    }
}
