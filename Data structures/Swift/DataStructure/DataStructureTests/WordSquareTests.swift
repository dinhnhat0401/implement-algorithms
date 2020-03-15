//
//  WordSquareTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/03/11.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class WordSquareTests: XCTestCase {
    func test1() {
        XCTAssertEqual(WordSquare().wordSquares(["area","lead","wall","lady","ball"]), [["ball","area","lead","lady"],["wall","area","lead","lady"]])}

    func test2() {
        XCTAssertEqual(WordSquare().wordSquares(["abat","baba","atan","atal"]), [["baba","abat","baba","atal"],["baba","abat","baba","atan"]])
    }

    func test3() {
        XCTAssertEqual(WordSquare().wordSquares(["a"]), [["a"]])
    }

    func test4() {
        XCTAssertEqual(WordSquare().wordSquares(["aa","bb"]), [["aa","aa"],["bb","bb"]])
    }

    func test5() {
        XCTAssertEqual(WordSquare().wordSquares(["momy","oooo","yoyo"]), [])
    }
}
