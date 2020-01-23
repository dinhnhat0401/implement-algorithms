//
//  SplitArrayLargestSumTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/20.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class SplitArrayLargestSumTests: XCTestCase {
    func test1() {
        XCTAssertEqual(SplitArrayLargestSum().splitArray([7,2,5,10,8], 2), 18)
    }
}
