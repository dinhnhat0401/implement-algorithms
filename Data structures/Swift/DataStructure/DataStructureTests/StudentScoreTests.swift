//
//  StudentScoreTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2019/12/27.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class StudentScoreTests: XCTestCase {
    func test1() {
        XCTAssertEqual(StudentScore().highFive([[1,91],[1,92],[2,93],[2,97],[1,60],[2,77],[1,65],[1,87],[1,100],[2,100],[2,76]]), [[1,87],[2,88]])
    }
}
