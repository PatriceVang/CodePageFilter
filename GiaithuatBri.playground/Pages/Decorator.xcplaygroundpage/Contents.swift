//: [Previous](@previous)

import Foundation

//
//protocol Xe4Banh {
//    func giaTien() -> Int
//}
//
//class Vinfast: Xe4Banh {
//    func giaTien() -> Int {
//        return 100
//    }
//}
//
//class Suv: Vinfast {
//    var vin: Vinfast
//    init(vin: Vinfast) {
//        self.vin = vin
//    }
//
//    override func giaTien() -> Int {
//        return vin.giaTien() + 10
//    }
//}
//
//
//
//let vinfast = Vinfast()
//let suv = Suv(vin: vinfast)
//print(suv.giaTien())


//// depenceny invention
//enum TypeAnimals {
//    case Anthit
//    case Anco
//}
//
//protocol Animals {
//    var typeAnimal: TypeAnimals {get set}
//    func eat()
//    func move()
//}
//
//class Mouse: Animals {
//    var typeAnimal: TypeAnimals = .Anco
//
//    func eat() {
//        print(typeAnimal)
//    }
//
//    func move() {
//        print("chay")
//    }
//}
//class Cat: Animals {
//    var typeAnimal: TypeAnimals = .Anthit
//
//    func eat() {
//        print(typeAnimal)
//    }
//
//    func move() {
//        print("Di")
//    }
//}
//
//
//class FeatureAnimals: Animals {
//    var typeAnimal: TypeAnimals = .Anco
//
//    func eat() {
//        animal.eat()
//    }
//
//    func move() {
//        animal.move()
//    }
//
//    var animal: Animals
//    init(animal: Animals) {
//        self.animal = animal
//    }
//
//}
//
//var mouse = Mouse()
//var cat = Cat()
//var fea = FeatureAnimals(animal: mouse)
//fea.eat()
//fea.move()
//



//class SurveyQuestion {
//    var text: String
//    init() {
//        text = "1"
//    }
//    init(text: String) {
//        self.text = text
//    }
//}
//
//class M: SurveyQuestion {
//    let name: Int
//    override init() {
//        self.name = 1
//        super.init(text: "")
//    }
//    override init(text: String) {
//        self.name = 0
//        super.init()
//
//
//
//    }
//}
//
//var m = M(text: "123")


//
//
//
//
//class Animal {
//    var species: Int = 0 {
//        didSet {
//            print("Call animal")
//        }
//    }
    
//    init() {}
//}
//
//class MN: Animal {
//    override var species: Int {
//        didSet {
//            print("MN Caled")
//        }
//    }
//}
//
//var animal = Animal()
//var mn = MN()
//animal.species = 1
//animal.species = 1
//mn.species = 2
//mn.species = 3
//mn.species = 2
//mn.species = 1



//class Car {
//    var soBanh: Int
//    var soGhe: Int
//    var color: String
//
//    init(soBanh: Int, soGhe: Int, color: String) {
//        self.soGhe = soGhe
//        self.soBanh = soBanh
//        self.color = color
//    }
//
//}
//
//class Taxi: Car {
//    var vanToc: Double
//    var coTheBay: Bool
//
//    init(vanToc: Double) {
//        self.coTheBay = false
//        self.vanToc = vanToc
//        super.init(soBanh: 8, soGhe: 4, color: "Trang")
//    }
//
//    convenience init(coTheBay: Bool, color: String) {
//        self.init(vanToc: 80)
//        self.color = color
//        self.coTheBay = coTheBay
//    }
//
//    func total() {
//
//    }
//}
//
//var a = Taxi(vanToc: 80)
//var b = Taxi(coTheBay: true, color: "Do")

//Cho 1 số đối tượng Hoa hậu, Ca sĩ, Diễn Viên, Cầu thủ Bóng Đá, hãy viết 1 cuộc thi sắc đẹp có chọn lọc đối tượng tham gia(đc biết chỉ Hoa hậu và Cầu thủ bóng đá mới có đủ nhan sắc tham gia chương trình này)

protocol Sacdep {}

class HoaHau: Sacdep {}
class Casi {}
class DienVien {}
class CauThuBongDa: Sacdep {}

class Cuocthi {
    func nhanHang(sacDep: Sacdep) {
    }
}

var hh = HoaHau()
var dv = DienVien()
var ct = CauThuBongDa()
var cs = Casi()
var cthi = Cuocthi()

cthi.nhanHang(sacDep: hh)
cthi.nhanHang(sacDep: ct)


@objc protocol CongViecCuaDev {
    @objc optional func fixbug()
    func code()
}


class Dev: CongViecCuaDev {
    func fixbug() {
        print("Dev fix bug")
    }
    func code() {
        print("Dev code")
    }
}

class Manager: CongViecCuaDev {
    func code() {
        print("Manager code")
    }

}

var a = Dev()
a.code()
a.fixbug()
var b = Manager()
b.code()





class Number {
    
}

class Get {
    var n: Number
    init(n: Number) {
        self.n = n
    }
}

