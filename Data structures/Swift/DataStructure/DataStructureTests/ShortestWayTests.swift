//
//  ShortestWayTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2019/12/30.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class ShortestWayTests: XCTestCase {
    func test1() {
        XCTAssertEqual(ShortestWay().shortestWay("abc", "abcbc"), 2)
    }

    func test2() {
        XCTAssertEqual(ShortestWay().shortestWay("xyz", "xzyxz"), 3)
    }
}
