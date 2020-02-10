//
//  SubArraysTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/08.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class SubArraysTests: XCTestCase {
    func test1() {
        XCTAssertEqual(SubArrays().numOfSubarrays([11,13,17,23,29,31,7,5,2,3], 3, 5), 6)
    }
}
