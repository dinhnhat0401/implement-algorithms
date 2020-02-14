//
//  NetworkDelayTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/14.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class NetworkDelayTests: XCTestCase {
    func test1() {
        XCTAssertEqual(NetworkDelay().networkDelayTime([[2,1,1],[2,3,1],[3,4,1]], 4, 2), 2)
    }
}
