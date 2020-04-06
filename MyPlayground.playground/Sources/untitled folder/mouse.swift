import Foundation

public class Mouse : Animal {
    public var color : String = ""
    
//    public override func eat() {
//        print("an com")
//    }
//    
//    public override func hello() {
//        print("meo meo")
//    }
    
    override public func hello() {
         print("Hello: Dog say gau gau")
     }
     override public func eat() {
         print("Eatting: Dog can eat something like Rice, Meat...")
     }
    
    public init(name: String, weight: Int, color: String){
        super.init(name: name, weight: weight)
        self.color = color
    }
}
