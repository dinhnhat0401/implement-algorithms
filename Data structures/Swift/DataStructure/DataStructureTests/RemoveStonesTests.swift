//
//  RemoveStonesTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/07.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class RemoveStonesTests: XCTestCase {
    func test1() {
        XCTAssertEqual(RemoveStones().removeStones([[0,0],[0,2],[1,1],[2,0],[2,2]]
), 3)
    }

    func test2() {
            XCTAssertEqual(RemoveStones().removeStones([[0,0],[0,1],[1,0],[1,2],[2,1],[2,2]]), 5)
        }
}
