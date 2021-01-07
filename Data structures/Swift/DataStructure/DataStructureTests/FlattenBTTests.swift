//
//  FlattenBTTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/05/17.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class FlattenBTTests: XCTestCase {
    func test1() {
        let root = TreeNode114(1)
        root.left = TreeNode114(2)
        root.left?.left = TreeNode114(3)
        root.left?.right = TreeNode114(4)
        root.right = TreeNode114(5)
        root.right?.right = TreeNode114(6)
        FlattenBT().flatten(root)
        XCTAssertEqual(root.left == nil, true)
        XCTAssertEqual(root.right?.right?.val, 3)
    }
}
