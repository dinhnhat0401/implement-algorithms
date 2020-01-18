//
//  MonarchyImplementationTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/18.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class MonarchyImplementationTests: XCTestCase {
    private var mi = MonarchyImplementation()

    override func setUp() {
        mi.birth("Alex", "Bob")
        mi.birth("Andy", "King")
        mi.birth("Bob", "King")
        mi.birth("Catherine", "King")
        mi.birth("Matthew", "Andy")
        mi.birth("Asher", "Bob")
    }
    func test1() {
        XCTAssertEqual(mi.getOrderOfSuccession(), ["King", "Andy", "Matthew", "Bob", "Alex", "Asher", "Catherine"])
    }

    func test2() {
        mi.death("King")
        XCTAssertEqual(mi.getOrderOfSuccession(), ["Andy", "Matthew", "Bob", "Alex", "Asher", "Catherine"])
    }

    func test3() {
        mi.death("King")
        mi.death("Andy")
        XCTAssertEqual(mi.getOrderOfSuccession(), ["Matthew", "Bob", "Alex", "Asher", "Catherine"])
    }

    func test4() {
        mi.birth("AndyII", "Andy")
        XCTAssertEqual(mi.getOrderOfSuccession(), ["King", "Andy", "Matthew", "AndyII", "Bob", "Alex", "Asher", "Catherine"])
    }
}
