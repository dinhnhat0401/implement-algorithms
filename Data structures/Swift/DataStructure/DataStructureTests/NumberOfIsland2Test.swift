//
//  NumberOfIsland2Test.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2019/12/22.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class NumberOfIsland2Test: XCTestCase {
    func test() {
        XCTAssertEqual(NumberOfIslands2().numIslands22(3, 3, [[0, 0], [0, 1], [1, 2], [1, 2]]), [1, 1, 2, 2])
    }
}
