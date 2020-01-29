//
//  MinDistanceTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/01.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class MinDistanceTests: XCTestCase {
    func test1() {
        XCTAssertEqual(MinDistance().minDistance("horse", "ros"), 3)
        XCTAssertEqual(MinDistance().minDistance("intention", "execution"), 5)
    }
}
