//
//  SearchMatrixTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/03/15.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class SearchMatrixTests: XCTestCase {
    func test1() {
        XCTAssertEqual(SearchMatrix().searchMatrix([[1, 1]], 2), false)
    }
}
