import Foundation

open class HinhChuNhat {
    public var chieudai   = 0
    public var chieurong  = 1
    
    public init(){}
    
    public func setInfor(chieudai: Int, chieurong: Int) {
        self.chieudai   = chieudai
        self.chieurong  = chieurong
    }
    public func getInfor() ->  String {
        return "\(chieudai) - \(chieurong)"
    }
    
    public func chuVi() -> Int {
        
        return (chieudai + chieurong) * 2
    }
    
    public func dienTich() -> Int{
        return chieurong * chieudai
    }
    
    public func toString() -> String {
        return "Information:\n - Chieu dai: \(chieudai)\n - Chieu rong la: \(chieurong)\n - Chu vi la: \(chuVi())\n - Dien tich la: \(dienTich()) "
    }
}
