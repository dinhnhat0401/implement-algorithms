//
//  MinStackTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/24.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class MinStackTests: XCTestCase {
    func test1() {
        let s = MinStack()
        s.push(-2)
        s.push(0)
        s.push(-3)
        XCTAssertEqual(s.getMin(), -3)
        s.pop()
        XCTAssertEqual(s.top(), 0)
        XCTAssertEqual(s.getMin(), -2)
    }
}
