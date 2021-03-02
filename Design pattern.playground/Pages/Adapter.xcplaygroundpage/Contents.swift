//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


protocol Duck {
    func quack()
    func fly()
}

class MainDuck: Duck {
    func quack() {
        print("Quach")
    }
    
    func fly() {
        print("Duck fly")
    }
    
}

protocol Turkey {
    func globle()
    func fly()
}

class MainTurkey: Turkey {
    func globle() {
        print("globle")
    }
    
    func fly() {
        print("Turkey sort fly")
    }
}


class TurkeyAdapter: Duck {
    var turkey: Turkey
    init(turkey: Turkey) {
        self.turkey = turkey
    }
    func quack() {
        turkey.globle()
    }
    
    func fly() {
        turkey.fly()
    }
}

var turkey = MainTurkey()
var adapter = TurkeyAdapter(turkey: turkey)
adapter.fly()
adapter.quack()


class DuckAdapter: Turkey {
    
    var duck: Duck
    
    init(duck: Duck) {
        self.duck = duck
    }
    
    func globle() {
        duck.quack()
    }
    
    func fly() {
        duck.fly()
    }
    
}

var duck = MainDuck()
var adapte = DuckAdapter(duck: duck)
adapte.globle()
adapte.fly()
