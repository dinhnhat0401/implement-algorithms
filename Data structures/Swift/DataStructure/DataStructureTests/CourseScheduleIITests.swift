//
//  CourseScheduleIITests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/23.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest

class CourseScheduleIITests: XCTestCase {
    func test1() {
        XCTAssertEqual(CourseScheduleII().findOrder(2, [[1, 0]]), [0, 1])
    }

    func test2() {
        XCTAssertEqual(CourseScheduleII().findOrder(4, [[1,0],[2,0],[3,1],[3,2]]), [0, 1, 2, 3])
    }

    func test3() {
        XCTAssertEqual(CourseScheduleII().findOrder(2, [[0,1],[1,0]]), [])
    }
}
