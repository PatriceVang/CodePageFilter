import Foundation

public class Dog : Animal {
    public var kind : String = ""
    
    
    override public func hello() {
        print("Hello: Dog say gau gau")
    }
    override public func eat() {
        print("Eatting: Dog can eat something like Rice, Meat...")
    }
    
    public init(name: String, weight: Int, kind: String){
        super.init(name: name, weight: weight)
        self.kind = kind

    }
}

