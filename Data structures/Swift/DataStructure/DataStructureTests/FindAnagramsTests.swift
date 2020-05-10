//
//  FindAnagramsTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/05/06.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class FindAnagramsTests: XCTestCase {
    func test1() {
        XCTAssertEqual(FindAnagrams().findAnagrams("cbaebabacd", "abc"), [0, 6])
    }

    func test2() {
        XCTAssertEqual(FindAnagrams().findAnagrams("baa", "aa"), [1])
    }

    func test3() {
        XCTAssertEqual(FindAnagrams().findAnagrams("acdcaeccde", "c"), [1, 3, 6,7])
    }
}
