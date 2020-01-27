//
//  FindCityWithSmallestNumberOfNeighborsTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/27.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class FindCityWithSmallestNumberOfNeighborsTests: XCTestCase {
    func test1() {
        XCTAssertEqual(FindCityWithSmallestNumberOfNeighbors().findTheCity(5,[[0,1,2],[0,4,8],[1,2,3],[1,4,2],[2,3,1],[3,4,1]]
, 2), 0)
    }

    func test2() {
        XCTAssertEqual(FindCityWithSmallestNumberOfNeighbors().findTheCity2(5,[[0,1,2],[0,4,8],[1,2,3],[1,4,2],[2,3,1],[3,4,1]]
, 2), 0)
    }
}
