//
//  ProfileViewController.swift
//  Meditation
//
//  Created by Лада on 05.04.2023.
//

import UIKit
import FSCalendar

var meditatedDates: [Date] = []

class ProfileViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    var coordinator: ProfileCoordinator?
    var calendar: FSCalendar!
    var greenDate = false
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        self.view.addSubview(calendar)
        calendar.delegate = self
        calendar.dataSource = self
    }
    
    func setup() {
        calendar = FSCalendar(frame: CGRect(x: 0.0, y: 90.0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        calendar.scrollDirection = .vertical
        calendar.allowsMultipleSelection = false
        calendar.locale = Locale(identifier: "ru_RU")
        calendar.appearance.headerDateFormat = "LLLL yyyy"
        calendar.appearance.headerTitleFont = UIFont.boldSystemFont(ofSize: 20)
        calendar.appearance.weekdayFont = UIFont.boldSystemFont(ofSize: 18)
        let selectionColorGreen = UIColor(red: 0.58, green: 0.80, blue: 0.66, alpha: 1.0)
        calendar.appearance.selectionColor = selectionColorGreen
        let todayColorGreen = UIColor(red: 0.09, green: 0.49, blue: 0.23, alpha: 0.57)
        calendar.appearance.todayColor = todayColorGreen
        let weekAndTitleColor = UIColor(red: 0.09, green: 0.49, blue: 0.23, alpha: 1)
        calendar.appearance.weekdayTextColor = weekAndTitleColor
        calendar.appearance.headerTitleColor = weekAndTitleColor
    }
}

// MARK: delegate && datasource

extension ProfileViewController {
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        if meditatedDates.contains(date) {
//            let selectionColorGreen = UIColor(red: 0.58, green: 0.80, blue: 0.66, alpha: 1.0)
            return UIColor.red // Возвращаем красный цвет для помеченных дат
        }
        return nil // Возвращаем nil для не помеченных дат
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("Выбрана дата: \(date)")
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        return 0 // Количество событий для даты (можно использовать для отображения точек)
    }
    
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        return nil // Подзаголовок для даты (можно использовать для отображения текста)
    }
    
    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
        return nil // Заголовок для даты (можно использовать для отображения чисел)
    }
}
