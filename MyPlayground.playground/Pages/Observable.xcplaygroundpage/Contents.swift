//: [Previous](@previous)

import Foundation

//
//enum Color {
//    case red
//    case green
//    case yellow
//    case invalid
//}
//
//protocol Observable {
//    func trafficLightColor(_ color: Color)
//}
//
//class VehicleObserver: Observable {
//
//    var colorLight: Color? {
//        didSet {
//            trafficLightColor(colorLight!)
//        }
//    }
//    func trafficLightColor(_ color: Color) {
//        if color == .red {
//            print("Stop")
//        } else if color == .green {
//            print("Start")
//        } else if color == .yellow {
//            print("Slow")
//        } else {
//            print("Invalid")
//        }
//    }
//}
//
//class VendorObserver: Observable {
//
//    func trafficLightColor(_ color: Color) {
//          if color == .red {
//              print("Vendor Stop")
//          } else if color == .green {
//              print("Vendor Start")
//          } else if color == .yellow {
//              print("Vendor Slow")
//          } else {
//              print("Vendor Invalid")
//          }
//      }
//}
//
//let a = VehicleObserver()
//let b = VendorObserver()
//
//a.colorLight = .green
//a.colorLight = .red

//class A {
//    var startTest = true
//
//    func resultTest() -> String {
//
//        var result: String {
//            if startTest {
//                return "True"
//            } else {
//                return "False"
//            }
//        }
//
//        return result
//    }
//
//    func switchTest() {
//        startTest = !startTest
//    }
//}
//
//var a = A()
//a.resultTest()
//a.switchTest()
//a.resultTest() //
//
//var arr = [1,2,3,4,5]
//
//
//struct User: Codable {
//    var id: Int?
//    var namse: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case namse = "name"
//    }
//}
//
//var allCharater = [(Int, Int)]()
////
//let a = [1, 2, 3]
//let b = [4, 5, 6]
//
//for i in a {
//    for j  in b {
//        let item = (i, j)
//        allCharater.append(item)
//    }
//
//}
//
//print(allCharater)


//enum Size: Comparable {
//    case lon
//    case vua
//    case nho
//}
//
//let alon = Size.lon
//let avua = Size.vua
//let anho = Size.nho
//
//if alon < avua {
//    print("sai")
//} else {
//    print("dung")
//}

//
//enum WorldCupResult: Comparable {
//    case neverWon
//    case winner(stars: Int)
//}
//
//let americanMen = WorldCupResult.neverWon
//let americanWomen = WorldCupResult.winner(stars: 4)
//let japaneseMen = WorldCupResult.neverWon
//let japaneseWomen = WorldCupResult.winner(stars: 1)
//
//let teams = [americanMen, americanWomen, japaneseMen, japaneseWomen]
//let sortedByWins = teams.sorted()
//print(sortedByWins)



class A {
    var defaul: Int {
        get {
            return 0
        }
        set {
            defaul = newValue
        }
    }
}

var a = A()
a.defaul = 7

print("123")




