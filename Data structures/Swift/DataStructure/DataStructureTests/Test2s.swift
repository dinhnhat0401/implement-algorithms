//
//  Test2s.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/25.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class Test2s: XCTestCase {
    func test1() {
        var A = [4, 2, 2, 4, 2]
        XCTAssertEqual(Test2().solution(&A), 5)
    }

    func test2() {
        var A = [1, 2, 3, 2]
        XCTAssertEqual(Test2().solution(&A), 3)
    }

    func test3() {
        var A = [0, 5, 4, 4, 5, 12]
        XCTAssertEqual(Test2().solution(&A), 4)
    }
}
