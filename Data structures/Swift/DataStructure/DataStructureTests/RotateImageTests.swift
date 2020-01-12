//
//  RotateImageTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/08.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class RotateImageTests: XCTestCase {
    func test1() {
        var matrix = [[1,2,3],
                      [4,5,6],
                      [7,8,9]]
        RotateImage().rotate(&matrix)
        XCTAssertEqual(matrix,[
          [7,4,1],
          [8,5,2],
          [9,6,3]
        ])
    }

    func test2() {
        var matrix = [
          [ 5, 1, 9,11],
          [ 2, 4, 8,10],
          [13, 3, 6, 7],
          [15,14,12,16]
        ]
        RotateImage().rotate(&matrix)
        XCTAssertEqual(matrix,[
          [15,13, 2, 5],
          [14, 3, 4, 1],
          [12, 6, 8, 9],
          [16, 7,10,11]
        ])
    }
}
