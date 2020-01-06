//
//  TrieTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/06.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class TrieTests: XCTestCase {
    func testInsertSearchPrefix() {
        let trie = Trie()
        trie.insert("apple")
        trie.insert("a")
        trie.insert("an")
        trie.insert("hello")
        XCTAssertEqual(trie.search("apple"), true)
        XCTAssertEqual(trie.search("apple1"), false)
        XCTAssertEqual(trie.search("app"), false)
        XCTAssertEqual(trie.search("an"), true)
        XCTAssertEqual(trie.startsWith("hell"), true)
    }
}
