//
//  SubsequenceTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2019/12/26.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class SubsequenceTests: XCTestCase {
    func test1() {
        XCTAssertEqual(Subsequence().isSubsequence("abdc", "ahbgcd"), false)
    }
}
