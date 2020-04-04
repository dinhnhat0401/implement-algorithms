//
//  LC126Tests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/04/04.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class LC126Tests: XCTestCase {
    func test1() {
        XCTAssertEqual(LC126().findLadders("hit", "cog", ["hot","dot","dog","lot","log","cog"]), [["hit","hot","dot","dog","cog"],["hit","hot","lot","log","cog"]])
    }

    func test2() {
        XCTAssertEqual(LC126().findLadders("a", "c", ["a","b","c"]), [["a","c"]])
    }

    func test3() {
        XCTAssertEqual(LC126().findLadders("red", "tax", ["ted","tex","red","tax","tad","den","rex","pee"]), [["red","ted","tad","tax"],["red","ted","tex","tax"],["red","rex","tex","tax"]])
    }
}
