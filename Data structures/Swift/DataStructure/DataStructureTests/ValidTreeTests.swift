//
//  ValidTreeTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/12.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class ValidTreeTests: XCTestCase {
    func test1() {
        XCTAssertEqual(ValidTree().validTree(3, [[2,1],[1,0],[0,2]]), false)
    }
}
