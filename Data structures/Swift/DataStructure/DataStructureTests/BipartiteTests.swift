//
//  BipartiteTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/15.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class BipartiteTests: XCTestCase {
    func test1() {
        XCTAssertEqual(Bipartite().isBipartite([[1,2,3], [0,2], [0,1,3], [0,2]]), false)
    }
}
