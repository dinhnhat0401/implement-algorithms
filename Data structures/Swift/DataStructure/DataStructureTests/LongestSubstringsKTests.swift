//
//  LongestSubstringsKTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/12.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class LongestSubstringsKTests: XCTestCase {
    func test1() {
        XCTAssertEqual(LongestSubstringsK().lengthOfLongestSubstringTwoDistinct("eceba"), 3)
    }
    func test2() {
        XCTAssertEqual(LongestSubstringsK().lengthOfLongestSubstringTwoDistinct("ccaabbb"), 5)
    }
}
