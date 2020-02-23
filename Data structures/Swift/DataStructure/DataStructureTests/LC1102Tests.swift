//
//  LC1102Tests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/23.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class LC1102Tests: XCTestCase {
    func test1() {
        XCTAssertEqual(LC1102().maximumMinimumPath([[5,4,5],[1,2,6],[7,4,6]]), 4)
    }

    func test2() {
        XCTAssertEqual(LC1102().maximumMinimumPath([[3,4,6,3,4],[0,2,1,1,7],[8,8,3,2,7],[3,2,4,9,8],[4,1,2,0,0],[4,6,5,4,3]]), 3)
    }
}
