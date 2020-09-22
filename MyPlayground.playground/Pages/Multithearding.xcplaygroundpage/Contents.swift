//: [Previous](@previous)

import Foundation




let dispatch = DispatchGroup()
var arrStr = [String]()

dispatch.enter()

func times1() {
    print("1")
}

dispatch.leave()


dispatch.enter()
func times2() {
    print("2")
}

dispatch.leave()


dispatch.enter()
func times3() {
    print("3")
}

dispatch.leave()


dispatch.notify(queue: .main) {
    print("finish")
}
