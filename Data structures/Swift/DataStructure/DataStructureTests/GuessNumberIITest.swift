//
//  GuessNumberIITest.swift
//  DataStructureTests
//
//  Created by Dinh, Nhat | Nate | MPB on 2019/12/23.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class GuessNumberIITest: XCTestCase {
    func test1() {
        XCTAssertEqual(GuessNumberII().getMoneyAmount(1), 0)
        XCTAssertEqual(GuessNumberII().getMoneyAmount(2), 1)
        XCTAssertEqual(GuessNumberII().getMoneyAmount(3), 2)
        XCTAssertEqual(GuessNumberII().getMoneyAmount(4), 4)
        XCTAssertEqual(GuessNumberII().getMoneyAmount(6), 8)
    }
}
