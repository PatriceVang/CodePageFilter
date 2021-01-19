//: [Previous](@previous)

import Foundation


protocol Xe4Banh {
    func giaTien() -> Int
}

class Vinfast: Xe4Banh {
    func giaTien() -> Int {
        return 100
    }
}

class Suv: Vinfast {
    var vin: Vinfast
    init(vin: Vinfast) {
        self.vin = vin
    }
    
    override func giaTien() -> Int {
        return vin.giaTien() + 10
    }
}



//let vinfast = Vinfast()
//let suv = Suv(vin: vinfast)
//print(suv.giaTien())


// depenceny invention 
enum TypeAnimals {
    case Anthit
    case Anco
}

protocol Animals {
    var typeAnimal: TypeAnimals {get set}
    func eat()
    func move()
}

class Mouse: Animals {
    var typeAnimal: TypeAnimals = .Anco
    
    func eat() {
        print(typeAnimal)
    }
    
    func move() {
        print("chay")
    }
}
class Cat: Animals {
    var typeAnimal: TypeAnimals = .Anthit
    
    func eat() {
        print(typeAnimal)
    }
    
    func move() {
        print("Di")
    }
}


class FeatureAnimals: Animals {
    var typeAnimal: TypeAnimals = .Anco
    
    func eat() {
        animal.eat()
    }
    
    func move() {
        animal.move()
    }
    
    var animal: Animals
    init(animal: Animals) {
        self.animal = animal
    }

}

var mouse = Mouse()
var cat = Cat()
var fea = FeatureAnimals(animal: mouse)
fea.eat()
fea.move()







