//
//  ReconstructionTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/15.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class ReconstructionTests: XCTestCase {
    func test1() {
        XCTAssertEqual(Reconstruction().sequenceReconstruction([1,2,3], [[1,2],[1,3],[2,3]]), true)
    }

    func test2() {
        XCTAssertEqual(Reconstruction().sequenceReconstruction([1], []), false)
    }

    func test3() {
        XCTAssertEqual(Reconstruction().sequenceReconstruction([1], [[],[]]), false)
    }

    func test4() {
        XCTAssertEqual(Reconstruction().sequenceReconstruction([1], [[1],[1],[1]]), true)
    }
}
