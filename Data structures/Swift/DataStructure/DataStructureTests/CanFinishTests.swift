//
//  CanFinishTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/08.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class CanFinishTests: XCTestCase {
    func test1() {
        XCTAssertEqual(CanFinish().canFinish(4, [[2,0],[1,0],[3,1],[3,2],[1,3]]), false)
    }
}
