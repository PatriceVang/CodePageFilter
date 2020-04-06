//import UIKit

import Foundation



//var n = 3
//var result = 0
////bai11
//func mulFromOneTo(number: Int) -> Int {
//    var sum = 1
//    for i in 1...number {
//        sum *= i
//    }
//    return sum
//}
////
//for item in 1...n {
//      result  += mulFromOneTo(number: item)
//}
//print(result)
//
//var tempVar = 1
//
//for num in 1...n {
//    tempVar *= num
//    result += tempVar
//}
//
//print(result)


//noted
//func hamMu(number: Double, hat: Int) -> Double {
//    var result: Double = 1
//    for i in 1...hat {
//        result *= number
//    }
//    return result
//}
//
//func bai12(x: Double, n: Int) -> Double {
//    var sum: Double = 0
//    for i in 1...n {
//        sum += hamMu(number: x, hat: i)
//    }
//    return sum
//}
//
//hamMu(number: 3, hat: 3)

//Bai 1
//var km: Double = 121
//var price = 0.0

//
//if km  <= 1 {
//    price = 15
//} else if km > 1 && km <= 5 {
//    price = 13
//} else if km > 5 && km <= 120{
//    price = 11
//} else if km > 120 {
//    price = 11 * 90.0/100.0
//}
//
//
//var total = km * price
//print(total)

//if km <= 1 {
//    price = 15
//} else if km <= 5 {
//    price = 13
//} else {
//    price = 11
//}
//var total: Double = 0
//
//total = km * price * (km > 120 ? 90.0/100.0 : 1)
//
//print(total)


//bai2 ptb2

//var a : Double = 1
//var b : Double = -6
//var c : Double = 5
//var del :Double = 0
//
//if a != 0 {
//    del = b*b - 4*a*c
//    if del > 0 {
//          print("2 nghiem phan biet: x1 = \((-b + sqrt(del))/2*a)")
//    } else if del == 0 {
//            print("pt co nghiem kep: x=\(-b/2*a)")
//    } else {
//        print("ptvn")
//    }
//} else {
//    if  b == 0 {
//        if c != 0 {
//            print("ptvn")
//        } else {
//            print("ptvsn")
//        }
//    } else {
//        print("x= \(-c/b)")
//    }
//}

//var month = 2
//var nameMonth = ""
//
//switch month {
//case 1:
//    nameMonth = "Jan"
//    break
//case 2:
//    nameMonth = "Feb"
//    break
//case 3:
//    nameMonth = "Mar"
//    break
//case 4:
//    nameMonth = "April"
//    break
//case 5:
//    nameMonth = "May"
//    break
//case 6:
//    nameMonth = "June"
//    break
//case 7:
//    nameMonth = "July"
//    break
//case 8:
//    nameMonth = "Aug"
//    break
//case 9:
//    nameMonth = "Sep"
//    break
//case 10:
//    nameMonth = "Otc"
//    break
//case 11:
//    nameMonth = "Nov"
//    break
//case 12:
//    nameMonth = "Nov"
//    break
//default:
//    nameMonth = "Nhap tao lao"
//}
//print(nameMonth)

//bai 6
//var year = 2000
//
//if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 {
//    print("is one year again")
//} else {
//    print("not one year again")
//}


//var number = [1,2,3,4,5,6]
//var number1 = number.map{(number) -> Int in
//    return number*number
//}
//print(number1)


//Bai 5

//let money = 1000
//let baseMoney1 = 2000, baseMoney2 = 1000, baseMoney3 = 500
//
//var remainMoney = money
//var numberOfMoney1 = remainMoney / baseMoney1
//
//remainMoney -= numberOfMoney1 * baseMoney1
//
//var numberOfMoney2 = remainMoney / baseMoney2
//remainMoney -= numberOfMoney2 * baseMoney2
//
//var numberOfMoney3 = remainMoney / baseMoney3
//remainMoney -= numberOfMoney3 * baseMoney3


//var a = 1
//var b = 2
//func toTal(a : Int, b : Int) -> Int{
//    var result = a + b
//    return result
//}
//print(toTal(a: 2, b: 3))

//func exchange(num1: inout Int, num2: inout Int) {
//
////    var temp = num1
////    num1 = num2
////    num2 = temp
//
//    num1 += num2
//    num2 = num1 - num2
//    num1 -= num2
//}
//
//
//var a = 5, b = 2
//
//exchange(num1: &a, num2: &b)
//
//a
//b

//var n = 5
//var x = 1
//for i in 1...n {
//    x *= i
//}
//print(x
//)



//func BCNN(a: Int, b: Int, result: inout Int) {
//    var _result : Int = 0
//    var  i = a > b ? a : b
//    while i <= (a*b) {
//        if i % a == 0 && i % b == 0 {
//            _result = i
//            break
//        }
//        i += 1
//    }
//    result = _result
////    return result
//}
//
//var result: Int = 0
//
//BCNN(a: 20, b: 12, result: &result)
//
////print(giaiThua(a: 4, b: 6))
//
//result

//func findDreamOfNumber (n: Int) -> [Int] {
//    var result = [Int]()
//    for i in 1...n {
//        if n % i == 0 {
//            result.append(i)
//        }
//    }
//    return result
//}
//
//print(findDreamOfNumber(n: 10))


//123
//func toTalNumberN(a: Int) -> Int {
//    var result = 0
////    var dv = a%10
////    var chuc = (a%100)/10
////    var tram = a/100
////    var result = dv + chuc + tram
//
//    var value = a
//    //123
//    while value > 0 {
//        let dv = value % 10
//
//        result = result * 10 + dv //dv = 1
//
//        value = value / 10
//        //1
//    }
//
//
//    return result
//}
//
//print(toTalNumberN(a: 125678))


//nhap vao 1 ngay xuat ra ngay hom qua la ngay may
//func maxDayOf(month: Int) -> Int {
//    var day = 0
//    switch month {
//    case 1,3,5,7,8,10,12:
//        day = 31
//    case 4,6,9,11:
//        day = 30
//    case 2:
//        day = 28
//    default:
//        print("input wrong!")
//    }
//    return day
//}
//func inPutDayvsMonth(day: Int, month: Int) -> Int {
////    var nextDay = day + 1
////    if nextDay > maxDayOf(month: month) {
////        nextDay = 1
////    }
//    var backDay = day - 1
//    if backDay < 1 { backDay = maxDayOf(month: month - 1) }
//    return backDay
////    return nextDay
//}
//print(inPutDayvsMonth(day: 1, month: 3))

//
//func checkingPrimeNumbers(n: Int) -> Bool {

//    if n == 1 { return false }
//    if n == 2 { return true }
//    for i in 2..<n {
//        if n % i == 0 { return false }
//    }
//    return true
//}
//
//
//checkingPrimeNumbers(n: 14)


//tim so chinh phuong
//func findSoChinhPhuong(n: Int){
//    for i in 1...n {
//
//        let can2 = Int(sqrt(Float(i)))
//        if i == can2 * can2 {
//            print("\(i) chinh phuong")
//        } else {
//            print("\(i) not ok")
//        }
//
////        if Int(exactly: sqrt(Float(i))) == nil {
////            print("\(i) sai")
////        } else {
////            print("\(i) dung")
////        }
//    }
//}
//
//findSoChinhPhuong(n: 9)

//tim so doi xung
//func isSymmetric(n: Int) -> Bool {
//    let numStr = "\(n)"
//    for i in 0...(numStr.count / 2) {
//        //1 4-1-1
//        if numStr[i] != numStr[numStr.count - 1 - i] { return false }
//
////        for j in (0...(numStr.count - 1)).reversed() {
////
////        }
//    }
//    return true
//}
//
//isSymmetric(n: 1221)
//
//
//extension StringProtocol {
//    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
//    subscript(range: Range<Int>) -> SubSequence {
//        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
//        return self[startIndex..<index(startIndex, offsetBy: range.count)]
//    }
//    subscript(range: ClosedRange<Int>) -> SubSequence {
//        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
//        return self[startIndex..<index(startIndex, offsetBy: range.count)]
//    }
//    subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
//    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
//    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
//}



//tuc
//func acountToTalNumber(n: Int) -> Int {
//    var result = 0
//    var value = n
//    while value > 0  {
//        var dv = value % 10
//        result += dv
//        value = value / 10
//    }
//    return result
//}
//
//print(acountToTalNumber(n: 123))

//var n = 3
//var result = 0
//for  i in 1...n {
//    result += i * i
//}
//print(result)




//bai 13
//func hamMu(so: Int, square: Int) -> Int {
//    var sum = 1
//    for i in 1...square {
//        sum *= so + 2
//    }
//    return sum
//}
//
//func bai12(x: Int, n: Int) -> Int {
//    var result = 0
//    for i in 1...n {
//        result += hamMu(so: x, square: i)
//    }
//    return result
//}
//print(bai12(x: 2, n: 3))

//func arithmeticMean(_ numbers: Double...) -> Double {
//    var total: Double = 0
//    for number in numbers {
//        total += number
//    }
//    return total / Double(numbers.count)
//}
//arithmeticMean(1, 2, 3, 4, 5)
//// returns 3.0, which is the arithmetic mean of these five numbers
//arithmeticMean(3, 8.25, 18.75)

//protocol FullyNamed {
//    var fullName: String { get }
//}
//
//
//class Starship: FullyNamed {
//    var prefix: String?
//    var name: String
//    init(name: String, prefix: String? = nil) {
//        self.name = name
//        self.prefix = prefix
//    }
//    var fullName: String {
//        return (prefix != nil ? prefix! + " " : "") + name
//    }
//}
//
//var ncc1701 = Starship(name: "Enterprise", prefix: "USS")

//protocol RandomNumberGenerator {
//    func random() -> Double
//}
//
//class LinearCongruentialGenerator: RandomNumberGenerator {
//    var lastRandom = 42.0
//    let m = 139968.0
//    let a = 3877.0
//    let c = 29573.0
//    func random() -> Double {
//        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
//        return lastRandom/m
//    }
//}
//var temp = LinearCongruentialGenerator()
//temp.lastRandom
//temp.random()


//protocol OptionCar {
//    func RunForwar()
//    func Stop()
//    func RunBackwar()
//    func Wash()
//    func Fly()
//    func Swim()
//    func Dance()
//}
//
//class Car : OptionCar {
//    var color : String
//    var gearAuto : Bool
//    var wheel : Int
//    init(color: String, gearAuto: Bool, wheel: Int) {
//         self.color = color
//         self.gearAuto = gearAuto
//         self.wheel = wheel
//    }
//    func RunForwar() {
//        print("Go ahead")
//    }
//    func Stop() {
//        print("Stoped")
//    }
//    func RunBackwar() {
//        print("Go behind")
//    }
//    func Wash() {
//        print("Washing car")
//    }
//    func Fly() {
//        print("Not function")
//    }
//    func Swim() {
//        print("Not function")
//    }
//    func Dance() {
//        print("Will been introduce in 2021")
//    }
//}
//
//var ferrari = Car(color: "Pink", gearAuto: true, wheel: 4)
//ferrari.Dance()
//ferrari.Fly()
//ferrari.Wash()
//ferrari.Swim()
//print(ferrari.color,ferrari.gearAuto,ferrari.wheel)



//var  dogBlack = Dog(name: "My name is Cho Muc", weight: 52)
//dogBlack.kind = "Dog's VietNam"
//print("Information's Dog:\n - \(dogBlack.name),\(dogBlack.weight) kg,\(dogBlack.kind)")
//dogBlack.hello()
//dogBlack.eat()

//var dog = Dog(name: "Cho muc", weight: 50, kind: "Dog's Vietnam")
//dog.eat()
//dog.hello()
//print(dog.name, dog.kind, dog.weight)
//print(dog)

//var mouse = Mouse(name: "", weight: ", color: )

//Bài 2: Tính S(n) = 1^2 + 2^2 + … + n^2

//var n = 5
//var result = 0
//for i in 1...n {
//    result += i*i
//}
//print(result)

//Bài 3: Tính S(n) = 1 + ½ + 1/3 + … + 1/n

//var n = 2
//var result : Double = 0
//for i in 1...n {
//    var mau : Double = 0
//    mau = Double(i)
//    result += 1/mau
//}
//print(result)

//Bài 5: Tính S(n) = 1 + 1/3 + 1/5 + … + 1/(2n + 1)

//var n = 1
//var result = 0.0
//
//for i in 0...n {
//    var mau = Double(i)
//    result += 1/(2*mau + 1)
//}
//print(result)
//var re: Double = 1+1/3

//Bài 6: Tính S(n) = 1/1×2 + 1/2×3 +…+ 1/n x (n + 1)

//var n = 2
//var result = 0.0
//for i in 1...n {
//    var mau = Double(i)
//    result += 1/(mau*(mau + 1))
//}
//
//print(result)
//var re: Double = 1/2 + 1/6

//Bài 7: Tính S(n) = ½ + 2/3 + ¾ + …. + n / n + 1

//var n = 2
//var result = 0.0
//
//for i in 1...n {
//    let so = Double(i)
//    result += so/(so + 1)
//}
//var re : Double = 1/2 + 2/3
//print(result)

//Bài 8: Tính S(n) = ½ + ¾ + 5/6 + … + 2n + 1/ 2n + 2

//var n = 1
//var result : Double = 0.0
//
//for i in 0...n {
//    let tuSo = Double((2*i + 1))
//    let denominator = Double((2*i + 2))
//    result += tuSo/denominator
//}
//var re : Double = 1/2 + 3/4
//print(result)

//Bài 10: Tính T(x, n) = x^n

//func hamMu(x: Int, n : Int) -> Int {
//    var soMu : Int = 1
//    for i in 1...n {
//        soMu *= x
//    }
//    return soMu
//}
//
//var n = 4
//var result = 1
//var x = 2
//result = hamMu(x: x, n: n)
//print(result)

//Bài 11: Tính S(n) = 1 + 1.2 + 1.2.3 + … + 1.2.3….N

//var n = 2
//var result = 0
//
//for i in 1...n {
//    var resultTemp : Int = 1
//    resultTemp *= i
//
//    result += resultTemp
//}
//print(result)


//Bài 12: Tính S(n) = x + x^2 + x^3 + … + x^n


//var result = 0
//var n = 2
//var x = 2
//
//func hamMu(x: Int, n: Int) -> Int {
//    var soMu : Int = 1
//    for i in 1...n {
//        soMu *= x
//    }
//    return soMu
//}
//
//for i in 1...n {
//    result += hamMu(x: x, n: i)
//}
//print(result)

//Bài 13: Tính S(n) = x^2 + x^4 + … + x^2n

//var result = 0
//var n = 3
//var x = 2
//
//func soMu(x : Int, n : Int) -> Int {
//    var resultSomu = 1
//
//    for i in 1...n {
//        resultSomu *= x*x
//    }
//    return resultSomu
//}
//
//for i in 1...n {
//    result += soMu(x: x, n: i)
//}
//print(result)

//Bài 14: Tính S(n) = x + x^3 + x^5 + … + x^2n + 1 //not finished

//var result = 0
//var n = 2
//var x = 2
//func soMu(x : Int, n : Int) -> Int {
//
//      var resultTemp = 1
//
//    for i in 1...n {
//
//        resultTemp *= x*x
//
//    }
//    return resultTemp
//}
//
//for i in 1...n {
//    result += soMu(x: x, n: i)
//}
//print(result)

//Bài 15: Tính S(n) = 1 + 1/1 + 2 + 1/1 + 2 + 3 + ….. + 1/1 + 2 + 3 + …. + N

//var n = 2
//var result = 0
//func hamTong(n: Int) -> Int{
//    var bien = 1/1
//    var resulutTemp = 0
//    for i in 1...n {
//        if i < 2 {
//            bien = 0
//        }
//        resulutTemp += (bien + i)
//    }
//    return resulutTemp
//}
//
//for i in 1...n {
//    result += hamTong(n: i)
//}
//print(result)
//
//var re = 1 + 1 + 2

//Bài 16: Tính S(n) = x + x^2/1 + 2 + x^3/1 + 2 + 3 + … + x^n/1 + 2 + 3 + …. + N

//var re : Double = (2 + (4/3) + (8/6))
//var n = 3
//var x : Double = 2
//var result : Double = 0
//var mu : Double = 1
//var mau : Double = 0
//
//for i in 1...n {
//    var i1 = Double(i)
//    mu *= x
//    mau += i1
//    result += (mu/mau)
//}
//
//
//print(result)

//func hamMu(x : Int, n : Int) -> Int {
//
//    var mu = 1
//    for i in 1...n {
//        mu *= x
//    }
//    return mu
//}
//
//for i in 1...n {
//    var bien = i
//    var tongbien = 0
//    if i < 2 {
//        bien = 0
//    }
//    tongbien += bien
//    result += (hamMu(x: 2, n: i) + tongbien)
//}

//Bài 17: Tính S(n) = x + x^2/2! + x^3/3! + … + x^n/N!

//var re : Double = 2 + (4/2) + (8/6)
//var n = 3
//var x : Double = 2
//var tu : Double = 1
//var mau : Double = 1
//var result : Double = 0
//
//for i in 1...n {
//    var bienTemp : Double = Double(i)
//    tu *= x
//    mau *= bienTemp
//    result += tu/mau
//}
//print(result)

//Bài 18: Tính S(n) = 1 + x^2/2! + x^4/4! + … + x^2n/(2n)! //not

//var re : Double = 1  + (4/2) + (16/24)
//var n = 3
//var x : Double = 2
//var tu : Double = 1
//var mau : Double = 1
//var result : Double = 1
//var mauTam: Double = 1
//
//for i in 1...n {
//    var bienTemp : Double = Double(i)
//    tu *= x*x
//    mauTam = bienTemp * 2
//    mau *= (mauTam * (mauTam - 1))
//    result += tu/mau
//}
//print(result)

//Bài 19: Tính S(n) = 1 + x + x^3/3! + x^5/5! + … + x^(2n+1)/(2n+1)! // not
//var tinh = 6 * 20
//var re : Double = 1  + 2 + (8/6)
//var n = 3
//var x : Double = 2
//var tu : Double = 1
//var mau : Double = 1
//var result : Double = 1 + x
//var mauTam: Double = 1
//
//for i in 1...n {
//    var bienTemp : Double = Double(i)
//    if i == 1  {
//        tu = x*x*x
//    }
//    tu *= x*x
//    mauTam = bienTemp * 2 + 1
//    mau *= (mauTam * (mauTam - 1))
//    result += tu/mau
//}
//print(result)


//Bài 20: Liệt kê tất cả các “ước số” của số nguyên dương n

//var n = 6
//for i in 1...n {
//    if n % i == 0{
//        print(i)
//    }
//}
//Bài 21: Tính tổng tất cả các “ ước số” của số nguyên dương n

//var n = 6
//var total = 0
//for i in 1...n {
//    if n % i == 0{
//        total += i
//    }
//}
//print(total)

//Bài 23: Đếm số lượng “ước số” của số nguyên dương n

//var n = 6
//var list = [Int]()
//for i in 1...n {
//    if n % i == 0{
//        list.append(i)
//    }
//}
//print(list.count)

//Bài 24: Liệt kê tất cả các “ước số lẻ” của số nguyên dương n

//var n = 6
//var list = [Int]()
//for i in 1...n {
//    if n % i == 0{
//        list.append(i)
//    }
//}
//print(list.count)
//
//for item in list {
//    if item % 2 == 1 {
//        print(item)
//    }
//}

//Bài 28: Cho số nguyên dương n. Tính tổng các ước số nhỏ hơn chính nó
//var n = 6
//var total = 0
//var list = [Int]()
//for i in 1...n {
//    if n % i == 0 {
//        list.append(i)
//    }
//}
//
//for item in list {
//    if item != n {
//        total += item
//    }
//}
//print(total)

//Bài 29: Tìm ước số lẻ lớn nhất của số nguyên dương n. Ví dụ n = 100 ước lẻ lớn nhất là 25

//var n = 6
//var total = 0
//var list = [Int]()
//for i in 1...n {
//    if n % i == 0{
//        list.append(i)
//    }
//}
//
//var max = list[0]
//var resuls = 0
//for item in list {
//    if item % 2 == 1 && item > max {
//        resuls = item
//    }
//}
//print(resuls)

//Bài 32: Cho số nguyên dương n. Kiểm tra xem n có phải là số chính phương hay không

//var n : Double = 9
//var conditon = sqrt(n)
//if conditon*conditon == n {
//    print("dung")
//}else {
//    print("k")
//}


//Bài 42: Cho n là số nguyên dương. Hãy tìm giá trị nguyên dương k lớn nhất sao cho S(k)  < n. Trong đó chuỗi k được định nghĩa như sau: S(k) = 1 + 2 + 3 + … + k

//var n = 10
//var total = 0
//var k = 0
//var list = [Int]()
//for i in 1..<n{
//    total += i
//    if total < n {
//        k = total
//        list.append(i)
//    }
//}
////find value max
//var valueMax = list[0]
//var result = 0
//var acount = 0
//for item in list {
//    acount += item
//    if item > valueMax {
//        result = item
//    }
//
//}
//print(result)
////acount total value
//print(acount)


//Bài 49: Cho số nguyên dương n. Hãy tìm chữ số đầu tiên của n
//var n = 1234
//var list = [Int]()
//while n > 0 {
//    var dv = n % 10
//    list.append(dv)
//    n = n/10
//}
//find number first
//for i in 0...list.count - 1 {
//    if i == (list.count - 1) {
//        print(list[i])
//    }
//
//}

//find number reverse
//var reverse = 0
//for i in list {
//    reverse = reverse * 10 + i
//}
//print(reverse)

//checking numberOfSymmetric
//for i in 0..<list.count {
//    if list[0] == list[list.count - 1] - i {
//        print(" \(n) is number of symmetric ")
//    } else {
//        print("not is number of symmetric")
//    }
//    break
//}

// checking n increase
//1234
//var increase = list[0]
//var result = 0
//for i in 1..<list.count {
//    if increase > list[i] {
//        increase = list[i]
//        print("tang dan")
//    } else {
//        print("k phai")
//        break
//    }
//}

//checking number of decrease
//var decrease = list[0]
//for i in 1..<list.count {
//    if decrease < list[i] {
//        print("is one list of number decrease")
//    } else {
//        print("not is one list of number decrease")
//    }
//
//
//}

//Bài 63: Cho 2 số nguyên dương a và b. Hãy tìm bội chung nhỏ nhất của 2 số này

//var a = 4
//var b = 6
//var condition = 1
//var result = 0
//while a > 0 && b > 0 {
//    if condition % a == 0  && condition % b == 0 {
//        result = condition
//        break
//    }
//    condition += 1
//}
//print(result)

//Bài 62: Cho 2 số nguyên dương a và b. Hãy tìm ước chung lớn nhất của 2 số này

//var a = 12
//var b = 30
//var  min = a < b ? a : b
//var result = 0
//var list1 = [Int]()
//var list2 = [Int]()
//
//for i in 1...min {
//    if a % i == 0 {
//        list1.append(i)
//    }
//
//    if b % i == 0 {
//        list2.append(i)
//    }
//}
//for i in 0..<list1.count {
//    result = list1[list1.count - 1]
//}
//
//for j in list2 {
//    print(j)
//}

//Bài 83: Viết chương trình nhập 2 số thực, kiểm tra xem chúng có cùng dấu hay không

//var a : Float = -1.3
//var b : Float = -2.5
//func checkingAandB(a: Float, b: Float) -> Bool {
//    if a > 0 && b > 0 {
//        return true
//    } else if a < 0 && b < 0 {
//        return true
//    } else {
//        return false
//    }
//}
//checkingAandB(a: a, b: b)

//bài 86: Tính S(n) = 1^3 + 2^3 + … + N^3
//var n = 3
//var result = 0
//var soMu = 1
//for i in 1...n {
//    soMu = i*i*i
//    result += soMu
//}
//print(result)

//Bài 87: Tìm số nguyên dương n nhỏ nhất sao cho 1 + 2 + … + n > 10000

//var condition = 1
//var result = 0
//var n = 10000
//while n > 0 {
//    result += condition
//    if result > n {
//        break
//    }
//    condition += 1
//}
//print(result)

//Bài 33: Tính S(n) = CanBac2(2+CanBac2(2+….+CanBac2(2 + CanBac2(2)))) có n dấu căn
//var test = sqrt(2 + sqrt(2))
//var n = 1
//var result: Double = 0
//if n < 1 {
//    n = 1
//}
//for  i  in 1...n {
//    if i == 1 {
//        result = sqrt(2)
//        continue
//    }
//
//    result = sqrt(2 + result)
//}
//print(result)
//Bài 34: Tính S(n) = CanBac2(n+CanBac2(n – 1 + CanBac2( n – 2 + … + CanBac2(2 + CanBac2(1)  có n dấu căn
//var test = sqrt(4 + sqrt(3 + sqrt(2 + sqrt(1))))
//var n = 4
//var result : Double = 0
//if n < 1 {
//    n = 1
//}
//
//for i in 1...n {
//    if i == 1 {
//        result = sqrt(1)
//        continue
//    }
//    result = sqrt(Double(i) + result)
//}
//print(result)
//Bài 36: Tính S(n) = CanBac2(n! + CanBac2((n-1)! +CanBac2((n – 2)! + … + CanBac2(2!) + CanBac2(1!)))) có n dấu căn
//
//var test = sqrt(6 + sqrt(2 + sqrt(1)))
//var n = 3
//var result : Double = 0
//var giaiThua = 1
//if n < 1 {
//    n = 1
//}
//
//for i in 1...n {
//    if i == 1 {
//        result = 1
//        continue
//    }
//    giaiThua *= i
//    result = sqrt(Double(giaiThua) + result)
//}
//print(result)

//Bài 41: Tính S(n) = 1 / (1 + 1 / ( 1 + 1 / (…. 1 + 1 / 1 + 1))) có n dấu phân số

//var n = 2
//var result : Double = 0
//for i in 1...n {
//    if i == 1  {
//        result = 1
//        continue
//    }
//    result = 1/(1 + result)
//}
//print(result)

//Bài 75: Kiểm tra số nguyên 4 byte có dạng 2^k hay không

//var n = 16
//
//var result = 1
//var condition = 1
//if n < 0 {
//    n = 1
//}
//while true {
//    result *= 2
//    if result == n {
//        print("co so 2^k")
//        break
//    } else if result > n {
//        print("k co")
//        break
//    }
//}

//Bài 94: Viết chương trình in ra tất cả các số lẻ nhỏ hơn 100 trừ các số 5, 7, 93

//var n = 100
//var listResult = [Int]()
//for i in stride(from: 1, to: n - 1, by: 2) {
//    if i == 5 || i == 7 || i == 9 {
//        continue
//    }
//    listResult.append(i)
//}
//print(listResult)

//tri tuyet doi
//var a : Float = -3
//var b : Float = 7
//var c : Float = -2
//
//func ttd(_ num: Float) -> Float { return num > 0 ? num : -num }
//var list = [ttd(a) , ttd(b) , ttd(c)]
//print(list)
//

//Bài 96: Viết chương trình nhập giá trị x sau tính giá trị của hàm số
//f(x) = 2x^2 + 5x + 9 khi x >= 5, f(x) = -2x^2 + 4x – 9 khi x < 5
//func f(x: Int) -> Int {
//    return x >= 5 ? 2*x*x + 5*x + 9 : -2*x*x + 4*x - 9
//}

////f(x: 5)

//Bài 111: Viết chương trình in ra tam giác cân có độ cao h
//
//Tam giác cân đặc nằm giữa màn hình
//
//var h = 4
//let maxWidth = h * 2 - 1 //5
//for i in 0..<h {
//    for j in 0..<maxWidth  {
//        if i == h - 1 {
//            print("*", terminator: "")
//        } else {
//            if j == maxWidth - (h - i) || j == (h - i - 1) {
//                       print("*", terminator: "")
//                   } else {
//                       print(" ", terminator: "")
//                   }
//        }
//
//    }
//    print("\n")
//}


//Bai 136: Tìm số chẵn cuối cùng trong mảng 1 chiều các số nguyên. Nếu mảng không có giá trị chẵn thì trả về -1

//
//var listOfNumberIntegrant = [1,5,3,81,9,3, 2,4,1,7]



//func findSochanFinal(arr: [Int]) -> Int {
//    var index = arr.count - 1
//
//    while index >= 0 {
//        if arr[index] % 2 == 0 { return arr[index] }
//        index -= 1
//    }
//    return -1
//}
////
////    var arrNew = arr.filter { number -> Bool in
////        return number % 2 == 0
////    }
////    if arrNew.count < 1  {
////        return -1
////    }
////    return  arrNew[arrNew.count - 1]
//
//findSochanFinal(arr: listOfNumberIntegrant)

//Bài 135: Viết hàm tìm giá trị dương đầu tiên trong mảng 1 chiều các số thực. Nếu mảng không có giá trị dương thì trả về -1

//var arr  = [1,-1,3,7,3,9,4,2,-3,3]
//
//func findNumber(arr: [Int]) -> Int {
//    var index = arr[0]
//    while index >= 0 {
//        if index >= 0 {
//            return index
//        }
//    }
//    return -1
//}
//findNumber(arr: arr)
//Bài 157: Cho mảng 1 chiều các số thực, hãy tìm đoạn [a, b] sao cho đoạn này chứa tất cả các giá trị trong mảng

//var arr = [2,-2,2,-12,2,3,62]
//
//func findRangeAb(arr: [Int]) -> [Int] {
//    var numberMax = arr[0]
//    var numberMin = arr[0]
//
//    for item in arr {
////        if item > numberMax {
////            numberMax = item
////        } else if item < numberMin {
////            numberMin = item
////        }
//        numberMax = item > numberMax ? item : arr[0]
//        numberMin = item < numberMin ? item : arr[0]
//    }
//    return [numberMin , numberMax]
//}
////
////}
////
//findRangeAb(arr: arr)

//Bài 155: Hãy tìm giá trị trong mảng các số thực xa giá trị x nhất

//156
//var arr1 = [1,5,3,6,8,4,9,2]
//
//func findDistance(x: Int, arr: [Int]) -> Int {
//
//    var lenghtArr = arr.count
//    var temp = 0
//    for i in 0..<arr.count {
//        if arr[i] == x {
//            temp = i
//        }
//    }
//    if temp == 0 {
//        return arr[1]
//    } else if temp == lenghtArr - 1 {
//        return arr1[arr1.count - 2]
//    } else {
//        return arr[temp + 1]
//    }
//}
//findDistance(x: 3, arr: arr1)


//Bài 160: Cho mảng 1 chiều các số thực, hãy tìm giá trị âm cuối cùng lớn hơn giá trị -1. Nếu mảng không có giá trị thỏa điều kiện trên thì trả về -1

//var arr = [3,-3,7,3,-5,-1,-2,3,-1,2]
//
//func findValueMinusFinal() -> Int {
//    var lastIndex = arr.count - 1
//    while lastIndex >= 0 {
//        var valueMinus = arr[lastIndex]
//        if valueMinus < 0 && valueMinus < -1{
//            return valueMinus
//        }
//        lastIndex -= 1
//    }
//    return -1
//}
//findValueMinusFinal()

//Bài 161: Cho mảng 1 chiều các số nguyên, hãy tìm giá trị đầu tiên nằm trong khoảng [x, y] cho trước. Nếu mảng không có giá trị thỏa điều kiện trên thì trả về -1

//var arr = [1,5,8,3,7,4,2]
//
//func findValue(x: Int, y: Int) -> Int {
//
//    var valueNew = arr.filter { value -> Bool in
//        return value > x && value < y
//    }.first
//    return valueNew ?? -1
//}
//findValue(x: 3, y: 9)

//Bài 162: Cho mảng 1 chiều các số thực. Hãy viết hàm tìm một vị trí trong mảng thỏa 2 điều kiện: có 2 giá trị lân cận và giá trị tại đó bằng tích 2 giá trị lân cận. Nếu mảng không tồn tại giá trị như vậy thì trả về giá trị -1

//var arr = [1,3,6,2,8,2,2,8,4,2]
//
//
//func findPositionInArr(arr: [Int]) -> [Int] {
//
//    var index = -1
//    var arrNew = [Int]()
//    for i in 1..<arr.count {
//        if i < arr.count - 1 && arr[i] == arr[i + 1] * arr[i - 1] {
//                index = i
//            arrNew.append(index)
//        }
//    }
//    return arrNew
//
//}
//
//findPositionInArr(arr: arr)

//Bài 164: Cho mảng 1 chiều các số nguyên. Hãy tìm giá trị đầu tiên thỏa mãn tính chất số gánh


//Bài 165: Cho mảng 1 chiều các số nguyên. Hãy tìm giá trị đầu tiên có chữ số đầu tiên là chữ số lẻ


//var arr = [26,25,35,25,14,63,6]

//
//func findNumberNotChanIn(arr: [Int]) -> Int {
//    var value = 0
//    
//    for item in arr {
//        var arrNew = [Int]()
//        var itemNew = item
//        while itemNew > 0 {
//            let dv = itemNew % 10
//            arrNew.append(dv)
//            itemNew = itemNew / 10
//        }
//        if arrNew[arrNew.count - 1] % 2 == 1 {
//            value = item
//            break
//        }
//    }
//   
//
//    return value
//    
//}
//
//findNumberNotChanIn(arr: arr)

//Bài 166: Cho mảng 1 chiều các số nguyên. Hãy viết hàm tìm giá trị đầu tiên trong mảng có dạng 2^k. Nếu mảng không có giá trị dạng 2k thì hàm sẽ trả về 0

//var arr = [3,4,16,2,17,7,8,12]
//
//func findValueFrist(k : Int, arr : [Int]) -> Int {
//
//    var value = 1
//
//    var index = 0
//    while index < k {
//        value *= 2
//        index += 1
//    }
//
//    for i in arr {
//        if i == value {
//            return value
//        }
//    }
//    return 0
//}
//
//findValueFrist(k: 4, arr: arr)

//Bài 167: Hãy tìm giá trị thỏa điều kiện toàn chữ số lẻ và là giá trị lớn nhất thỏa điều kiện ấy trong mảng 1 chiều các số nguyên. Nếu mảng không có giá trị thỏa điều kiện trên thì trả về 0


//var arr = [11,4,2,37,377,42,123]
//
//func isAllnumberLe(_ a : Int) -> Bool {
//        var value = a
//
//        while value != 0 {
//            var dv = value % 10
//            if dv % 2 == 0 {
//                return false
//            }
//            value = value / 10
//        }
//    return true
//}
//
//func findNumberLeMax(arr : [Int]) -> Int {
//    var valueMax = 0
//    for item in arr {
//        if isAllnumberLe(item) == true && item > valueMax {
//            valueMax = item
//        }
//    }
//    return valueMax
//}
//
//findNumberLeMax(arr: arr)

//Bài 173 (*): Cho mảng 1 chiều các số nguyên. Hãy viết hàm tìm chữ số xuất hiện ít nhất trong mảng

let arr = [1,4,1,2,6,64,3,4]
var arrNew = [Int]()


func tachChuSoInArr() {
    for item in arr {
        var itemNew = item
        while item > 0 {
            var chuSo = itemNew % 10
            arrNew[chuSo] += 1
            itemNew = itemNew / 10
        }
    }
}

func findNumberAppearLeast() -> Int {
    var chuSoMin = arr[0] % 10
    var index = 10
    for  i in 0..<index {
        if arrNew[i] != 0 {
            chuSoMin = (arrNew[chuSoMin] < arrNew[i]) ? chuSoMin : i
        }
    }
    return chuSoMin
}


















