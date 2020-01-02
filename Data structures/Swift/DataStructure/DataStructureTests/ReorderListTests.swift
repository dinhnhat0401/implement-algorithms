//
//  ReorderListTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/02.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class ReorderListTests: XCTestCase {
    func test1() {
        let head = ListNode(1)
        head.next = ListNode(2)
        head.next?.next = ListNode(3)
        head.next?.next?.next = ListNode(4)
        ReorderList().reorderList(head)
        XCTAssertEqual(head.next!.val, 4)
    }

    func test2() {
        let head = ListNode(1)
        head.next = ListNode(2)
        head.next?.next = ListNode(3)
        head.next?.next?.next = ListNode(4)
        head.next?.next?.next?.next = ListNode(5)
        head.next?.next?.next?.next?.next = ListNode(6)
        head.next?.next?.next?.next?.next?.next = ListNode(7)
        ReorderList().reorderList2(head)
        XCTAssertEqual(head.next!.val, 7)
    }

    func test3() {
        var head = ListNode(1)
        head.next = ListNode(2)
        head.next?.next = ListNode(3)
        head.next?.next?.next = ListNode(4)
        head.next?.next?.next?.next = ListNode(5)
        head.next?.next?.next?.next?.next = ListNode(6)
        head.next?.next?.next?.next?.next?.next = ListNode(7)
        head = ReorderList().reverse(head)!
        XCTAssertEqual(head.val, 7)
        XCTAssertEqual(head.next?.val ?? 0, 6)
    }

    func test4() {
        let head = ListNode(1)
        head.next = ListNode(2)
        head.next?.next = ListNode(3)
        head.next?.next?.next = ListNode(4)
        ReorderList().reorderList2(head)
        XCTAssertEqual(head.next!.val, 4)
    }
}
