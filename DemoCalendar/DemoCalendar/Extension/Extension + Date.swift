//
//  Extension + Date.swift
//  DemoCalendar
//
//  Created by Apple on 9/4/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation


//
//  Date+Extensions.swift
//  GoFixCustomer
//
//  Created by Edward Nguyen on 6/25/18.
//  Copyright © 2018 gofix.vinova.sg. All rights reserved.
//

import Foundation

enum GFDateFormat: String {
    
    case ddMMMyyCommahhmma          = "dd MMM yyyy, hh:mm a"
    case ddMMyyyyHHmmDash           = "dd-MM-yyyy HH:mm"
    case ddMMyyyyhhmmma             = "dd MM yyyy hh:mm"
    case ddMMMyyyy                  = "dd MMM yyyy"
    case ddMMyyyy                   = "dd MM yyyy"
    case MMyyyy                     = "MM yyyy"
    case MMMMyyyy                   = "MMMM yyyy"
    case hhmma                      =  "hh:mm a"
//    case yyyyMMDD                   = "yyyy-MM-dd"
    case weekdayddMMMyyy            = "EE, dd MMM yyyy"
    
    case MMMyyyy = "MMM yyyy"
    case ddMMYYYY = "dd.MM.YYYY"
    case yyyyMMdd = "yyyy-MM-dd"
    case MMdd = "MM dd"
    case HHmm = "HH:mm"
    case ha = "ha"
    case MM = "MM"
    case dd = "dd"
    case ISO8601 = "yyyy-MM-dd'T'HH:mm:ss"
    var formatString: String {
        return self.rawValue
    }
}


extension Date {
    var isInThePast: Bool {
        let now = Date()
        return self.compare(now) == ComparisonResult.orderedAscending
    }
        
    /// SwifterSwift: ISO8601 string of format (yyyy-MM-dd'T'HH:mm:ss.SSS) from date.
    ///
    ///     Date().iso8601String -> "2017-01-12T14:51:29.574Z"
    ///
    public var iso8601String: String {
        // https://github.com/justinmakaila/NSDate-ISO-8601/blob/master/NSDateISO8601.swift
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        
        return dateFormatter.string(from: self).appending("Z")
    }
    
    /// SwifterSwift: Create date object from ISO8601 string.
    ///
    ///     let date = Date(iso8601String: "2017-01-12T16:48:00.959Z") // "Jan 12, 2017, 7:48 PM"
    ///
    /// - Parameter iso8601String: ISO8601 string of format (yyyy-MM-dd'T'HH:mm:ss.SSSZ).
    public init?(iso8601String: String) {
        // https://github.com/justinmakaila/NSDate-ISO-8601/blob/master/NSDateISO8601.swift
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = dateFormatter.date(from: iso8601String) {
            self = date
        } else {
            return nil
        }
    }
    
    init?(string: String, format: GFDateFormat) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = format.formatString
        if let date = dateFormatter.date(from: string) {
            self = date
        } else {
            return nil
        }
    }
    
    init?(string: String, format: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = format
        if let date = dateFormatter.date(from: string) {
            self = date
        } else {
            return nil
        }
    }
    
    public var isToday: Bool {
        let calendar = Calendar.autoupdatingCurrent
        return calendar.isDateInToday(self)
    }
    
    /**
     *  Determine if date is within the day tomorrow
     */
    public var isTomorrow: Bool {
        let calendar = Calendar.autoupdatingCurrent
        return calendar.isDateInTomorrow(self)
    }
    
    /**
     *  Determine if date is within yesterday
     */
    public var isYesterday: Bool {
        let calendar = Calendar.autoupdatingCurrent
        return calendar.isDateInYesterday(self)
    }
    
    /**
     *  Determine if date is in a weekend
     */
    public var isWeekend: Bool {
        if weekday == 7 || weekday == 1 {
            return true
        }
        return false
    }
    
    // MARK: - Components
    
    /**
     *  Convenience getter for the date's `era` component
     */
    public var era: Int {
        return component(.era)
    }
    
    /**
     *  Convenience getter for the date's `year` component
     */
    public var year: Int {
        return component(.year)
    }
    
    /**
     *  Convenience getter for the date's `month` component
     */
    public var month: Int {
        return component(.month)
    }
    
    /**
     *  Convenience getter for the date's `week` component
     */
    public var week: Int {
        return component(.weekday)
    }
    
    /**
     *  Convenience getter for the date's `day` component
     */
    public var day: Int {
        return component(.day)
    }
    
    /**
     *  Convenience getter for the date's `hour` component
     */
    public var hour: Int {
        return component(.hour)
    }
    
    /**
     *  Convenience getter for the date's `minute` component
     */
    public var minute: Int {
        return component(.minute)
    }
    
    /**
     *  Convenience getter for the date's `second` component
     */
    public var second: Int {
        return component(.second)
    }
    
    /**
     *  Convenience getter for the date's `weekday` component
     */
    public var weekday: Int {
        return component(.weekday)
    }
    
    /**
     *  Convenience getter for the date's `weekdayOrdinal` component
     */
    public var weekdayOrdinal: Int {
        return component(.weekdayOrdinal)
    }
    
    /**
     *  Convenience getter for the date's `quarter` component
     */
    public var quarter: Int {
        return component(.quarter)
    }
    
    /**
     *  Convenience getter for the date's `weekOfYear` component
     */
    public var weekOfMonth: Int {
        return component(.weekOfMonth)
    }
    
    /**
     *  Convenience getter for the date's `weekOfYear` component
     */
    public var weekOfYear: Int {
        return component(.weekOfYear)
    }
    
    /**
     *  Convenience getter for the date's `yearForWeekOfYear` component
     */
    public var yearForWeekOfYear: Int {
        return component(.yearForWeekOfYear)
    }
    
    /**
     *  Convenience getter for the date's `daysInMonth` component
     */
    public var daysInMonth: Int {
        let calendar = Calendar.autoupdatingCurrent
        let days = calendar.range(of: .day, in: .month, for: self)
        return days!.count
    }
    
    public func component(_ component: Calendar.Component) -> Int {
        let calendar = Calendar.autoupdatingCurrent
        return calendar.component(component, from: self)
    }
    
    func toString(formatString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatString
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: self)
    }
    
    func getStartHour() -> String {
        return toString(formatString: GFDateFormat.HHmm.formatString)
    }
    
    func getEndHour() -> String {
        var endStr = toString(formatString: GFDateFormat.HHmm.formatString)
        if endStr == "00:00" {
            endStr = "24:00"
        }
        return endStr
    }
}

extension Date {
    func isBetween(_ date1: Date, and date2: Date) -> Bool {
        return (min(date1, date2) ... max(date1, date2)).contains(self)
    }
    
    public func dateComponents(days: Int) -> Date {
           let calendar = Calendar.autoupdatingCurrent
           var components = DateComponents()
           components.day = days
           return calendar.date(byAdding: components, to: self)!
       }
       
       func format(with dateFormat: String, timeZone: TimeZone) -> String {
           return format(with: dateFormat, timeZone: timeZone, locale: Locale.autoupdatingCurrent)
       }
       
       public func format(with dateFormat: String, timeZone: TimeZone, locale: Locale) -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = dateFormat
           dateFormatter.timeZone = timeZone
           dateFormatter.locale = locale
           
           return dateFormatter.string(from: self)
       }
       
       func dateOnly() -> Date {
           return Date(year: year, month: month, day: day)
       }
       
       public init(year: Int, month: Int, day: Int) {
           self.init(year: year, month: month, day: day, hour: 0, minute: 0, second: 0)
       }
       
       public init(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) {
           var dateComponents = DateComponents()
           dateComponents.year = year
           dateComponents.month = month
           dateComponents.day = day
           dateComponents.hour = hour
           dateComponents.minute = minute
           dateComponents.second = second
           
           guard let date = Calendar.current.date(from: dateComponents) else {
               self = Date()
               return
           }
           self = date
       }
       
       public func isEarlier(than date: Date) -> Bool {
           return self.compare(date) == .orderedAscending
       }
       
       public func isLater(than date: Date) -> Bool {
           return self.compare(date) == .orderedDescending
       }
}


