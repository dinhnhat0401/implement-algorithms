//
//  GetWordsTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/03/05.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class GetWordsTests: XCTestCase {
    func test1() {
        XCTAssertEqual(GetWords().expand("{a,b}c{d,e}f"), ["acdf","acef","bcdf","bcef"])
    }

    func test2() {
        XCTAssertEqual(GetWords().expand("{a,b}{z,x,y}"), ["ax","ay","az","bx","by","bz"])
    }
}
