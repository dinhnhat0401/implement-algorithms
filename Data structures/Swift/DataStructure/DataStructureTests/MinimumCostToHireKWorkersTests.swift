//
//  MinimumCostToHireKWorkersTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/25.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class MinimumCostToHireKWorkersTest: XCTestCase {
    func test1() {
        XCTAssertEqual(MinimumCostToHireKWorkers().mincostToHireWorkers([10, 20, 5], [70, 50, 30], 2), 105)
    }

    func test2() {        XCTAssertEqual((MinimumCostToHireKWorkers().mincostToHireWorkers([3,1,10,10,1], [4,8,2,2,7], 3) * 100000.0).rounded() / 100000.0, 30.66667)
    }
}
