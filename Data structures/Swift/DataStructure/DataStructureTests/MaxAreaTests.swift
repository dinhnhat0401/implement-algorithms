//
//  MaxAreaTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/03.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class MaxAreaTests: XCTestCase {
    func test1() {
        XCTAssertEqual(MaxArea().maxArea([1,8,6,2,5,4,8,3,7]), 49)
    }
}
