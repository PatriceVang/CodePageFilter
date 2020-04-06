import Foundation

open class SinhVien {
    public var id  : Int
    public var name : String
    public var pointLT : Float
    public var pointTH : Float
    public init() {
        id = 0
        name = ""
        pointLT = 0.0
        pointTH = 0.0
    }
    public init(id: Int, name: String, pointLT: Float, pointTH: Float){
        self.id = id
        self.name = name
        self.pointLT = pointLT
        self.pointTH = pointTH
    }
    
    public func acountPointAverage() -> Float {
        return pointLT + pointTH
    }
    
    public func toString() -> String {
        return "Information:\n - ID:\(id)\n - Name:\(name)\n - PointLT:\(pointLT)\n - PointTH:\(pointTH)\n - PointAverage:\(acountPointAverage()) "
    }
}
