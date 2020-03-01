//
//  EvaluateDivisionTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/06.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class EvaluateDivisionTests: XCTestCase {
    func test1() {
        XCTAssertEqual(EvaluateDivision().calcEquation([ ["a", "b"], ["b", "c"] ], [2.0, 3.0], [ ["a", "c"], ["b", "a"], ["a", "e"], ["a", "a"], ["x", "x"] ]), [6.0, 0.5, -1.0, 1.0, -1.0 ])
    }

    func test2() {
        XCTAssertEqual(EvaluateDivision().calcEquation([["a","b"],["c","d"]], [1.0,1.0], [["a","c"],["b","d"],["b","a"],["d","c"]]), [-1.0, -1.0, 1.0, 1.0])
    }

    func test3() {
        XCTAssertEqual(EvaluateDivision().calcEquation2([ ["a", "b"], ["b", "c"] ], [2.0, 3.0], [ ["a", "c"], ["b", "a"], ["a", "e"], ["a", "a"], ["x", "x"] ]), [6.0, 0.5, -1.0, 1.0, -1.0 ])
    }

    func test4() {
        XCTAssertEqual(EvaluateDivision().calcEquation2([["a","b"],["c","d"]], [1.0,1.0], [["a","c"],["b","d"],["b","a"],["d","c"]]), [-1.0, -1.0, 1.0, 1.0])
    }
}
