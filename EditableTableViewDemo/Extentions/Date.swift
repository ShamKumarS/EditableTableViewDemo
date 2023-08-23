//
//  Date.swift
//  Driven-Day
//
//  Created by BrainX IOS on 14/10/2022.
//

import Foundation

extension Date {
    
    static var dobFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
    
    static var apiDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    static var yearMonthDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM"
        return formatter
    }()
    
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: Calendar.Identifier.iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        return formatter
    }()
    
    static var addTaskAPIDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()
    
    static var dateTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy, hh:mm a"
        return formatter
    }()
    
    static var dayDateTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE - MMM dd, yyyy"
        return formatter
    }()
    
    
    static var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter
    }()
    
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }
    
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
    
    static func dates(from fromDate: Date, to toDate: Date) -> [String] {
        var dates: [String] = []
        var date = fromDate
        while date < toDate {
            dates.append(Date.apiDateFormatter.string(from: date))
            guard let newDate = Calendar.current.date(byAdding: .day, value: 1, to: date) else { break }
            date = newDate
        }
        return dates
    }
    
    func weeksInBetween(_ date: Date) -> Int {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/604800)
        return Int(diff)
    }
    
    func daysInBetween(_ date: Date) -> Int {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff)
        return Int(diff/86400)
    }
    
    func hoursInBetween(_ date: Date) -> Int {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/3600)
        return Int(diff)
    }
    
    func minutesInBetween(_ date: Date) -> Int {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/60)
        return Int(diff)
    }
    
    func secondsInBetween(_ date: Date) -> Int {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff)
        return Int(diff)
    }
    
    func monthsBetween(_ date: Date) -> Int? {
        let calendar = Calendar.current
        let currentDate = calendar.startOfDay(for: date)
        let publishDate = calendar.startOfDay(for: self)
        let components = calendar.dateComponents([.month], from: publishDate, to: currentDate)
        return components.month
    }
    
    func yearsBetween(_ date: Date) -> Int! {
        let calendar = Calendar.current
        let currentDate = calendar.startOfDay(for: date)
        let publishDate = calendar.startOfDay(for: self)
        let components = calendar.dateComponents([.year], from: publishDate, to: currentDate)
        return components.year
    }
    
    func differenceFromNow() -> String? {
        let date = Date()
        var timeDiff: String?
        guard let yearsBetween = yearsBetween(date) else {
            return nil
        }
        guard let monthsBetween = monthsBetween(date) else {
            return nil
        }
        if yearsBetween > 0 {
            timeDiff = yearsBetween == 1 ? "\(yearsBetween) \(LocalizedKey.yearAgo.string)" : "\(yearsBetween) \(LocalizedKey.yearsAgo.string)"
        } else if monthsBetween > 0 {
            timeDiff = monthsBetween == 1 ? "\(monthsBetween) \(LocalizedKey.monthAgo.string)" : "\(monthsBetween) \(LocalizedKey.monthsAgo.string)"
        } else if weeksInBetween(date) > 0 {
            timeDiff = weeksInBetween(date) == 1 ? "\(weeksInBetween(date)) \(LocalizedKey.weekAgo.string)" : "\(weeksInBetween(date)) \(LocalizedKey.weeksAgo.string)"
        } else if daysInBetween(date) > 0 {
            timeDiff = daysInBetween(date) == 1 ? "\(daysInBetween(date)) \(LocalizedKey.dayAgo.string)" : "\(daysInBetween(date)) \(LocalizedKey.daysAgo.string)"
        } else if hoursInBetween(date) > 0 {
            timeDiff = hoursInBetween(date) == 1 ? "\(hoursInBetween(date)) \(LocalizedKey.hoursAgo.string)" : "\(hoursInBetween(date)) \(LocalizedKey.hoursAgo.string)"
        } else if minutesInBetween(date) > 0 {
            timeDiff = minutesInBetween(date) == 1 ? "\(minutesInBetween(date)) \(LocalizedKey.minuteAgo.string)" : "\(minutesInBetween(date)) \(LocalizedKey.minutesAgo.string)"
        } else if secondsInBetween(date) > 0 {
            timeDiff = LocalizedKey.justNow.string
        }
        return timeDiff
    }
}
