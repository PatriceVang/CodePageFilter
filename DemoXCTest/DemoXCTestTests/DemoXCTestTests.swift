//
//  DemoXCTestTests.swift
//  DemoXCTestTests
//
//  Created by Apple on 9/14/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import XCTest
@testable import DemoXCTest

class DemoXCTestTests: XCTestCase {

    func testSquareInt() {
        let value = 3
        let square = value.square()
        XCTAssertEqual(square, 9)
    }
    
    func testHelloWord() {
        var hello: String?
        XCTAssertNil(hello)
        hello = "hello"
        XCTAssertEqual(hello, "hello")
    }
    
    func testSoChan() {
        let value = 3
        let result = value.checkNumberChan()
        let condition: ResultNumber = .sole
        
        XCTAssertEqual(result, condition)
    }

}
