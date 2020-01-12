//
//  DuplicateZerosTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/09.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class DuplicateZerosTests: XCTestCase {
    func test1() {
        var arr = [1, 9, 0, 0, 1, 0, 2]
        DuplicateZeros().duplicateZeros(&arr)
    }
}
