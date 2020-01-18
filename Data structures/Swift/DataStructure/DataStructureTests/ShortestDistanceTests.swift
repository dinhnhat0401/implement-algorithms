//
//  ShortestDistanceTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/19.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest

class ShortestDistanceTests: XCTestCase {
    func test1() {
        XCTAssertEqual(ShortestDistance().shortestDistance([[0,0,1,0,0],[0,0,0,0,0],[0,0,0,1,0],[1,1,0,1,1],[0,0,0,0,0]], [0,4], [4,4]), 12)
    }

    func test2() {
        XCTAssertEqual(ShortestDistance().shortestDistance([[0,0,1,0,0],[0,0,0,0,0],[0,0,0,1,0],[1,1,0,1,1],[0,0,0,0,0]], [0,4], [3,2]), -1)
    }

    func test3() {
        XCTAssertEqual(ShortestDistance().shortestDistance2([[0,0,1,0,0],[0,0,0,0,0],[0,0,0,1,0],[1,1,0,1,1],[0,0,0,0,0]], [0,4], [4,4]), 12)
    }

    func test4() {
        XCTAssertEqual(ShortestDistance().shortestDistance2([[0,0,1,0,0],[0,0,0,0,0],[0,0,0,1,0],[1,1,0,1,1],[0,0,0,0,0]], [0,4], [3,2]), -1)
    }

    func test5() {
        XCTAssertEqual(ShortestDistance().shortestDistance2([[0,0,0,0,1,0,0],[0,0,1,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,1],[0,1,0,0,0,0,0],[0,0,0,1,0,0,0],[0,0,0,0,0,0,0],[0,0,1,0,0,0,1],[0,0,0,0,1,0,0]], [0,0], [8,6]), -1)
    }
}
