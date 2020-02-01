//
//  MinWindowTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/01.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class MinWindowTests: XCTestCase {
    func test1() {
        XCTAssertEqual(MinWindow().minWindow("ADOBECODEBANC", "ABC"), "BANC")
    }

    func test2() {
        XCTAssertEqual(MinWindow().minWindow("aa", "aa"), "aa")
    }
}
