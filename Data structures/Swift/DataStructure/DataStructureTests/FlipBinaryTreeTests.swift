//
//  FlipBinaryTreeTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/08.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class FlipBinaryTreeTests: XCTestCase {
    func test1() {
        let r1 = TreeNode(0)
        r1.left = TreeNode(3)
        r1.right = TreeNode(1)
        r1.right?.right = TreeNode(2)
        let r2 = TreeNode(0)
        r2.left = TreeNode(3)
        r2.right = TreeNode(1)
        r2.left?.left = TreeNode(2)
        XCTAssertEqual(FlipBinaryTree().flipEquiv(r1, r2), false)
    }
}
