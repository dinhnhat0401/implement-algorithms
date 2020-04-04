//
//  LC191Tests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/03/23.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class LC191Tests: XCTestCase {
    func test1() {
        XCTAssertEqual(LC191().hammingWeight(00000000000000000000000000001011), 3)
    }
}
