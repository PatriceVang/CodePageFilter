//: [Previous](@previous)

import Foundation



//: [Next](@next)


//let date = Calendar.current
//
//let day = date.date(byAdding: , value: <#T##Int#>, to: <#T##Date#>)
//
//extension Int {
//    var seconds: DateComponents { .init(second: self)}
//    var minutes: DateComponents {.init(minute: self)}
//    var hours: DateComponents {.init(hour: self)}
//    var days: DateComponents {.init(day: self)}
//    var weeks: DateComponents {.init(day: self * 7)}
//    var months: DateComponents {.init(month: self)}
//    var years: DateComponents {.init(year: self)}
//}
//
//extension DateComponents {
//    var fromNow: Date? {Calendar.current.date(byAdding: self, to: Date())}
//    var ago: Date? {Calendar.current.date(byAdding: -self, to: Date())}
//
//
//}
//var giay: Int = 5
//print(giay.seconds)
//
//var threesDay = 3.days.fromNow
//print(threesDay)




//var lang = "Obj"
//
//let code = { [lang] in
//    print(lang)
//}
//
//lang = "Swift"
//
//let newCode = code
//newCode()



//let calendar = Calendar.current
//let today = calendar.startOfDay(for: Date())
//let dayOfWeek = calendar.component(.weekday, from: Date())
//let weekDay = calendar.range(of: .weekday, in: .weekOfYear, for: today)
//let days = (weekDay?.lowerBound ..< weekDay?.upperBound)
//
//print(today)
//print(dayOfWeek)
//print(weekDay)

//var calendar = Calendar.autoupdatingCurrent
//calendar.firstWeekday = 2 // Start on Monday (or 1 for Sunday)
//let today = calendar.startOfDay(for: Date())
//var week = [Date]()
//if let weekInterval = calendar.dateInterval(of: .weekOfYear, for: today) {
//    for i in 0...6 {
//        if let day = calendar.date(byAdding: .day, value: i, to: weekInterval.start) {
//            week += [day]
//        }
//    }
//}
//
//let formatter = DateFormatter()
//formatter.dateFormat = "MMM dd"
//for date in week {
//    print(formatter.string(from: date))
//}
//
//
//var thu = ["2", "3", "4", "5", "6", "7", "CN"]
//
//
//let combine = zip(thu, week)
//for (thu, ngay) in combine {
//    print("\(thu) - \(formatter.string(from: ngay))")
//}
//print(week)



//let calendar = Calendar.current
//let today = calendar.startOfDay(for: Date())
//let dayOfWeek = calendar.component(.weekday, from: today)
//let weekdays = calendar.range(of: .weekday, in: .weekOfYear, for: today)!
//let days = (weekdays.lowerBound ..< weekdays.upperBound)
//    .compactMap { calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: today) }  // use `flatMap` in Xcode versions before 9.3
//    .filter { !calendar.isDateInWeekend($0) }
//print(days)
//
//let formatter = DateFormatter()
//formatter.dateFormat = "eeee' = 'D"
//for date in days {
//    print(formatter.string(from: date))
//}

//let today = Calendar.current.startOfDay(for: Date())
