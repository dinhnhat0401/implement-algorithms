//
//  LinkedListSequenceTests.swift
//  DataStructureTests
//
//  Created by Dinh, Nhat | Nate | MPB on 2020/01/16.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class LinkedListSequenceTests: XCTestCase {
    func test1() {
        let linkedList = LinkedListSequence<Int>()
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)
        linkedList.append(4)

        var enumerated = false
        for (i, l) in linkedList.enumerated() {
            enumerated = true
            if i == 0 {
                XCTAssertEqual(l.val, 1)
            }

            if i == 1 {
                XCTAssertEqual(l.val, 2)
            }

            if i == 2 {
                XCTAssertEqual(l.val, 3)
            }

            if i == 3 {
                XCTAssertEqual(l.val, 4)
            }
        }
        XCTAssertEqual(enumerated, true)

        for (i, l) in linkedList.enumerated() {
            if i == 0 {
                XCTAssertEqual(l.val, 1)
            }

            if i == 1 {
                XCTAssertEqual(l.val, 2)
            }

            if i == 2 {
                XCTAssertEqual(l.val, 3)
            }

            if i == 3 {
                XCTAssertEqual(l.val, 4)
            }
        }
    }
}
