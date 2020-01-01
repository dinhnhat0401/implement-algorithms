//
//  NextPermutationTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2019/12/30.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class NextPermutationTests: XCTestCase {
    func test1() {
        var nums = [1,2,5,3,4]
        NextPermutation().nextPermutation(&nums)
        XCTAssertEqual(nums, [1,2,5,4,3])
    }

    func test2() {
        var nums = [1,5,1]
        NextPermutation().nextPermutation(&nums)
        XCTAssertEqual(nums, [5, 1, 1])
    }

    func test3() {
        var nums = [5, 1, 1]
        NextPermutation().nextPermutation(&nums)
        XCTAssertEqual(nums, [1, 1, 5])
    }

    func test4() {
        var nums = [3, 2, 1]
        NextPermutation().nextPermutation(&nums)
        XCTAssertEqual(nums, [1, 2, 3])
    }
}
