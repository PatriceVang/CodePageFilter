//: [Previous](@previous)

import Foundation
//
//var str = "Hello, playground"

//: [Next](@next)


//enum Animals: Int {
//    case Tiger = 1
//    case Panda
//    case Pig
//}



//extension Animals {
//    var message: String {
//        switch self {
//        case .Panda:
//            return "Gau truc"
//        case .Pig:
//            return "Heo"
//        case .Tiger:
//            return "Cop"
//        }
//    }
//}

//enum Exams {
//
//    case victory(String)
//    case failure(String)
//
//}
//
//func resultExams(exams: Exams) -> Exams {
//    switch exams {
//    case .victory:
//        return .victory("Win")
//    default
//    }
//}


//var computer: Optional<String> = Optional.none
//let mobile: Optional<String> = Optional.some("IP8")
//print(mobile!)
//print(computer ?? "Default")
//computer = .some("asdf")
//
//switch  computer {
//case .none:
//    print("no")
//case .some(let value):
//    print(value)
//}

enum RightOrWrong {
    case right
    case wrong
    var isRight: Bool {
        switch self {
        case .right:
            return true
        case .wrong:
            return false
        }
    }
}

extension RightOrWrong {

    func switchState() -> Self {
        switch self {
        case .right:
            return .wrong
        case .wrong:
            return .right
        }
    }
}

var a = RightOrWrong.right
a.isRight
a.switchState()
a.isRight











