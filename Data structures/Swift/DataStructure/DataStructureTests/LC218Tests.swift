//
//  LC218Tests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/03/02.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class LC218Tests: XCTestCase {
    func test1() {
        XCTAssertEqual(LC218().getSkyline([[2,9,10],[3,7,15],[5,12,12],[15,20,10],[19,24,8]]), [[2,10],[3,15],[7,12],[12,0],[15,10],[20,8],[24,0]])
    }
}
