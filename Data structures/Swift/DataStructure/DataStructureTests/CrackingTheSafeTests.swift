//
//  CrackingTheSafeTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/19.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class CrackingTheSafeTests: XCTestCase {
    func test1() {
        XCTAssertEqual(CrackingTheSafe().crackSafe(2, 3), "0221120100")
    }

    func test2() {
        XCTAssertEqual(CrackingTheSafe().crackSafe(1, 1), "01")
    }

    func test3() {
        XCTAssertEqual(CrackingTheSafe().crackSafe(2, 2), "01100")
    }
}
