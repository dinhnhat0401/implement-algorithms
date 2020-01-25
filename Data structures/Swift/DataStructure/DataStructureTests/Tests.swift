//
//  Tests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/25.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class Tests: XCTestCase {
    func test1() {
        var A = [1, 4, 7, 3, 3, 5]
        Test().solution(&A)
    }
}
