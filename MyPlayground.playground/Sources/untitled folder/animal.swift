import Foundation

public class Animal {
  
    public var name : String = ""
    public var weight : Int = 0

    public init(name: String, weight: Int) {
        self.name = name
        self.weight = weight
    }
    
    public func hello(){}
    public func eat(){}
}
