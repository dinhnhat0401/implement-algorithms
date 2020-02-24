//
//  LRUCacheTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/23.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class LRUCacheTests: XCTestCase {
    func test1() {
        let cache = LRUCache(2)
        cache.put(1, 1)
        cache.put(2, 2)
        cache.get(1)
        cache.put(3, 3)
        XCTAssertEqual(cache.get(2), -1)
    }

    func test2() {
        let cache = LRUCache(1)
        cache.put(2, 1)
        cache.get(2)
        cache.put(3, 2)
        cache.get(2)
        cache.get(3)
        XCTAssertEqual(cache.get(2), -1)
    }

    func test3() {
//        ["LRUCache","put","put","put","put","get","get","get","get","put","get","get","get","get","get"]
//        [[3],[1,1],[2,2],[3,3],[4,4],[4],[3],[2],[1],[5,5],[1],[2],[3],[4],[5]]
        let cache = LRUCache(3)
        cache.put(1, 1)
        cache.put(2, 2)
        cache.put(3, 3)
        cache.put(4, 4)
        XCTAssertEqual(cache.get(4), 4)
        XCTAssertEqual(cache.get(3), 3)
        XCTAssertEqual(cache.get(2), 2)
        XCTAssertEqual(cache.get(1), -1)
        cache.put(5, 5)
        XCTAssertEqual(cache.get(4), -1)
        XCTAssertEqual(cache.get(3), 3)
        XCTAssertEqual(cache.get(2), 2)
        XCTAssertEqual(cache.get(1), -1)
        XCTAssertEqual(cache.get(5), 5)
    }

//    ["LRUCache","put","put","get","put","get","get"]
//    [[2],[2,1],[1,1],[2],[4,1],[1],[2]]
    func test4() {
        let cache = LRUCache(2)
        cache.put(2, 1)
        cache.put(1, 1)
        XCTAssertEqual(cache.get(2), 1)
        cache.put(4, 1)
        XCTAssertEqual(cache.get(1), -1)
        XCTAssertEqual(cache.get(2), 1)
    }
}
