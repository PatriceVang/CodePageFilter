//: [Previous](@previous)

import Foundation



//: [Next](@next)


let date = Calendar.current

let day = date.date(byAdding: , value: <#T##Int#>, to: <#T##Date#>)

extension Int {
    var seconds: DateComponents { .init(second: self)}
    var minutes: DateComponents {.init(minute: self)}
    var hours: DateComponents {.init(hour: self)}
    var days: DateComponents {.init(day: self)}
    var weeks: DateComponents {.init(day: self * 7)}
    var months: DateComponents {.init(month: self)}
    var years: DateComponents {.init(year: self)}
}

extension DateComponents {
    var fromNow: Date? {Calendar.current.date(byAdding: self, to: Date())}
    var ago: Date? {Calendar.current.date(byAdding: -self, to: Date())}
    
 
}
var giay: Int = 5
print(giay.seconds)

var threesDay = 3.days.fromNow
print(threesDay)




