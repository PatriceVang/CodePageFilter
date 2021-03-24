//: [Previous](@previous)

import Foundation

//Semophore

//let semophore = DispatchSemaphore(value: 1)
//
//let queue = DispatchQueue(label: "1")
//let queue2 = DispatchQueue(label: "2")
//
//semophore.wait()
//for i in 0...10 {
//    queue.async {
//        print("i \(i)")
//    }
//
//    queue2.async {
//        print("j \(i)")
//    }
//
//}
//semophore.signal()

func testResult<T>(agru: T,success:  @escaping(Result<T, Error>) -> Void) {
    if let t = agru as? Int, t == 10 {
        success(.success(t as! T))
    } else{
        success(.failure("" as! Error))
    }
}

testResult(agru: 10) { (result) in
    switch result {
    case .success(10):
        print(10)
    case .failure(let error):
        print(error.localizedDescription)
    default: print("dEdaul")
    }
}

