//
//  KthLargestElementInArrayTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/26.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class KthLargestElementInArrayTests: XCTestCase {
    func test1() {
        XCTAssertEqual(KthLargestElementInArray().findKthLargest([3, 2, 1, 5, 6, 4], 2), 5)
    }

    func test2() {
        XCTAssertEqual(KthLargestElementInArray().findKthLargest([3,2,3,1,2,4,5,5,6], 4), 4)
    }

    func test3() {
        XCTAssertEqual(KthLargestElementInArray().findKthLargest([-1, -1], 2), -1)
    }
}
