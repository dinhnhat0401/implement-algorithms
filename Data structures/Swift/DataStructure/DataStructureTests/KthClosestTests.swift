//
//  KthClosestTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/02.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class KthClosestTests: XCTestCase {
    func test1() {
        XCTAssertEqual(KthClosest().kClosest([[1,3],[-2,2]], 1), [[-2, 2]])
    }

    func test2() {
        XCTAssertEqual(KthClosest().kClosest([[3,3],[5,-1],[-2,4]], 2), [[3,3],[-2,4]])
    }

    func test3() {
        XCTAssertEqual(KthClosest().kClosest([[0,1],[1,0]], 2), [[0,1],[1,0]])

    }
}
