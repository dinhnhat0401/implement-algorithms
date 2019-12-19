//
//  LinkedListTest.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2019/12/19.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class LinkedListTest: XCTestCase {
    func testInsertOneElement() {
        var linkedList = LinkedList<Int>()
        linkedList.append(data: 1)
        XCTAssertEqual(1, try linkedList.first())
        XCTAssertEqual(1, try linkedList.last())
        XCTAssertEqual(1, try linkedList.removeFirst())
        XCTAssertEqual(true, linkedList.isEmpty())
    }

    func testEmptyLinkedList() {
        let linkedList = LinkedList<Int>()
        do {
            print(try linkedList.first())
        } catch {
            let e = error as? LinkedListError
            XCTAssertEqual(e, LinkedListError.EmptyLinkedList)
        }
    }

    func testInsertMorethanOneElement() {
        var linkedList = LinkedList<Int>()
        linkedList.append(data: 1)
        linkedList.append(data: 2)
        linkedList.append(data: 3)
        XCTAssertEqual(1, try linkedList.first())
        XCTAssertEqual(3, try linkedList.last())
        XCTAssertEqual(1, try linkedList.removeFirst())
        XCTAssertEqual(2, try linkedList.first())
        XCTAssertEqual(false, linkedList.isEmpty())
    }
}
