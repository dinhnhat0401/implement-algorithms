//
//  RegionsBySlashesTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/13.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class RegionsBySlashesTests: XCTestCase {
    func test1() {
        XCTAssertEqual(RegionBySlashes().regionsBySlashes([" /","/ "]), 2)
    }
}
