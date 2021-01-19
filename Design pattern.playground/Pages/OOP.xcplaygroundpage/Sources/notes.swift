import Foundation



///express: 3, true, a == 3
///statement: a = 3; call();

//khai bao bien closure
//var handlePrimeNum: (Bool) -> Void = {
//
//}
//closure
//func treamentResult(_ a: Int) -> Bool {
//    if a % 2 == 0 {
//        return true
//    } else {
//        return false
//    }
//}
//
//func checkingIsEvenNumber(number: Int,fun: (Int) -> Bool){
//    let result = treamentResult(number)
//    if result {
//        print("\(number) la so chan")
//    } else {
//        print("\(number) la so le")
//    }
//}
//checkingIsEvenNumber(number: 6, fun:  treamentResult)



///filter: Giam so luong phan tu di, ko khac kieu
///map: Giu nguyen so luong phan tu, nhung co the khac kieu
///reduce: Chi tra ve 1 gia tri khi duyet tat ca cac phan tu

///REDUCE

//var arr = [1,2,5,3,5,6,7]
//print(
//        arr
//        .reduce(0) { preResult, newItem in
//            return preResult + (newItem % 2 == 0 ? newItem : 0)
//        }
//)

//var sum = arr.reduce(0) { preResult, newElement in
//    var isChan = newElement % 2 != 0
//    return preResult + (isChan ? 1 : 0)
//}
//
//print(sum)

//Bài 109: Viết chương trình in bảng cửu chương ra màn hình

//func releaseMultiplicationTable(x: Int) -> String {
////    var result = ""
////    for i in 1...9 {
////         result += textOfMultiple(x1: x, x2: i) + "\n"
////    }
////    return result
//
//    return (1...9).reduce("", { $0 + textOfMultiple(x1: x, x2: $1) + "\n" })
//}
//func textOfMultiple(x1: Int, x2: Int) -> String {
//    return "\(x1) x \(x2) = \(x1 * x2)"
//}
////print(releaseMultiplicationTable(x: 2))
//
//for i in 2...9 {
//    var temp = ""
//    temp += releaseMultiplicationTable(x: i)
//    print(temp)
//}


////////////////MAP
//var newArr = arr.map { num in
////    return "So la \(num)"
//    return num + 2
//}
//
//print(newArr)


//reduce instead of filter
//var arr = [1,3,9,11,3,3,3,61]
//
//print(
//
//    arr.reduce([], { preResult, item in
//        return preResult + (item % 2 == 0 ? [item] : [])
//    })
//
//)


///
//reduce instead of map

//print(
//
//    arr.reduce([], { preResult, item in
//        return preResult + ["\(item)"]
//    })
//
//)


