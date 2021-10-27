import UIKit
import Foundation



//
//let list = [1,2,4,5,6,7,8,9,9,5,7,4,7,8,3,4,7]
//
//let dpGgroup = DispatchGroup()
//
//func finished() {
//    print("finished")
//}
//func test() {
//
////    DispatchQueue.global(qos: .userInitiated).async {
////
////        dpGgroup.enter()
////        var a = list.map { $0}
////        print(a)
////        dpGgroup.leave()
////    }
////
////    dpGgroup.notify(queue: .main) {
////            finished()
////    }
//
//    let baries = DispatchWorkItem(qos: .userInitiated, flags: [.barrier]) {
//        finished()
//    }
//
//    for i in 0...10 {
//        print(i)
//    }
//
//    baries.perform()
//}
//
//test()

//


//var dwi: DispatchWorkItem? = DispatchWorkItem {
//    for i in 0...5 {
//        print("\(dwi?.isCancelled)")
//    }
//}

//var dwi:DispatchWorkItem?
//dwi = DispatchWorkItem { //1
//  for i in 1...5 {
//    print("\(dwi?.isCancelled)")
//    if (dwi?.isCancelled)!{
//      break
//    }
//    sleep(1)
//    print("DispatchWorkItem : \(i)")
//  }
//}
////submit the work item to the default global queue
//DispatchQueue.global().async(execute: dwi!) //2
//
////cancelling the task after 3 seconds
//DispatchQueue.global().async{ //3
//  sleep(3)
//  dwi?.cancel()
//}



//func callNumber() {
//    print("number")
//}
//
//func outputNumber() {
//
//    var dwi = DispatchWorkItem.init {
//        for i in 0...3 {
//            print(i)
//        }
//    }
//
//    for i in 1...5 {
//        if i == 3 {
//            dwi.perform()
//        }
//        print(i)
//    }
//}
//
//outputNumber()


//var dwi:DispatchWorkItem?
//dwi = DispatchWorkItem { //1
//  for i in 1...5 {
//    print("\(dwi?.isCancelled)")
//    if (dwi?.isCancelled)!{
//      break
//    }
//    sleep(1)
//    print("DispatchWorkItem : \(i)")
//  }
//}
////submit the work item to the default global queue
////DispatchQueue.global().async(execute: dwi!) //2
//dwi?.perform()
//
////dwi?.perform()
//
////cancelling the task after 3 seconds
////DispatchQueue.global().async{ //3
//////    dwi?.perform()
////  sleep(3)
////  dwi?.cancel()
////}
//
//
////DispatchQueue.main.async {
////    sleep(3)
////    dwi?.cancel()
////}
//
//sleep(3)
//dwi?.cancel()



//let queue = DispatchQueue(label: "", attributes: .concurrent)

//
//let dpGr = DispatchGroup()
//let w: DispatchWorkItem?
//w = DispatchWorkItem(block: {
//    for j in 20...30 {
//        print(j)
//    }
//})
//
//
//
//
//let dwi = DispatchWorkItem(qos: .utility, flags: .barrier) {
//    for j in 20...30 {
//        print(j)
//    }
//}
//queue.async(execute: w!)
//
//queue.async {
//    for i in 0...10 {
//        print(i)
//    }
//}


//dpGr.notify(queue: .main) {
//    queue.async {
//        for j in 20...30 {
//            print(j)
//        }
//    }
//}




//dpGr.enter()

//for i in 0...10 {
//    print(i)
//}

//dpGr.leave()

//let group = DispatchGroup()
//let queue = DispatchQueue.global(qos: .userInitiated)
//queue.async(group: group) {
//    group.enter()
//    for i in 0...20 {
//        print(i)
//    }
//    group.leave()
//
//    group.enter()
//    
//    for j in 21...40 {
//        print(j)
//    }
//
//    group.leave()
//
//    group.notify(queue: .main) {
//        print("finish")
//    }
//}
//queue.async(group: group) {
//    print("Start job 2")
//    Thread.sleep(until: Date().addingTimeInterval(2))
//    print("End job 2")
//}
// if group.wait(timeout: .now() + 5) == .timedOut { print("I got tired of waiting")
//} else {
//   print("All the jobs have completed")
//}

///Display date

//let now = Date()
//let pastDate = Date(timeIntervalSinceNow: -60 * 60 * 24 * 7)
//extension Date {
//    func timeAgoDisplay() -> String {
//        let secondeAgo = Int(Date().timeIntervalSince(self))
//
//        let second = 60
//        let minute = 60 * second
//        let hour = 60 * minute
//        let day = 24 * hour
//        let week = 7 * day
//        let month = 4 * week
//        let year = 12 * month
//
//
//        // neu nho hon phut la giay, nho hon gio la phut
//        if secondeAgo < minute {
//            return  "\(secondeAgo) seconde ago"
//        } else if secondeAgo < hour {
//            return  "\(secondeAgo / minute) minute ago"
//        } else if secondeAgo < day {
//            return "\(secondeAgo / 60 / 60) hour ago"
//        } else if secondeAgo < week {
//            "\(secondeAgo / 60 / 60 / 24) day ago"
//        }
//        return "\(secondeAgo / 60 / 60 / 24 / 7) week ago"
//    }
//}
//
//print(pastDate.timeAgoDisplay())


//let sentence = "Madam Ronaldo David Vila Sarapova Ronaldo"
//
//
//func allPalindSomeCounts(sentense: String) -> [String: Int]{
//    let words = sentence.components(separatedBy: " ")
//    var counts = [String: Int]()
//    words.forEach { (word) in
//        if isPalindrome(word: word) {
//            let count = counts[word] ?? 0
//            counts[word] = count + 1
//        } else {
//
//        }
//    }

//    return counts
//}
////
//func isPalindrome(word: String) -> Bool {
//    var currentIndex = 0
//    let charater = Array(word.lowercased())
//    while currentIndex < charater.count / 2 {
//        if charater[currentIndex] != charater[charater.count - currentIndex - 1] {
//            return false
//        }
//        currentIndex += 1
//    }
//    return true
//}
//
//print(allPalindSomeCounts(sentense: sentence))

///123


//func reserver(number: Int) -> Int {
//    var reuslt = 0
//    var temNumber = number
//    while temNumber > 0 {
//        let donvi = temNumber % 10
//        reuslt *= 10
//        reuslt += donvi
//        temNumber = temNumber / 10
//        print(temNumber)
//    }
//    return reuslt
    
//}
//
//reserver(number: 123)
//
//
//
//
//var arr = [ 1, 2, 44, 5, 2, 4, 9, 5]
//var temp = 0
//
//for i in 0..<arr.count {
//    for j in 0..<arr.count - 1 {
//        if arr[j] < arr[j + 1] {
//            temp = arr[j + 1]
//            arr[j + 1] = arr[j]
//            arr[j] = temp
//        }
//
//    }
//}



//print(arr)

//let dispatch = DispatchGroup()
//let gcd = DispatchQueue(label: "name")
//let sep = DispatchSemaphore(value: 0)
//
//var arr = [Int]()
//

//dispatch.enter()
//DispatchQueue.global().async {
//    arr.append(1)
//    print("1")
//    sep.signal()
//}
//sep.wait()
//dispatch.leave()

//dispatch.enter()
//DispatchQueue.global().async {
//    arr.removeAll()
//    print("2")
//    sep.signal()
//}
//sep.wait()

//dispatch.leave()


//dispatch.enter()

//DispatchQueue.global().async {
//    arr += [1,2,4,5,5,6,7,7,7,4,2,2,3,4,5,6,6]
//    print("3")
//    print(arr)
//    sep.signal()
//}
//sep.wait()

//dispatch.leave()

//dispatch.enter()
//arr += [1,1,1,1,1,1,1]
//print("4")
//print(arr)
//dispatch.leave()

//dispatch.notify(queue: .main) {
//    print("xong")
//} 



//let test = "acbaaac"

//let count = test.reduce(into: [:]) { (count, charater) in
//    count[charater, default: 0] += 1
//}
//
//print(count)

//func counting() -> [String: Int] {
//    var result = [String: Int]()
//    for charater in test {
//        let cha = String(charater)
//        if result.isEmpty {
//            result[cha] = 1
//        } else {
//            for (key, value) in result {
//                if cha == key {
//                    result[cha]! += 1
//                } else {
//                    if result[cha] == nil {
//                        result[cha] = 1
//                    }
//                }
//            }
//        }
//    }
//    return result
//}
//
//print(counting())


//enum Level {
//    case easy
//    case hard
//}
//struct Exam {
//    var level: Level
//    lazy private(set) var questions: String = {
//        switch level {
//        case .easy:
//            return "easy"
//        default:
//            return "hard"
//        }
//    }()
//}
//
//var a = Exam(level: .easy)
//print(a.questions)
//var b = a
//b.level = .hard
//print(b.questions)
//b.level = .hard
//
//a.level = .hard
//print(b.questions)


//var b = 0
//var a = 1 {
//    willSet {
//        print("Will set dc goi")
//        print("a = \(a)")
//        print(newValue)
//    }
//
//    didSet {
//        print("DidSet ddc goi")
//        print("a = \(a)")
//        print(oldValue)
//    }
//}
//a = 2
//print(b)
//
//
//
//a
//
//func total(_ a: String, b: String) {
//
//    func convertToInt(str: String) -> Int {
//        return Int(str) ?? 0
//    }
//    print(convertToInt(str: a) + convertToInt(str: b))
//
//}
//
//total("3", b: "3")



//func subtract(_ closure: @autoclosure() -> Int) -> Int {
//    return closure()
//}
//
//
//subtract(1 + 1)
//
//func tttt(_ closure: () -> Int) -> Int {
//    return closure()
//}
//
//tttt {
//    1 + 1
//}





//var c = [1,2,4]
//
//var d: (_ numberOne: Int, _ numberTwo: Int) -> Void = { m, n in
//    print(m + n)
//}
//
//d(1, 2)
//
//
//var i = 10
//
//func tinh(number: Int) -> Int {
//
//    var number1 = 0
//
//    func to() -> Int {
//        number1 += number
//        return number1
//    }
//    return to()
//}


//
//func increment(number: Int) -> () -> Int {
//    var total = 0
//
//    let closure: () -> Int = {
//        total += number
//        return total
//    }
//
//    return closure
//}
//
//var m = increment(number: 10)
//m()
//m()
//
//

//class A: Equatable {
//    static func == (lhs: A, rhs: A) -> Bool {
//        return lhs == rhs
//    }
//
//
//}
//
//
//
//var a1 = A()
//var a2 = A()
//var b = A()
//a1 == a2
//a1 == b
//b == a2
//print(1)

//protocol CongViecCuaDev {
//    func fixbug()
//    func code()
//}
//
//extension CongViecCuaDev {
//    func fixbug() {
//        print("Fix bug")
//    }
//}
//
//class Dev: CongViecCuaDev {
//    func fixbug() {
//        print("Dev fix bug")
//    }
//    func code() {
//        print("Dev code")
//    }
//}
//
//class Manager: CongViecCuaDev {
//    func code() {
//        print("Manager code")
//    }
//
//    func fixbug() {
//        print("Manager fixbug")
//    }
//
//}
//struct E: CongViecCuaDev {
//    func code() {
//
//    }
//}
//
//var a = Dev()
//a.code()
//a.fixbug()
//var b = Manager()
//b.code()
//b.fixbug()

class Bank {

    var balan: Double
    init(balan: Double) {
        self.balan = balan
    }
    
    func withDraw(_ amount: Double) {
        if balan >= amount {
            print("Money from account")
            let pro = UInt32.random(in: 0...3)
            print("Process for \(pro)")
            sleep(pro)
            balan -= amount
            print("balanis : \(balan)")
        }
    }
}

let bank = Bank(balan: 500)
let queue = DispatchQueue(label: "123", attributes: .concurrent)

queue.async {
    bank.withDraw(500)
}

queue.async {
    bank.withDraw(300)
}



