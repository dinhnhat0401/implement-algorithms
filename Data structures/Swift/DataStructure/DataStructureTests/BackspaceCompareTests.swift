//
//  BackspaceCompareTests.swift
//  DataStructureTests
//
//  Created by Dinh, Nhat | Nate | MPB on 2020/01/17.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class BackspaceCompareTests: XCTestCase {
    func test1() {
        XCTAssertEqual(BackspaceCompare().backspaceCompare("#AB##", "C###D#"), true)
    }

    func test2() {
        XCTAssertEqual(BackspaceCompare().backspaceCompare("ABC#", "##AB"), true)
    }

    func test3() {
        XCTAssertEqual(BackspaceCompare().backspaceCompare("AB", "AC"), false)
    }

    func test4() {
        XCTAssertEqual(BackspaceCompare().backspaceCompare("AB#", "AC#"), true)
    }

    func test5() {
        XCTAssertEqual(BackspaceCompare().backspaceCompare("AB#DE#", "AC#DD#"), true)
    }
}
