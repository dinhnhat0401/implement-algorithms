//
//  MinDifficultyTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/28.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class MinDifficultyTests: XCTestCase {
    func test1() {
        XCTAssertEqual(MinDifficulty().minDifficulty([6,5,4,3,2,1], 2), 7)
    }

    func test2() {
        XCTAssertEqual(MinDifficulty().minDifficulty([9,9,9], 4), -1)
    }

    func test3() {
        XCTAssertEqual(MinDifficulty().minDifficulty([1,1,1], 3), 3)
    }

    func test4() {
        XCTAssertEqual(MinDifficulty().minDifficulty([7,1,7,1,7,1], 3), 15)
    }

    func test5() {
        XCTAssertEqual(MinDifficulty().minDifficulty([11,111,22,222,33,333,44,444], 6), 843)
    }

    func test6() {
        XCTAssertEqual(MinDifficulty().minDifficulty1([6,5,4,3,2,1], 2), 7)
    }

    func test7() {
        XCTAssertEqual(MinDifficulty().minDifficulty1([9,9,9], 4), -1)
    }

    func test8() {
        XCTAssertEqual(MinDifficulty().minDifficulty1([1,1,1], 3), 3)
    }

    func test9() {
        XCTAssertEqual(MinDifficulty().minDifficulty1([7,1,7,1,7,1], 3), 15)
    }

    func test10() {
        XCTAssertEqual(MinDifficulty().minDifficulty1([11,111,22,222,33,333,44,444], 6), 843)
    }
}
