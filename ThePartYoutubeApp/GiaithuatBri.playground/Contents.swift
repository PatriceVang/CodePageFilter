import UIKit



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


//func allPalindSomeCounts(sentense: String) -> [String: Int]{
//    let words = sentence.components(separatedBy: " ")
//    var counts = [String: Int]()
//    words.forEach { (word) in
//        if isPalindrome(word: word) {
//            let count = counts[word] ?? 0
//
//            counts[word] = count + 1
//        } else {
//
//        }
//    }
//
//    return counts
//}
//
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


var a = [1,2,3,4,5,6]

for i in 0..<a.count {
    
}
