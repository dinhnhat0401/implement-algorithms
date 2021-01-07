//
//  Jan7Tests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2021/01/08.
//  Copyright © 2021 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class Jan7Tests: XCTestCase {
    func test1() {
        XCTAssertEqual(Jan7().lengthOfLongestSubstring("abcde"), 5)
    }
}
