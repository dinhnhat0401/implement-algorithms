//
//  LC418Tests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/27.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class LC418Tests: XCTestCase {
    func test1() {
        XCTAssertEqual(LC418().wordsTyping(["hello","world"], 2, 8), 1)
    }
}
