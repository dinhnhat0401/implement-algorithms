//
//  KnightProbability.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/02.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class KnightProbabilityTests: XCTestCase {
    func test1() {
        XCTAssertEqual(KnightProbability().knightProbability2(3, 2, 0, 0), 0.0625)
    }
}
