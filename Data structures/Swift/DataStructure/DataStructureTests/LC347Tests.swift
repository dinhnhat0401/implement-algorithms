//
//  LC347Tests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/03/09.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class LC347Tests: XCTestCase {
    func test1() {
        XCTAssertEqual(LC347().topKFrequent([1,1,1,2,2,3], 2), [1, 2])
    }
}
