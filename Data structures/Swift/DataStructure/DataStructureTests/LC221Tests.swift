//
//  LC221Tests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/03/01.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class LC221Tests: XCTestCase {
    func test1() {
        XCTAssertEqual(LC221().maximalSquare([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]), 4)
    }
}
