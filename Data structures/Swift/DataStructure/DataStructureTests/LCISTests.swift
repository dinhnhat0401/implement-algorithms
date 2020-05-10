//
//  LCISTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/05/10.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class LCISTests: XCTestCase {
    func test1() {
        XCTAssertEqual(LCIS().findLengthOfLCIS([1, 3, 5, 4, 7, 8, 9, 10]), 5)
    }
}
