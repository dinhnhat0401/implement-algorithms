//
//  RedundantConnectionTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/15.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class RedundantConnectionTests: XCTestCase {
    func test1() {
        XCTAssertEqual(RedundantConnection().findRedundantConnection([[1,2], [1,3], [2,3]]), [2, 3])
    }

    func test2() {
        XCTAssertEqual(RedundantConnection().findRedundantConnection([[1,3],[3,4],[1,5],[3,5],[2,3]]), [3, 5])
    }
}
